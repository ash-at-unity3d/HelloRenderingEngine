workspace "HelloRenderingEngine"
  configurations {"Debug", "Release"}
  platforms { "Win64", "macosx" }
  location "../Solutions"

project "Demo"
  kind "ConsoleApp"
  location "../Projects"
  language "C++"
  targetdir "../bin/%{cfg.buildcfg}"
  objdir ("../bin-int/%{cfg.buildcfg}/%{prj.name}")

  includedirs {"../dependencies/glfw/include", "glfw"}
  libdirs {"../bin/%{cfg.buildcfg}"}

  files {"../Demo/**.h", "../Demo/**.c", "../Demo/**.cpp"}

  links {"glad", "glfw"}

  filter "configurations:Debug"
    defines { "Debug" }
    symbols "On"

  filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "On"

  filter "system:macosx"
    links {"OpenGL.framework","Cocoa.framework", "IOKit.framework", "CoreVideo.framework", "QuartzCore.framework"}

project "Glad"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    location "../Projects"

    targetdir ("../libs/%{cfg.buildcfg}")
    objdir ("../bin-int/%{cfg.buildcfg}/%{prj.name}")

    files {
        "../dependencies/glad/include/glad/glad.h",
        "../dependencies/glad/include/KHR/khrplatform.h",
        "../dependencies/glad/OpenGL/src/gl.c"
    }


    filter "system:windows"
      includedirs { "../dependencies/glad/OpenGL/include" }
      systemversion "latest"

    filter "system:macosx"
      externalincludedirs { "../dependencies/glad/OpenGL/include" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    location "../Projects"
    targetdir ("../libs/%{cfg.buildcfg}")
    objdir ("../bin-int/%{cfg.buildcfg}/%{prj.name}")

    files {
        "../dependencies/glfw/include/GLFW",
        "../dependencies/glfw/src/*"
    }

    filter "system:windows"
      includedirs { "../dependencies/glfw/include" }
      systemversion "latest"

    filter "system:macosx"
      externalincludedirs { "../dependencies/glfw/include" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "platforms:Win64"
      defines {"_GLFW_WIN32"}

    filter "platforms:macosx"
      defines {"_GLFW_COCOA"}
