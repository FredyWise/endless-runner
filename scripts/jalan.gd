extends CSGCombiner3D

var SPEED = 5
var MAIN
# Called when the node enters the scene tree for the first time.
func _ready():
	MAIN = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z -= SPEED * delta
	
	if position.z <= -4:
		MAIN.spawnRoad(MAIN.amnt -5)
		queue_free()
