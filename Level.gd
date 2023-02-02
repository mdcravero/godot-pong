extends Node2D

var PlayerScore = 0
var PlayerEnemy = 0

func _ready():
	_restart_game()

func _process(delta):
	$scoredPlayerNum.text = str(PlayerScore)
	$scoredEnemyNum.text = str(PlayerEnemy)

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	#$Ball.reset_ball()
	$RestarTime.start()

func _on_ArcoPlayer_body_entered(body):
	if body is Ball:
		PlayerEnemy += 1
		_restart_game()


func _on_ArcoEnemy_body_entered(body):
	if body is Ball:
		PlayerScore += 1
		_restart_game()
