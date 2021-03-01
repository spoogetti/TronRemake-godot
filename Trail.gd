extends Line2D


# Declare member variables here. Examples:
var target 
var point
export var targetPath = NodePath()

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(targetPath)
	position = target.global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	point = target.global_position + Vector2(0, 0)
	add_point(point)
