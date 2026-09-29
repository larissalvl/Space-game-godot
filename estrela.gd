extends AnimatedSprite2D

func _ready():
	var tamanho_estrela: float
	tamanho_estrela = randf_range(0.005, 0.01)
	scale = Vector2(tamanho_estrela, tamanho_estrela)
	frame = randi_range(0, 5)
