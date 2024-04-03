yy=room_height;
header_font = fn_Ubuntu;
subheader_font = fn_menu;
body_font = fn_Ubuntu_small;
header_extra_padding = 2.5;
subheader_extra_padding = 2;
body_extra_padding = 1.5;

text = [
	{"type": "header", "text": "[Biome Quest]"},
	{"type": "header", "text": "Credits"},
	{"type": "subheader", "text": "Sounds"},
	{"type": "body", "text": "Chest Open - youtube.com @PacTube"},
	{"type": "body", "text": "Swing - youtube.com @Jochi SFX"},
	{"type": "subheader", "text": "Code"},
	{"type": "body", "text": "Inventory - youtube.com @GameMaker"},
	{"type": "body", "text": "Parralax Background - gamemaker.io @Mark Alexander"},
]

height = 0;

for(i = 0; i < array_length(text); i++) {
	
	if(text[i].type == "header") {
		draw_set_font(header_font)
		height += string_height("A") * header_extra_padding;
	} else if(text[i].type == "subheader") {
		draw_set_font(subheader_font)
		height += string_height("A") * subheader_extra_padding;
	} else if(text[i].type == "body") {
		draw_set_font(body_font)
		height += string_height("A") * body_extra_padding;
	}
	
	draw_reset();
}