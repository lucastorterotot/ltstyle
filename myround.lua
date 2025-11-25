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
    pow = math.floor(math.log10(math.abs(x)))
    if x*10^(-pow) >= 5 then
        pow = pow + 1
    end
    return pow
end

function math.myroundcs ( x1 , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow1 = math.floor(math.log10(math.abs(x1)))
      if pow1 > n-1 then
          return math.myroundsc ( x1 , n )
      end
      x2 = math.round_int ( x1*10^(n-1-pow1) ) * 10^(pow1-n+1)
      pow2 = math.floor(math.log10(math.abs(x2)))
      if pow2 == pow1 then
          xs = x2
          pows = pow1
      else
          xs = math.round_int ( x1*10^(n-1-pow2) ) * 10^(pow2-n+1)
          pows = pow2
      end
      xs = string.format ( "%."..n-1-pows.."f" , xs )
      return xs
   end
end

function math.myroundps ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    if n > pow then
        return 0
    end
    if n<1 then
        return math.myround(x, -n)
    else -- n >= 0
        x = math.round_int ( x / 10^n )
        x = string.format ("%s%s%s", x, "e", n)
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

function math.myroundsc ( x1 , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow1 = math.floor(math.log10(math.abs(x1)))
      x2 = math.round_int ( x1*10^(n-1-pow1) ) * 10^(pow1-n+1)
      pow2 = math.floor(math.log10(math.abs(x2)))
      if pow2 == pow1 then
          xs = x2
          pows = pow1
      else
          xs = math.round_int ( x1*10^(n-1-pow2) ) * 10^(pow2-n+1)
          pows = pow2
      end
      xs = xs * 10^(-pows)
      xs = string.format ( "%."..n-1-0*pows.."f" , xs )
      if pows > 0 or pows < 0 then
         xs = string.format ("%s%s%s", xs, "e", pows)
      end
      return xs
   end
end

function math.myroundscps ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    if n > pow then
        return 0
    end
    x = math.round_int ( x / 10^n ) * 10^n / 10^pow
    x = string.format ("%s%s%s", string.format ( "%."..pow-n.."f" , x ), "e", pow)
    return x
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

function myautoqty ( x1 , n )
   if n<1 then
      n = 1
   else   -- n>0
      pow1 = math.floor(math.log10(math.abs(x1)))
      pow3 = math.floor(pow1 / 3)*3
      x2 = math.round_int ( x1*10^(n-1-pow1) ) * 10^(pow1-n+1)
      pow2 = math.floor(math.log10(math.abs(x2)))
      if pow2 == pow1 then
          xs = x2
          pows = pow1
      else
          xs = math.round_int ( x1*10^(n-1-pow2) ) * 10^(pow2-n+1)
          pows = pow2
      end
      if n-1-pows+pow3 < 0 then
          pow3 = pow3 + 3 -- if not enough significant numbers
      end
      xs = xs * 10^(-pow3)
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
      else
        return math.myroundsc(x1, n), prefix
      end
      xs = string.format ( "%."..n-1-pows+pow3.."f" , xs )
      return xs, prefix
   end
end

function myautoqtyps ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    if n > pow then
        return 0, ""
    end
    pow3 = math.floor(pow / 3)*3
    if n > pow3 then
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
    else
        return math.myroundps(x, n), prefix
    end
    x = math.round_int ( x / 10^n ) * 10^(n-pow3)
    x = string.format ( "%."..pow3-n.."f" , x )
    return x, prefix
end

function myautoqtya ( x , n )
    x, prefix = myautoqty ( x , n )
    return x
end

function myautoqtyaps ( x , n )
    x, prefix = myautoqtyps ( x , n )
    return x
end

function myautoqtyai ( x , n )
    pow = math.floor(math.log10(math.abs(x)))
    x_r = math.round_int ( x*10^(n-1-pow) ) * 10^(pow-n+1)
    if x_r < x * 0.95 then
        return myautoqtya ( x + 10^(pow) , n )
    else
        return myautoqtya ( x , n )
    end
end

function myautoqtyb ( x , n )
    x, prefix = myautoqty ( x , n )
    return prefix
end

function myautoqtybps ( x , n )
    x, prefix = myautoqtyps ( x , n )
    return prefix
end

function myautoqtyaUnc ( u , x , n )
    x_bis = myautoqtyaps ( x , math.floor(math.log10(math.abs(u))) - n + 1 )
    if math.floor(math.log10(math.abs(u/x*x_bis))) < -5 then
        return math.myroundsci(u * 10^(math.round_int(math.log10(math.abs(x_bis/x)))), n)
    else
        return math.myroundcsi(u * 10^(math.round_int(math.log10(math.abs(x_bis/x)))), n)
    end
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