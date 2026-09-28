extends CharacterBody3D

@export var speed: float = 25.0
@export var turn_speed: float = 12.0
@export var track_limit: float = 5.0

func _physics_process(delta: float) -> void:
	# El carro avanza automÃ¡ticamente hacia adelante
	velocity.z = -speed
	
	# Detectar entrada de movimiento lateral
	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * turn_speed
	
	move_and_slide()
	
	# Mantiene el carro dentro de la pista
	position.x = clamp(position.x, -track_limit, track_limit)