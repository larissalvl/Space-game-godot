extends Control

const RAIO_MINIMAP := 40.0

# quantos pixels do MUNDO viram 1 pixel do minimap — controla o "zoom" do radar
# começa com esse valor e ajusta testando: se os planetas somem rápido demais
# (ficam grudados na borda o tempo todo), diminui esse número
const ESCALA := 0.05

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	var centro := Vector2(RAIO_MINIMAP, RAIO_MINIMAP)

	draw_circle(centro, RAIO_MINIMAP, Color(0.0, 0.0, 0.318, 0.537))

	var nave := get_tree().get_first_node_in_group("nave")
	if nave == null:
		return

	var planetas := get_tree().get_nodes_in_group("planetas")

	for planeta in planetas:
		var direcao: Vector2 = planeta.global_position - nave.global_position
		var pos_radar: Vector2 = direcao * ESCALA

		# .length() = o tamanho do vetor (a distância, via Pitágoras: sqrt(x²+y²))
		# se o planeta "encolhido" ainda cai fora do círculo do radar...
		if pos_radar.length() > RAIO_MINIMAP:
			# .normalized() = mesmo vetor, mas com tamanho 1 (só a direção, sem a distância)
			# multiplicando pelo RAIO_MINIMAP, ele "gruda" exatamente na borda do radar,
			# na direção certa — assim você sempre sabe PRA ONDE ir, mesmo se não sabe
			# a distância exata
			pos_radar = pos_radar.normalized() * RAIO_MINIMAP

		draw_circle(centro + pos_radar, 2.0, Color.WHITE)  # cor genérica por enquanto

	draw_circle(centro, 2.0, Color(0.824, 0.09, 0.486, 1.0))
