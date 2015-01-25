pos={}
orig_pos={}

local function pos_is_pointable(pos)
        local node = minetest.get_node(pos)
	local nodedef = minetest.registered_nodes[node.name]
	return nodedef and nodedef.pointable
end



local function tokra_dig(pos, user)
      --print("tokra_dig called")
      --print("tokra_dig pos:")
      --for key,value in pairs(pos) do print(key,value) end
      if minetest.is_protected(pos, user:get_player_name()) then
	     minetest.record_protection_violation(pos, user:get_player_name())
	     return
      end
      local node=minetest.get_node(pos)
      --print(node.name)
      if node.name == "air" or node.name == "ignore" then return end
      if node.name == "default:lava_source" then return end
      if node.name == "default:lava_flowing" then return end
      if node.name == "default:water_source" then return end
      if node.name == "default:water_flowing" then return end
      --print("node fine, doing dig")
      minetest.node_dig(pos, node, user)
end



local function tokra_execute_dig(pos,direction,crystal_type,user)
	print("TOKRA DIRECTION")      
	print(direction)
      --print(crystal_type)

      -- NOTE: direction 1 = +x, direction 2 = -x
      --       direction 3 = +z, direction 4 = -7

      --       crystal 1 = 1x2x3 corridor
      --       crystal 2 = 4x3x4 room
      if direction == 1 then
        if crystal_type == 1 then
 	   --print("calling tokra_dig")
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
	    pos.x=pos.x+1
	    tokra_dig(pos,user)
	    pos.y=pos.y+1
	    tokra_dig(pos,user)
	    pos.x=pos.x+1
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
	    return
	 end
	 if crystal_type == 2 then
	     --orig_pos = pos
	     for y=-1,1 do
	        for z=-2,2 do
	  	    for x=0,4 do
			print("x"..x)
			print("y"..y)
			print("z"..z)
			--pos=orig_pos
			local temp_x = pos.x
			local temp_y = pos.y
			local temp_z = pos.z
			pos.x = pos.x + x
			pos.y = pos.y + y
			pos.z = pos.z + z
			tokra_dig(pos,user)
			pos.x = temp_x
			pos.y = temp_y
			pos.z = temp_z
		    end
		end
	    end
	end
	return
      end
      if direction == 2 then
         if crystal_type == 1 then
             --print("calling tokra_dig")
             tokra_dig(pos,user)
             pos.y=pos.y-1
             tokra_dig(pos,user)
             pos.x=pos.x-1
             tokra_dig(pos,user)
             pos.y=pos.y+1
             tokra_dig(pos,user)
             pos.x=pos.x-1
             tokra_dig(pos,user)
             pos.y=pos.y-1
             tokra_dig(pos,user)
	 return
         end
	 if crystal_type == 2 then
	     --orig_pos = pos
	     for y=-1,1 do
	        for z=-2,2 do
	  	    for x=0,-4,-1 do
			--pos=orig_pos
			local temp_x = pos.x
			local temp_y = pos.y
			local temp_z = pos.z
			pos.x = pos.x + x
			pos.y = pos.y + y
			pos.z = pos.z + z
			tokra_dig(pos,user)
			pos.x = temp_x
			pos.y = temp_y
			pos.z = temp_z
		    end
		end
	     end 													     
	 end
	return
      end
      if direction == 3 then
      	 if crystal_type == 1 then
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
	    pos.z=pos.z+1
	    tokra_dig(pos,user)
	    pos.y=pos.y+1
	    tokra_dig(pos,user)
	    pos.z=pos.z+1
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
	    return
	 end
      
	 if crystal_type == 2 then
	     --orig_pos = pos
	     for y=-1,1 do
	        for z=0,4 do
	  	    for x=-2,2,1 do
			--pos=orig_pos
			local temp_x = pos.x
			local temp_y = pos.y
			local temp_z = pos.z
			pos.x = pos.x + x
			pos.y = pos.y + y
			pos.z = pos.z + z
			tokra_dig(pos,user)
			pos.x = temp_x
			pos.y = temp_y
			pos.z = temp_z
		    end
		end
	     end 
	 end
	 return													     
	 end
      if direction == 4 then
      	 --print("d4")

      	 if crystal_type == 1 then
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
	    pos.z=pos.z-1
	    tokra_dig(pos,user)
	    pos.y=pos.y+1
	    tokra_dig(pos,user)
	    pos.z=pos.z-1
	    tokra_dig(pos,user)
	    pos.y=pos.y-1
	    tokra_dig(pos,user)
            return
	 end
      
	 if crystal_type == 2 then
	     --orig_pos = pos
	     
	    -- print("HERE")
	     for y=-1,1 do
	        for z=0,-4,-1 do
	  	    for x=-2,2 do
			--pos=orig_pos
			local temp_x = pos.x
			local temp_y = pos.y
			local temp_z = pos.z
			pos.x = pos.x + x
			pos.y = pos.y + y
			pos.z = pos.z + z
			tokra_dig(pos,user)
			pos.x = temp_x
			pos.y = temp_y
			pos.z = temp_z
		    end
		end
	     end
	  													     
	 end
	 end
end



local function tokra_do_dig(pos, user, crystal_type)
      --print("tokra_do_dig called")
      local dir = user:get_look_dir()
      local xdir, zdir = math.abs(dir.x), math.abs(dir.z)
      if xdir>zdir then
      	 if dir.x>0 then tokra_execute_dig(pos,1,crystal_type, user) else tokra_execute_dig(pos,2,crystal_type,user) end
      end
      if zdir>xdir then
      	 if dir.z>0 then tokra_execute_dig(pos,3,crystal_type,user) else tokra_execute_dig(pos,4,crystal_type,user) end
      end
end




local function tokra_init_dig(itemstack, user, pointed_thing, crystal_type)
      local keys = user:get_player_control()
      local player_name = user:get_player_name()
      local meta = minetest.deserialize(itemstack:get_metadata())
      if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
      	 	return
      end
      pos=minetest.get_pointed_thing_position(pointed_thing, above)
      --print("POS:")
      --print(pos)
      for key,value in pairs(pos) do print(key,value) end
      tokra_do_dig(pos, user, crystal_type)
      itemstack:set_metadata(minetest.serialize(meta))
      return itemstack
end




minetest.register_tool("naquadah:tokra_crystal_1", {
        description = "Tokra Excavation Crystal (1x2x3 corridor)",
	inventory_image = "tokra_crystal_1.png",
	on_use = function(itemstack, user, pointed_thing)
	      tokra_init_dig(itemstack, user, pointed_thing, 1)
	      return itemstack
	end,
})

minetest.register_tool("naquadah:tokra_crystal_2", {
        description = "Tokra Excavation Crystal (5x3x5 room)",
	inventory_image = "tokra_crystal_2.png",
	on_use = function(itemstack, user, pointed_thing)
	      tokra_init_dig(itemstack, user, pointed_thing, 2)
	      return itemstack
	end,
})
								