extends RigidBody2D

var textures = [
	preload("res://Sprites/Asteroids/Asteroids_256x256_001.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_002.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_003.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_004.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_005.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_006.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_007.png"),
	preload("res://Sprites/Asteroids/Asteroids_256x256_008.png") ]
	
var rng = RandomNumberGenerator.new() 
var randomAngularVelocity = rng.randf_range(1, 2)

func _ready():
	generate_random_texture()
	
func _physics_process(_delta):
	angular_velocity = randomAngularVelocity

func generate_random_texture():
	rng.randomize()
	var num = rng.randi_range(0, 7) 
	get_child(0).texture = textures[num]
