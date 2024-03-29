y_offset = 40;
_width = 350;
_height = 25;
_x = 50;
_y = display_get_gui_height() - _height - y_offset;

draw_healthbar(_x, _y, _x + _width, _y + _height, (oHealth / oMaxHealth) * 100, c_black, c_red, c_lime, 0, true, true)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(_x + _width / 2, _y + _height / 2, $"{oHealth} / {oMaxHealth}");
draw_reset();