#!/usr/bin/env julia
# Noah Bliss
# Generates a random 20 character long hex string.
# vcat is necessary as the ranges between a-f and 0-9 are not vectors on their own. vcat combines both ranges into a single vector of all available characters. 
using Random
randstring(vcat(('0':'9'),('a':'f')), 20)
