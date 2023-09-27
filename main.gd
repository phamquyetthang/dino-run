extends Node2D

var worldMap = preload("res://world_map.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_world_map_body_entered(body):
	if body.name=='Dino':
		var newMap = worldMap.instantiate()
		newMap.position.x = 2000
		newMap.position.y = 0
		self.add_child(newMap)
		print('new Map', newMap.position, newMap.global_position)
	pass # Replace with function body.
