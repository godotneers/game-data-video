extends PanelContainer

@onready var _texture_rect:TextureRect = %TextureRect

func display(item:Item):
	_texture_rect.texture = item.icon
	
