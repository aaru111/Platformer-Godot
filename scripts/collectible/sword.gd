extends Area2D




func _on_player_entered(player):
	player.sword = true
	queue_free()
