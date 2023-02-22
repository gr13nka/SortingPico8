--logic
-- starting giraffee heights
g =	{}
--amount of visible gif
gcnt=0
z=0

function adding_ind(i)
	
	add(g,0)
	[[while i<#g do
		g[i] = g[i+1]
		i+=1
	end
	]]
	gcnt+= 1
	--g[i] = 0

	print("press d to increase height",
	      22, 2, 7) 
end

function adding_gf()

	add(g,0)
	gcnt+=1
end

function removing_gf()
	
	if gcnt > 0 then
		g[gcnt]=nil
		gcnt-=1
	end
end

function talling()
	
	if gcnt > 0	then
		g[gcnt]+=1
	end
end

--drawing

-- draw a giraffe at x,y with
-- neck length of l

function draw_giraffe(x,y,l)

	-- body
	spr(33,x-8,y-8,2,1)
		
	-- neck for l segments
	for i=1,l do
		spr(18, x,y-8-i*8)
	end
	
	-- put head on top
	spr(2, x,y-16-l*8)

end

function _draw()
	cls(12)
	rectfill(0,110,227,127,14)
	
	
	print("press ❎ to sort",
	      32, 10, 7)
	
	for i=1,gcnt do
			draw_giraffe(i*16,110,g[i])
	end

end
--calls

function _update()
	
	if (btnp(⬅️,1)) then
		adding_gf()
	end
	
	if (btnp(⬆️,1)) then
		removing_gf()
	end
	
	if (btnp(⬇️,1)) then
		talling()
	end
	
	if (btnp(2)) then
		adding_ind(0)	
	end
		
	-- ❎ to sort
	if (btnp(5)) then
			for i=1,#g-1 do
				
				if (g[i] > g[i+1]) then
				
					temp   = g[i]
					g[i]   = g[i+1]
					g[i+1] = temp
				
					sfx(0)
				
					break 
				end
			end
			
	end
	
	if (btnp(1)) then
		z += 5
		camera(z,y)
	end
	
	if (btnp(0)) then
		z -= 5
		camera(z,y)
	end

end
