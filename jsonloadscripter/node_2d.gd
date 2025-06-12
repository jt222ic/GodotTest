extends Node2D

var transitions = {}
var class_test_data = {}  # write next variable if you want to load of DICTIONARY in JSon

func _ready():
    class_test_data = "res://ClassTest.json"
    load_transitions(class_test_data)
# @param path: string -> the Json source file path
func load_transitions(path:String):
    var file = FileAccess.open(path, FileAccess.READ)
    if file:
        var json_string = file.get_as_text()
        var parsed = JSON.parse_string(json_string)
        if parsed == null:
            push_error("❌ Failed to parse JSON.")
        else:
            transitions = parsed
            print("✅ Loaded transitions:", transitions)
            print("✅ Specific print:", transitions["name"])
            print("✅ Specific print:", transitions["health"])
    else:
        push_error("❌ Failed to open ClassTest.json")


    
