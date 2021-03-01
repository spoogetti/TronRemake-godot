extends Node


# Declare member variables here. Examples:
#export var position_a = Vector2(0,0)
#export var position_b = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$WallHitBox.shape = SegmentShape2D.new()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
