local K="Doom"

-- Anti-debug (basic)
pcall(function()
    if debug or hookfunction then
        while true do end
    end
end)

-- Integrity check (anti-edit)
local s=tostring(script)
local h=0
for i=1,#s do h=(h+s:byte(i))%999999 end
if h~=382741 then while true do end end -- papalitan mo ito

-- Load encrypted payload
local e=game:HttpGet("https://raw.githubusercontent.com/USERNAME/REPO/main/data.txt")

local o=""
for i=1,#e do
    o=o..string.char(bit32.bxor(e:byte(i),K:byte((i-1)%#K+1)))
end

loadstring(o)()
