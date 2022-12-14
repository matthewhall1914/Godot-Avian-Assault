extends CanvasLayer


signal startGame

func _on_Start_pressed():
	get_node("Start").hide()
	emit_signal("startGame")
	yield(get_node("MessageTimer"), "timeout")

func _on_MessageTimer_timeout():
	get_node("Message").hide()
	
func showMessage(text):
	get_node("Message").text = text
	get_node("Message").show()
	get_node("MessageTimer").start()
	
func showGameOver():
	showMessage("Your bird is birdiefeeded!")
	yield(get_node("MessageTimer"), "timeout")
	get_node("Message").text = "Bird Attack!"
	get_node("Message").show()
	get_node("Start").show()

	
func updateScore(score):
	get_node("Score").text = str(score)
