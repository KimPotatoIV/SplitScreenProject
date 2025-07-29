extends Node2D

##################################################
var camera_l_node: Camera2D
var camera_r_node: Camera2D
var player_l_node: CharacterBody2D
var player_r_node: CharacterBody2D

##################################################
func _ready() -> void:
	camera_l_node = $SubViewportContainerL/SubViewportL/Camera2DL
	camera_r_node = $SubViewportContainerR/SubViewportR/Camera2DR
	player_l_node = $SubViewportContainerL/SubViewportL/World/PlayerL
	player_r_node = $SubViewportContainerL/SubViewportL/World/PlayerR
	
	var world: World2D = $SubViewportContainerL/SubViewportL.world_2d
	$SubViewportContainerR/SubViewportR.world_2d = world

##################################################
func _process(delta: float) -> void:
	camera_l_node.global_position = player_l_node.global_position
	camera_r_node.global_position = player_r_node.global_position
