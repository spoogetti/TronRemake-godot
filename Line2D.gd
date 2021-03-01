extends Line2D


# Declare member variables here. Examples:
var target 
var point
export var targetPath = NodePath()

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(targetPath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	point = target.global_position
	add_point(point)
	
