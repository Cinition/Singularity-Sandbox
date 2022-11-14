project "Singularity-Sandbox"

    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    targetdir "bin/%{cfg.buildcfg}"
    staticruntime "off"

    targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")
    
    files { "src/**.h", "src/**.cpp" }

    includedirs
    {
        "../Vendor/imgui",

        --Singularity Includes
        
        "../Singularity/src",
        "../Singularity/Vendors/GLFW/include",
        "../Singularity/Vendors/GLM",
        "%{VULKAN_ENV}/Include",
    }

    include "Vendor/vendor.lua"

    links
    {
        "Singularity",
        "ImGui"
    }


    filter "system:windows"
        systemversion "latest"
        defines { "WL_PLATFORM_WINDOWS" }

    filter "configurations:Debug"
        defines { "WL_DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "WL_RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        kind "WindowedApp"
        defines { "WL_DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"