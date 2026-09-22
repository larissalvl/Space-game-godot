extends Control

const RAIO_MINIMAP := 40.0

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

		if pos_radar.length() > RAIO_MINIMAP:
			pos_radar = pos_radar.normalized() * RAIO_MINIMAP

		draw_circle(centro + pos_radar, 2.0, Color.WHITE)  # cor genérica por enquanto

	draw_circle(centro, 2.0, Color(0.824, 0.09, 0.486, 1.0))
