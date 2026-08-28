extends Parallax2D

var estrelas = []

const TAMANHO_BLOCO = Vector2(2000, 2000)

func _ready():
	repeat_size = TAMANHO_BLOCO
	var textura = load("res://estrela.png")
	
	for i in range(150):
		var estrela = Sprite2D.new()
		estrela.texture = textura
		
		var escala = randf_range(0.15, 0.5)
		estrela.scale = Vector2(escala, escala)
		
		estrela.position = Vector2(
			randf_range(0, TAMANHO_BLOCO.x),
			randf_range(0, TAMANHO_BLOCO.y)
		)
		
		add_child(estrela)
		
		estrelas.append({
			"no": estrela,
			"fase": randf_range(0, TAU),        
			"velocidade": randf_range(2.0, 3.0)
		})

func _process(delta):
	for e in estrelas:
		e["fase"] += delta * e["velocidade"]
		
		var brilho = 0.65 + sin(e["fase"]) * 0.35
		
		e["no"].modulate.a = brilho
