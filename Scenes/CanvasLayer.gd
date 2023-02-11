extends CanvasLayer


func _update_greenBoard(gb):
	$Label1/gb.text = str(gb)

func _update_plastic(pl):
	$Label2/pl.text = str(pl)
	
func _update_IDcard(idc):
	$Label3/idc.text = str(idc)
