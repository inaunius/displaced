class_name Debugger extends Node

#FRIEND POINTS
var set_friend_points: bool setget _set_friend_points_pressed
var friend_points_amount: int
var character_name: String


func _get_property_list():
	var properties = []
	
	properties.append({
		name = "Friend points",
		type = TYPE_NIL,
		usage = PROPERTY_USAGE_CATEGORY | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "set_friend_points",
		type = TYPE_BOOL
	})
	properties.append({
		name = "friend_points_amount",
		type = TYPE_INT
	})
	properties.append({
		name = "character_name",
		type = TYPE_STRING
	})
	return properties
	
	return properties

func _set_friend_points_pressed(_val):
	set_friend_points = false
	if !(character_name in state.characters): 
		push_error("No such character: " + character_name)
	state.heroes[character_name].friend_points = friend_points_amount
