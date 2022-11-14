workspace( "Singularity-Sandbox" )
    architecture "x64"
    configurations { "Debug", "Release", "Publish" }
    startproject "Singularity-Sandbox"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Singularity"
include "App"