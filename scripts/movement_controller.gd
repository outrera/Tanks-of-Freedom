var tile_types = [
	'plain',
	'road',
	'road',
	'road',
	'road',
	'road',
	'road',
	'road',
	'river',
	'river',
	'river',
	'river',
	'river',
	'river',
	'river',
	'river',
	'road',
	'road'
]

func move_object(from, to):
	var action_cost = self.get_terrain_cost(from, self.get_terrain_type(to))
	var player_stats = from.object.get_stats()
	
	if self.can_move(from, to):
		player_stats.ap = player_stats.ap - action_cost
		from.object.set_stats(player_stats)
		
		to.object = from.object
		from.object = null
		to.object.set_pos_map(to.position)
		
		
		return true
	else:
	
		return false
		
func can_move(from, to):
	var unit_stats = from.object.get_stats()
	var action_cost = self.get_terrain_cost(from, self.get_terrain_type(to))
	if unit_stats.ap >= action_cost:
		return true
	else:
		return false
		
func get_terrain_type(to):
	return tile_types[to.terrain_type]
	
func get_terrain_cost(from, terrain_type):
	var stats = from.object.get_stats()
	return stats[terrain_type]