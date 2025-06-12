extends Node


@onready var elemental_script = $Elemental

func _ready() -> void:
    #elemental_script.get_multiplier()
    pass 

#func take_damage(base_damage: float, attacker_element: int) -> void:
    # Get the damage multiplier based on elements (attacker vs defender)
    #var multiplier = elemental_script.get_multiplier(attacker_element, element)  # 'element' is defender's element
    
    # Calculate the final damage by applying the multiplier to the base damage
    #var final_damage = base_damage * multiplier
    
    # Apply the damage to the defender's health (assuming you have a 'health' variable)
    #health -= final_damage
    
    # Optional: Clamp health so it doesn't drop below zero
    #health = max(health, 0)
    
    # Optional: Print debug info
    #print("Damage dealt:", final_damage, "Remaining health:", health)
