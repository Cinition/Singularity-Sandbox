project "Singularity-Sandbox"

    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    targetdir "bin/%{cfg.buildcfg}"
    staticruntime "off"

    targetdir ("../Bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../Bin-Int/" .. outputdir .. "/%{prj.name}")
    
    files { 
        "Src/**.h",
        "Src/**.cpp",
    }

    includedirs {

        --Singularity Includes

        "../Singularity/Src",
        "../Singularity/Vendor/GLFW/include",
        "../Singularity/Vendor/imgui",
        "../Singularity/Vendor/GLM",
        "%{VULKAN_ENV}/Include",
    }

    links {
        "Singularity",
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

    filter "configurations:Publish"
        kind "WindowedApp"
        defines { "WL_DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"