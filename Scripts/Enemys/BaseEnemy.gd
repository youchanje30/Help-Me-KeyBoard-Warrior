extends IEnemy

var move_vec : Vector2
@export var speed : float = 3

func _ready() -> void:
	super._ready()
	move_vec = -self.global_position.normalized()

func move(delta):
	translate(move_vec * speed * delta)
