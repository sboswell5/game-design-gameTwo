function Inventory() constructor {
	
	slots_amount = 4;
	
	_inventory_items = array_create(slots_amount, noone);
	
	item_set = function(_name, _quantity, _held) {
		_inventory_items[find_open_index()] = {
			name: _name,
			quantity: _quantity,
			options: _held,
		};
	}
	
	find_open_index = function() {
		idx = -1;
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if(_inventory_items[i] == noone) {
				idx = i;
				break;
			}
		}
		return idx;
	}
	
	item_get_from_index = function(_index) {
		if(_index < 0) return noone;
		if(_inventory_items[_index] == noone) return noone;
		return _inventory_items[_index];
	}
	
	item_find = function(_name) {
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if(_inventory_items[i] != noone && _name == _inventory_items[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	item_move = function(_indexFrom, _indexTo) {	
		// Check if current place has an item
		if(_inventory_items[_indexFrom] == noone) return;
		
		// Check if new index is empty
		//if(_inventory_items[_indexTo] != noone) return; // Changed to swapping positions!
		
		tmp = _inventory_items[_indexTo];
		_inventory_items[_indexTo] = _inventory_items[_indexFrom];
		_inventory_items[_indexFrom] = tmp;
		
	}
	
	item_add = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			_inventory_items[index].quantity += _quantity;
		} else {
			if(find_open_index() == -1) {
				return noone;	
			}
			item_set(_name, _quantity, get_item(_name));
		}
		return item_get_from_index(item_find(_name));
	}
	
	item_subtract = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			if(item_has(_name, _quantity)) {
				_inventory_items[index].quantity -= _quantity;
				
				if(_inventory_items[index].quantity <= 0) {
					item_remove(index);
				}
			}
		}
		return item_get_from_index(item_find(_name));
	}
	
	item_has = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			return _inventory_items[index].quantity >= _quantity;
		}
		
		return false;
	}
	
	item_remove = function(index) {
		_inventory_items[index] = noone;
	}
	
	clear = function() {
		_inventory_items = array_create(slots_amount, noone);
	}
	
	item_get = function() {
		return _inventory_items;
	}
	
	toString = function() {
		return json_stringify(_inventory_items);
	}
}