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
      return x
   end
end

function math.ODGpow ( x )
    pow = math.round_int(math.log10(math.abs(x)))
    return pow
end

function math.myroundcs ( x , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow = math.floor(math.log10(math.abs(x)))
      if pow > n-1 then
          return math.myroundsc ( x , n )
      end
      x = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-n+1)
      x = string.format ( "%."..n-1-pow.."f" , x )
      return x
   end
end

function math.myroundcsi ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    x_r = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-n+1)
    if x_r < x * 0.95 then
        return math.myroundcs ( x + 10^(pow) , n )
    else
        return math.myroundcs ( x , n )
    end
end

function math.myroundsc ( x , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow = math.floor(math.log10(math.abs(x)))
      x = math.round_int ( x*10^(n-1-pow) ) * 10^(-n+1)
      x = string.format ( "%."..n-1-0*pow.."f" , x )
      if pow > 0 or pow < 0 then
         x = string.format ("%s%s%s", x, "e", pow)
      end
      return x
   end
end

function math.myroundsci ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    x_r = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-n+1)
    if x_r < x * 0.95 then
        return math.myroundsc ( x + 10^(pow) , n )
    else
        return math.myroundsc ( x , n )
    end
end

function myautoSI ( x , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow = math.floor(math.log10(math.abs(x)))
      pow3 = math.floor(pow / 3)*3
      if n-1-pow+pow3 < 0 then
          pow3 = pow3 + 3 -- if not enough significant numbers
      end
      prefix = ""
      if pow3 == 3 then
          prefix = "\\kilo"
      elseif pow3 == 6 then
          prefix = "\\mega"
      elseif pow3 == 9 then
          prefix = "\\giga"
      elseif pow3 == 12 then
          prefix = "\\tera"
      elseif pow3 == 15 then
          prefix = "\\peta"
      elseif pow3 == 18 then
          prefix = "\\exa"
      elseif pow3 == 21 then
          prefix = "\\zetta"
      elseif pow3 == 24 then
          prefix = "\\yotta"
      elseif pow3 == 27 then
          prefix = "\\ronna"
      elseif pow3 == 30 then
          prefix = "\\quetta"
      elseif pow3 == -3 then
          prefix = "\\milli"
      elseif pow3 == -6 then
          prefix = "\\micro"
      elseif pow3 == -9 then
          prefix = "\\nano"
      elseif pow3 == -12 then
          prefix = "\\pico"
      elseif pow3 == -15 then
          prefix = "\\femto"
      elseif pow3 == -18 then
          prefix = "\\atto"
      elseif pow3 == -21 then
          prefix = "\\zepto"
      elseif pow3 == -24 then
          prefix = "\\yocto"
      elseif pow3 == -27 then
          prefix = "\\ronto"
      elseif pow3 == -30 then
          prefix = "\\quecto"
      end
      x = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-pow3-n+1)
      x = string.format ( "%."..n-1-pow+pow3.."f" , x )
      return x, prefix
   end
end

function myautoSIa ( x , n )
    x, prefix = myautoSI ( x , n )
    return x
end

function myautoSIai ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    x_r = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-n+1)
    if x_r < x * 0.95 then
        return myautoSIa ( x + 10^(pow) , n )
    else
        return myautoSIa ( x , n )
    end
end

function myautoSIb ( x , n )
    x, prefix = myautoSI ( x , n )
    return prefix
end

function myautoSIaUnc ( u , x , n )
    x_bis, prefix = myautoSI ( x , n+5 )
    return math.myroundsci(u / x * x_bis, n)
end

function myNcsByUnc ( x, u )
    pow_x = math.floor(math.log10(math.abs(x)))
    pow_u = math.floor(math.log10(math.abs(u)))
    N = pow_x - pow_u + 1
    if N < 1 then
        N = 1
    end
    return N
end