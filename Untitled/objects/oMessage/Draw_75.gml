draw_set_color(bgd_color);
draw_rectangle(x_offset, y_offset, x_offset + bgd_width, y_offset + bgd_height, false);
draw_set_color(c_black);
draw_text(x_offset + bgd_width / 2 - string_width(close_message) / 2, y_offset, close_message );
draw_text_ext(x_offset + x_padding, y_offset + y_padding, text_message, string_height("|"), bgd_width - x_padding);
draw_reset();