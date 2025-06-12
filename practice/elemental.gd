extends Node


@export var element: Element = Element.NORMAL
#accessing the data

enum Element {
    NORMAL,
    FIRE,
    WATER,
    GRASS  # A Checkbox
}
const Multipliers = {
    Element.FIRE: { Element.WATER: 2.0, Element.GRASS: 0.5 },
    Element.WATER: { Element.GRASS: 2.0, Element.FIRE: 0.5 },
    Element.GRASS: { Element.FIRE: 2.0, Element.WATER: 0.5 }, # List of Elemental
}

func _ready():
    print("ELEMENTAL: ",get_enum_name(element))
    
func get_enum_name(value: int):  #Return the int to a string to check 
    for name in Element.keys():  # Loop trhough Enum Element keys as name
        if Element[name] == value:  # if the Element[keys] == value then return the name
            return name
    return "Unknown"
    
func get_multiplier(attacker_element: int, defender_element: int) -> float:
    if Multipliers.has(attacker_element):
        return Multipliers[attacker_element].get(defender_element, 1.0)
    return 1.0


   
    
     
