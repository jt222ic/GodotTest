extends Node2D

enum State { IDLE, FOLLOW }
enum Tile { OBSTACLE, START_POINT, END_POINT } 

const MASS = 10.0
const ARRIVE_DISTANCE = 10.0

@export var speed: float = 200.0


@export var startcell: Vector2i 
@export var endcell: Vector2i

var _state = State.IDLE
var _velocity = Vector2()
var _click_position = Vector2()
var _path = PackedVector2Array()
var _next_point = Vector2()
var global_start_position = Vector2()
var global_end_position = Vector2()
var clicktile = Vector2()
@onready var _tile_map = $"../TileMap"

func _ready():
    global_start_position = _tile_map.to_global(_tile_map.map_to_local(startcell))
    global_end_position = _tile_map.to_global(_tile_map.map_to_local(endcell))
    # Set the starting position you have to because it is built-in transformaposition
    #important to set the global_position = desired startposition 
    global_position = global_start_position
    #global_position = _tile_map.round_local_position(startcell)
    _path = _tile_map.find_path(global_position, global_end_position)
    #draw_circle(Vector2(20,20), BASE_LINE_WIDTH * 2.0, DRAW_COLOR)

    # If the end is walkable, prepare the path and start following
    if _tile_map.is_point_walkable(endcell):
        #global_end_position = _tile_map.round_local_position(endcell)
     
        _change_state(State.FOLLOW)
    else:
        push_warning("End position is not walkable.")
        _change_state(State.IDLE)

#func _input(event):
    #_click_position = get_global_mouse_position()
    ##if _tile_map.is_point_walkable(_click_position):
    #if event.is_action_pressed(&"move_to", false, true):
        #print("hej",clicktile)
        #clicktile = _tile_map.map_to_local(_click_position)
        #_tile_map.set_cell(0, clicktile, 0, Vector2i(0, 0)) 
   #
            #
            
func _process(_delta):
    if _state != State.FOLLOW:
        return
    var arrived = _move_to(_next_point)
    if arrived:
        _path.remove_at(0)
        if _path.is_empty():
            _change_state(State.IDLE)
            return
        _next_point = _path[0]

func _move_to(local_position: Vector2) -> bool:
    var desired_velocity = (local_position - position).normalized() * speed
    var steering = desired_velocity - _velocity
    _velocity += steering / MASS   # going to exclude mass so it become full rotation without physicial push
    position += _velocity * get_process_delta_time()
    rotation = _velocity.angle()
    return position.distance_to(local_position) < ARRIVE_DISTANCE

func _change_state(new_state: State):
    if new_state == State.IDLE:
        _tile_map.clear_path()
    elif new_state == State.FOLLOW:
        _path = _tile_map.find_path(global_position, global_end_position)
        if _path.size() < 2:
            push_warning("Path too short or blocked.")
            _change_state(State.IDLE)
            return
        _next_point = _path[1] # skip current tile  # better explanation moving to path[0] to path[1]
    _state = new_state
