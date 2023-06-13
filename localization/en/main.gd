extends Node

var TranslationDict = {
	#Buildings
	WORKERMARKET = "Market",
	PURCHASE = "Purchase",
	SELL = "Sell",
	TASKS = "Tasks",
	UPGRADES = "Upgrades",
	TOWNHALL = "Town Hall",
	FOODCONV = "Food Conversion",
	HARVESTMETAL = "Harvest Ore",
	HARVESTPLANT = "Harvest Plants",
	GOBLINWORKER = "Goblin Worker",
	ELFWORKER = "Elven Worker",
	
	#Materials
	STARTINGADJ = "Starting",

	MATERIALWOOD = "Wood",
	MATERIALWOODDESCRIPT = "Sturdy wood for general building and furnishing purposes.",
	WOODADJ = "wooden",
	MATERIALSTONE = "Stone",
	MATERIALSTONEDESCRIPT = "Stone comes in many forms and shapes, but might serve as good building material or even poor instrumentum.",
	STONEADJ = 'stone',
	MATERIALELVENWOOD = "Elven Wood",
	MATERIALELVENWOODDESCRIPT = "An unusual wood with additional magic properties. ",
	ELVENWOODADJ = "Elven",
	MATERIALGOBLINMETAL = "Goblin Metal",
	METARIALGOBLINGMETALDESCRIPT = "Rusty looking metal, but still decent for some work. Can be used for heavy armor. ",
	GOBLINMETALADJ = "Goblin",
	MATERIALELVENMETAL = "Elven Metal",
	METARIALELVENMETALDESCRIPT = "Soft, but strong alloy storing some magical properties. ",
	ELVENMETALADJ = "Elven",
	MATERIALLETHER = "Leather",
	MATERIALLEATHERDESCRIPT = "A common animal leather. Can be used for light armor.",
	LEATHERADJ = "Leather",
	MATERIALBONE = "Bone",
	MATERIALBONEDESCRIPT = "A common animal bone. With right approach can provide some interesting properties. ",
	BONEADJ = "Bone",
	MATERIALCLOTH = "Cloth",
	MATERIALCLOTHDESCRIPT = "A simple cotton fibre for simple clothes. Can be used for cloth armor. ",
	CLOTHADJ = "Cotton",


	#Items
	WEAPONAXENAME = "Axe",
	WEAPONPICKAXENAME = "Pickaxe",
	WEAPONSWORDNAME = 'Sword',
	WEAPONBOWNAME = "Bow",
	WEAPONSTAFFNAME = "Staff",


	WEAPONAXEDESCRIPT = 'Axe can be used for cutting wood and combat.',
	WEAPONSWORDDESCRIPT = "Good damage vs unarmored enemies.",
	WEAPONPICKAXEDESCRIPT = "Allows workers to harvest ore, but also can be use in combat.",
	WEAPONBOWDESCRIPT = "Simple weapon for ranged fighters.",
	WEAPONSTAFFDESCRIPT = "A simple tool for magic users.",

	ARMORBASICCHEST = "Chestplate",
	ARMORROBE = "Robe",
	ARMORHOOD = "Hood",
	ARMORSHOES = "Shoes",
	ARMORBASICCHESTDESCRIPT = "Offers basic body protection.",
	ARMORBASICHELM = "Helmet",
	ARMORBASICHELMDESCRIPT = "Offers basic head protection.",
	ARMORBASICBOOTS = "Boots",
	ARMORBASICBOOTSDESCRIPT = "Offers basic foot protection",
	ARMORBASICGLOVES = "Gloves",
	ARMORBASICGLOVESDESCRIPT = "Offers basic hand protection",

	USABLEMORSEL = "Morsel",
	USABLEMORSELDESCRIPT = "A questionable piece of meat. Restores 50 health. Can be converted into Food.",
	USABLEMANAGRASS = "Blue Grass",
	USABLEMANAGRASSDESCRIPT = "An unusual plant with magical properties. Restores 25 mana on use. ",
	USABLEBARRICADE = "Barricade",
	USABLEBARRICADEDESCRIPT = "A makeshift wooden obstacle. Shields target from 50 physical damage for 2 turns",
	USABLEPROTECTIVECHARM = "Protective Charm",
	USABLEPROTECTIVECHARMDESCRIPT = "An enchanted piece of paper. Shields target from 50 magic damage for 2 turns",
	USABLEELIXIR = "Elixir",
	USABLEELIXIRDESCRIPT = "A rejuvinating potion. Restores 75 health and 40 mana.",


	#enemies
	MONSTERELVENRAT = "Elven Rat",
	MONSTERELVENRATFLAVOR = "These animals are fairly common in most areas. Distinct ears make them accumulate all sorts of moniker, but goblins seem to label them this way...",
	MONSTERMOLE = "Mole",
	MONSTERMOLEFLAVOR = "",
	MONSTERVULTURE = "Vulture",
	MONSTEVOLTUREFLAVOR = "",
	MONSTERFAERY = "Faery",
	MONSTERFAERYFLAVOR = "If not for their nasty nature, I would even consider them appealing.",
	
	MONSTERTREANT = "Treant",
	MONSTERTREANTFLAVOR = "Despite its looks, this thing is actually a plant. Often disguises itself as a simple trunk for a nasty surprise.",
	MONSTERSPIDER = "Spider",
	MONSTERSPIDERFLAVOR = "Of course just ents weren't enough...",
	MONSTERANGRYDWARF = "Angry Dwarf",
	MONSTERANGRYDWARFFLAVOR = "Dumb but strong for their size. Despite my best attempts, they didn't seem to be up for any sort of negotiation. ",
	MONSTEREARTHGOLEMBOSS = "Greater Golem",
	MONSTEREARTHGOLEMBOSSFLAVOR = "Twice as big as normal golem. And twice as angry...",
	
	MONSTERDWARFWARRIOR = "Dwarf Warrior",
	MONSTERDWARFWARRIORFLAVOR = "",
	MONSTERZOMBIE = "Zombie",
	MONSTERZOMBIEFLAVOR = "",
	MONSTERSKELETON_WARRIOR = "Skeleton Warrior",
	MONSTERSKEELTON_WARRIORFLAVOR = "",
	MONSTERSKELETON_ARCHER = "Skeleton Archer",
	MONSTERSKEELTON_ARCHERFLAVOR = "",
	MONSTERWRAITH = "Wraith",
	MONSTERWRAITHFLAVOR = "",
	MONSTERCULT_SOLDIER = "Cult Soldier",
	MONSTERCULT_SOLDIERFLAVOR = "",
	MONSTERCULT_MAGE = "Cult Mage",
	MONSTERCULT_MAGEFLAVOR = "",
	MONSTERCULT_ARCHER = "Cult Archer",
	MONSTERCULT_ARCHERFLAVOR = "",
	MONSTERHATCHLING = "Hatchling",
	MONSTERHATCHLINGFLAVOR = "",
	MONSTERWYVERN = "Wyvern",
	MONSTERWYVERNFLAVOR = "",
	MONSTERARMORED_BEAST = "Armored Beast",
	MONSTERARMORED_BEASTFLAVOR = "",
	MONSTERGIANT_TOAD = "Giant Toad",
	MONSTERGIANT_TOADFLAVOR = "",
	MONSTERDEMON1 = "Demon",
	MONSTERDEMON1FLAVOR = "",
	MONSTERDEMON2 = "Demon",
	MONSTERDEMON2FLAVOR = "",
	MONSTERSOLDIER = "Soldier",
	MONSTERSOLDIERFLAVOR = "",
	MONSTERDRONE = "Drone",
	MONSTERDRONEFLAVOR = "",
	MONSTERBOMBER = "Bomber",
	MONSTERBOMBERFLAVOR = "",
	
	
	
	MONSTERBIGTREANT = "Big Ent",
	MONSTERBIGTREANTFLAVOR = "Big ents are somewhat mobile and quite dangerous when provoked.",
	MONSTEREARTHGOLEM = "Earth Golem",
	MONSTEREARTHGOLEMFLAVOR = "A magic creature of considerable power. They seem to roam around some caves and dungeons with little thought. I would expect more from a hand-made slave. ",
	MONSTERDWARVENKING = "Dwarven King",
	MONSTERDWARVENKINGFLAVOR = "",
	MONSTERFEARYQUEEN = "Faery Queen",
	MONSTERFEARYQUEENFLAVOR = "",
	MONSTERDRAGON_BOSS = "Dragon",
	MONSTERDRAGON_BOSSFLAVOR = "",
	MONSTERVIKTOR_BOSS = "Viktor",
	MONSTERVIKTOR_BOSSFLAVOR = "",
	MONSTERANNET = "Annet",
	MONSTERANNETFLAVOR = "",
	MONSTERSCIENTIST_BOSS = "Zelroth",
	MONSTERSCIENTIST_BOSSFLAVOR = "",
	MONSTERCALIBAN = "Monster",
	MONSTERCALIBANFLAVOR = "",
	MONSTERDEMITRIUS1 = "Demitrius",
	MONSTERDEMITRIUS1FLAVOR = "",
	MONSTERDEMITRIUS2 = "Demitrius",
	MONSTERDEMITRIUS2FLAVOR = "",
	
	#gearclasses
	GEARSWORD = "Swords",
	GEARAXE = "Axes",
	GEARSTAFF = "Staves",
	GEARBOW = "Bows",
	GEARPICKAXE = "Pickaxes",

	#Stats
	DAMAGE = 'Damage',
	DAMAGEMOD = "Damage Mult.",
	ARMOR = 'Armor',
	MDEF = "Magic Armor",
	EVASION = 'Evasion',
	HITRATE = 'Hit Chance',
	HEALTH = 'Health',
	DURABILITY = "Durability",
	DURABILITYMOD = "Dur. Factor",
	ARMORPENETRATION = "Armor Pen.",
	RESISTFIRE = "Fire Res.",
	RESISTEARTH = "Earth Res.",
	RESISTAIR = "Air Res.",
	RESISTWATER = "Water Res.",
	HEALTHPERCENT = "Max. Health",
	MANAPERCENT = "Max. Mana",
	CRITICAL = "Critical",
	CRITCHANCE = "Crit. Chance",
	CRITMOD = "Crit. Mod",
	LEVELUP = "Level up",
	MAXLEVEL =  "Maximum Level",
	LEVEUPTEXT = " has just acquired a level. Select a new trait to unlock",

	#stat tooltips
	TOOLTIPDAMAGE = "Defines damage output of skills and spells",
	TOOLTIPARMOR = "Reduces skill damage taken by this percent",
	TOOLTIPMDEF = "Reduces spell damage taken by this percent",
	TOOLTIPCRIT = "Percent chance to crit for extra damage\nFirst value is a chance. Second value is a modifier.",
	TOOLTIPHITRATE = "Percent chance to hit target\nReduced by enemy's evasion",
	TOOLTIPARMORPEN = "Reduces enemy armor by this value",
	TOOLTIPEVASION = "Reduces enemy hit chance by this value",
	TOOLTIPSPEED = "Improves your odds to act before other characters",
	TOOLTIPRESISTS = "Reduces elemental damage by relative resist",

	AREAFORESTNAME = "Forest",
	AREAFORESTDESCRIPT = "An ancient forests rumored to be home to elves and stumps. The visitors are rare around these places especially after the stray faeries have been appearing around here.",
	AREACAVENAME = "Caves",
	AREACAVEDESCRIPT = "A labyrinth of dark tunnels and chambers that lead deep into the earth. The walls are slick with moisture and the air is thick with the musky scent of bats. Legend has it that hidden within the caves lies an ancient evil capable of bringing world's destruction.",
	AREAROAD_TO_TOWNNAME = "Road to Aeros",
	AREAROAD_TO_TOWNDESCRIPT = "A well-traveled path that winds through rolling hills and stretches of open plain. Merchants and adventurers alike make use of this road to reach the nearby town, but beware of bandits and wild animals that lurk in the shadows.",
	AREACASTLENAME = "Summerhill Keep",
	AREACASTLEDESCRIPT = "A foreboding fortress that looms over a desolate wasteland. The castle's walls are lined with the skeletal remains of those who dared to approach, and its halls echo with the haunting whispers of restless spirits. ",
	AREADRAGON_MOUNTAINSNAME = "Dragon Mountains",
	AREADRAGON_MOUNTAINSDESCRIPT = "A towering range of jagged peaks that stretch as far as the eye can see. Despite its name its mainly wyverns nest here instead of actual dragons, yet rumors say there might be some dragons left there.",
	AREACULTNAME = "Cult Grounds",
	AREACULTDESCRIPT = "The place for Ancestors' cult worshippers. One of the more safe and secured places out there given the worshippers have their own militia. The home to Demitrius and Iola. ",
	AREAMODERN_CITYNAME = "Place out of this world ",
	AREAMODERN_CITYDESCRIPT = "A desolate landscape of towering, rusted skyscrapers and broken highways. This once-thriving metropolis was destroyed in the process of teleportation into this dimension by Demitrius and all its inhabitants have been killed or possessed by demons. ",
	
	
	ROAD_TO_VILLAGENAME = "Road to village",
	ROAD_TO_VILLAGEDESCRIPT = "You are forced to walk through deserts in search of any kind of settlement.",
	FOREST_ERIKANAME = "Search for Elves",
	FOREST_ERIKADESCRIPT = "You've learned that the elves live at the ancient forest and might be able to help you.",
	CAVES_DEMITRIUSNAME = "Escort Demitrius",
	CAVES_DEMITRIUSDESCRIPT = "A priest from Ancestors' cult has asked you to escort him to the depths of the caves... And you couldn't refute.",
	CAVES_IOLANAME = "Escort Iola",
	CAVES_IOLADESCRIPT = "Despite your best hopes, Demitrius daughter has asked you to help her find her father, so you gonna have to escort her now.",
	ROAD_TO_TOWNNAME = "Road to Aeros",
	ROAD_TO_TOWNDESCRIPT = "Its time to visit the only major local town around these lands. Good thing its fairly straightforward.",
	CAVES_DWARFNAME = "Dwarfing Problems",
	CAVES_DWARFDESCRIPT = "Your entrance to the town has been abrupted by guards who forced you to do a task in their place... Screw guards.",
	FOREST_ERIKA_SIDEQUESTNAME = "Elven Medicine",
	FOREST_ERIKA_SIDEQUESTDESCRIPT = "Erika has suggested something what could mellow Rose for her advances... ",
	FOREST_FAERIES_1NAME = "Faery Queen",
	FOREST_FAERIES_1DESCRIPT = "You have to find Faery Queen who seems to possess the artifact you are looking for which can help you get back to your world. Or at least Rose insists so.",
	FOREST_FAERIES_2NAME = "Faering Dirty Laundry",
	FOREST_FAERIES_2DESCRIPT = "With the bitch of a Queen she is, we need a new plan to get to her. And Rilu proposed one.",
	FOREST_FAERIES_3NAME = "Trapping the Royalty",
	FOREST_FAERIES_3DESCRIPT = "Getting the annoying bitch, this time for sure. ",
	CASTLE_IOLANAME = "Fetch Quest",
	CASTLE_IOLADESCRIPT = "Iola asked us to get her some spirit essence necessary for her religious stuff from a spooky place. Can't blame her not willing to go here herself I suppose.",
	CULT_IOLA_RESCUENAME = "Iola's Rescue",
	CULT_IOLA_RESCUEDESCRIPT = "Somehow Rilu has found out that Iola was captured by her cult and is in danger. Could it be her weirdo father fault?",
	DRAGON_MOUNTAINSNAME = "Dragon Climbing",
	DRAGON_MOUNTAINSDESCRIPT = "For some reason Ember demanded us to come here. I kinda hate it, but what if there's more dragon girl here?",
	TOWN_VIKTOR_FIGHTNAME = "Vengence",
	TOWN_VIKTOR_FIGHTDESCRIPT = "We've received an ominous letter telling us to come here...",
	CAVES_WANDERERNAME = "Wanderer",
	CAVES_WANDERERDESCRIPT = "Iola has found some reason to bring us to these darn mines again... If we aren't getting another harem member from this I'm going to be disappointed.",
	TOWN_SIEGENAME = "Pandemonium",
	TOWN_SIEGEDESCRIPT = "They said weird stuff has been going on around the town lately. ",
	CASTLE_RILUNAME = "Rilu's Disappearance",
	CASTLE_RILUDESCRIPT = "One night Rilu has left on her own into unknown direction. My curiousity has picked up and I decided to follow.",
	CASTLE_RILU_RETURNNAME = "Last Measures",
	CASTLE_RILU_RETURNDESCRIPT = "With both Rose and Iola missing, there's not much we can do, except for relying on Rilu's plan.",
	CULT_ROSE_RESCUENAME = "Standoff",
	CULT_ROSE_RESCUEDESCRIPT = "We have to face Demitrius to get back my property... I mean, Rose and Iola.",
	FINAL_BATTLE_STAGE1NAME = "Final Battle",
	FINAL_BATTLE_STAGE1DESCRIPT = "A serie of battles in final standing",
	MODERN_CITY_STAGE1NAME = "Unknown Ruins",
	MODERN_CITY_STAGE1DESCRIPT = "I don't like it, but what else we gonna do but go for Demitrius now?",
	FOREST_ERIKA_ROSE_MISSIONNAME = "Elven Tea",
	FOREST_ERIKA_ROSE_MISSIONDESCRIPT = "Erika suggested to get some special herbs to make Rose more... accepting. ",
	
	
	#Menu
	NEWGAME = "New Game",
	LOAD = 'Load',
	OPTIONS = 'Options',
	QUIT = 'Quit',
	CLOSE = "Close",
	PROCEED = "Proceed",
	SELECTHERO = "Select Hero",
	SOUND = "Sound",
	MUSIC = "Music",
	MASTERSOUND = "Master Volume",
	MUTE = "Mute",
	AUDIO = "Audio",

	TEXTSPEED = "Text Speed",
	SKIPREAD = "Skip Read",
	DISABLETUTORIAL = "Disable Tutorial",

	#hotkeys tab in options
	TAB_HOTKEYS = "Hotkays",
	TAB_HOTKEYS_SKILLS = "Skills",
	HOTKEYS_REMAP = "Remap",
	HOTKEYS_DEFAULT = "Default",
	SKILL_ATTACK = "Attack",
	SKILL_DEFENCE = "Defence",
	SKILL_PERSONAL1 = "Hero's skill 1",
	SKILL_PERSONAL2 = "Hero's skill 2",
	SKILL_PERSONAL3 = "Hero's skill 3",
	SKILL_PERSONAL4 = "Hero's skill 4",
	SKILL_PERSONAL5 = "Hero's skill 5",
	SKILL_PERSONAL6 = "Hero's skill 6",
	SKILL_PERSONAL7 = "Hero's skill 7",
	SKILL_PERSONAL8 = "Hero's skill 8",
	REMAP_TEXT = "Please, press desired button for action %s",
	REMAP_SWITCH_TEXT = "Pressed button already maped on %s. Do you wish to switch them?",
	REMAP_DEFAULT = "This action will irreversible neglect all your changes to hotkey mapping. Are you sure?",

	CURRENTFOOD = "Current Food",
	GAINFOOD = "Food Value",
	FOODCONVERT = "Convert Food",

	#System
	CONFIRM = "Confirm",
	FRONT = "Front",
	BACK = "Back",
	CANCEL = "Cancel",
	REMOVE = "Remove",
	NONE = "None",
	SPEED = "Speed",
	DAY = "Day",
	ENERGY = "Energy",
	TIME = "Time",
	CRAFT = "Craft",
	BLACKSMITH = "Blacksmith",
	PROGRESS = "Progress",
	REPAIR = "Repair",
	REPAIRALL = "Repair All",
	WORKERNOENERGY = " has no energy left and stopped working.",
	TOOLBROKEN = " has broken.",
	CURRENTTASK = "Current Task",
	REQUIREDMATERIAL = "Required Material",
	REQUIREDMATERIALS = "Required Materials",
	SELECTREPAIR = "Select Item(s) to Repair",
	TOTALPRICE = "Total Price",
	SELECTMATERIAL = "Select materials for all parts.",
	INPOSESSION = "In Possession",
	BASECHANCE = "Base Chance",
	CANTREPAIREFFECT = "This item can't be repaired.",
	NOTENOUGH = "Not enough",
	ITEMCREATED = "Item Created",
	UPGRADEUNLOCKED = "Upgrade Unlocked",
	MAINQUEST = "Main Quest",
	SIDEQUESTS = "Sidequests",
	MAINQUESTUPDATED = "Main Quest Updated",
	QUESTLOG = "Quest Log",
	SCENES = "Scenes",
	NOACTIVEQUESTS = "You have no active quests.",
	INVALIDCLASS = "Invalid class for this gear.",
	NOTENOUGHGOLD = "Not enough gold",
	PURCHASETHISTRAIT = "Purchase this trait",
	TRAITPOINTSCOST = "Trait Points",
	TRAITPOINTS = "Trait Points used",
	GOLDPRICE = "Gold Cost",
	ABANDONAREA = "Abandon Area",
	DONOTSHOW = "Don't show any more",

	SYSNOFOOD = "Work canceled: No food",
	SYSNOWORKERENERGY = "Work canceled: No energy",

	BASEDAMAGETYPE = "Basic Attack damage type",
	TOOLTIPEXP = "Experience. Character gains EXP from combat.",
	TOOLTIPHP = "Health. Automatically restored after each combat.",
	
	
	SELECT = "Select",
	SELECTTOOL = "Select Tool",
	SELECTWORKER = "Select Worker",
	SELECTITEM = "Select Item",
	WORKERLIMITREACHER = "Worker Limit Reached: Upgrade Houses to increase",
	TOTALWORKERS = "Total Workers",

	TRAITS = "Traits",
	CLASSINFO = "Class Details",

	INVENTORY = "Inventory",
	RETURN = "Return",
	HEROLIST = "Hero List",
	OPTIONMENU = "Options",

	INVENTORYALL = "All items",
	INVENTORYWEAPON = "Weapons",
	INVENTORYARMOR = "Armor",
	INVENTORYMATERIAL = "Materials",
	INVENTORYUSE = "Usables",
	INVENTORYQUEST = "Misc",
	SELLCONFIRM = "Sell",
	RAWPRICE = "Raw Price",
	FOODDESCRIPT = "Food is used to feed workers. ",
	MONEYDESCRIPT = "Money is used to purchase goods and workers.",

	AREAISENDLESS = "This area has no progression",
	TOWNRETURN = "Return",

	#Confirms

	LEAVECONFIRM = "Leave to Main Menu? Unsaved progress will be lost. ",
	LOADCONFIRM = "Load this save file?",
	OVERWRITECONFIRM = "Overwrite this save file?",
	DELETECONFIRM = "Delete this save file?",
	STOPTASKCONFIRM = "Stop this job?",
	SLAVEREMOVECONFIRM = "Expel this worker?",


	#Inbuilt Tooltips
	PAUSEBUTTONTOOLTIP = 'Pause\nHotkey: 1',
	NORMALBUTTONTOOLTIP = 'Normal Speed\nHotkey: 2',
	FASTBUTTONTOOLTIP = 'Fast Speed\nHotkey: 3',


	#Tasks
	HARVESTWOOD = "Harvest Lumber",
	WOODCUTTINGTASKDESCRIPTION = "Harvest lumber from nearest vegetation.",
	HARVESTMETALDESCRIPTION = "Harvest metal ores from the mine. \n[color=red]Requires a pickaxe.[/color]",
	HARVESTPLANTDESCRIPTION = "Produce plants from the farm.",


	#Classes
	CLASSDESCRIPT = "Class defines character's basic characteristics, abilities, specific traits and allowed gear. More abilities are unlocked as you level up. After certain level you can advance into one of the new classes.",
	WARRIOR = "Warrior",
	MAGE = "Mage",
	ARCHER = "Archer",
	BRAWLER = "Brawler",
	WARRIORDESCRIPT = "Warrior is a strong melee class focusing on tanking and dealing damage. They can handle many weapons but lack in magic and range. ",
	MAGEDESCRIPT = "Mage is a supporting class capable of both healing and slinging powerful area spells. ",
	ARCHERDESCRIPT = "Archer is a ranged damaging class. Having access to some spells, they can hit any target on the battlefield. ",
	BRAWLERDESCRIPT = "Brawler is a melee supporting class. They specialize in using special attacks for crowd control. ",
	MAGETRAITDESCRIPT = "Gain 1 bonus Damage for every 2 bonus Magic Armor.",
	ARCHERTRAITDESCRIPT = "Gain 1 bonus Hit Rate for every 1 bonus Evasion.",
	CLASSALLOWEDWEAPONS = "Allowed gear",
	CLASSTRAIT = "Class bonus",

	#Names
	ARRON = 'Arron',
	ROSE = 'Rose',
	EMBER = 'Ember',
	ERIKA = 'Erika',
	RILU = 'Rilu',
	IOLA = 'Iola',
	GOBLIN = 'Goblin',
	GUARD1 = 'Guard1',
	GUARD2 = 'Guard2',
	GUARD3 = 'Guard3',
	NORBERT = 'Norbert',
	DEMITRIUS = "Demitrius",
	LYRA = "Lyra",
	FLAK = "Flak",
	
	SKILLATTACK = "Base Attack",
	SKILLATTACKDESCRIPT = "The most generic attack with no strengths or weaknesses.",
	SKILLDEFENCE = "Defence",
	SKILLDEFENCEDESCRIPT = "Reduces incoming damage by 50% until next turn.",
	SKILLFENCING = "Fencing",
	SKILLFENCINGDESCRIPT = "Strikes enemy 3 times. If target dies, switch to another enemy.",
	SKILLLUNGE = "Lunge",
	SKILLLUNGEDESCRIPT = "Stikes a single target and apply bleeding effect.",
	SKILLSIDESLASH = "Side Slash",
	SKILLSIDESLASHDESCRIPT = "Strikes single target and additionally hits target next to it.",
	SKILLSWIFT_S = "Swift Strike",
	SKILLSWIFT_SDESCRIPT = "Strikes single target and gain +20 evasion for 1 turn.",
	SKILLPARRY = "Parry",
	SKILLPARRYDESCRIPT = "Select an ally target. Single target attacks will be redirected to you for 2 turns. 50% chance to receive no damage at all. Deals Slash damage for every attack redirected to you. ",
	SKILLSWORD_MASTERY = "Sword Mastery",
	SKILLSWORD_MASTERYDESCRIPT = "Self: your next attack deals 150% damage.",
	SKILLTERMINATION = "Termination",
	SKILLTERMINATIONDESCRIPT = "Self: +25% attack damage for next 3 turns. After that delivers 4 strikes to a target.",
	SKILLSMOKE_S = "Smoke Screen",
	SKILLSMOKE_SDESCRIPT = "All allies receive +90 evasion for 1 turn. ",
	SKILLSWIPE = "Swipe",
	SKILLSWIPEDESCRIPT = "Strikes a single enemy, dispelling them.",
	SKILLFIRE_BOLT = "Fire Bolt",
	SKILLFIRE_BOLTDESCRIPT = "A fire attack, applying Burn effect for 2 turns.",
	SKILLFLASH = "Flash",
	SKILLFLASHDESCRIPT = "Reduce Hit Rate of enemies by 25 for 1 turn.",
	SKILLDELUGE = "Deluge",
	SKILLDELUGEDESCRIPT = "Hit enemy receive effect: next Air attack deals 30% more damage.",
	SKILLRENEW = "Renew",
	SKILLRENEWDESCRIPT = "Heals ally target for 35% of maximum health and applies buff: Heal for 25% of maximum health at start of new turn for 2 turns.",
	SKILLDISPEL = "Dispel",
	SKILLDISPELDESCRIPT = "Remove all debuffs from 1 ally.",
	SKILLEXPLOSION = "Explosion",
	SKILLEXPLOSIONDESCRIPT = "Deals heavy fire damage to all enemies.",
	SKILLPROTECT = "Protection",
	SKILLPROTECTDESCRIPT = "Provides damage negating barrier to an ally and dispell all debuffs.",
	SKILLQSHOT = "Quick Shot",
	SKILLQSHOTDESCRIPT = "Hit random targets 3 times.",
	SKILLAARROW = "Air Arrow",
	SKILLAARROWDESCRIPT = "Hit enemy receive effect: next Air attack deals 50% more damage.",
	SKILLEASTRIKE = "Earth Strike",
	SKILLEASTRIKEDESCRIPT = "Deals 30% more damage to stunned targets.",
	SKILLFROST_ARROW = "Frost Arrow",
	SKILLFROST_ARROWDESCRIPT = "50% chance to Freeze target. Frozen target is stunned and takes double damage from next attack. Duration: 2 turns.",
	SKILLARR_SHOWER = "Arrow Shower",
	SKILLARR_SHOWERDESCRIPT = "Hits all enemies on the field.",
	SKILLNAT_BLESS = "Nature's Blessing",
	SKILLNAT_BLESSDESCRIPT = "Increase all Ally Damage by 20% and Hit Rate by 20 for 2 turns.",
	SKILLHEARTSEEKER = "Heartseeker",
	SKILLHEARTSEEKERDESCRIPT = "Ignores barriers and stuns target for 2 turns.",
	SKILLCHARM = "Charm",
	SKILLCHARMDESCRIPT = "Reduce all enemy damage by 50% for 3 turns.",
	SKILLCOMBO = "Combo attack",
	SKILLCOMBODESCRIPT = "Hits 3 times. If target dies, repeats on the enemy behind it.",
	SKILLFIREPUNCH = "Fire Punch",
	SKILLFIREPUNCHDESCRIPT = "Apply Burn. If target is already burning, deals 30% more damage.",
	SKILLSHOCKWAVE = "Shockwave",
	SKILLSHOCKWAVEDESCRIPT = "Target Neighboors receive 50% damage.",
	SKILLUPPERCUT = "Uppercut",
	SKILLUPPERCUTDESCRIPT = "Hit enemy receive effect: next Air attack deals 50% more damage",
	SKILLDEFEND = "Defend",
	SKILLDEFENDDESCRIPT = "All single target attacks will be redirected at you for 1 turn. Also receive 25% less damage.",
	SKILLDRAGON_PROTECTION = "Dragon Protection",
	SKILLDRAGON_PROTECTIONDESCRIPT = "Receive barrier for 25% of max health and can't be debuffed for 1 turn.",
	SKILLAEGIS = "Aegis",
	SKILLAEGISDESCRIPT = "Reduce all damage taken for all allies by 75% for 1 turn.",
	SKILLEARTHQUAKE = "Earthquake",
	SKILLEARTHQUAKEDESCRIPT = "Hits all enemies 4 times.",
	SKILLDARK_ORB = "Dark Orb",
	SKILLDARK_ORBDESCRIPT = "Hit enemy receive effect: Take 25% more damage from all Light and Dark sources for 2 turns.",
	SKILLPALE_MIST = "Pale mist",
	SKILLPALE_MISTDESCRIPT = "Consume 1 Spirit. Hit enemy receive Poisoned effect for 3 turns.",
	SKILLAVALANCHE = "Avalanche",
	SKILLAVALANCHEDESCRIPT = "Hit 5 times. Targets chosen randomly. 20% chance to stun target on hit.",
	SKILLSOULTHORNS = "Soul Thorns",
	SKILLSOULTHORNSDESCRIPT = "Deal 40% more damage if target is stunned.",
	SKILLDARK_ECHOES = "Dark Echoes",
	SKILLDARK_ECHOESDESCRIPT = "Receive barrier for 30% of maximum health. All enemies are taunted for 2 turns.",
	SKILLRESTORATION = "Restoration",
	SKILLRESTORATIONDESCRIPT = "Consume 1 Spirit. Restore 20% of maximum health to all allies.",
	SKILLSOUL_BEAM = "Soul Beam",
	SKILLSOUL_BEAMDESCRIPT = "Dispell all target barriers. Consume all spirits. Deal Light damage based on spirits consumed. After damage apply debuff: Increase incoming damage by 20% for 2 turns.",
	SKILLSOUL_PROT = "Soul Protection",
	SKILLSOUL_PROTDESCRIPT = "Consume all spirits. Heal based on spirits consumed. Apply buff: Health can't drop below 1 for 2 turns.",
	SKILLHOLY_LIGHT = "Holy Light",
	SKILLHOLY_LIGHTDESCRIPT = "Deals light damage to a single target.",
	SKILLGUSTOFWIND = "Gust of Wind",
	SKILLGUSTOFWINDDESCRIPT = "Hit enemy receive effect with 40% chance: Deal 15% less damage for 2 turns.",
	SKILLSMASH = "Smash",
	SKILLSMASHDESCRIPT = "50% chance to Stun target for 1 turn.",
	SKILLCLEANSING = "Cleansing",
	SKILLCLEANSINGDESCRIPT = "Dispel all positive buffs on target. If target is burning cooldown is reset.",
	SKILLBARRIER = "Barrier",
	SKILLBARRIERDESCRIPT = "Shields ally for 50% of their maximum health for 1 turn.",
	SKILLBLESS = "Bless",
	SKILLBLESSDESCRIPT = "Heal one ally target for 50% of caster's maximum health. Apply buff: +25 Hit Rate, +15% damage for 2 turns.",
	SKILLSANCTUARY = "Sanctuary",
	SKILLSANCTUARYDESCRIPT = "Heal all living allies for 35% of caster's maximum health and ressurect the dead ones. ",
	SKILLPURGE = "Purge",
	SKILLPURGEDESCRIPT = "Dispel and silence all enemies for 2 turns.",
	
	SKILLRILUPASSIVE = "Spirit Attractor",
	SKILLRILUPASSIVEDESCRIPT = "Start the battle with 1 Spirit. Each Spirit increase damage received by 5% and damage dealt by 8%. When hit has 50% chance to generate new Spirit. Can hold up to 5 Spirits.",
	
	WEAPON_ARRON1 = "Bastard Sword",
	WEAPON_ARRON2 = "Royal Sword",
	WEAPON_ARRON1_EFFECT1 = "Fencing: deals 1 more attack if target is killed",
	WEAPON_ARRON1_EFFECT2 = "Fencing: deals 1 more attack if target is killed\n\nSword Mastery: apply to 2 attacks instead of 1",
	WEAPON_ARRON1_EFFECT3 = "Fencing: deals 1 more attack if target is killed\n\nSword Mastery: apply to 2 attacks instead of 1\n\nSwift Strike: buff lasts 2 turns",
	WEAPON_ARRON1_EFFECT4 = "Fencing: deals 2 more attacks if target is killed\n\nSword Mastery: apply to 2 attacks instead of 1\n\nSwift Strike: buff lasts 2 turns\n\nTermination: damage bonus increased to 50%",
	WEAPON_ARRON2_EFFECT1 = "Fencing: reduce Target's damage by 15% for 2 turns",
	WEAPON_ARRON2_EFFECT2 = "Fencing: reduce Target's damage by 15% for 2 turns\n\nParry: lasts one additional turn",
	WEAPON_ARRON2_EFFECT3 = "Fencing: reduce Target's damage by 15% for 2 turns\n\nParry: lasts one additional turn\n\nLunge: also hits target behind",
	WEAPON_ARRON2_EFFECT4 = "Fencing: reduce Target's damage by 25% for 2 turns\n\nParry: lasts one additional turn\n\nLunge: also hits target behind\n\nSmoke Screen: also reduce all received damage by 50% for 2 turns",
	
	WEAPON_ROSE1 = "Wand of Fire",
	WEAPON_ROSE2 = "Crystal Staff",
	WEAPON_ROSE1_EFFECT1 = "Fire Bolt: Burn damage +100%",
	WEAPON_ROSE1_EFFECT2 = "Fire Bolt: Burn damage +100%\n\nReduce all cooldowns by 1 when last hitting an enemy",
	WEAPON_ROSE1_EFFECT3 = "Fire Bolt: Burn damage +100%\n\nReduce all cooldowns by 1 when last hitting an enemy\n\nFlash: has 10% chance to stun enemy",
	WEAPON_ROSE1_EFFECT4 = "Fire Bolt: Burn damage +200%\n\nReduce all cooldowns by 1 when last hitting an enemy\n\nFlash: has 15% chance to stun enemy\n\nExplosion: deals 200% more damage if there's only 1 target",
	WEAPON_ROSE2_EFFECT1 = "Renew: provides 20% damage resist for 2 turns",
	WEAPON_ROSE2_EFFECT2 = "Renew: provides 20% damage resist for 2 turns\n\nDispel: applies to all allies",
	WEAPON_ROSE2_EFFECT3 = "Renew: provides 20% damage resist for 2 turns\n\nDispel: applies to all allies\n\nDeluge: hit chance is 100%, and affect all enemies",
	WEAPON_ROSE2_EFFECT4 = "Renew: provides 30% damage resist for 2 turns\n\nDispel: applies to all allies\n\nDeluge: hit chance is 100%, and affect all enemies\n\nProtection: gives all other allies barrier with 1/3 of strength",
	
	WEAPON_ERIKA1 = "Windbreaker",
	WEAPON_ERIKA2 = "The Hawk",
	WEAPON_ERIKA1_EFFECT1 = "Air Arrow: Ignore 35% of target's Air Resist",
	WEAPON_ERIKA1_EFFECT2 = "Air Arrow: Ignore 35% of target's Air Resist\n\nFrozen Arrow: Apply Chill effect: DoT for 0.4 damage for 3 Turns",
	WEAPON_ERIKA1_EFFECT3 = "Air Arrow: Ignore 35% of target's Air Resist\n\nFrozen Arrow: Apply Chill effect: DoT for 0.4 damage for 3 Turns\n\nQuick Shot: Always hit same target",
	WEAPON_ERIKA1_EFFECT4 = "Air Arrow: Ignore 70% of target's Air Resist\n\nFrozen Arrow: Apply Chill effect: DoT for 0.4 damage for 3 Turns\n\nQuick Shot: Always hit same target\n\nHeart Seeker: Increase damage taken by target by 25% for 4 turns",
	WEAPON_ERIKA2_EFFECT1 = "Quick Shot: Deals 1 more attack",
	WEAPON_ERIKA2_EFFECT2 = "Quick Shot: Deals 1 more attack\n\nArrow Shower: Reduce enemy hit chance by 15",
	WEAPON_ERIKA2_EFFECT3 = "Quick Shot: Deals 1 more attack\n\nArrow Shower: Reduce enemy hit chance by 15\n\nNature's Blessing: is passive and applied at the start of combat",
	WEAPON_ERIKA2_EFFECT4 = "Quick Shot: Deals 2 more attacks\n\nArrow Shower: Reduce enemy hit chance by 15\n\nNature's Blessing: is passive and applied at the start of combat\n\nCharm: all non-boss enemies leave the battlefield",
	
	WEAPON_EMBER1 = "Punching Gloves",
	WEAPON_EMBER2 = "Gauntlets of Endurance",
	WEAPON_EMBER1_EFFECT1 = "Combo Attack: deal 25% more damage if target is stunned",
	WEAPON_EMBER1_EFFECT2 = "Combo Attack: deal 25% more damage if target is stunned\n\nFire Punch: enemy takes 20% more damage for 2 turns",
	WEAPON_EMBER1_EFFECT3 = "Combo Attack: deal 25% more damage if target is stunned\n\nFire Punch: enemy takes 20% more damage for 2 turns\n\nDeal 20% more damage with all attacks",
	WEAPON_EMBER1_EFFECT4 = "Combo Attack: deal 50% more damage if target is stunned\n\nFire Punch: enemy takes 20% more damage for 2 turns\n\nDeal 20% more damage with all attacks\n\nEarthquake: has 20% chance to stun",
	WEAPON_EMBER2_EFFECT1 = "Defend: Reduce cooldown by 1",
	WEAPON_EMBER2_EFFECT2 = "Defend: Reduce cooldown by 1\n\nShockwave: Reduce target's hit chance by 20 for 1 turn",
	WEAPON_EMBER2_EFFECT3 = "Defend: Reduce cooldown by 1\n\nShockwave: Reduce target's hit chance by 20 for 1 turn\n\nDragon's Protection: Increase barrier strength to 50%",
	WEAPON_EMBER2_EFFECT4 = "Defend: Reduce cooldown by 2\n\nShockwave: Reduce target's hit chance by 20 for 1 turn\n\nDragon's Protection: Increase barrier strength to 50%\n\nAegis: Apply buff: +25% max hp for 3 tuns",
	
	
	WEAPON_RILU1 = "Spirit Orb",
	WEAPON_RILU2 = "Sun Sphere",
	WEAPON_RILU1_EFFECT1 = "Dark Orb: 20% chance to cast twice",
	WEAPON_RILU1_EFFECT2 = "Dark Orb: 20% chance to cast twice\n\nSpirit Thorns: Generate 1 spirit",
	WEAPON_RILU1_EFFECT3 = "Dark Orb: 20% chance to cast twice\n\nSpirit Thorns: Generate 1 spirit\n\nRestore: Doubles effect and spirit consumed",
	WEAPON_RILU1_EFFECT4 = "Dark Orb: 40% chance to cast twice\n\nSpirit Thorns: Generate 1 spirit\n\nRestore: Doubles effect and spirit consumed\n\nSoul Beam: Deals 50% more damage",
	WEAPON_RILU2_EFFECT1 = "Dark Echoes: Increase barrier value to 50%",
	WEAPON_RILU2_EFFECT2 = "Dark Echoes: Increase barrier value to 50%\n\nAvalanche: Debuff: Increase taken damage by 20% for 1 turn",
	WEAPON_RILU2_EFFECT3 = "Dark Echoes: Increase barrier value to 50%\n\nAvalanche: Debuff: Increase taken damage by 20% for 1 turn\n\nPale Mist: Also reduce target's hit rate by 25",
	WEAPON_RILU2_EFFECT4 = "Dark Echoes: Increase barrier value to 75%\n\nAvalanche: Debuff: Increase taken damage by 20% for 1 turn\n\nPale Mist: Also reduce target's hit rate by 25\n\nSoul Protection: 25% chance to reduce active cooldown by 1 when Spirit is generated",
	
	WEAPON_IOLA1 = "Staff of Ancients",
	WEAPON_IOLA2 = "Depths Wand",
	WEAPON_IOLA1_EFFECT1 = "Blessing: Reduce cooldown by 1",
	WEAPON_IOLA1_EFFECT2 = "Blessing: Reduce cooldown by 1\n\nSmash: Stun chance is 100%",
	WEAPON_IOLA1_EFFECT3 = "Blessing: Reduce cooldown by 1\n\nSmash: Stun chance is 100%\nCleansing: Applies burn",
	WEAPON_IOLA1_EFFECT4 = "Blessing: Reduce cooldown by 2\n\nSmash: Stun chance is 100%\nCleansing: Applies burn\n\nSanctuary: Increase Heal amount to 70%",
	WEAPON_IOLA2_EFFECT1 = "Barrier: Also applies to self",
	WEAPON_IOLA2_EFFECT2 = "Barrier: Also applies to self\n\nGust of wind: 80% chance to apply 25% reduced damage instead",
	WEAPON_IOLA2_EFFECT3 = "Barrier: Also applies to self\n\nGust of wind: 80% chance to apply 25% reduced damage instead\n\nCleansing: is cast on row",
	WEAPON_IOLA2_EFFECT4 = "Barrier: Also applies to all party\n\nGust of wind: 80% chance to apply 25% reduced damage instead\n\nCleansing: is cast on row\n\nAlso deal 2.5 Light damage to all enemies",
	

	#Upgrades
	UPGRADEPREVBONUS = "Current bonus",
	UPGRADENEXTBONUS = "Unlock bonus",
	BRIDGEUPGRADE = "Bridge",
	UPGRADEBRIDGEDESCRIPT = "Reinforce the bridge leading to the outer lands. Currently it barely allows locals move in and out, but you are afraid it might prove to dangerous for you to cross as is.",
	UPGRADEBRIDGEBONUS = "Unlocks exploration",
	MINEUPGRADE = "Mine",
	UPGRADEMINEDESCRIPT = "The old mine should still be rich in resources, but will require some work on it. ",
	UPGRADEMINEBONUS = "Allows production of ores.",
	FARMUPGRADE = "Farm",
	UPGRADEFARMDESCRIPT = "The farm allows cultivation of various plant fibers, useful for crafting. ",
	UPGRADEFARMBONUS = "Allows production of cloth",
	HOUSESUPGRADE = "Worker Barracks",
	UPGRADEHOUSESDESCRIPT = "Living quarters for your workers. ",
	UPGRADHOUSEBONUS1 = "Hosts up to 4 workers",
	UPGRADHOUSEBONUS2 = "Hosts up to 8 workers",
	BLACKSMITHUPGRADE = "Blacksmith",
	UPGRADEBLACKSMITHDESCRIPT = "Upgrade of Ember's forge will allow the production of new gear.",
	UPGRADEBLACKSMITHBONUS1 = "Unlocks Headgear",
	UPGRADEBLACKSMITHBONUS2 = "Unlocks footgear",
	LUMBERMILLUPGRADE = "Lumber mill",
	UPGRADELUMBERMILLDESCRIPT = "Provides a room for more Lumber Harvesters.",
	UPGRADELUMBERMILLBONUS = "Increases the number of workers allowed in same time to 4. ",

	#traitdescriptions
	TRAITBEASTBONUSDAMAGE = "Deals 20% more damage to animals",
	TRAITBEASTBONUSRESIST = "Takes 20% less damage from animals",
	TRAITBEASTBONUSEXP = "Receive 15% more Experience after combat",
	TRAITBONUSHIT = "+10 Hit Rate",
	TRAITBONUSEVASION = "+10 Evasion",
	TRAITBONUSEVASIONPLUS = "+15 Evasion",
	TRAITBONUSCRIT = "+10% Critical Strike Chance",
	TRAITBONUSRESIST = "+10 To all elemental resists",
	TRAITBONUSARMOR = "+5 Armor",
	TRAITBONUSSPEED = "+10 Speed",
	TRAITBONUSHPMAX = "+25 Maximum Health",
	TRAITBONUSREGEN = "Regenerates 5% Health in the end of each turn",
	TRAITDODGEDEBUFF = "On hit: Reduces Enemy's evasion by 10 for 2 turns",
	TRAITGROUPARMOR = "+10 Armor to all characters in same row",
	TRAITDOUBLEHEAL = "When heals an ally, Caster also heals for 50% of effect",
	TRAITSPEEDONDAMAGE = "+20 Speed for 2 turns after taking damage",
	TRAITSPELLCRITBONUS = "Restores Spell's mana cost on Spell critical",
	TRAITSPEEDDEBUFF = "Reduces Speed and Evasion by 10 when hitting an enemy (stacks up to 2 times)",
	TRAITBOWEXTRADAMAGE = "After dealing a finishing blow, your next attack deals 100% more damage",
	TRAITCRITARMORIGNORE = "Critical strikes ignore target's Armor",
	TRAITDODGEGROUP = "+10 Speed to all characters on the same column",
	TRAITRESISTDEBUFF = "On hit reduces all target resists for 15 for 1 turn",
	TRAITFIREDAMAGEBONUS = "20% Extra Fire damage to skills",

	TAKEGOLDBUTTON = "Take 100 Gold",
	TAKEGOLDBUTTONTOOLTIP = "Refuse all traits and receive 100 gold",
	
	ITEMITEM_HEAL_1NAME = "Carrot",
	ITEMITEM_HEAL_1DESCRIPT = "Restores 500 HP",
	ITEMITEM_HEAL_2NAME = "Morsel",
	ITEMITEM_HEAL_2DESCRIPT = "Restores 2500 HP",
	ITEMITEM_HEAL_3NAME = "Steak",
	ITEMITEM_HEAL_3DESCRIPT = "Restores 10000 HP and dispel all debuffs",
	ITEMITEM_HEAL_AOE_1NAME = "Mushroom",
	ITEMITEM_HEAL_AOE_1DESCRIPT = "Restores 250 HP to all allies",
	ITEMITEM_HEAL_AOE_2NAME = "Sacred Leaf",
	ITEMITEM_HEAL_AOE_2DESCRIPT = "Restores 1250 HP to all allies",
	ITEMITEM_HEAL_AOE_3NAME = "Divine Flower",
	ITEMITEM_HEAL_AOE_3DESCRIPT = "Restores 1250 HP to all allies",
	ITEMITEM_DISPEL_1NAME = "Apple",
	ITEMITEM_DISPEL_1DESCRIPT = "Dispel all debuffs",
	ITEMITEM_DISPEL_2NAME = "Apples",
	ITEMITEM_DISPEL_2DESCRIPT = "Dispel all debuffs from whole team",
	ITEMITEM_RES_1NAME = "Small Soul Piece",
	ITEMITEM_RES_1DESCRIPT = "Resurrect 1 ally with 20% HP",
	ITEMITEM_RES_2NAME = "Large Soul Piece",
	ITEMITEM_RES_2DESCRIPT = "Resurrect 1 ally with 100% HP",
	ITEMITEM_RES_3NAME = "Small Spirit Piece",
	ITEMITEM_RES_3DESCRIPT = "Resurrect all allies with 20% HP",
	ITEMITEM_RES_4NAME = "Large Spirit Piece",
	ITEMITEM_RES_4DESCRIPT = "Resurrect all allies with 100% HP and grant 50% HP barrier for 3 turns",
	ITEMITEM_BARRIER_1NAME = "Magic Feather",
	ITEMITEM_BARRIER_1DESCRIPT = "Apply 25% HP barrier to ally for 2 turns ",
	ITEMITEM_BARRIER_2NAME = "Golden Feather",
	ITEMITEM_BARRIER_2DESCRIPT = "Apply 150% HP barrier to ally for 3 turns ",
	ITEMITEM_BARRIER_3NAME = "Phoenix Feather",
	ITEMITEM_BARRIER_3DESCRIPT = "Apply 100% HP barrier to all allies for 2 turns ",
	ITEMITEM_DAMAGE_1NAME = "Bomb",
	ITEMITEM_DAMAGE_1DESCRIPT = "Deal 1.5 Damage multiplier to 1 enemy",
	ITEMITEM_DAMAGE_2NAME = "Black Bombs",
	ITEMITEM_DAMAGE_2DESCRIPT = "Deal 1.5 Damage multiplier to all enemies",
	ITEMITEM_BUFF_ATKNAME = "Scroll of the Offense",
	ITEMITEM_BUFF_ATKDESCRIPT = "Increase damage by 50% for 3 turns to ally",
	ITEMITEM_BUFF_DEFNAME = "Scroll of the Protection",
	ITEMITEM_BUFF_DEFDESCRIPT = "Reduce incoming damage by 50% for 3 turns to ally",
	
	TUTORIAL = "Tutorial",
	TUTORIAL_SKILL_USAGE = "Select a skill to use on your enemy. Different skills have different attributes and elements to them. Selecting correct skill in certain situation is a key to victory.",
	TUTORIAL_SELECT_CHARACTER = "You can select your characters to make them act first. After all your characters have acted this turn your turn ends.",
	TUTORIAL_ELEMENTAL_WEAKNESSES = "Different enemies are weak to certain elements. Strike with correct element to deal more damage.",
	TUTORIAL_SWAPPING_CHARACTERS = "Drag characters to their positions to place or swap them. This costs no turn.",
	TUTORIAL_BUILDING_UPGRADES = "Select Townhall to access your actions. Upgrading settlement makes characters stronger.",
	TUTORIAL_EXPLORATION_MENU = "Select location and select mission you will be attending. You can replay your old missions for materials and experience.",
}
