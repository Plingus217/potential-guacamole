extends CharacterBody2D
const SPEED := 9999
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("moveRight", "moveLeft", "moveUp", "moveDown")
	velocity = (direction * SPEED * delta)
	print(global_position)
	move_and_slide()
	for i in get_slide_collision_count():
		var body = get_slide_collision(i)
		if body.get_collider() is RigidBody2D:
			body.get_collider().apply_force(body.get_normal() * -50)
