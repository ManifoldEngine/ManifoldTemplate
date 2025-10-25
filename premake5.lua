
local locations = require("locations")
local mani = require("Engine.Scripts.mani")

-- your project name here
local projectName = "Template"
local workspaceName = "Manifold"

mani.workspace.setup(workspaceName, projectName)
mani.workspace.includeEngine()

-- Executables
project (projectName)
    location "%{prj.name}"

    files { "%{prj.name}/**.h", "%{prj.name}/**.cpp" }

    links { "Core", "OpenGL", "Camera", "FloatingCamera", "Resources", "RenderAPI", "Inputs", "UI", "Sprite", "Animation", "FMod" }

    includedirs { locations.moduledir .. "/**", "%{prj.name}/Sources" }

    filter "configurations:Debug"
        links { "ManImGui" }

    filter "configurations:Debug"
        kind "ConsoleApp"
    filter "configurations:Release"
        kind "WindowedApp"
    filter "configurations:Distribution"
        kind "WindowedApp"