-- First two functions seen somewhere on tex.stackexchange.com.
-- (Maybe https://tex.stackexchange.com/a/468118/5001 ??)

function math.round_int ( x )
   return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function math.round ( x , n )
   return math.round_int ( x*10^n ) / 10^n 
end

-- New:
function math.myround ( x , n )
   if n==0 then
      return math.round_int ( x )
   elseif n<0 then
      return math.floor ( math.round ( x , n ) )
   else   -- n>0
      x = math.round ( x , n ) -- replace 'x' with rounded version
      x = string.format ( "%."..n.."f" , x )
      return ( x:gsub ( "%." , "{,}" , 1 ) )
   end
end