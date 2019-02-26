extends Node


var partmaterials = {
	ToolHandle = {
		wood = {hitrate = 5},
		elvenwood = {hitrate = 10},
		goblinmetal = {effects = ['gobmetalhandle']},
		elvenmetal = {effects = ['elfmetalhandle']},
		bone = {},
	},
	Blade = {
		wood = {damagemod = -0.5},
		elvenwood = {damagemod = -0.4},
		goblinmetal = {damage = 3, effects = ['gobmetalblade']},
		elvenmetal = {damagemod = 0.3, effects = ['elfmetalblade']},
		bone = {damagemod = -0.1},
	},
	Blunt = {
		wood = {damagemod = -0.2},
		elvenwood = {damagemod = 0.1},
		goblinmetal = {damage = 2, armorpenetration = 10},
		elvenmetal = {damagemod = 0.3, effects = ['elfmetalblunt']},
		bone = {damagemod = -0.1},
	},
	BowBase = {
		wood = {},
		elvenwood = {damagemod = 0.3, effects = ['elfmetalhandle']},
		bone = {damagemod = 0.1, effects = ['bonebow']},
		goblinmetal = {damagemod = 0.1, effects = ['gobmetalbow']},
		elvenmetal = {damagemod = 0.2, effects = ['elfmetalblade']},
	},
	Rod = {
		wood = {},
		elvenwood = {damagemod = 0.2, effects = ['elfwoodrod']},
		bone = {effects = ['bonerod']},
		goblinmetal = {effects = ['gobmetalrod']},
		elvenmetal = {damagemod = 0.1, speed = 10},
	},
	ArmorBase = {
		leather = {evasion = 20},
		bone = {armor = 10, evasion = 10},
		cloth = {evasion = 5, mdef = 10},
		goblinmetal = {armor = 20, resistfire = 20},
		elvenmetal = {armor = 25, mdef = 10},
		
	},
	ArmorTrim = {
		wood = {hpmod = 0.1},
		elvenwood = {hpmod = 0.1, manamod = 0.1},
		bone = {mdef = 3},
		cloth = {manamod = 0.1},
		goblinmetal = {hpmod = 0.15, resistearth = 15},
		elvenmetal = {mdef = 10, manamod = 0.1},
		
	},
}


func _init():
	for i in partmaterials:
		for k in partmaterials[i]:
			Materials[k].parts[i] = partmaterials[i][k].duplicate()



var Materials = {
	wood = {name = tr("MATERIALWOOD"), price = 1, icon = load("res://assets/images/iconsitems/Wood.png"), description = tr('MATERIALWOODDESCRIpT'),
	adjective = tr("WOODADJ"),
	DefaultEffect = 'natural',
	code = 'wood',
	unlockreq = true,
	color = Color8(160,100,53),
	parts = {
	}},
	elvenwood = {name = tr("MATERIALELVENWOOD"), price = 1, icon = load("res://assets/images/iconsitems/ElvenWood.png"), description = tr('MATERIALELVENWOODDESCRIPT'),
	adjective = tr("ELVENWOODADJ"),
	DefaultEffect = '',
	code = 'elvenwood',
	unlockreq = true,
	color = Color8(118,159,52),
	parts = {
	}},
#	stone = {name = tr("MATERIALSTONE"), price = 2, icon = load("res://assets/images/gui/stone.jpg"), description = tr("MATERIALDESCRIPTSTONE"), 
#	adjective = tr('STONEADJ'),
#	DefaultEffect = "brittle",
#	code = 'stone',
#	unlockreq = true,
#	color = Color8(75,75,75),
#	parts = {
#		Blade = {durabilitymod = 0.4, damage = 4, hitrate = -5},
#		Blunt = {durabilitymod = 0.5, damage = 7},
#		Rod = {durabilitymod = 0.4, damage = 5},
#		ArmorBase = {armor = 20, durabilitymod = 0.5, evasion = -10},
#	}},
	goblinmetal = {name = tr("MATERIALGOBLINMETAL"), price = 1, icon = load("res://assets/images/iconsitems/GoblinMetal.png"), description = tr('METARIALGOBLINGMETALDESCRIPT'),
	adjective = tr("GOBLINMETALADJ"),
	DefaultEffect = '',
	code = 'goblinmetal',
	unlockreq = true,
	color = Color8(255,182,124),
	parts = {
	}},
	elvenmetal = {name = tr("MATERIALELVENMETAL"), price = 1, icon = load("res://assets/images/iconsitems/ElvenMetal.png"), description = tr('METARIALELVENMETALDESCRIPT'),
	adjective = tr("ELVENMETALADJ"),
	DefaultEffect = '',
	code = 'elvenmetal',
	unlockreq = true,
	color = Color8(200,200,55),
	parts = {
	}},
	leather = {name = tr("MATERIALLETHER"), price = 1, icon = load("res://assets/images/iconsitems/Leather.png"), description = tr('MATERIALLEATHERDESCRIPT'),
	adjective = tr("LEATHERADJ"),
	DefaultEffect = '',
	code = 'leather',
	unlockreq = true,
	color = Color8(160,87,52),
	parts = {
	}},
	bone = {name = tr("MATERIALBONE"), price = 1, icon = load("res://assets/images/iconsitems/Bone.png"), description = tr('MATERIALBONEDESCRIPT'),
	adjective = tr("BONEADJ"),
	DefaultEffect = '',
	code = 'bone',
	unlockreq = true,
	color = Color8(164,180,180),
	parts = {}
	},
	cloth = {name = tr("MATERIALCLOTH"), price = 1, icon = load("res://assets/images/iconsitems/Cloth.png"), description = tr('MATERIALCLOTHDESCRIPT'),
	adjective = tr("CLOTHADJ"),
	DefaultEffect = '',
	code = 'cloth',
	unlockreq = true,
	color = Color8(100,125,125),
	parts = {}
	},
}

var stats = {
	damage = tr('DAMAGE'),
	damagemod = tr('DAMAGEMOD'),
	armor = tr('ARMOR'),
	evasion = tr('EVASION'),
	hitrate = tr('HITRATE'),
	hpmod = tr("HEALTHPERCENT"),
	manamod = tr("MANAPERCENT"),
	hpmax = tr("HEALTH"),
	speed = tr("SPEED"),
	armorpenetration = tr("ARMORPENETRATION"),
	durability = tr("DURABILITY"),
	durabilitymod = tr("DURABILITYMOD"),
	resistfire = tr('RESISTFIRE'),
	resistwater = tr('RESISTWATER'),
	resistearth = tr('RESISTEARTH'),
	resistair = tr('RESISTAIR'),
	mdef = tr("MDEF"),
	
}



func applyeffect(effect, caster, target):
	
	var value = effect.value
	
	if effect.has('casterreq'):
		if globals.evaluate(effect.casterreq) == false:
			return
	if effect.has('targetreq'):
		if globals.evaluate(effect.targetreq) == false:
			return
	
	

var Parts = {
	ToolHandle = {name = tr("TOOLHANDLE"), code = 'ToolHandle'},
	Blade = {name = tr("BLADE"), code = 'Blade'},
	Blunt = {name = tr("BLUNT"), code = 'Blunt'},
	Rod = {name = tr("ROD"), code = 'Rod'},
	BowBase = {name = tr("BOWBASE"), code = 'BowBase'},
	BowTrim = {name = tr("BOWTRIM"), code = 'BowTrim'},
	ArmorBase = {name = tr("ARMORBASE"), code = 'ArmorBase'},
	ArmorTrim = {name = tr("ARMORTRIM"), code = 'ArmorTrim'},
	ArmorCloth = {name = tr("ARMORCLOTH"), code = 'ArmorCloth'},
	JewelryGem = {name = tr("JEWELRYGEM"), code = 'JewelryGem'},
	
	
}


var Items = {
	axe = {name = tr("WEAPONAXENAME"), code = 'axe', description = tr("WEAPONAXEDESCRIPT"),
	icon = load("res://assets/images/iconsgear/AxeBasic.png"),
	basedurability = 50.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'axe',
	weaponrange = 'melee',
	unlockreq = true,
	parts = {Blade = 3, ToolHandle = 1},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['tool', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	},
	pickaxe = {name = tr("WEAPONPICKAXENAME"), code = 'pickaxe', description = tr("WEAPONPICKAXEDESCRIPT"),
	icon = load("res://assets/images/iconsgear/PickaxeBasic.png"),
	basedurability = 50.0,
	basestats = {damage = 15},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'pickaxe',
	weaponrange = 'melee',
	unlockreq = true,
	parts = {Blade = 3, ToolHandle = 1},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['tool', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	},
	sword = {name = tr("WEAPONSWORDNAME"), code = 'axe', description = tr("WEAPONSWORDDESCRIPT"),
	icon = load("res://assets/images/iconsgear/SwordBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 25},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'sword',
	weaponrange = 'melee',
	unlockreq = true,
	parts = {Blade = 5, ToolHandle = 3},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['weapon', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	},
	bow = {name = tr("WEAPONBOWNAME"), code = 'bow', description = tr("WEAPONBOWDESCRIPT"),
	icon = load("res://assets/images/iconsgear/BowBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'bow',
	weaponrange = 'any',
	unlockreq = true,
	parts = {BowBase = 3, ToolHandle = 3},
	partcolororder = {BowBase = 1, ToolHandle = 2},
	partmaterialname = "BowBase",
	tags = ['weapon', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand', 'lhand'],
	},
	staff = {name = tr("WEAPONSTAFFNAME"), code = 'staff', description = tr("WEAPONSTAFFDESCRIPT"),
	icon = load("res://assets/images/iconsgear/StaffBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'staff',
	weaponrange = 'melee',
	unlockreq = true,
	parts = {Rod = 2, ToolHandle = 3},
	partcolororder = {ToolHandle = 1, Rod = 2},
	partmaterialname = "Rod",
	tags = ['staff', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand', 'lhand'],
	},
	
	#basic Armor
	basicchest = {name = tr("ARMORBASICCHEST"), code = 'basicchest', description = tr("ARMORBASICCHESTDESCRIPT"),
	icon = load("res://assets/images/iconsgear/ArmorBasic.png"),
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'chest',
	subtype = 'basic',
	unlockreq = true,
	parts = {ArmorBase = 5, ArmorTrim = 3},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['chest'],
	},
	basichelm = {name = tr("ARMORBASICHELM"), code = 'basichelm', description = tr("ARMORBASICHELMDESCRIPT"),
	icon = load("res://assets/images/iconsgear/HelmetBasic.png"),
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'helm',
	subtype = 'basic',
	unlockreq = false,
	parts = {ArmorBase = 3, ArmorTrim = 2},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['helm'],
	},
	basicboots = {name = tr("ARMORBASICBOOTS"), code = 'basicboots', description = tr("ARMORBASICBOOTSDESCRIPT"),
	icon = load("res://assets/images/iconsgear/BootsBasic.png"),
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'boots',
	subtype = 'basic',
	unlockreq = false,
	parts = {ArmorBase = 2, ArmorTrim = 2},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['boots'],
	},
	basicgloves = {name = tr("ARMORBASICGLOVES"), code = 'basicgloves', description = tr("ARMORBASICGLOVESDESCRIPT"),
	icon = load("res://assets/images/iconsgear/GloveBasic.png"),
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'gloves',
	subtype = 'basic',
	unlockreq = false,
	parts = {ArmorBase = 2, ArmorTrim = 2},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['gloves'],
	},
	
	
	
	#usables
	meatsteak = {name = tr("MEATSTEAK"), code = 'meatsteak', description = tr("USABLEMEATSTEAKDESCRIPT"),
	icon = load("res://assets/images/iconsitems/Morsel.png"),
	itemtype = 'usable',
	unlockreq = true,
	useeffects = ['heal50'],
	useskill = 'steakheal',
	foodvalue = 50,
	tags = [],
	price = 10,
	},
	
}

func gainhealth(target, value):
	target.hp += value

func itemtofood(item):
	globals.state.food += item.foodvalue

var bonustatsarray = ['damage','damagemod','armor','evasion', 'hitrate','hp', 'hpmod','speed', 'armorpenetration','resistfire', 'resistearth', 'resistair', 'resistwater']

