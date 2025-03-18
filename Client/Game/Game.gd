extends Node2D

var tower_scene = preload("res://Game/Scenes/Tower.tscn")
var troop_scene = preload("res://Game/Scenes/Troop.tscn")
var worker_scene = preload("res://Game/Scenes/Worker.tscn")

onready var units_node = get_node("Units")
onready var towers_node = get_node("Towers")

func _ready():
	CreateTroop("Militia", Vector2(0,0), "Red")
	CreateTroop("Militia", Vector2(20,0), "Blue")

func PlaceTower(which, where, team):
	var tower = tower_scene.instance()
	tower.position = where

func CreateTroop(which, where, team):
	var troop = troop_scene.instance()
	troop.SetData(which, team)
	troop.position = where
	units_node.add_child(troop)

var physics_timer = 0
func _physics_process(delta):
	physics_timer += 1
	
	if physics_timer == 60:
		var targets = units_node.get_children() + towers_node.get_children()
		var red_base = get_node("Sensors/RedBase")
		var blue_base = get_node("Sensors/BlueBase")
		
		for unit_node in units_node.get_children():
			unit_node.FindTarget(targets, red_base if unit_node.team == "Blue" else blue_base)
