project "yaml-cpp"
    kind "StaticLib"
    language "C++"

	targetdir "../../../bin/%{cfg.buildcfg}/%{prj.name}-%{cfg.system}-%{cfg.buildcfg}"
	objdir "../../../bin-int/%{cfg.buildcfg}/%{prj.name}-%{cfg.system}-%{cfg.buildcfg}"

    files
    {
        "src/**.h",
        "src/**.cpp",

        "include/**.h"
    }

    includedirs
    {
        "include"
    }

    defines
    {
        "YAML_CPP_STATIC_DEFINE"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "Off"
    
    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "Off"

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"