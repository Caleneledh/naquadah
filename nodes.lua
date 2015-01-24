minetest.register_node("naquadah:naquadah_ore", {
         description = "Naquadah ore",
	 tiles = {"default_stone.png^naquadah_naquadah_ore.png"},
	 is_ground_content = true,
	 groups = {cracky=3, stone=1},
	 drop = 'naquadah:naquadah_lump',
	 sounds = default.node_sound_stone_defaults(),
})