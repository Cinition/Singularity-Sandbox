workspace( "Singularity-Sandbox" )
    architecture "x64"
    configurations { "Debug", "Release", "Publish" }
    startproject "Singularity-Sandbox"

outputdir  = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
VULKAN_ENV = os.getenv("VULKAN_SDK")

include "Singularity"
include "App"