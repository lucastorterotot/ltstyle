function math.argcosh(x)
   return math.log(x + (x^2 - 1)^.5)
end

function math.argsinh(x)
   return math.log(x + (x^2 + 1)^.5)
end

function math.argtanh(x)
   return 1/2*math.log((1+x)/(1-x))
end