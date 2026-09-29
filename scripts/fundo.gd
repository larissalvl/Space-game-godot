extends Parallax2D

const MOLDE_ESTRELA: PackedScene = preload("res://cenas/estrela.tscn")


func _ready():
	var espaco = 2000
	for i in range(200):
		var estrela = MOLDE_ESTRELA.instantiate()
		add_child(estrela)
		estrela.position = Vector2(
			randf_range(0, espaco),
			randf_range(0, espaco)
		)
	repeat_size = Vector2(espaco, espaco)
