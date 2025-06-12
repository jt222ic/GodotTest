extends Node2D

static var global_id = 0
var id = 0
var unique_id: int = -1
func _init():
      global_id += 1
      id = global_id

func _on_button_pressed() -> void:
    print("HADOUKEN","ID CHECK:",id) # Replace with function body.
