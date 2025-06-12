extends Node2D

signal Buttox  # two different approach to SIgnal
@onready var button = $Button
func _ready() -> void:
    Buttox.connect(Callable(self, "Shout"))

    button.pressed.connect(Callable(self, "Shout"))  # callable self(is finding the node class to call)
func Shout():
    print("UARGHH")

func _unhandled_input(event):
    if event is InputEventMouseButton and event.pressed:
        print("Mouse clicked at: ", event.position)
    if event is InputEventKey and event.pressed:
        print("Button pressed")


func _on_button_pressed():
    print("HELLO")
    emit_signal("Buttox")  # This will trigger Shout()
