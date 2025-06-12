extends BaseState  # Child of State.gd


class_name Concreate_State
var state_machine = State_Behaviour
signal request_state_change(new_state_class)   # Signal is defined


func _init(sm):
    state_machine = sm 
    
func enter(): 
    #set_process(true)           #allow update function aka _process
    print("Entered Idle")
   
   
    
func exit():
    print("Entered Exit")
    #set_process(false)    #disable script for performance saving


       
    
    # priority list  Player(parent->statebhaviour, concreate->statebehaviour, statebehaviour handle all the transition just call change state
    #func update(delta):         example on how statebehaviour, the owner send around and call statemachine
    #if Input.is_action_just_pressed("jump"):
        #state_machine.change_state(JumpState.new(state_machine))

#
#func _on_level_up_2_pressed():
    ##pass # Replace with function body.
    #print("LEVEL FRYRVYRF")
    #emit_signal("request_state_change") 
    #var next_class
    #State transition
    #if current_state is WarriorState:
        #next_class = VikingState  # Advance warrior to viking
    #elif current_state is MageState:
        #next_class = ArchmageState  # Just an example
    #elif current_state is RangerState:
        #next_class = SniperState
    #else:
        #next_class = DefaultState  # fallback
    
    #emit_signal("request_state_change", next_class) #Emit to a function request state


func _on_level_up_2_pressed() -> void:
    print("ORAAAAW") # Replace with function body.
