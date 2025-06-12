extends Node

@onready var scene_to_pool: PackedScene = preload("res://Player.tscn")

@export var pool_size: int = 10

var pool: Array = []
var id_counter: int = 0
var total_pooling : int
func _ready():
    randomize()
    total_pooling = pool_size
    for i in range(pool_size):
        var obj = scene_to_pool.instantiate()
        obj.visible = false
        add_child(obj)
        pool.append(obj)
        
#

func get_instance() -> Node2D:
    for obj in pool:
        if obj.visible == false:
            obj.visible = true
            obj.set("unique_id", id_counter)
            id_counter += 1
           
            return obj

    # Expand pool if all in use
    var obj = scene_to_pool.instantiate()
    add_child(obj)
    pool.append(obj)
    obj.set("unique_id", id_counter)
    id_counter += 1
    return obj

func return_instance(obj: Node2D) -> void:
    obj.visible = false
    # Optional: reset position, state, velocity, etc.
