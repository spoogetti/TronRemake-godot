extends Area2D
signal hit

enum Directions {NORTH, EAST, SOUTH, WEST}

# Declare member variables here. Examples:
export var speed = 2
export var player_direction = Directions.EAST
export var color = Color(0,0,255,255)
var screen_size
var last_turn_player_pos = Vector2(0, 0)

var wall_scene
var col_segs = []

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	match player_direction:
		Directions.NORTH:
			rotation -= PI/2
		Directions.SOUTH:
			rotation += PI/2
		Directions.WEST:
			rotation -= PI
	wall_scene = preload("res://Wall.tscn")
	instanciate_new_colision_segment()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_right"):
		go_right()
		instanciate_new_colision_segment()
	if Input.is_action_just_pressed("ui_left"):
		go_left()
		instanciate_new_colision_segment()
		
	var velocity = Vector2()
	match player_direction:
		Directions.NORTH:
			velocity.y -= 1
		Directions.EAST:
			velocity.x += 1
		Directions.SOUTH:
			velocity.y += 1
		Directions.WEST:
			velocity.x -= 1
		
	position += velocity * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	col_segs.back().get_node("WallHitBox").shape.b = position

func _on_Player_body_entered(_body):
	hide()
	emit_signal("hit")
	$ColShape.set_deferred("disabled", true)
	pass

func start(pos):
	position = pos
	last_turn_player_pos = pos
	show()
	$ColShape.disabled = false
	col_segs.back().get_node("WallHitBox").shape.a = pos

func go_right():
	player_direction = Directions.NORTH if player_direction == Directions.WEST else player_direction + 1
	rotation += PI/2

func go_left():
	player_direction = Directions.WEST if player_direction == Directions.NORTH else player_direction - 1
	rotation -= PI/2

func instanciate_new_colision_segment():
	var wall = wall_scene.instance()
	$Node.add_child(wall)
	col_segs.append(wall)
	wall.get_node("WallHitBox").shape.a = position
