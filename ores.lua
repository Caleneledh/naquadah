minetest.register_ore({
      ore_type = "scatter",
      ore = "naquadah:naquadah_ore",
      wherein = "default:stone",
      clust_scarcity = 8*8*8,			--temporary
      clust_num_ores = 8,			--temporary
      clust_size = 3,	 			--temporary
      height_min = -10000,
      height_max = -5000,
      noise_threshhold = 0.5,			--temporary
})
