extends IEnemy

var move_vec : Vector2
@export var speed : float = 3

var distance : float = 1

func _ready() -> void:
	super._ready()
	move_vec = -self.global_position.normalized()
	distance = global_position.distance_to(Vector2.ZERO)
	speed = distance / 10

func move(delta):
	translate(move_vec * speed * delta)
	
