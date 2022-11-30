extends Node2D


signal Boss1_killed 
var lvl = 1 

func Boss1_killed():
	get_tree().change_scene("res://backgrounds/background pictures/lvl2.tscn")
