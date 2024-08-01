extends Node3D

const JALAN = preload("res://scenes/jalan.tscn")
var amnt = 30
const MULTIPLIER = preload("res://scenes/multiplier.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in amnt:
		spawnRoad(i)
	spawnMult(amnt)

func spawnMult(i):
	var nj = MULTIPLIER.instantiate()
	nj.position.z = i
	nj.notationLeft = randi_range(0,3)
	nj.numLeft = randi_range(0,10)
	nj.notationRight = randi_range(0,3)
	nj.numRight = randi_range(0,10)
	add_child(nj)

func spawnRoad(i):
	var nj = JALAN.instantiate()
	nj.position.z = i
	add_child(nj)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
