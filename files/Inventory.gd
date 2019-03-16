extends "res://files/Close Panel Button/ClosingPanel.gd"

onready var itemcontainer = $ScrollContainer/GridContainer

var selectedhero
var mode

func _ready():
	$ScrollContainer/GridContainer/Button.set_meta('type', 'none')
	for i in $HBoxContainer.get_children():
		i.connect('pressed',self,'selectcategory', [i])
	
	#number select panel
	$NumberSelectPanel/ConfirmButton.connect("pressed", self, "NumberConfirm")
	$NumberSelectPanel/CancelButton.connect("pressed", self, "NumberClose")
	$NumberSelectPanel/SpinBox.connect('value_changed', self, 'NumberChanged')
	$NumberSelectPanel/MaxButton.connect("pressed",self, "NumberMax")
	

func open(newmode = null, args = null):
	if newmode == 'hero':
		selectedhero = args
	mode = newmode
	show()
	buildinventory()
	selectcategory($HBoxContainer/all)

func buildinventory():
	globals.ClearContainer(itemcontainer)
	for i in state.materials:
		if state.materials[i] <= 0:
			continue
		var newbutton = globals.DuplicateContainerTemplate(itemcontainer)
		var material = Items.Materials[i]
		newbutton.get_node('Image').texture = material.icon
		newbutton.get_node('Number').text = str(state.materials[i])
		newbutton.get_node('Number').show()
		newbutton.set_meta('type', 'mat')
		globals.connectmaterialtooltip(newbutton, material)
		#globals.itemtooltip(material, newbutton)
		#globals.connecttooltip(newbutton, '[center]' + material.name + '[/center]\n' + material.description)
		newbutton.connect("pressed",self,'useitem', [i, 'material'])
	for i in state.items.values():
		if i.owner != null:
			continue
		var newnode = globals.DuplicateContainerTemplate(itemcontainer)
		if i.durability != null:
			newnode.get_node("Number").show()
			newnode.get_node("Number").text = str(globals.calculatepercent(i.durability, i.maxdurability)) + '%'
		if i.amount != null && i.amount > 1:
			newnode.get_node("Number").show()
			newnode.get_node("Number").text = str(i.amount)
		input_handler.itemshadeimage(newnode.get_node('Image'), i)
		globals.connectitemtooltip(newnode, i)
		newnode.set_meta('type', i.itemtype)
		newnode.connect("pressed",self,'useitem', [i, i.itemtype])


func selectcategory(button):
	var type = button.name
	for i in $HBoxContainer.get_children():
		i.pressed = i == button
	
	for i in itemcontainer.get_children():
		i.visible = i.get_meta('type') == type || type == 'all'
		if i.get_meta('type') == 'none':
			i.hide()
	$ScrollContainer/GridContainer.queue_sort()

func useitem(item, type):
	activeitem = item
	if mode == null:
		return
	elif mode == 'hero' && selectedhero != null:
		if type == 'material':
			return
		selectedhero.equip(item)
		get_parent().get_node("HeroList/HeroPanel").open(selectedhero)
		input_handler.GetItemTooltip().hide()
		buildinventory()
	elif mode == 'shop':
		sellwindow(item, type)

var numbermode
var operatingitem
var itemprice = 0
var amount = 0
var maxamount = 0
var activeitem

func sellwindow(item, type):
	var text = ''
	operatingitem = item
	numbermode = 'sell'
	$NumberSelectPanel.show()
	$NumberSelectPanel/SpinBox.value = 0
	if type == 'material':
		var material = Items.Materials[item]
		maxamount = state.materials[item]
		itemprice = material.price
		amount = 1
		text = tr("SELLCONFIRM") + " " + material.name + "?" 
	else:
		itemprice = item.calculateprice()
		amount = 1
		maxamount = 1
		text = tr("SELLCONFIRM") + " " + item.name + "?" 
	$NumberSelectPanel/RichTextLabel.bbcode_text = text
	updateprice()

func updateprice():
	if amount > maxamount:
		amount = maxamount
	elif amount == 0:
		amount = 1
	$NumberSelectPanel/SpinBox.value = amount
	$NumberSelectPanel/BasePrice.text = str(itemprice) + " *"
	$NumberSelectPanel/EndPrice.text = "= " + str(itemprice * amount)


func NumberConfirm():
	if numbermode == 'sell':
		state.money += amount*itemprice
		if typeof(activeitem) == TYPE_STRING:
			state.materials[activeitem] -= amount
		else:
			state.items.erase(activeitem.id)
	$NumberSelectPanel.hide()
	buildinventory()

func NumberClose():
	$NumberSelectPanel.hide()

func NumberChanged(value):
	amount = value
	updateprice()

func NumberMax():
	amount = maxamount
	updateprice()

