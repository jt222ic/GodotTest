extends TileMap

enum Tile { OBSTACLE, START_POINT, END_POINT }  ## enum order 0,1,2

const CELL_SIZE = Vector2i(64, 64)
const BASE_LINE_WIDTH = 3.0
const DRAW_COLOR = Color.RED * Color(1, 1, 1, 0.5)

# The object for pathfinding on 2D grids.
var _astar = AStarGrid2D.new()

var _start_point = Vector2i()
var _end_point = Vector2i()
var _path = PackedVector2Array()

func _ready():
    # Region should match the size of the playable area plus one (in tiles).
    # In this demo, the playable area is 17×9 tiles, so the rect size is 18×10.
    _astar.region = Rect2i(0, 0, 18, 10)
    _astar.cell_size = CELL_SIZE
    _astar.offset = CELL_SIZE * 0.5
    _astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
    _astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
    _astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
    
    
    _astar.update()

    for i in range(_astar.region.position.x, _astar.region.end.x):
        for j in range(_astar.region.position.y, _astar.region.end.y):
            var pos = Vector2i(i, j)
            if get_cell_source_id(0, pos) == Tile.OBSTACLE:
                _astar.set_point_solid(pos)  # source from lsyrt 0 snf i j in pod rwusl with obstacle


func _draw():
    if _path.is_empty():
        return

    var last_point = _path[0]
    for index in range(1, len(_path)):
        var current_point = _path[index]
        #draw_line(last_point, current_point, DRAW_COLOR, BASE_LINE_WIDTH, true)
        #draw_circle(current_point, BASE_LINE_WIDTH * 2.0, DRAW_COLOR)
        last_point = current_point
        
        # draw line and circle and line,  by looping through length of the _path array packed array


func round_local_position(local_position):
    return map_to_local(local_to_map(local_position))  # convert tilemap to local position


func is_point_walkable(local_position):
    var map_position = local_to_map(local_position)
    if _astar.is_in_boundsv(map_position):
        return not _astar.is_point_solid(map_position)
    return false


func clear_path():
    if not _path.is_empty():
        _path.clear()
        erase_cell(0, _start_point)
        erase_cell(0, _end_point)
        # Queue redraw to clear the lines and circles.
        # i mean if it is required then...
        queue_redraw()


func find_path(local_start_point, local_end_point):
    clear_path()

    _start_point = local_to_map(local_start_point)
    _end_point = local_to_map(local_end_point)
    _path = _astar.get_point_path(_start_point, _end_point)  # i believe is to just get local vector to map in grid

    if not _path.is_empty():
        
        set_cell(0, _start_point, 0, Vector2i(Tile.START_POINT, 0))  
        # setCell(layer,position,SourceID,AtlasSource)
        #important facts : because Vector2i tracks the atlas coordinate in tilemap
        #enum has a hidden data order from 0->1 determine by order
        # so Vector2i(Tile.Startpoint = 1 in enum, 0) meaning in x row 1 and y coordinate 0
        set_cell(0, _end_point, 0, Vector2i(Tile.END_POINT, 0))

    # Redraw the lines and circles from the start to the end point.
    queue_redraw()

    return _path.duplicate()  #return the duplicate of an array # the intended use when change are made wont disrupt
        #the internal path logic before placing a tower.
