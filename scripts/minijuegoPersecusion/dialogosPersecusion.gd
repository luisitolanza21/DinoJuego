extends Control

var dialog = ["asdkakjdasjdsakj"]
var dialog_index = 0
var finish = false
var text_speed = 0.1
var is_typing = false
var current_tween: Tween = null

func _ready():

	if dialog.size() > 0:
		load_dialog()

func set_dialog_text(new_dialog: Array):
	dialog = new_dialog
	dialog_index = 0
	load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finish = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.visible_characters = 0
		var tween_duration = text_speed * dialog[dialog_index].length()
		current_tween = get_tree().create_tween()
		is_typing = true
		current_tween.tween_property($RichTextLabel, "visible_characters", dialog[dialog_index].length(), tween_duration)
		current_tween.finished.connect(self._on_tween_finished)
	else:
		queue_free()
	dialog_index += 1

func _on_tween_finished():
	is_typing = false
	finish = true

func complete_text():
	if is_typing and current_tween:
		current_tween.stop()
		$RichTextLabel.visible_characters = dialog[dialog_index - 1].length()
		is_typing = false
		finish = true
