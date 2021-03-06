help([[
]])

local pkgName = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

local hierA        = hierarchyA(pkgNameVer,1)
local compNameVer  = hierA[1]
local compNameVerD = compNameVer:gsub("/","-")

conflict(pkgName)

local opt = os.getenv("HPC_OPT") or os.getenv("OPT") or "/opt/modules"

local base = pathJoin(opt,compNameVerD,pkgName,pkgVersion)

setenv("ip_ROOT", base)
setenv("ip_VERSION", pkgVersion)
setenv("IP_INC4", pathJoin(base,"include_4"))
setenv("IP_INC8", pathJoin(base,"include_8"))
setenv("IP_INCd", pathJoin(base,"include_d"))
setenv("IP_LIB4", pathJoin(base,"lib/libip_4.a"))
setenv("IP_LIB8", pathJoin(base,"lib/libip_8.a"))
setenv("IP_LIBd", pathJoin(base,"lib/libip_d.a"))

whatis("Name: ".. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: library")
whatis("Description: " .. pkgName .. " library")
