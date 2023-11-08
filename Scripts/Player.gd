extends CharacterBody2D

@export var upwardSpeed = 40
@export var downwardSpeed = 25 # "gravity"

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		velocity.y -= upwardSpeed
	else:
		velocity.y += downwardSpeed
		
	var collision = move_and_collide(velocity * delta)
	
	if(collision):
		var colliderName = collision.get_collider().name
		
		if("Floor" in colliderName): # collided with floor
			velocity.y = 0
		elif ("RigidBody2D" in colliderName) or ("Enemy" in colliderName): # collided with enemy
			spawn_explosion()
			self.queue_free() # Similar to Destroy()
			
		#print(collision.get_collider().name)
		
func spawn_explosion():
	var explosion_scene = load("res://Prefabs/Explosion.tscn") 
	var explosion_instance = explosion_scene.instantiate()
	explosion_instance.position = position
	get_tree().get_current_scene().add_child(explosion_instance)
