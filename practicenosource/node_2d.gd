extends Node2D



class_name  testingclass

var nodein2d : Node2D
var box = [] 
var LastIndex
var FirstIndex
var size = 10
var state



func _ready() -> void:
    
    #var test = testingclass.new()  # because i have classname, i can create an instance of it
        #box.resize(size)   adding 10 null boxes in array
    for i in range(size):   # add aditional 10 with array
        box.append(i)
    for j in range(box.size()):  # remember the range is asking for in and not array
        box.remove_at(j)
        
    LastIndex= box.max()
    FirstIndex = box.min()
    
    print("print",LastIndex)
    print("print",FirstIndex)
    
    #var Nodeplacement = nodein2d[LastIndex]  # a lot of question mark, but i bet it is trying to find node2d child in array
    
