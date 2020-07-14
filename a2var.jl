#Parse out equals sign delimited files easily inter julialang variables. ^.*n.x$ style. 
# Creates a 2d array from the input file, searches for matches in the first dimension, returns value from second dimension. 
# echo "var1=data" > settings.conf
using DelimitedFiles

settingsfile = "settings.conf"
importedvars = readdlm(settingsfile, '=', String; skipblanks=true)

function a2var(key, a)
    c=1
    for i in getindex(a, :, 1)
        key == i && return getindex(a, c, 2) ; c=c+1
    end
    error("$key not found")
end

var1 = a2var("var1", importedvars)
println(var1)
