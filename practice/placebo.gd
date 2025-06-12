extends Node2D

@onready var tilemap = $".."

func _unhandled_input(event):
    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        var global_pos = get_global_mouse_position()

        # Convert global mouse position to tilemap cell coordinates
        var local_mouse = tilemap.to_local(global_pos)
        var cell = tilemap.local_to_map(local_mouse)

        # Now set a tile from the tileset (e.g., at atlas coords (0, 0))
        tilemap.set_cell(0, cell, 0, Vector2i(0, 0))
