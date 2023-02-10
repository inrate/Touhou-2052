extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready():
	value = 10
# write in the max hp of the p1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = 10
	


func _on_p1_health_changed(new_health):
	value=new_health
