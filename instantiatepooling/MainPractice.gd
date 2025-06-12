extends Node2D

#@onready var player_scene := preload("res://Player.tscn") # Adjust the path
var unique_id: int = -1  # Placeholder
var newPoolerClone: Node2D = null 
var clones = []
func _on_button_pressed() -> void:
    #print("Clone")
## without object pooling
    #var newClone = player_scene.instantiate() as Node2D
    #get_tree().current_scene.add_child(newClone)
    #var rand_x = randf_range(100.0, 500.0)
    #var rand_y = randf_range(100.0, 400.0)
    #newClone.global_position = Vector2(rand_x, rand_y)
#
    ##newClone.global_position = randomize(global_position) 
    #
    #Objectpooler
    print("Clone (using object pool)")

    newPoolerClone = Objectpooler.get_instance()  # Get from pool instead of instantiating
    clones.append(newPoolerClone)
    var rand_x = randf_range(100.0, 500.0)
    var rand_y = randf_range(100.0, 400.0)
    newPoolerClone.global_position = Vector2(rand_x, rand_y)
    print("Spawned object with ID:", newPoolerClone.get("unique_id"))
    #print(clone.get("unique_id")) 
    # Optionally reset state if needed


  


   
func _on_button_2_pressed() -> void:
    if clones.size() > 0:
        var last_index = clones.size() - 1   # get the last index of the array
        var clone_to_return_Last_index = clones[last_index]  # Node2d return as last index
        Objectpooler.return_instance(clone_to_return_Last_index)  
        clones.remove_at(last_index)
        
        # Optional: clear newPoolerClone if it points to that instance
        #if newPoolerClone == clone_to_return:
            #newPoolerClone = null
