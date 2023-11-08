extends Node

# numbers
var timer = 0.0
var timerEnd = 2.0
var enemySpeed = -300
var scrollSpeed = 150
var asteroids = 1
var totalTime = 0.0

# prefabs
var enemyPrefab = "res://Prefabs/Enemy.tscn"

# various
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	totalTime += delta
	
	$"TextureRect".position.x -= scrollSpeed * delta
	$"TextureRect".size.x += scrollSpeed * delta

	# Spawn enemy every x seconds
	if(timer > timerEnd):
		spawn_enemies()
			
		enemySpeed -= 20
		scrollSpeed += 20
		
		if(timerEnd > 1):
			timerEnd -= 0.05

		if(totalTime > 40):
			asteroids = 3
		elif(totalTime > 20):
			asteroids = 2
			
		timer = 0 
		
	# Reset scene
	if(Input.is_key_pressed(KEY_R)):
		get_tree().reload_current_scene()

# Godot requires you to load the scene prefab, instantiate it, then add it as a child to the main one.
# Thus, this wrapper function provides a more Unity-like approach.
func instantiate(prefab, position):
	var prefabInstance = load(prefab).instantiate()
	prefabInstance.position = position
	get_tree().get_current_scene().add_child(prefabInstance)
	return prefabInstance

func spawn_enemies():
	for n in range(asteroids):
		var enemy = instantiate(enemyPrefab, Vector2(1500.0, rng.randf_range(80.0, 640.0)))
		enemy.linear_velocity.x = enemySpeed
		await get_tree().create_timer(rng.randf_range(1,2)).timeout
		continue
