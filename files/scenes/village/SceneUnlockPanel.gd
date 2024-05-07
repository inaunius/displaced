extends "res://files/Close Panel Button/ClosingPanel.gd"


signal was_closed
signal was_open


onready var charlist = $Panel/heroes/HBoxContainer
onready var scenelist = $Panel/scenes/GridContainer
onready var close_btn = $close


var selected_char
const char_sprites = {
	rose = 'rose',
	ember = 'emberhappy',
	erika = 'erika',
	iola = 'iola',
	rilu = 'rilu'
}
var characters_ids = ['rose', 'ember', 'erika', 'iola', 'rilu']

export var test_mode = false

func RepositionCloseButton():
	pass#no reposition

func _ready():
	if input_handler.scene_node == null and test_mode:
		input_handler.initiate_scennode(self)
		
	close_btn.connect("pressed", self, 'hide')
	
	for character_tab in charlist.get_children():
		var character_id = character_tab.name.to_lower()
		character_tab.set_meta('hero', character_id)
		character_tab.connect('pressed', self, 'select_hero', [character_id])
		
		if char_sprites.has(character_id): 
			resources.preload_res("sprite/%s" % char_sprites[character_id])
	#TODO full preload of previews is a bad idea! Need to optimise it somehow
	preload_previews()
	
	if test_mode:
		testmode()
		if resources.is_busy(): yield(resources, "done_work")
		open()

func testmode():
	for cid in state.characters:
		state.unlock_char(cid)
	
#	var tscene = load("res://files/TextSceneNew/TextSystem.tscn")
#	var tnode = tscene.instance()
#	input_handler.scene_node = tnode #will be set on add_child anyway
#	tnode.hide()
#	add_child(tnode)


func preload_previews():
	for event in Explorationdata.scene_sequences:
		var eventdata = Explorationdata.scene_sequences[event]
		if eventdata.has('gallery') and eventdata.has('preview'):
			resources.preload_res("scene_preview/%s" % eventdata.preview)



func open():
	var default_selection = ""
	for character_id in characters_ids:
		if state.heroes[character_id].unlocked: 
			default_selection = character_id
	
	for character_id in characters_ids:
		var character_tab = charlist.get_node(character_id)
		character_tab.visible = state.heroes[character_id].unlocked
	rebuild_scene_list()
	.show()
	emit_signal("was_open")


func select_hero(cid):
	if cid == selected_char: return
	selected_char = cid
	for ch in charlist.get_children():
		ch.pressed = (ch.get_meta('hero') == cid)
	rebuild_scene_list()
	if selected_char != 'all': #simple sprite setup. tell me if animated sprite is needed
		var tmp = resources.get_res("sprite/%s" % char_sprites[selected_char]) 
		$panel_hero/hero.texture = tmp
	else:
		$panel_hero/hero.texture = null


func rebuild_scene_list():
	var available_scenes = _get_scenes_to_show()
	input_handler.ClearContainer(scenelist, ['Button'])
	for scene_id in available_scenes:
		var scene_data = available_scenes[scene_id]
		
		var is_unlocked = state.OldSeqs.has(scene_id);
		var is_unlockable = scene_data.has("initiate_reqs") and state.checkreqs(scene_data.initiate_reqs)
		
		if !(is_unlockable or is_unlocked): continue
		
		var panel = input_handler.DuplicateContainerTemplate(scenelist, 'Button')
		
		if is_unlocked:
			panel.set_unlocked(scene_data)
			panel.connect('show_pressed', self, 'show_event', [scene_id])
			#If not unlocked yet but unlockable
		elif is_unlockable:
			panel.set_unlockable(scene_data)
			panel.connect('unlocked_pressed', self, 'unlock_show_event', [scene_id])
			panel.set_highlighted(scene_id in state.pending_scenes)

func _get_scenes_to_show() -> Dictionary:
	var id_and_scene_data = {}
	
	for scene_id in Explorationdata.scene_sequences:
		var scene_data = Explorationdata.scene_sequences[scene_id]
		if !scene_data.has('gallery'): continue
		
		var scene_characters = scene_data.unlock_price.keys()
		if selected_char != 'all' and !(selected_char in scene_characters): continue
		
		var character_locked = false
		for chartater in scene_characters:
			if !state.heroes[chartater].unlocked:
				character_locked = true
				break
		if character_locked: continue
		
		id_and_scene_data[scene_id] = scene_data
	
	return id_and_scene_data

func show_event(ev):
	globals.run_seq(ev)
#	input_handler.OpenClose(input_handler.scene_node)
#	input_handler.scene_node.play_scene(ev)


func unlock_show_event(ev):
	var eventdata = Explorationdata.scene_sequences[ev]
	for ch in eventdata.unlock_price:
		var hero = state.heroes[ch]
		hero.friend_points -= eventdata.unlock_price[ch]
	show_event(ev)
	rebuild_scene_list()

func hide():
	emit_signal("was_closed")
	.hide()
