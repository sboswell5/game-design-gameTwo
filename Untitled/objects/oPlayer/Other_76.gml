if (layer_instance_get_instance(event_data[?"element_id"]) == id) {
   switch (event_data[?"message"]) {
      case "end_attack": {
		state = PlayerState.IDLE;
	  }
   }
}