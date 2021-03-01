extends Node


# Declare member variables here. Examples:
export (PackedScene) var Mob
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_hit():
	pass # Replace with function body.

#func game_over():
	

func new_game():
#	score = 0
	$Players/Player1.start($Positions/StartPosition1.position)
	$Players/Player2.start($Positions/StartPosition2.position)
	$Players/Player3.start($Positions/StartPosition3.position)
	$Players/Player4.start($Positions/StartPosition4.position)

#func _draw():
#	$Player.current_col_seg.draw(get_canvas(), Color(200, 0, 0 , 255))
#	update()
