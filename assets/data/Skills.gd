extends Node
#var S_Skill = preload("res://files/scripts/short_skill.gd");

var skilllist = {
	attack = {
		code = 'attack',
		name = tr("SKILLATTACK"),
		description = tr("SKILLATTACKDESCRIPT"),
		icon = load("res://assets/images/iconsskills/defaultattack.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "weapon",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 1,
	},
	#mage
	firebolt = {
		code = 'firebolt',
		name = tr("SKILLFIREBOLT"),
		description = tr("SKILLFIREBOLTDESCRIPT"),
		icon = load("res://assets/images/iconsskills/firebolt.png"),
		
		damagetype = "fire",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'row',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*2'],
		cooldown = 0,
		manacost = 7,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	minorheal = {
		code = 'minorheal',
		name = tr("SKILLMINORHEAL"),
		description = tr("SKILLMINORHEALDESCRIPT"),
		icon = load("res://assets/images/iconsskills/lesserheal.png"),
		
		damagetype = "magic",
		
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally','self'],
		reqs = [],
		tags = ['heal', 'type_heal'],
		value = ['caster.damage','+35'],
		cooldown = 1,
		manacost = 8,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	concentrate = {
		code = 'concentrate',
		name = tr("SKILLCONCENTRATE"),
		description = tr("SKILLCONCENTRATEDESCRIPT"),
		icon = load("res://assets/images/iconsskills/meditate.png"),
		
		damagetype = "magic",
		
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['self'],
		reqs = [],
		tags = ['heal', 'type_mana'],
		damagestat = 'mana',
		value = ['25'],
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	firestorm = {
		code = 'firestorm',
		name = tr("SKILLFIRESTORM"),
		description = tr("SKILLFIREBOLTDESCRIPT"),
		icon = load("res://assets/images/iconsskills/firestorm.png"),
		
		damagetype = "fire",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'all',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*2.5'],
		cooldown = 2,
		manacost = 30,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	earthquake = { #NEW, NEED FILLING DATA
		code = 'earthquake',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/firebolt.png"),
		
		damagetype = "earth",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'line',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 7,
		casteffects = ['e_s_quake'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	#archer
	windarrow = {
		code = 'windarrow',
		name = tr("SKILLWINDARROW"),
		description = tr("SKILLWINDARROWDESCRIPT"),
		icon = load("res://assets/images/iconsskills/windarrow.png"),
		
		damagetype = "air",
		skilltype = 'skill',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [{type = 'gear', slot = 'any', name = 'geartype', operant = 'eq', value = 'bow'}],
		tags = ['damage'],
		value = ['caster.damage','*1.3'],
		cooldown = 1,
		manacost = 7,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	heavyshot = { 
		code = 'heavyshot',
		name = tr("SKILLSTRONGSHOT"),
		description = tr("SKILLSTRONGSHOTDESCRIPT"),
		icon = load("res://assets/images/iconsskills/heavyshot.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [{type = 'gear', slot = 'any', name = 'geartype', operant = 'eq', value = 'bow'}],
		tags = ['damage'],
		value = ['caster.damage','*1.5'],
		cooldown = 3,
		manacost = 10,
		casteffects = ['e_s_stun'],
		
		hidden = false,
		sfx = [{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	arrowshower = { #new, to overlook
		code = 'arrowshower',
		name = tr("SKILLARROWSHOWER"),
		description = tr("SKILLARROWSHOWERDESCRIPT"),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "any",
		targetpattern = 'all',
		allowedtargets = ['enemy'],
		reqs = [{type = 'gear', slot = 'any', name = 'geartype', operant = 'eq', value = 'bow'}],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 2,
		manacost = 20,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	windwalk = {#NEW, NEED FILLING DATA
		code = 'windwalk',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'row',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['magic'],
		value = ['0'],
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_wwalk'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	naturesbless = {#NEW, NEED FILLING DATA
		code = 'naturesbless',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['magic'],
		value = ['0'],
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_nbless'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	#brawler
	tackle = { 
		code = 'tackle',
		name = tr("SKILLTACKLE"),
		description = tr("SKILLTACKLEDESCRIPT"),
		icon = load("res://assets/images/iconsskills/tackle.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "melee",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*0.5'],
		cooldown = 2,
		manacost = 7,
		casteffects = [
			'e_s_stun05'
		],
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	cripple = { #new, to overlook
		code = 'cripple',
		name = tr("SKILLCRIPPLE"),
		description = tr("SKILLCRIPPLEDESCRIPT"),
		icon = load("res://assets/images/iconsskills/cripple.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "melee",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 2,
		manacost = 10,
		casteffects = [
			'e_s_cripple'
		],
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	comboattack = {
		code = 'comboattack',
		name = tr("SKILLCOMBOATTACK"),
		description = tr("SKILLCOMBOATTACKDESCRIPT"),
		icon = load("res://assets/images/iconsskills/comboattack.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "weapon",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 4,
		manacost = 13,
		casteffects = [],
		repeat = 3,
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	battlecry = {#NEW, NEED FILLING DATA
		code = 'battlecry',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'all',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['magic'],
		value = ['0'],
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_bcry'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	earthshock = { #NEW, NEED FILLING DATA
		code = 'earthshock',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/firebolt.png"),#!
		
		damagetype = "earth",
		skilltype = 'spell',
		userange = "melee",
		targetpattern = 'line',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 7,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	#warrior
	doubleattack = {
		code = 'doubleattack',
		name = tr("SKILLDOUBLEATTACK"),
		description = tr("SKILLDOUBLEATTACKDESCRIPT"),
		icon = load("res://assets/images/iconsskills/strongattack.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "weapon",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*0.85'],
		cooldown = 1,
		manacost = 8,
		casteffects = [],
		repeat = 2,
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	slash = {
		code = 'slash',
		name = tr("SKILLSLASH"),
		description = tr("SKILLSLASHDESCRIPT"),
		icon = load("res://assets/images/iconsskills/slash.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "melee",
		targetpattern = 'line',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*1.5'],
		cooldown = 2,
		manacost = 15,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	taunt = {
		code = 'taunt',
		name = tr("SKILLTAUNT"),
		description = tr("SKILLTAUNTDESCRIPT"),
		icon = load("res://assets/images/iconsskills/taunt.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = [],
		value = [['caster.id']],
		damagestat = ['=taunt'],
		cooldown = 2,
		manacost = 5,

		chance = 100,
		evade = 0,
		critchance = 0,
		casteffects = ['e_s_taunt'],
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	lightningthrust = { #NEW, NEED FILLING DATA
		code = 'lightningthrust',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/firebolt.png"),#!
		
		damagetype = "air",
		skilltype = 'spell',
		userange = "melee",#i think this is correct do not let warrior to target backline
		targetpattern = 'row',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 7,
		casteffects = [],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	execute = { 
		code = 'execute',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/tackle.png"),#!
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "melee",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage','*1.8'],
		cooldown = 2,
		manacost = 7,
		casteffects = ['e_s_execute'],
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	#new classes' skills and effects are not tested
	#priest
	ward = {
		code = 'ward',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/meditate.png"),#
		
		damagetype = "magic",
		
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = [],
		value = ['caster.damage', '*1.5'],
		damagestat = 'no_stat',
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_s_ward'],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	bless = {#NEW, NEED FILLING DATA
		code = 'bless',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['magic'],
		value = ['0'],
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_bless'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	sanctuary = {#NEW, NEED FILLING DATA
		code = 'sanctuary',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),#
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'all',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['magic'],
		value = ['caster.damage', '*0.5'],
		damagestat = 'no_stat',
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_sanctuary'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	wave = { #NEW, NEED FILLING DATA
		code = 'wave',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/firebolt.png"),#
		
		damagetype = "water",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'line',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 7,
		casteffects = ['e_s_wave'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	#necromancer
	spiritcall = {#NEW, NEED FILLING DATA
		code = 'spiritcall',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/arrowshower.png"),#
		
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['self'],
		reqs = [],
		tags = ['magic', 's_set'],
		value = ['caster.alt_mana', '+1'],
		damagestat = 'alt_mana',
		cooldown = 0,
		manacost = 7,
		chance = 100,
		evade = 0,
		casteffects = ['e_s_spiritshield'],
		
		hidden = false,
		sfx = [{code = 'targetfire', target = 'target', period = 'postdamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'firebolt', strike = null, hit = 'firehit', hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	drain = {
		code = 'drain',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/defaultattack.png"),#
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "weapon",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_s_drain_kill','e_s_drain_crit'],
		
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 1,
	},
	restoration = {
		code = 'restoration',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/lesserheal.png"),#
		damagetype = "magic",
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'line',
		allowedtargets = ['ally','self'],
		reqs = [{type = 'stats', name = 'alt_mana', operant = 'gte', value = 1}],
		tags = ['heal', 'type_heal'],
		value = ['target.hpmax'],
		cooldown = 1,
		manacost = 8,
		casteffects = ['e_cost1'],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	implosion = {
		code = 'implosion',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/defaultattack.png"),#
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "weapon",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [{type = 'stats', name = 'alt_mana', operant = 'gte', value = 1}],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_cost1', 'e_s_implosion'],
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 1,
	},
	explosion = {
		code = 'explosion',
		name = tr(""),
		description = tr(""),
		icon = load("res://assets/images/iconsskills/defaultattack.png"),#
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "any",
		targetpattern = 'all',
		allowedtargets = ['enemy'],
		reqs = [{type = 'stats', name = 'alt_mana', operant = 'gte', value = 1}],
		tags = ['damage'],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_cost3', 'e_s_explosion'],
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 1,
	},
	#items
	steakheal = {
		code = 'steakheal',
		name = '',
		description = '',
		icon = null,
		
		damagetype = "food",
		
		skilltype = 'item',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['heal', 'instant'],
		value = ['50'],
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
		
	},
	bluegrass = { #new, to overlook
		code = 'bluegrass',
		name = '',
		description = '',
		icon = null,
		
		damagetype = "food",
		
		skilltype = 'item',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['heal','instant'],
		value = ['25'],
		damagestat = 'mana',
		chance = 100,
		evade = 0,
		critchance = 0,
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
		
	},
	elixir = { #new, to overlook
		code = 'elixir',
		name = '',
		description = '',
		icon = null,
		
		damagetype = "food",
		
		skilltype = 'item',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['heal','instant'],
		chance = 100,
		evade = 0,
		value = ['75', '40'],
		damagestat = ['hp', 'mana'],
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'heal', hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
		
	},

	barrier2 = { #new, to overlook
		code = 'barrier2',
		name = '',
		description = '',
		icon = null,
		
		damagetype = "food",
		
		skilltype = 'item',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['instant'],
		chance = 100,
		evade = 0,
		value = ['0'],
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_i_barrier2'],
	
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = null, hit = null, hittype = 'absolute'},
		
		aipatterns = ['instant'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	barrier3 = { #new, to overlook
		code = 'barrier3',
		name = '',
		description = '',
		icon = null,
		
		damagetype = "food",
		
		skilltype = 'item',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['ally', 'self'],
		reqs = [],
		tags = ['instant'],
		chance = 100,
		evade = 0,
		value = ['0'],
		cooldown = 0,
		manacost = 0,
		casteffects = ['e_i_barrier3'],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = null, hit = null, hittype = 'absolute'},
		
		aipatterns = ['heal'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
	},
	
	#monsters
	spiderattack = { #new, to overlook
		code = 'spiderattack',
		name = "Piercing Attack",
		description = tr("SKILLSPIDERDESCRIPT"),
		icon = load("res://assets/images/iconsskills/cripple.png"),
		
		damagetype = "weapon",
		skilltype = 'skill',
		userange = "melee",
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = [],
		value = ['caster.damage'],
		cooldown = 0,
		manacost = 0,
		casteffects = [
			'e_s_spidernoarmor'
		],
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = 'strike', hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
		
	},
	fairyattack = { #new, to overlook
		code = 'fairyattack',
		name = "Magic Arrow",
		description = tr("SKILLFAIRYDESCRIPT"),
		icon = load("res://assets/images/iconsskills/cripple.png"),
		
		damagetype = "weapon",
		skilltype = 'spell',
		userange = "any",#or should it be ranged only?
		targetpattern = 'single',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = [['caster.damage'],['random 5','+5']],
		damagestat = ['+damage_hp', '-mana'],
		cooldown = 0,
		manacost = 0,
		casteffects = [],
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = 'weapon', hit = null, hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 2,
		
	},
	golemattack = {
		code = 'golemattack',
		name = "Avalanche",
		description = tr("SKILLFAIRYDESCRIPT"),
		icon = load("res://assets/images/iconsskills/cripple.png"),
		
		damagetype = "earth",
		skilltype = 'spell',
		userange = "any",#or should it be ranged only?
		targetpattern = 'all',
		allowedtargets = ['enemy'],
		reqs = [],
		tags = ['damage'],
		value = ['caster.damage', "*0.3"],
		cooldown = 6,
		manacost = 0,
		casteffects = [],
		hidden = false,
		sfx = [{code = 'casterattack', target = 'caster', period = 'windup'},{code = 'targetattack', target = 'target', period = 'predamage'}],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = 'avalanche', strike = null, hit = null, hittype = 'bodyarmor'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 0.3,
		
	},
	
	summontreant = {
		code = 'summontreant',
		name = "Summon",
		description = tr("SKILLSUMMONTREANTDESCRIPT"),
		icon = load("res://assets/images/iconsskills/cripple.png"),
		
		damagetype = "summon",
		
		skilltype = 'spell',
		userange = "any",
		targetpattern = 'single',
		allowedtargets = ['self'],
		reqs = [],
		tags = ['summon'],
		value = ['treant', 2],
		cooldown = 1,
		manacost = 30,
		casteffects = [],
		
		hidden = false,
		sfx = [],
		sfxcaster = null,
		sfxtarget = null,
		sounddata = {initiate = null, strike = null, hit = null, hittype = 'absolute'},
		
		aipatterns = ['attack'],
		aitargets = '1ally',
		aiselfcond = 'any',
		aitargetcond = 'any',
		aipriority = 5,
	},
}


var buffdict = {
	stun = {code = 'stun', icon = 'stun', name = tr("STUN"), description = tr("STUNDESCRIPT")},
	
}

func makebuff(caster, buffcode):
	var newbuff = buffdict[buffcode].duplicate()
	newbuff.caster = caster

func restoremana(data):
	data.target.mana += data.value

func stun(data):
	var newbuff = makebuff(data.caster, 'stun')
	newbuff.duration = 1
	data.target.effects[newbuff.code] = newbuff
