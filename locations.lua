local locations = {
    engineName = "Engine",
    binName = "bin",
    bin = _MAIN_SCRIPT_DIR .. "/bin",
    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}",
}

locations.enginedir = _MAIN_SCRIPT_DIR .. "/" .. locations.engineName
locations.moduledir = locations.enginedir .. "/Modules"
locations.thirdpartiesdir = locations.enginedir .. "/ThirdParties"

return locations