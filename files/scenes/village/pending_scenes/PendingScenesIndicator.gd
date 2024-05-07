class_name PendingScenesIndicator extends TextureRect

func _ready():
	state.connect("pending_scenes_updated", self, "_update_visibility")


func _update_visibility():
	visible = !state.pending_scenes.empty()
