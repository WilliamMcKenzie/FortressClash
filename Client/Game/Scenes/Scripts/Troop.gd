extends Node2D

var team
var strength = 1
var target = null

var which
var health
var attack
var speed
var velocity = Vector2.ZERO

func SetData(_which, _team):
	team = _team
	which = _which
	
	var data = Data.units[which]
	health = data.health * strength
	attack = data.attack * strength
	speed = data.speed

func FindTarget(targets, enemy_base):
	target = null
	var nearest_target = 999
	
	for potential_target in targets:
		var distance = potential_target.position.distance_to(position)
		if potential_target.team != team and distance < nearest_target:
			target = potential_target
			nearest_target = distance
	
	if not target:
		target = enemy_base

func _physics_process(delta):
	if target:
		velocity = (delta * speed) * (target.position - position).normalized()
		position += velocity
