-- Table to hold statistical functions
stats={}

-- Get the mean value of a table
function stats.mean( t )
    local sum = 0
    local count= 0

    for k,v in pairs(t) do
        if type(v) == 'number' then
            sum = sum + v
            count = count + 1
        end
    end

    return (sum / count)
end

-- Get the median of a table.
function stats.median( t )
    local temp={}

    -- deep copy table so that when we sort it, the original is unchanged
    -- also weed out any non numbers
    for k,v in pairs(t) do
        if type(v) == 'number' then
            table.insert( temp, v )
        end
    end

    table.sort( temp )

    -- If we have an even number of table elements or odd.
    if math.fmod(#temp,2) == 0 then
        -- return mean value of middle two elements
        return ( temp[#temp/2] + temp[(#temp/2)+1] ) / 2
    else
        -- return middle element
        return temp[math.ceil(#temp/2)]
    end
end

-- Get the standard deviation of a table
function stats.std( t, ddof)
    ddof = ddof or 1 -- default value for ddof
    local m
    local vm
    local sum = 0
    local count = 0
    local result

    m = stats.mean( t )

    for k,v in pairs(t) do
        if type(v) == 'number' then
            vm = v - m
            sum = sum + (vm * vm)
            count = count + 1
        end
    end

    result = math.sqrt(sum / (count-ddof))

    return result
end

-- Get the max and min for a table
function stats.maxmin( t )
    local max = -math.huge
    local min = math.huge

    for k,v in pairs( t ) do
        if type(v) == 'number' then
            max = math.max( max, v )
            min = math.min( min, v )
        end
    end

    return max, min
end

function stats.max( t )
    max, min = stats.maxmin( t )
    return max
end

function stats.min( t )
    max, min = stats.maxmin( t )
    return min
end