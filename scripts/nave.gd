extends CharacterBody2D

var vel_nave_base = 300
var vel_nave_atual = vel_nave_base
var vel_angular_base = PI/2
var vel_angular_atual = vel_angular_base

func _ready():
	var sprite = $AnimatedSprite2D
	sprite.play("nave")
	

func _process(delta):
	if Input.is_action_pressed("paraEsquerda"):
		rotation -= vel_angular_atual * delta
	if Input.is_action_pressed("paraDireita"):
		rotation += vel_angular_atual * delta
	if Input.is_action_pressed("paraTras"):
		var movNave = Vector2.DOWN.rotated(rotation) * vel_nave_atual
		position += movNave * delta
	if Input.is_action_pressed("paraFrente"):
		var movNave = Vector2.UP.rotated(rotation) * vel_nave_atual
		position += movNave * delta
	if Input.is_action_pressed("Acelerar"):
		vel_nave_atual = 600
		vel_angular_atual = vel_angular_base * 2
	else:
		vel_nave_atual = vel_nave_base
		vel_angular_atual = vel_angular_base
