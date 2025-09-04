include "locations.lua"
include "Engine/Scripts/Build/buildwebgl.lua"

workspace "Manifold"

configurations { "Debug", "Release", "Distribution" }
    platforms { "Win64", "WebGL" }
    startproject "Sandbox"
    language "C++"
    cppdialect "C++20"
    flags { "MultiProcessorCompile" }
    targetdir ("bin/" .. outputdir)
    objdir ("bin-int/" .. outputdir)

    -- ManiMaths
    includedirs { thirdpartiesdir .. "/ManiMaths/include" }
    -- ManiTests
    includedirs { thirdpartiesdir .. "/ManiTests/include" }
    -- ManiZ
    includedirs { thirdpartiesdir .. "/ManiZ/include"}
    
    filter "configurations:Debug"
        defines { "MANI_DEBUG", "MANI_CONSOLE_APP" }
        defines { "MANI_PROJECTROOT_PATH=\"".. _MAIN_SCRIPT_DIR .. "\"" }
        symbols "On"
    
    filter "configurations:Release"
        defines { "MANI_RELEASE" }
        defines { "MANI_PROJECTROOT_PATH=\"".. _MAIN_SCRIPT_DIR .. "\"" }
        optimize "On"

    filter "configurations:Distribution"
        defines { "MANI_DISTRIBUTION" }
        optimize "On"

    filter "platforms:Win64"
        architecture "x64"
        system "windows"

    filter "platforms:WebGL"
        defines { "MANI_WEBGL" }
        linkoptions { "-sUSE_GLFW=3", "-sMAX_WEBGL_VERSION=2" }
        system "windows"
        
    filter "system:windows"
        defines { "MANI_WINDOWS" }

    filter "kind:ConsoleApp"
        defines { "MANI_CONSOLE_APP" }

group "Engine"
    include "Engine"
group ""

-- Executables
project "Template"
    location "%{prj.name}"

    files { "%{prj.name}/**.h", "%{prj.name}/**.cpp" }

    links { "Core", "OpenGL", "Camera", "FloatingCamera", "Resources", "RenderAPI", "Inputs" }

    includedirs { moduledir .. "/**", "%{prj.name}/Sources" }

    filter "configurations:Debug"
        links { "ManImGui" }

    filter "configurations:Debug"
        kind "ConsoleApp"
    filter "configurations:Release"
        kind "WindowedApp"
    filter "configurations:Distribution"
        kind "WindowedApp"