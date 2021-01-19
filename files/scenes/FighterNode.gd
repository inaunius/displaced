extends TextureButton

var animation_node


signal signal_RMB
signal signal_RMB_release
signal signal_LMB

var position = 0
var fighter
var RMBpressed = false


#var damageeffectsarray = []

var hp
var mp
var buffs = []

#data format: node, time, type, slot, params

#func _process(delta):
#	if $hplabel.visible:
#		update_hp_label()
#	if $mplabel.visible:
#		update_mp_label()
#	for i in damageeffectsarray:
#		if i.played == false:
#			textdamageeffect(i)
#			i.played = true
#		yield(get_tree().create_timer(0.5), "timeout")
#	for i in damageeffectsarray:
#		if i.played == true:
#			damageeffectsarray.erase(i)
#			break


func _input(event):
	if get_global_rect().has_point(get_global_mouse_position()):
		if event.is_pressed():
			if event.is_action("RMB"):
				emit_signal("signal_RMB", fighter)
				RMBpressed = true
			elif event.is_action('LMB'):
				emit_signal("signal_LMB", position)
	if event.is_action_released("RMB") && RMBpressed == true:
		emit_signal("signal_RMB_release")
		RMBpressed = false


func setup_character(ch):
	fighter = ch
	ch.displaynode = self
	$sprite.texture = fighter.animations.idle


func get_attack_vector():
	if fighter.combatgroup == 'ally': return Vector2(100, 0)
	elif fighter.combatgroup == 'enemy': return Vector2(-100, 0)


func update_hp():
	if hp == null:
		hp = fighter.hp
	if hp != null && hp != fighter.hp:
		var args = {damage = 0, type = '', color = Color(), newhp = fighter.hp, newhpp = globals.calculatepercent(fighter.hp, fighter.get_stat('hpmax')), damage_float = true}
		args.damage = fighter.hp - hp
		if args.damage < 0:
			args.color = Color(0.8,0.2,0.2)
			if fighter.combatgroup == 'ally':
				args.type = 'damageally'
			else:
				args.type = 'damageenemy' 
		else:
			args.type = 'heal'
			args.color = Color(0.2,0.8,0.2)
		if hp <= 0: args.damage_float = false
		hp = fighter.hp
		if hp < 0:
			args.newhp = 0
			args.newhpp = 0
			hp = 0
		#damageeffectsarray.append(data)
		var data = {node = self, time = globals.combat_node.turns,type = 'hp_update',slot = 'HP', params = args}
		animation_node.add_new_data(data)

#func update_mana():
#	if mp == null:
#		mp = fighter.mana
#	if mp != null && mp != fighter.mana:
#		var args = {newmp = fighter.mana, newmpp = globals.calculatepercent(fighter.mana, fighter.get_stat('manamax'))}
#		mp = fighter.mana
#		#damageeffectsarray.append(data)
#		var data = {node = self, time = globals.combat_node.turns,type = 'mp_update',slot = 'MP', params = args}
#		animation_node.add_new_data(data)

func defeat():#not working correctly at all
	$Icon.material = load("res://assets/sfx/bw_shader.tres")
	#input_handler.FadeAnimation(self, 0.5, 0.3)
	set_process_input(false)

func update_shield(): 
	var args = {}
	if fighter.shield <= 0: 
		args.color = Color(0.9, 0.9, 0.9, 0.0)
		#self.material.set_shader_param('modulate', Color(0.9, 0.9, 0.9, 0.0))
		#return
	else:
		args.color = Color(0.8, 0.8, 0.8, 1.0)
		#self.material.set_shader_param('modulate', Color(0.8, 0.8, 0.8, 1.0)); #example
	var data = {node = self, time = globals.combat_node.turns, type = 'shield_update',slot = 'SHIELD', params = args}
	animation_node.add_new_data(data)

func process_sfx(code):
	var data = {node = self, time = globals.combat_node.turns,type = code, slot = 'SFX', params = {}}
	animation_node.add_new_data(data)

func process_sound(sound):
	var data = {node = self, time = globals.combat_node.turns, type = 'sound', slot = 'sound', params = {sound = sound}}
	animation_node.add_new_data(data)

func rebuildbuffs():
	var data = {node = self, time = globals.combat_node.turns, type = 'buffs', slot = 'buffs', params = fighter.get_all_buffs()}
	animation_node.add_new_data(data)

func process_critical():
	var data = {node = self, time = globals.combat_node.turns, type = 'critical', slot = 'crit', params = {}}
	animation_node.add_new_data(data)

func process_enable():
	var data = {node = self, time = globals.combat_node.turns, type = 'enable', slot = 'full', params = {}}
	animation_node.add_new_data(data)

func process_disable():
	disabled = true
	var data = {node = self, time = globals.combat_node.turns, type = 'disable', slot = 'full', params = {}}
	animation_node.add_new_data(data)

func appear():#stub
	var data = {node = self, time = globals.combat_node.turns, type = 'reappear', slot = 'full', params = {}}
	animation_node.add_new_data(data)

func disappear():#stub
	var data = {node = self, time = globals.combat_node.turns, type = 'disappear', slot = 'full', params = {}}
	animation_node.add_new_data(data)

#control visuals
func noq_rebuildbuffs(newbuffs):
	var oldbuff = 0
	for b in newbuffs:
		if buffs.has(b.template_name): oldbuff += 1
	if oldbuff == buffs.size():
		for i in newbuffs:
			if buffs.has(i.template_name): update_buff(i)
			else: add_buff(i)
	else:
		globals.ClearContainer($Buffs)
		buffs.clear()
		for i in newbuffs:
			add_buff(i)

func add_buff(i):
	var newbuff = globals.DuplicateContainerTemplate($Buffs)
	var text = i.description
	newbuff.texture = i.icon
	buffs.push_back(i.template_name)
	if i.template.has('bonuseffect'):
		match i.template.bonuseffect:
			'barrier':
				newbuff.get_node("Label").show()
				newbuff.get_node("Label").text = str(fighter.shield)
	newbuff.hint_tooltip = text

func update_buff(i):
	var pos = buffs.find(i.template_name)
	var newbuff = $Buffs.get_child(pos)
	var text = i.description
	newbuff.texture = i.icon
	buffs.push_back(i.template_name)
	if i.template.has('bonuseffect'):
		match i.template.bonuseffect:
			'barrier':
				newbuff.get_node("Label").show()
				newbuff.get_node("Label").text = str(fighter.shield)
	newbuff.hint_tooltip = text

func update_hp_label(newhp, newhpp):
	if fighter.combatgroup == 'ally' || variables.show_enemy_hp:
		$hplabel.text = str(floor(newhp)) + '/' + str(floor(fighter.get_stat('hpmax')))
	else:
		$hplabel.text = str(round(newhpp)) + '%%'

#func update_mp_label(newmp, newmpp):
#	if fighter.combatgroup == 'ally' || variables.show_enemy_hp:
#		$mplabel.text = str(floor(newmp)) + '/' + str(floor(fighter.get_stat('manamax')))
#	else:
#		$mplabel.text = str(round(newmpp)) + '%%'

