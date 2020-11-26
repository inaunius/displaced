extends Node


var partmaterials = { #obsolete
	ToolHandle = {
		starting = {},
		wood = {hitrate = 5},
		elvenwood = {hitrate = 10},
		goblinmetal = {effects = ['gobmetalhandle']},
		elvenmetal = {effects = ['elfmetalhandle']},
		bone = {hpmod = 0.05},
	},
	Blade = {
		starting = {damagemod = -0.4},
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
		starting = {damagemod = -0.4},
		wood = {},
		elvenwood = {damagemod = 0.3, effects = ['elfmetalhandle']},
		bone = {damagemod = 0.1, effects = ['bonebow']},
		goblinmetal = {damagemod = 0.1, effects = ['gobmetalblade']},
		elvenmetal = {damagemod = 0.2, effects = ['elfmetalblade']},
	},
	Rod = {
		starting = {damagemod = -0.4},
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



var Materials = { #obsolete
	#Only for basic equipment
	starting = {name = "Dummy Material", price = 0, icon = load("res://assets/images/iconsitems/Wood.png"), description = "",
	adjective = tr("STARTINGADJ"),
	DefaultEffect = '',
	code = 'starting',
	unlockreqs = [],
	color = Color8(73,49,28),
	parts = {
	}},
	wood = {name = tr("MATERIALWOOD"), price = 5, icon = load("res://assets/images/iconsitems/Wood.png"), description = tr('MATERIALWOODDESCRIPT'),
	adjective = tr("WOODADJ"),
	DefaultEffect = 'natural',
	code = 'wood',
	unlockreqs = [],
	color = Color8(160,100,53),
	parts = {
	}},
	elvenwood = {name = tr("MATERIALELVENWOOD"), price = 10, icon = load("res://assets/images/iconsitems/ElvenWood.png"), description = tr('MATERIALELVENWOODDESCRIPT'),
	adjective = tr("ELVENWOODADJ"),
	DefaultEffect = '',
	code = 'elvenwood',
	unlockreqs = [],
	color = Color8(118,159,52),
	parts = {
	}},
#	stone = {name = tr("MATERIALSTONE"), price = 2, icon = load("res://assets/images/gui/stone.jpg"), description = tr("MATERIALDESCRIPTSTONE"), 
#	adjective = tr('STONEADJ'),
#	DefaultEffect = "brittle",
#	code = 'stone',
#	unlockreqs = [],
#	color = Color8(75,75,75),
#	parts = {
#		Blade = {durabilitymod = 0.4, damage = 4, hitrate = -5},
#		Blunt = {durabilitymod = 0.5, damage = 7},
#		Rod = {durabilitymod = 0.4, damage = 5},
#		ArmorBase = {armor = 20, durabilitymod = 0.5, evasion = -10},
#	}},
	goblinmetal = {name = tr("MATERIALGOBLINMETAL"), price = 10, icon = load("res://assets/images/iconsitems/GoblinMetal.png"), description = tr('METARIALGOBLINGMETALDESCRIPT'),
	adjective = tr("GOBLINMETALADJ"),
	DefaultEffect = '',
	code = 'goblinmetal',
	unlockreqs = [],
	color = Color8(255,182,124),
	parts = {
	}},
	elvenmetal = {name = tr("MATERIALELVENMETAL"), price = 10, icon = load("res://assets/images/iconsitems/ElvenMetal.png"), description = tr('METARIALELVENMETALDESCRIPT'),
	adjective = tr("ELVENMETALADJ"),
	DefaultEffect = '',
	code = 'elvenmetal',
	unlockreqs = [],
	color = Color8(200,200,55),
	parts = {
	}},
	leather = {name = tr("MATERIALLETHER"), price = 5, icon = load("res://assets/images/iconsitems/Leather.png"), description = tr('MATERIALLEATHERDESCRIPT'),
	adjective = tr("LEATHERADJ"),
	DefaultEffect = '',
	code = 'leather',
	unlockreqs = [],
	color = Color8(160,87,52),
	parts = {
	}},
	bone = {name = tr("MATERIALBONE"), price = 5, icon = load("res://assets/images/iconsitems/Bone.png"), description = tr('MATERIALBONEDESCRIPT'),
	adjective = tr("BONEADJ"),
	DefaultEffect = '',
	code = 'bone',
	unlockreqs = [],
	color = Color8(164,180,180),
	parts = {}
	},
	cloth = {name = tr("MATERIALCLOTH"), price = 5, icon = load("res://assets/images/iconsitems/Cloth.png"), description = tr('MATERIALCLOTHDESCRIPT'),
	adjective = tr("CLOTHADJ"),
	DefaultEffect = '',
	code = 'cloth',
	unlockreqs = [],
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
	critchance = tr("CRITCHANCE"),
	critmod = tr("CRITMOD"),
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



var Parts = { #obsolete
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


var Items = { #partly obsolete
	axe = {name = tr("WEAPONAXENAME"), code = 'axe', description = tr("WEAPONAXEDESCRIPT"),
	icon = load("res://assets/images/iconsgear/AxeBasic.png"),
	basedurability = 50.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'axe',
	weaponrange = 'melee',
	unlockreqs = [],
	parts = {Blade = 3, ToolHandle = 1},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['tool', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	hitsound = 'blade',
	effects = ['axe'],
	},
	pickaxe = {name = tr("WEAPONPICKAXENAME"), code = 'pickaxe', description = tr("WEAPONPICKAXEDESCRIPT"),
	icon = load("res://assets/images/iconsgear/PickaxeBasic.png"),
	basedurability = 50.0,
	basestats = {damage = 15, armorpenetration = 10},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'pickaxe',
	weaponrange = 'melee',
	unlockreqs = [],
	parts = {Blade = 3, ToolHandle = 1},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['tool', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	hitsound = 'blade',
	effects = ['pick'],
	},
	sword = {name = tr("WEAPONSWORDNAME"), code = 'sword', description = tr("WEAPONSWORDDESCRIPT"),
	icon = load("res://assets/images/iconsgear/SwordBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 25},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'sword',
	weaponrange = 'melee',
	unlockreqs = [],
	parts = {Blade = 5, ToolHandle = 3},
	partcolororder = {ToolHandle = 1, Blade = 2},
	partmaterialname = "Blade",
	tags = ['weapon', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand'],
	hitsound = 'blade',
	},
	bow = {name = tr("WEAPONBOWNAME"), code = 'bow', description = tr("WEAPONBOWDESCRIPT"),
	icon = load("res://assets/images/iconsgear/BowBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'bow',
	weaponrange = 'any',
	unlockreqs = [],
	parts = {BowBase = 3, ToolHandle = 3},
	partcolororder = {BowBase = 1, ToolHandle = 2},
	partmaterialname = "BowBase",
	tags = ['weapon', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand', 'lhand'],
	hitsound = 'bow',
	},
	staff = {name = tr("WEAPONSTAFFNAME"), code = 'staff', description = tr("WEAPONSTAFFDESCRIPT"),
	icon = load("res://assets/images/iconsgear/StaffBasic.png"),
	basedurability = 100.0,
	basestats = {damage = 20},
	basemods = {},
	itemtype = 'weapon',
	geartype = 'staff',
	weaponrange = 'melee',
	unlockreqs = [],
	parts = {Rod = 2, ToolHandle = 3},
	partcolororder = {Rod = 1, ToolHandle = 2},
	partmaterialname = "Rod",
	tags = ['staff', 'recipe'],
	repairdifficulty = 'easy',
	availslots = ['rhand', 'lhand'],
	hitsound = 'dodge',
	},
	
	#basic Armor
	basicchest = {name = tr("ARMORBASICCHEST"), code = 'basicchest', description = tr("ARMORBASICCHESTDESCRIPT"),
	icon = load("res://assets/images/iconsgear/ArmorBasic.png"),
	alticons = {cloth = {icon = load("res://assets/images/iconsgear/ArmorBasicCloth.png"), part = "ArmorBase", materials = ['cloth'], altname = tr('ARMORROBE')}},
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'chest',
	subtype = 'basic',
	unlockreqs = [{type = "has_upgrade", name = "blacksmith", value = 1}],
	parts = {ArmorBase = 5, ArmorTrim = 3},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['chest'],
	},
	basichelm = {name = tr("ARMORBASICHELM"), code = 'basichelm', description = tr("ARMORBASICHELMDESCRIPT"),
	icon = load("res://assets/images/iconsgear/HelmetBasic.png"),
	alticons = {cloth = {icon = load("res://assets/images/iconsgear/HelmetBasicCloth.png"), part = "ArmorBase", materials = ['cloth','leather'], altname = tr('ARMORHOOD')}},
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'helm',
	subtype = 'basic',
	unlockreqs = [{type = "has_upgrade", name = "blacksmith", value = 1}],
	parts = {ArmorBase = 3, ArmorTrim = 2},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['helm'],
	},
	basicboots = {name = tr("ARMORBASICBOOTS"), code = 'basicboots', description = tr("ARMORBASICBOOTSDESCRIPT"),
	icon = load("res://assets/images/iconsgear/BootsBasic.png"),
	alticons = {cloth = {icon = load("res://assets/images/iconsgear/BootsBasicCloth.png"), part = "ArmorBase", materials = ['cloth'], altname = tr('ARMORSHOES')}},
	basedurability = 100.0,
	basestats = {},
	basemods = {},
	itemtype = 'armor',
	geartype = 'boots',
	subtype = 'basic',
	unlockreqs = [{type = "has_upgrade", name = "blacksmith", value = 2}],
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
	unlockreqs = [{type = "has_upgrade", name = "blacksmith", value = 2}],
	parts = {ArmorBase = 2, ArmorTrim = 2},
	partcolororder = {ArmorBase = 1, ArmorTrim = 2},
	partmaterialname = "ArmorBase",
	tags = ['recipe'],
	repairdifficulty = 'medium',
	availslots = ['gloves'],
	},
	
	
	
	#usables
	morsel = {name = tr("USABLEMORSEL"), code = 'morsel', description = tr("USABLEMORSELDESCRIPT"),
	icon = load("res://assets/images/iconsitems/Morsel.png"),
	itemtype = 'usable',
	unlockreqs = [],
	useeffects = ['heal50'], #for what is this (cause hp are added via skill)? and where is this effect defined?
	useskill = 'steakheal',
	foodvalue = 50,
	tags = [],
	price = 10,
	},
	managrass = {name = tr("USABLEMANAGRASS"), code = 'managrass', description = tr("USABLEMANAGRASSDESCRIPT"),
	icon = load("res://assets/images/iconsitems/BlueGrass.png"),
	itemtype = 'usable',
	unlockreqs = [],
	useeffects = [],
	useskill = 'bluegrass',
	foodvalue = 0,
	tags = [],
	price = 25,
	},
	protectivecharm = {name = tr("USABLEPROTECTIVECHARM"), code = 'protectivecharm', description = tr("USABLEPROTECTIVECHARMDESCRIPT"),
	icon = load("res://assets/images/iconsitems/Charm.png"),
	itemtype = 'usable',
	unlockreqs = [],
	useeffects = [],
	useskill = 'barrier3',
	foodvalue = 0,
	tags = [],
	price = 50,
	},
	barricade = {name = tr("USABLEBARRICADE"), code = 'barricade', description = tr("USABLEBARRICADEDESCRIPT"),
	icon = load("res://assets/images/iconsitems/Barricade.png"),
	itemtype = 'usable',
	unlockreqs = [],
	useeffects = [],
	useskill = 'barrier2',
	foodvalue = 0,
	tags = [],
	price = 50,
	},
	lesserpotion = {name = tr("USABLEELIXIR"), code = 'lesserpotion', description = tr("USABLEELIXIRDESCRIPT"),
	icon = load("res://assets/images/iconsitems/PotionLesser.png"),
	itemtype = 'usable',
	unlockreqs = [],
	useeffects = [],
	useskill = 'elixir',
	foodvalue = 0,
	tags = [],
	price = 50,
	},
}

func gainhealth(target, value):
	target.hp += value

func itemtofood(item):
	state.food += item.foodvalue

var bonustatsarray = ['damage','evasion', 'hitrate','hp','speed','resistfire', 'resistearth', 'resistair', 'resistwater'] #2fix, possibly obsolete

var hero_items_data = {
	arron_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/arron_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/arron_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/arron_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/arron_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	arron_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/arron_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/arron_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/arron_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/arron_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	arron_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/arron_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/arron_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/arron_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/arron_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
	rilu_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/rilu_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rilu_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rilu_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rilu_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	rilu_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/rilu_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rilu_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rilu_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rilu_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	rilu_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/rilu_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rilu_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rilu_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rilu_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
	iola_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/iola_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/iola_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/iola_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/iola_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	iola_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/iola_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/iola_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/iola_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/iola_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	iola_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/iola_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/iola_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/iola_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/iola_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
	rose_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/rose_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rose_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rose_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rose_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	rose_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/rose_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rose_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rose_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rose_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	rose_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/rose_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/rose_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/rose_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/rose_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
	ember_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/ember_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/ember_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/ember_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/ember_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	ember_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/ember_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/ember_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/ember_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/ember_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	ember_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/ember_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/ember_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/ember_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/ember_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
	erika_weapon1 = {
		name = 'weapon1',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/erika_weapon1_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/erika_weapon1_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/erika_weapon1_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/erika_weapon1_4.png",
				lvldesc = "4",
				},
		}
	},
	erika_weapon2 = {
		name = 'weapon2',
		description = 'descript',
		weaponrange = 'melee',
		damagetype = 'pierce',
		weaponsound = 'dodge',
		leveldata = {
			0:{ #for possible use later
				icon = null,
				lvldesc = "Not forged yet",
				cost = {},
				},
			1:{
				icon = "res://assets/images/iconsgear/erika_weapon2_1.png",
				lvldesc = "5",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/erika_weapon2_2.png",
				lvldesc = "6",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/erika_weapon2_3.png",
				lvldesc = "7",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/erika_weapon2_4.png",
				lvldesc = "8",
				cost = {},
				},
		}
	},
	erika_armor = {
		name = 'armor',
		description = 'descript',
		leveldata = {
			1:{
				icon = "res://assets/images/iconsgear/erika_armor_1.png",
				lvldesc = "1",
				cost = {},
				},
			2:{
				icon = "res://assets/images/iconsgear/erika_armor_2.png",
				lvldesc = "2",
				cost = {},
				},
			3:{
				icon = "res://assets/images/iconsgear/erika_armor_3.png",
				lvldesc = "3",
				cost = {},
				},
			4:{
				icon = "res://assets/images/iconsgear/erika_armor_4.png",
				lvldesc = "4",
				cost = {},
				},
		}
	},
}
