extends Node3D

enum mult { KALI,BAGI,TAMBAH,KURANG }

@export var notationLeft : mult
@export var numLeft : int
@export var notationRight : mult
@export var numRight : int

@onready var kiri = $Kiri
@onready var kanan = $Kanan
@onready var label = $Kiri/label

var SPEED = 5
var once = true
var MAIN

func mult_to_string(x):
	match x:
		mult.KALI:
			return "×"
		mult.BAGI:
			return "÷"
		mult.TAMBAH:
			return "+"
		mult.KURANG:
			return "−"

func _ready():
	MAIN = get_parent()
	kiri.get_node("label").text = mult_to_string(notationLeft)+str(numLeft)
	kanan.get_node("label").text = mult_to_string(notationRight)+str(numRight)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rl : RayCast3D = kiri.get_node("RayCast3D")
	var rr : RayCast3D = kanan.get_node("RayCast3D")
	
	if rl.is_colliding() and once:
		once = false
		var orang = rl.get_collider()
		var camera = orang.get_parent()
		orang = orang.duplicate()
		orang.position.x += 1
		camera.add_child(orang.duplicate())
	
	if rr.is_colliding():
		print(rr.get_collider())
		print(numRight)
	
	position.z -= SPEED * delta
	
	if position.z <= -4:
		MAIN.spawnMult(20)
		queue_free()
