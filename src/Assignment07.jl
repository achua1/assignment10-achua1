module Assignment07

export normalizeDNA,
       composition

# # uncomment the following line if you intend to use BioSequences types
# using BioSequences

"""
    normalizeDNA(::AbstractString)

Ensures that a sequence only contains valid bases
(or `'N'` for unknown bases).
Returns a String.
"""
function normalizeDNA(seq)
    seq = uppercase(string(seq))
    for base in seq
        # note: `N` indicates an unknown base
        occursin(base, "AGCTN") || error("invalid base $base")
    end
    return seq # change to `return LongDNASeq(seq)` if you want to try to use BioSequences types
end


# Your code here.
# Don't forget to export your functions!
function composition(seq)
    sequence = normalizeDNA(seq) # make uppercase string, check invalid bases
    a = c = g = t = n = 0 # sets all 4 variables to `0`
    
    for base in sequence
        ## add 1 to each base as it occurs
        if occursin(base, "A")
            a = a + 1
        elseif occursin(base, "C")
            c = c + 1
        elseif occursin(base, "G")
            g = g + 1
        elseif occursin(base, "T")
            t = t + 1
        elseif occursin(base, "N")
            n = n + 1
        end
    end
        
    return composition_dict = Dict('A'=>a, 'C'=>c, 'G'=>g, 'T'=>t,'N'=>n)
end

function gc_content(seq)
    seqlength = length(seq)

    sequence = composition(seq)
    cs = sequence['C']
    gs = sequence['G']

    return (cs + gs) / seqlength 
end

function complement(base::Char)
    comp = Dict('A'=>'T',
                'T'=>'A',
                'G'=>'C',
                'C'=>'G',
                'N'=>'N')
    return comp[base]
 end

function complement(seq::AbstractString)
    seq = uppercase(seq)
    base_comp = Dict("A" => "T",
                    "T" => "A",
                    "G" => "C",
                    "C" => "G",
                    "N" => "N")
    return base_comp[sequence]         
end    

function complement(base)
    base = uppercase(base)

    if base == "A" || base == 'A'
        return 'T'
    elseif base == "T" || base == 'T'
        return 'A'
    elseif base == "C" || base == 'C'
        return 'G'
    elseif base == "G" || base == 'G'
        return 'C'
    else 
        error("Base $base not supported.")
    end
end

    if occursin(base, "A") 
        return "T"
    elseif occursin(base, "T") 
        return "A"
    elseif occursin(base, "C")
        return "G"
    elseif occursin(base,"G")
        return "C"
    elseif occursin(base, "N")
        return "N"
    else 
        error("Base $base not supported.")
    end



end # module Assignment07
