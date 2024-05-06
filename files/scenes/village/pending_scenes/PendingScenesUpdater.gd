class_name PendingScenesUpdater extends Node


onready var _scene_unlock_panel = $"../scenes"

var _is_scene_unlock_panel_open = false


func _ready():
	_scene_unlock_panel.connect("was_open", self, "_on_scene_unlock_panel_open")
	_scene_unlock_panel.connect("was_closed", self, "_on_scene_unlock_panel_closed")
	
	for character in state.characters:
		var hero_instance: hero = state.heroes[character]
		hero_instance.connect("friend_points_changed", self, "_on_hero_friend_points_changed")

func _on_hero_friend_points_changed(_points: int):
	_update_pending_scenes()


func _on_scene_unlock_panel_open():
	_is_scene_unlock_panel_open = true
	
func _on_scene_unlock_panel_closed():
	if _is_scene_unlock_panel_open:
		state.clear_pending_scenes()
		_is_scene_unlock_panel_open = false


func _update_pending_scenes():
	var scenes = []
	
	for scene_id in Explorationdata.scene_sequences:
		var scene_data = Explorationdata.scene_sequences[scene_id]
		if !scene_data.has("gallery"): continue
		
		if state.checkreqs(scene_data.initiate_reqs):
			scenes.append(scene_id)

	state.update_pending_scenes(scenes)


func _character_friend_points(character: String) -> int:
	return state.heroes[character].friend_points


#func _array_difference(a: Array, b: Array):
#	var a_specific = []
#	for elem in a:
#		if not (elem in b):
#			a_specific.append(elem)
#	return a_specific
