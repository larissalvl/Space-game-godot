extends Control

const RAIO = 40.0
const ESCALA = 0.05

@export var icone_nave_minimapa: Texture2D
@export var tamanho_icones := Vector2(10.0, 10.0)
var metade_icones = tamanho_icones/2

func _process(delta):
	queue_redraw()

func _draw():
	var centro := Vector2(RAIO, RAIO)
	draw_circle(centro, RAIO, Color(0.0, 0.018, 0.111, 0.894))
	var nave = get_tree().get_first_node_in_group("nave")
	if nave == null:
		return
		
	var planetas = get_tree().get_nodes_in_group("planetas")
	for planeta in planetas:
		var distancia_naveplaneta: Vector2 = planeta.global_position - nave.global_position
		var distancia_naveplaneta_minimapa: Vector2 = distancia_naveplaneta * ESCALA
		
		if distancia_naveplaneta_minimapa.length() > RAIO:
			distancia_naveplaneta_minimapa = distancia_naveplaneta_minimapa.normalized() * RAIO
		
		var desenho_planeta:= Rect2(centro + distancia_naveplaneta_minimapa - metade_icones, tamanho_icones)
		draw_texture_rect(planeta.icone_planeta_minimapa, desenho_planeta, false)
	
	draw_set_transform(centro, nave.rotation, Vector2.ONE)
	var desenho_nave:= Rect2(-metade_icones, tamanho_icones)
	draw_texture_rect(icone_nave_minimapa, desenho_nave, false)
		
