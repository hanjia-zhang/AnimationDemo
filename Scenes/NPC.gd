extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			
			var dialog = Dialogic.start('timeline-1')
			
			
			add_child(dialog)


func _on_NPC_body_entered(body):
	if body.name == 'PlayerControl':
		active = true
		
func _on_NPC_body_exited(body):
	if body.name == 'PlayerControl':
		active = false