extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready():
	value = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_boss_1_bosshealthchange(new_health):
	value=new_health
