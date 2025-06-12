extends Node



class_name State_Behaviour

var current_state: BaseState  ## BaseClass

var transitions = {}
#var class_map = {
    ##"WarriorState": WarriorState,
    ##"VikingState": VikingState,
    ##"MageState": MageState,
    ## Add all your state classes here
#}

func change_state(new_state: BaseState):  ## Concreate Class changing behaviour or state
    if current_state:
        current_state.exit()
    current_state = new_state
    current_state.enter()
    if current_state.has_signal("request_state_change"):
      current_state.connect("request_state_change", Callable(self, "_on_request_state_change"))

#func _ready():
    #load_transitions()
#
#func load_transitions():
    #var file = FileAccess.open("res://ClassTest.json", FileAccess.READ)
    #var json = JSON.parse_string(file.get_as_text())
    #if json.error == OK:
        #transitions = json.result
    #else:
        #push_error("Failed to load transitions.json")    

#func _ready():
    #current_state = Concreate_State.new(self)        # call for child or concreate state
    #change_state(current_state)                     # send the concreate state 
func _on_request_state_change(new_state_class):
    var next_state = new_state_class.new(self)
    change_state(next_state)

#func _on_request_state_change(event_name):
    #var state_name = current_state.get_class()
    #var next_state_name = transitions.get(state_name, {}).get(event_name, null)
    #if next_state_name != null and class_map.has(next_state_name):
        #change_state(class_map[next_state_name].new(self))
    
func _process(delta):
 if current_state:
    #print("updating")
    current_state.update(delta)         ## the current state is running BAse->Concreate
   
