# Using Premake to Generate project files

Hi there!

If you're reading this, you're interested in using [Premake](https://premake.github.io) to generate your project!

Premake is a fairly straightforward tool that you can use to automatically generate Visual Studio projects, CMake projects, Xcode and other projects across multiple platforms.

There's a great little Getting Started document you can read through, but simply put, in order to create a project, you'll want to run the following through a command line:

## Windows

From the same folder as the `premake5.lua` file:

``` ps1
.\Tools\Win\premake5.exe --file=premake5.lua vs2022
```

After this finishes, you will find two new folders have been created at the root of your project: `Solutions` and `Projects`. These folders contain exactly what you would expect, the Visual Studio Solution  (.sln) and the Visual Studio project (.vcxproj).

# OSX

From the same folder as the `premake5.lua` file:

``` bash
./Tools/osx/premake5 --file=premake5.lua xcode4
```

After this command finishes, you will find two new folder have been created at the root of your project: `Solutions` and `Projexts`. You will find the XCode project in the `Solutions` folder.

## ToDo

Add support for cmake.

