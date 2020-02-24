tool
extends Node2D

export(String) var title: String = "" setget setTitleText
export(Texture) var background: Texture = null setget setBackgroundTexture

func setTitleText(aTitle: String) -> void:
	title = aTitle
	$TitleLabel.text = aTitle

func setBackgroundTexture(aTexture: Texture) -> void:
	background = aTexture
	$GaugeBG.texture = aTexture
