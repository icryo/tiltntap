extends Control
## Main menu manager

@onready var _right_panel := $RightControl
@onready var sensitivity_slider := $LeftControl/VBoxContainer/SensitivityContainer/HBoxContainer/SensitivitySlider
@onready var sensitivity_input := $LeftControl/VBoxContainer/SensitivityContainer/HBoxContainer/SensitivityInput

var data_wrapper:DataManager.SectionWrapper:
	get:
		return DataManager.get_wrapper(DataManager.SETTINGS_FILE_PATH, "user")

func _ready() -> void:
	$LeftControl/VBoxContainer/Play.grab_focus()
	_hide_options()
	
	# Initialize sensitivity controls
	var saved_sensitivity = data_wrapper.get_data("sensitivity", 0.50)
	_update_sensitivity_controls(saved_sensitivity)
	
	# Connect signals
	sensitivity_slider.value_changed.connect(_on_sensitivity_slider_changed)
	sensitivity_input.text_submitted.connect(_on_sensitivity_input_submitted)

func _update_sensitivity_controls(value: float) -> void:
	sensitivity_slider.value = value
	sensitivity_input.text = "%.2f" % value
	data_wrapper.set_data("sensitivity", value)
	# Also update the game-specific sensitivity values
	data_wrapper.set_data("sensitivity_game", "Counter Strike 2")
	data_wrapper.set_data("sensitivity_game_value", 0.022)

func _on_sensitivity_slider_changed(value: float) -> void:
	_update_sensitivity_controls(value)

func _on_sensitivity_input_submitted(text: String) -> void:
	var new_value = text.to_float()
	# Clamp value to valid range
	new_value = clampf(new_value, sensitivity_slider.min_value, sensitivity_slider.max_value)
	_update_sensitivity_controls(new_value)

func _on_play_pressed() -> void:
	_hide_options()
	_right_panel.get_node("SelectGamemode").visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_settings_pressed() -> void:
	_hide_options()
	_right_panel.get_node("Settings").visible = true

## Hide all right panel options
func _hide_options() -> void:
	for child in _right_panel.get_children():
		child.visible = false
