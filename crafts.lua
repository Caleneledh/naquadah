--tokra crystal recipes

minetest.register_craft({
      output = 'naquadah:tokra_crystal_1',
      recipe = {
	 {'','naquadah:naquadah_lump',''},
	 {'','blox:glowstone',''},
	 {'','naquadah:naquadah_lump',''},
      }
})

minetest.register_craft({
      output = 'naquadah:tokra_crystal_2',
      recipe = {
	 {'naquadah:naquadah_lump','naquadah:naquadah_lump',''},
	 {'','blox:glowstone',''},
	 {'naquadah:naquadah_lump','naquadah:naquadah_lump',''},
      }
})

minetest.register_craft({
      output = 'naquadah:tokra_crystal_3',
      recipe = {
	 {'naquadah:naquadah_lump','naquadah:naquadah_lump','naquadah:naquadah_lump'},
	 {'naquadah:naquadah_lump','','naquadah:naquadah_lump'},
	 {'naquadah:naquadah_lump','naquadah:naquadah_lump','naquadah:naquadah_lump'},
      }
})
	    
