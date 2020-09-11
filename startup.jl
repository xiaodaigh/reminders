println("Running startup.jl")
println("at $(@__FILE__)")

println("using Revise")
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        println("Revise not installed. Please install")
    end

end

try
    using PackageCompiler
catch
    println("Issue with PackageCompiler DETECTED; install it")
end

try
    using PkgVersionHelper
    println("PkgVersionHelper ready; upcheck() available")
catch
    println("Issue with PkgVersionHelper DETECTED; install it")
end


function compileds()
    @time create_sysimage([
        :Alert,
        :BenchmarkTools,
        :Blosc,
        :BufferedStreams,
        :CategoricalArrays,
        :CSV,
        :CUDA,
        :DataAPI,
        :DataConvenience,
        :DataFrames,
        :DataFramesMeta,
        :FastGroupBy,
        :FloatingTableView,
        :Flux,
        :IJulia,
        :JDF,
        :JLBoost,
        :JLBoostMLJ,
        :LoopVectorization,
        :Missings,
        :PairAsPipe,
        :Parquet,
        :Pipe,
        :PkgTemplates,
        :PkgVersionHelper,
        :Plots,
        :Pluto,
        :PooledArrays,
        :RDatasets,
        :SortingLab,
        :StatsBase,
        :StatsPlots,
        :Tables,
        :TableView,
        :ThreadPools,
        :TimeZones,
        :Tullio,
        :WeakRefStrings,
        :Weave
        # :DataFramesMacros,
    ], replace_default=true)
end


try
    using ProjectEulerUtil
catch
    println("Issue with ProjectEulerUtil DETECTED; install it")
end

dope(n) = begin
    """Do Project Euler"""
    path = "C:/git/hacker-rank/project-euler/$n"
    if !isdir(path)
        mkdir(path)
        open(joinpath(path, "code.jl"), "w") do file
            write(file, "")
        end

        open(joinpath(path, "run.jl"), "w") do file
            code_file = path*"/code.jl"
            write(file, "includet(\"$code_file\")")
        end

    end
end

const PE_STATUS_FILE = "c:/git/hacker-rank/pe-status.txt"

addpestatus(arr::AbstractArray) = addpestatus.(arr)

function addpestatus(n::Integer, msg="DONE")
    pt = get_problem_title(n)
    open(PE_STATUS_FILE, "a") do file
        println(file, "#$n $pt - $(uppercase(msg))")
    end
end

function clearpestatus()
     open(PE_STATUS_FILE, "w") do file
        write(file, "")
    end
end

updatepestatus(args...) = changepestatus(args...)

function changepestatus(n::Integer, msg)
    pt = get_problem_title(n)
    lines = open(PE_STATUS_FILE, "r") do file
        readlines(file)
    end

    open(PE_STATUS_FILE, write=true, truncate=true, append=false) do file
        dict = Dict{Int, Bool}()
        for line in lines
            if length(line) == 0
                 continue
            end
            first_num = parse(Int, split(line, " ")[1][2:end])
            if !haskey(dict, first_num)
                if first_num == n
                    println(file, "#$n $pt - $(uppercase(msg))")
                else
                    println(file, line)
                end
            end
            dict[first_num] = true
        end
    end
end

println("Finished running startup.jl")
