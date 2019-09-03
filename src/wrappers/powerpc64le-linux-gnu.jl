# Autogenerated wrapper script for Libuuid_jll for powerpc64le-linux-gnu
export libuuid

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libuuid`
const libuuid_splitpath = ["lib", "libuuid.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libuuid_path = ""

# libuuid-specific global declaration
# This will be filled out by __init__()
libuuid_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libuuid = "libuuid.so.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (,))
    append!.(Ref(LIBPATH_list), (,))

    global libuuid_path = abspath(joinpath(artifact"Libuuid", libuuid_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libuuid_handle = dlopen(libuuid_path)
    push!(LIBPATH_list, dirname(libuuid_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

