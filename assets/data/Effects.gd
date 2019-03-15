extends Node
#old part, to replace
var effects = {
	gobmetalhandle = {descript = tr("GOBMETALHANDLEDESCRIPT"), code = 'gobmetalhandle', textcolor = 'yellow', trigger = 'skillhit', triggereffect = 'gobmetalhandleffect'},
	elfmetalhandle = {descript = tr("ELFMETALHANDLEDESCRIPT"), code = 'elfmetalhandle', textcolor = 'yellow', trigger = 'skillhit', triggereffect = 'elfmetalhandleffect'},
	gobmetalblade = {descript = tr("GOBMETALBLADEDESCRIPT"), code = 'gobmetalblade', textcolor = 'yellow', trigger = 'skillhit', triggereffect = 'gobmetalbladeeffect'},
	elfmetalblade = {descript = tr("ELFMETALBLADEDESCRIPT"), code = 'elfmetalblade', textcolor = 'yellow', trigger = 'skillhit', triggereffect = 'elfmetalbladeeffect'},
	elfwoodrod = {descript = tr("ELFWOODRODDESCRIPT"), code = 'elfwoodrod', textcolor = 'yellow', trigger = 'endcombat',triggereffect = 'elfwoodrodeffect'},
	gobmetalrod = {descript = tr("GOBMETALRODDESCRIPT"), code = 'gobmetalrod', textcolor = 'yellow', trigger = 'spellhit', triggereffect = 'gobmetalrodeffect'},
	bonerod = {descript = tr("BONERODDESCRIPT"), code = 'bonerod', textcolor = 'yellow', trigger = 'spellhit', triggereffect = 'bonerodeffect'},
	bonebow = {descript = tr("BONEBOWDESCRIPT"), code = 'bonebow', textcolor = 'yellow', trigger = 'skillhit', triggereffect = 'boneboweffect'},
	
	natural = {name = tr("NATURAL"), code = 'natural', descript = tr("NATURALEFFECTDESCRIPT"), textcolor = 'brown', trigger = 'custom', tags = []},
	brittle = {name = tr("BRITTLE"), code = 'brittle', descript = tr("BRITTELEFFECTDESCRIPT"), textcolor = 'gray', tags = []},
	
}

var combateffects = {
#traits
beastdamage = {effect = 'skillmod', effectvalue = {type = "damagemod", value = ['0.2'], targetreq = {type = 'stats', name = 'race', operant = 'eq', value = 'animal'}}},


#items
gobmetalhandleeffect = {effect = 'skillmod', effectvalue = {type = 'damagemod', value = ['0.15']}, targetreq = {type = 'stats', name = 'hppercent', operant = 'lte', value = 25}},
elfmetalhandleeffect = {effect = 'gainstat', receiver = 'caster', effectvalue = {type = 'mana', value = ['1']}},
boneboweffect = {effect = 'gainstat', receiver = 'caster', effectvalue = {type = 'hp', value = ['1']}},
gobmetalbladeeffect = {effect = 'extradamage', receiver = 'target', effectvalue = {type = 'global', element = 'earth', value = ['caster.level']}},
elfmetalbladeeffect = {effect = 'skillmod', effectvalue = {type = 'damage', value = ['10']}, targetreq = {type = 'stats', name = 'hppercent', operant = 'gte', value = 100}},
elfwoodrodeffect = {effect = 'gainstat', receiver = 'caster', effectvalue = {type = 'mana', value = ['manamax','*0.1']}},
gobmetalrodeffect = {effect = 'buff', receiver = 'target', effectvalue = {code = 'gobrodspeeddebuf',effects = [{stat = 'speed', value = ['-10']}], duration = 1, tags = []}},
bonerodeffect = {effect = 'gainstat', receiver = 'caster', effectvalue = {type = 'hp', value = ['hpmax','*0.03']}},

}

#new part
var effect_table = {
	#traits
	e_tr_dmgbeast = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [
			{target = 'target', value = {type = 'race', value = 'animal' } }
		],
		effects = [{type = 'param_m', stat = 'value', value = 1.2, target = 'skill'}]
	},
	e_tr_nodmgbeast = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [
			{target = 'caster', value = {type = 'race', value = 'animal' } }
		],
		effects = [{type = 'param_m', stat = 'value', value = 0.8, target = 'skill'}]
	},
	e_tr_fastlearn = { #no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'xpmod', value = 0.15}]
	},
	e_tr_hitrate = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'hitrate', value = 10}]
	},
	e_tr_ev10 = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'evasion', value = 10}]
	},
	e_tr_ev15 = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'evasion', value = 15}]
	},
	e_tr_crit = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'critchance', value = 10}]
	},
	e_tr_resist = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [
			{type = 'stat', stat = 'resistfire', value = 10},
			{type = 'stat', stat = 'resistair', value = 10},
			{type = 'stat', stat = 'resistwater', value = 10},
			{type = 'stat', stat = 'resistearth', value = 10},
		]
	},
	e_tr_armor = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'armor', value = 5}]
	},
	e_tr_hpmax = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'static',
		effects = [{type = 'stat', stat = 'hpmax', value = 25}]
	},
	e_tr_speed = {#no icon for buff as this is the only effect of trait. version with icon exists too
		type = 'static',
		effects = [{type = 'stat', stat = 'speed', value = 10}]
	},
	e_tr_regen = {#no icon for buff as this is the only effect of trait. can add if reqired
		type = 'trigger',
		trigger = variables.TR_TURN_F,
		conditions = [],
		effects = [{type = 'stat_once', stat = 'hppercent', value = 5}]
	},
	e_tr_noevade = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [],
		effects = ['noevade10']
	},
	e_tr_prot = {
		type = 'static',
		effects = ['prot_icon', {type = 'stat', stat = 'armor', value = 10}]
	},
	e_tr_areaprot = {
		type = 'area',
		area = 'back',
		value = 'e_tr_prot',
		effects = ['area_prot_icon']
	},
	e_tr_healer = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'tag', value = 'heal'}],
		effects = [{type = 'skill', new_type = 'stat_once', target = 'caster', stat = 'hp', value = 'value', mul = 0.5}]
	},
	e_tr_react = {
		type = 'trigger',
		trigger = variables.TR_DMG,
		conditions = [],
		effects = ['react']
	},
	e_tr_magecrit = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'result', value = variables.RES_CRIT}],
		effects = [
			{type = 'skill', new_type = 'stat_once', target = 'caster', stat = 'mana', value = 'manacost', mul = 1}, 
			'magecrit_once'
		]
	},
	e_tr_slowarrow = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'result', value = variables.RES_HITCRIT}],
		effects = ['slowarrow']
	},
	e_tr_killer = {
		type = 'trigger',
		trigger = variables.TR_KILL,
		effects = ['killer', 'killer_once']
	},
	e_tr_rangecrit = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [
			{target = 'skill', check = 'result', value = variables.RES_CRIT} 
		],
		effects = [{type = 'param', stat = 'armor_p', value = 100000, target = 'skill'}]
	},
	e_tr_speed_icon = {
		type = 'static',
		effects = ['speed_icon', {type = 'stat', stat = 'speed', value = 10}]
	},
	e_tr_areaspeed = {
		type = 'area',
		area = 'line',
		value = 'e_tr_speed_icon',
		effects = ['area_speed_icon']
	},
	e_tr_noresist = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [],
		effects = ['noresist']
	},
	e_tr_firefist = {
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'result', value = variables.RES_HITCRIT}],
		effects = ['firefist']
	},
	#monstertraits
	e_tr_elheal = {
		type = 'trigger',
		trigger = variables.TR_TURN_S,
		conditions = [],
		effects = [{type = 'stat_once', stat = 'hp', value = 20}]
	},
	e_tr_dwarwenbuf = {#pattern for buffs with limited but not defined duration
		type = 'trigger',
		trigger = variables.TR_DMG,
		conditions = [],
		effects = [{type = 'effect', effect = 'e_dwarwenbuf'}]
	},
	e_tr_dwarwenclear = {#clear buff trigger, not that usable for enemy, but part of pattern
		type = 'trigger',
		trigger = variables.TR_COMBAT_F,
		conditions = [],
		effects = [{type = 'delete_effect', effect = 'e_dwarwenbuf'}]
	},
	#skills
	e_s_stun05 = {
		type = 'oneshot',
		trigger = variables.TR_HIT,
		conditions = [
			{target = 'skill', check = 'result', value = variables.RES_HITCRIT},
			{target = 'chance', value = 50}
		],
		effects = ['stun1']
	},
	e_s_restoremana20 = {
		type = 'oneshot',
		trigger = variables.TR_CAST,
		conditions = [],
		effects = [{type = 'stat_once', stat = 'mana', value = 20}]
	},
	e_s_treantbarrier = {
		type = 'oneshot',
		trigger = variables.TR_CAST,
		conditions = [],
		effects = [{type = 'temp_effect', target = 'caster', effect = 'e_addbarrier1', duration = 1, stack = 1}]
	},
	e_s_spidernoarmor = {
		type = 'oneshot',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'result', value = variables.RES_HITCRIT}],
		effects = [{target = 'target', type = 'temp_effect', effect = 'e_spidernoarmor', duration = 2, stack = 99}]
	},
	e_s_faery = {
		type = 'oneshot',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'result', value = variables.RES_HITCRIT}],
		effects = [{target = 'target', type = 'stat', stat = 'mana', value = -20}] # ! value to check
	},
	#weapon
	#item skills
	e_i_barrier2 = {
		type = 'oneshot',
		trigger = variables.TR_CAST,
		conditions = [],
		effects = [{type = 'temp_effect', target = 'caster', effect = 'e_addbarrier2', duration = 2, stack = 1}]
	},
	e_i_barrier3 = {
		type = 'oneshot',
		trigger = variables.TR_CAST,
		conditions = [],
		effects = [{type = 'temp_effect', target = 'caster', effect = 'e_addbarrier3', duration = 2, stack = 1}]
	},
	e_i_restoremana25 = {
		type = 'oneshot',
		trigger = variables.TR_HIT,
		conditions = [],
		effects = [{target = 'target', type = 'stat_once', stat = 'mana', value = 25}]
	},
	e_i_elixir = {
		type = 'oneshot',
		trigger = variables.TR_CAST,
		conditions = [],
		effects = [{type = 'stat_once', stat = 'mana', value = 40},
		{type = 'stat_once', stat = 'hp', value = 75}]
	},
	#secondary
	e_stun = {
		type = 'static',
		disable = true,
		effects = ['stun_icon']
	},
	e_noevade10 = {
		type = 'static',
		effects = ['noevade_icon', {type = 'stat', stat = 'evasion', value = -10}]
	},
	e_react = {
		type = 'static',
		effects = ['react_icon', {type = 'stat', stat = 'speed', value = 20}]
	},
	e_magecrit_once = {#ensures one triggering of magecrit per cast, potential unsafe construction (works only because after skill activating player can't deactivate and activate traits) do not copy this pattern for blocking effects for more than 0 time
		type = 'static',
		effects = [{type = 'block_effect', effect = 'e_tr_magecrit'}]
	},
	e_slowarrow = {
		type = 'static',
		effects = ['slowarrow', 
			{type = 'stat', stat = 'evasion', value = -10},
			{type = 'stat', stat = 'speed', value = -10}]
	},
	e_killer = { #killer buff, adds icon, atk trigger and eoc trigger
		type = 'static',
		effects = ['tr_killer', 'killer_icon', 'killer_eoc']
	},
	e_t_kiler = { #atk check for killer buff. doubles damage than removes buff (so do not triggers on next target if triggers on skill with multiple targets)
		type = 'trigger',
		trigger = variables.TR_HIT,
		conditions = [{target = 'skill', check = 'type', value = 'skill'}],#not triggers on item use and spells
		effects = [
			{type = 'param_m', stat = 'value', value = 2, target = 'skill'},
			'clear_killer']
	},
	e_kiler_eoc = { #clears killer buf at the end of combat
		type = 'trigger',
		trigger = variables.TR_COMBAT_F,
		conditions = [],
		effects = ['clear_killer']
	},
	e_killer_once = {#ensures one triggering of killer per cast, potential unsafe construction (works only because after skill activating player can't deactivate and activate traits) do not copy this pattern for blocking effects for more than 0 time
		type = 'static',
		effects = [{type = 'block_effect', effect = 'e_tr_killer'}]
	},
	e_noresist = {
		type = 'static',
		effects = [
			{type = 'stat', stat = 'resistfire', value = -15},
			{type = 'stat', stat = 'resistair', value = -15},
			{type = 'stat', stat = 'resistwater', value = -15},
			{type = 'stat', stat = 'resistearth', value = -15},
			'noresist_icon'
		]
	},
	e_addbarrier1 = { #additional trigger to remove effect in those effects only effectively removes icon. but this is the pattern for creating barriers with additional bonuses
		type = 'static',
		effects = [{type = 'effect', effect = 'e_rembarrier1'},
		{type = 'stat_s', stat = 'shield', value = 15},
		{type = 'stat_s', stat = 'shieldtype', value = variables.S_PHYS},
		'shield1_icon']
	},
	e_rembarrier1 = {
		type = 'trigger',
		conditions = [],
		trigger = variables.TR_SHIELD_DOWN,
		effects = [{type = 'delete_effect', effect = e_addbarrier1}]
	},
	e_addbarrier2 = { #additional trigger to remove effect in those effects only effectively removes icon. but this is the pattern for creating barriers with additional bonuses
		type = 'static',
		effects = [{type = 'effect', effect = 'e_rembarrier2'},
		{type = 'stat_s', stat = 'shield', value = 50},
		{type = 'stat_s', stat = 'shieldtype', value = variables.S_PHYS},
		'shield2_icon']
	},
	e_rembarrier2 = {
		type = 'trigger',
		conditions = [],
		trigger = variables.TR_SHIELD_DOWN,
		effects = [{type = 'delete_effect', effect = e_addbarrier2}]
	},
	e_addbarrier3 = { #additional trigger to remove effect in those effects only effectively removes icon. but this is the pattern for creating barriers with additional bonuses
		type = 'static',
		effects = [{type = 'effect', effect = 'e_rembarrier3'},
		{type = 'stat_s', stat = 'shield', value = 50},
		{type = 'stat_s', stat = 'shieldtype', value = variables.S_MAG},
		'shield3_icon']
	},
	e_rembarrier3 = {
		type = 'trigger',
		conditions = [],
		trigger = variables.TR_SHIELD_DOWN,
		effects = [{type = 'delete_effect', effect = e_addbarrier3}]
	},
	e_dwarwenbuf = {
		type = 'static',
		effects = [{type = 'stat', stat = 'damage', value = 5}]
	},
	e_spidernoarmor = {
		type = 'static',
		effects = ['spider_icon',
		{type = 'stat', stat = 'armor', value = -10} #!!!value to check
		]
	},
};

var atomic = {
	#icons
	stun_icon = {type = 'buff', value = 'stun'},
	noevade_icon = {type = 'buff', value = 'noevade'},
	prot_icon = {type = 'buff', value = 'prot10'},
	area_prot_icon = {type = 'buff', value = 'area_prot'},
	react_icon = {type = 'buff', value = 'react'},
	killer_icon = {type = 'buff', value = 'killer'},
	speed_icon = {type = 'buff', value = 'speed'},
	area_speed_icon = {type = 'buff', value = 'area_speed'},
	noresist_icon = {type = 'buff', value = 'noresist'},
	shield1_icon = {type = 'buff', value = 'shield1'},
	shield2_icon = {type = 'buff', value = 'shield2'},
	shield3_icon = {type = 'buff', value = 'shield3'},
	spider_icon = {type = 'buff', value = 'spider_noarmor'},
	#add effect
	stun1 = {type = 'temp_effect', target = 'target', effect = 'e_stun', duration = 1, stack = 10},
	noevade10 = {type = 'temp_effect', target = 'target', effect = 'e_noevade10', duration = 2, stack = 1},
	react = {type = 'temp_effect', effect = 'e_react', duration = 2, stack = 1},
	magecrit_once = {type = 'temp_effect', target = 'caster', effect = 'e_magecrit_once', duration = 0, stack = 1},
	slowarrow = {type = 'temp_effect', target = 'target', effect = 'e_slowarrow', duration = 2, stack = 2},
	killer = {type = 'effect', effect = 'e_killer'},
	tr_killer = {type = 'effect', effect = 'e_t_killer'},
	clear_kiler = {type = 'delete_effect', effect = 'e_killer'},
	killer_once = {type = 'temp_effect', effect = 'e_killer_once', duration = 0, stack = 1},
	killer_eoc = {type = 'effect', effect = 'e_killer_eoc'},
	noresist = {type = 'temp_effect', target = 'target', effect = 'e_noresist', duration = 1, stack = 1},
	firefist = {type = 'skill', new_type = 'damage', target = 'target', source = variables.S_FIRE, value = 'value', mul = 0.2},
};
#needs filling
var buffs = {
	#code = {icon, description}
	stun = {icon = null, description = null},
	noevade = {icon = null, description = null},
	prot10 = {icon = null, description = null},
	area_prot = {icon = null, description = null}, #marks owner of area protection effect
	react = {icon = null, description = null},
	slowarrow = {icon = null, description = null},
	killer = {icon = null, description = null},
	speed = {icon = null, description = null},
	area_speed = {icon = null, description = null}, #marks owner of area speed effect
	noresist = {icon = null, description = null},
	shield1 = {icon = null, description = null},
	shield2 = {icon = null, description = null},
	shield3 = {icon = null, description = null},
	spider_noarmor = {icon = null, description = null},
};