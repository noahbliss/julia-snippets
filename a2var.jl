#Parse out equals sign delimited files easily inter julialang variables. ^.*n.x$ style. 
# Creates a 2d array from the input file, searches for matches in the first dimension, returns value from second dimension. 
# echo "var1=data" > settings.conf
using DelimitedFiles

settingsfile = "settings.conf"
importedvars = readdlm(settingsfile, '=', String; skipblanks=true)

a2var(key, a) = (c=1; for i in a[:, 1]; i == key && return a[c, 2]; c+=1; end || error("$key not found"))

var1 = a2var("var1", importedvars)
println(var1)

# A verbose version of the above function is included below:
function a2var(key, a)
    c=1
    for i in a[:, 1]
        i == key && return a[c, 2]; c+=1
    end
    error("$key not found")
end
