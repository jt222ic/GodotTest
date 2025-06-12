extends Node2D

@onready var button: Button = $Button
@onready var node_2d: Node2D = $"."
signal forReal

var indexi:=0   
var number: int = 5
var text : String = "hej"
var boxes : Array= [1,2,3]
enum State {
    IDLE,
    WALKING,
    RUNNING,
    JUMPING
}
#Signal is UI button to send any class to indicate button press without dependencies
func checkClassOrNode():
    if button is Button:
        print("button is correct")
func checkCondition():
    if indexi> 0: 
        print("Yes") 
    else:print("NO")
  
        
        
func LoopdeLoop():
    for n in 8:
        print(n)
        
func WhileLoop():
    var glass := 0.0
    while glass< 0.5:
        glass+= 0.2
        print(glass)
    print("reach HalfFull")
   
    

func dictory():
    var my_dict = {"Man": 12, "baby": 7,}
   # print(my_dict["Man"])
    
    for indi in my_dict:
        print(indi,"hej",my_dict[indi])
        
        # going through each dict so first it will print Man and hej
        # then it will check my_dict["Man"] check key then out comes value

func runninArray():
    for box in boxes:
        print("box: ",box)
var numbers:= 10
#underline is the engine running like start or update in unity
func _ready():
 runninArray()
 dictory()
 LoopdeLoop()
 WhileLoop()
 checkClassOrNode()
 checkCondition()
 forReal.connect(_on_level_up)   #subscribe channel mame of the variable and the full name of the function
 #require a body 
   
    
    #variable or things that is inside a function
    #need to be tabbed= to show that the variable
    # is inside the block
    #python or gdscript is strict
    #with indentifaction
    
func test():
    print("hejjj")    
func state():
    var statecontrol = State.IDLE
    match statecontrol:
        State.IDLE: print("idle")
        State.RUNNING: print("run")
func mama():
    print("HEIFHEH")
    
func _input(event):
    if event.is_action_pressed("my_action"):
        print("red")
        $Label.modulate = Color.RED  
        
    if event.is_action_released("my_action"): 
        print("green")
        $Label.modulate = Color.GREEN 
        
    if event.is_action_pressed("Updown"):
        print("red")
        $Button.modulate = Color.RED
        
    if event.is_action_released("Updown"): 
        print("green")
        $Button.modulate = Color.GREEN
    
    

func _on_button_2_pressed() -> void:
    print("MONEY")# Replace with function body.

var xp:= 0



func _on_timer_timeout() -> void:
    xp+= 5
    print(xp)
    if(xp>20): 
        xp=0
        print("LEVEL up")
        

func _on_level_up_timeout() -> void:
     xp+= 5
     print("splosh")
     if(xp>20): 
        forReal.emit("herro")
        xp=0
       # Replace with function body.

func _on_level_up(msg):
    print(msg)


 # Replace with function body.
