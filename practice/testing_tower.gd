extends Node2D

var _click_positions := []  # Store click positions in local space
#@param
func _input(event):
    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        var global_pos = get_global_mouse_position()
        var local_pos = to_local(global_pos)
        
        _click_positions.append(local_pos)  # Store position
        queue_redraw()  # Triggers _draw() to redraw circles

#func _draw():
    #for pos in _click_positions:
        #draw_circle(pos, 10.0, Color.YELLOW)
