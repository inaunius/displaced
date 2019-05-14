extends Reference
class_name base_effect

var parent = null
var id
var template
var args : = []
var self_args := {}
var sub_effects := []
var tags := []
var buffs := []
var atomic := []
var is_applied
var applied_pos:int
var applied_char = null

func _init(caller):
	parent = caller
	is_applied = false

func apply():
	var obj = get_applied_obj()
	is_applied = true
	atomic.clear()
	for a in template.atomic:
		var tmp := atomic_effect.new(a, self)
		tmp.resolve_template()
		#tmp.apply_template(obj)
		obj.apply_atomic(tmp.template)
		atomic.push_back(tmp.template)
	sub_effects.clear()
	for e in template.sub_effects:
		var tmp = effects_pool.e_createfromtemplate(e, id)
		tmp.calculate_args()
		sub_effects.push_back(effects_pool.add_effect(tmp))
		pass
	buffs.clear()
	for e in template.buffs:
		var tmp = Buff.new(id)
		tmp.createfromtemplate(e)
		tmp.calculate_args()
		buffs.push_back(tmp)
	pass

func remove():
	var obj = get_applied_obj()
	for a in atomic:
		if obj != null: 
			#tmp.remove_template(obj)
			obj.remove_atomic(a)
	atomic.clear()
	buffs.clear()

func get_applied_obj():
	if applied_pos == null: return null
	if applied_char == null:
		applied_char = state.combatparty[applied_pos]
	return state.heroes[applied_char]

func createfromtemplate(buff_t):
	if typeof(buff_t) == TYPE_STRING:
		template = Effectdata.effect_table[buff_t]
	else:
		template = buff_t.duplicate()
	tags = template.tags.duplicate()



func calculate_args():
	args.clear()
	if template.has('args'):
		for arg in template.args:
			match arg.obj:
				'self':
					args.push_back(self_args[arg.param])
					pass
				'parent':
					var par
					if typeof(parent) == TYPE_STRING:
						par = effects_pool.get_effect_by_id(parent)
					else:
						par = parent
					args.push_back(par.get(arg.param))
					pass
				'template':
					args.push_back(template[arg.param])
				'parent_args':
					var par
					if typeof(parent) == TYPE_STRING:
						par = effects_pool.get_effect_by_id(parent)
					else:
						par = parent
					args.push_back(par.args[arg.param])
		pass

func set_args(arg, value):
	self_args[arg] = value

func serialize():
	var tmp := {}
	tmp['is_applied'] = is_applied
	tmp['template'] = template
	tmp['args'] = self_args
	tmp['sub_effects'] = sub_effects
	tmp['type'] = 'base'
	tmp['atomic'] = atomic
	tmp['buffs'] = []
	tmp['app_pos'] = applied_pos
	tmp['app_char'] = applied_char
	for b in buffs:
		tmp['buffs'].push_back(b.serialize())
	return tmp

func deserialize(tmp):
	is_applied = tmp['is_applied']
	template = tmp['template'].duplicate()
	tags = template.tags.duplicate()
	self_args = tmp['args'].duplicate()
	sub_effects = tmp['sub_effects'].duplicate()
	atomic = tmp['atomic'].duplicate()
	applied_pos = int(tmp['app_pos'])
	applied_char = tmp['app_char']
	buffs.clear()
	for b in tmp['buffs']:
		var t = Buff.new(self)
		t.deserialize(b)
		buffs.push_back(t)
	pass