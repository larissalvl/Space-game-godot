extends CharacterBody2D

var velNave = 250
var velAngular = PI

func _ready():
	var sprite = $AnimatedSprite2D
	sprite.play("nave")
	

func _process(delta):
	if Input.is_action_pressed("paraEsquerda"):
		rotation -= velAngular * delta * 1
	if Input.is_action_pressed("paraDireita"):
		rotation += velAngular * delta * 1
	if Input.is_action_pressed("paraTras"):
		var movNave = Vector2.DOWN.rotated(rotation) * velNave
		position += movNave * delta
	if Input.is_action_pressed("paraFrente"):
		var movNave = Vector2.UP.rotated(rotation) * velNave
		position += movNave * delta
