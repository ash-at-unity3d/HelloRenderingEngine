workspace "HelloRenderingEngine"
  configurations {"Debug", "Release"}
  platforms { "Win64" }
  location "../Solutions"

project "Demo"
  kind "ConsoleApp"
  location "../Projects"
  language "C++"
  targetdir "../bin/%{cfg.buildcfg}"

  files {"../Demo/**.h", "../Demo/**.c", "../Demo/**.cpp"}

  filter "configurations:Debug"
    defines { "Debug" }
    symbols "On"

  filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "On"
