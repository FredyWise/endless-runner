extends Node3D

const JALAN = preload("res://scenes/jalan.tscn")
var amnt = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in amnt:
		spawnRoad(i)

func spawnRoad(i):
	var nj = JALAN.instantiate()
	nj.position.z = i
	add_child(nj)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
