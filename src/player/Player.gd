extends Area2D

onready var ray = $RayCast2D


var tile_size:int = 16
var tile_offset_x:int = 20
var tile_offset_y:int = 20
var tile_position:Vector2 = Vector2.ZERO


var directions = {
	'up':Vector2.UP,
	'right':Vector2.RIGHT,
	'down':Vector2.DOWN,
	'left':Vector2.LEFT
}

func _input(event):
	if Input.is_action_just_pressed("up"):
		check("up")
	elif Input.is_action_just_pressed("right"):
		check("right")
	elif Input.is_action_just_pressed("down"):
		check("down")
	elif Input.is_action_just_pressed("left"):
		check("left")
		pass
	
	
func _ready():
	position.x = (tile_position.x * tile_size) + tile_offset_x
	position.y = (tile_position.y * tile_size) + tile_offset_y
	

func check(dir):
	ray.cast_to.x = directions[dir].x * (tile_size/2) 
	ray.cast_to.y = directions[dir].y * (tile_size/2) 
	
	position.x += directions[dir].x * tile_size
	position.y += directions[dir].y * tile_size
	
