extends Node2D

var state_machine: State_Behaviour
#var initial_state = Concreate_State

func _ready():
    
    print("READY ON")
    state_machine = State_Behaviour.new()
    add_child(state_machine)
    var initial_state = Concreate_State.new(state_machine)         # pass state_machine in constructor
    state_machine.change_state(initial_state)

func _process(delta):
    
    state_machine._process(delta)
