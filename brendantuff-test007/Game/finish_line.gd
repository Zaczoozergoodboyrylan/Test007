extends Area2D

# Track the current lap
var current_lap : int = 1
const MAX_LAPS : int = 5

func _on_body_entered(body: Node2D) -> void:
	# Make sure the object crossing the line is actually the player
	if body.name == "player_car":
		print("Lap completed!")
		current_lap += 1
		
		# Update your UI text here if you have a label
		$HUD/Label.text = "Lap: " + str(current_lap) + "/5"
		
		# Check for the win condition
		if current_lap > MAX_LAPS:
			win_game()

func win_game() -> void:
	print("Race finished! You beat Rylan!")
	# Change to your win or game over scene
	get_tree().change_scene_to_file("res://Game/GameOver.tscn")
