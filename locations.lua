local locations = {}

locations.outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
locations.enginedir = "%{wks.location}/Engine"
locations.moduledir = locations.enginedir .. "/Modules"
locations.thirdpartiesdir = locations.enginedir .. "/ThirdParties"

return locations