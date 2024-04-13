# Notes
To run the build, will be using the following commands for now: 
cmake -B build 
cmake --build build

You should run `cmake -B build` whenever you change your project `CMakeLists.txt` file (like when
adding a new source file).

# Building Info
You can specify the target with the `--target <program>` option, where the program may be
`inOneWeekend`, `theNextWeek`, `theRestOfYourLife`, or any of the demonstration programs. By default
(with no `--target` option), CMake will build all targets.

    $ cmake --build build --target inOneWeekend

# Optimized Builds
CMake supports Release and Debug configurations. These require slightly different invocations
across Windows (MSVC) and Linux/macOS (using GCC or Clang). The following instructions will place
optimized binaries under `build/Release` and debug binaries (unoptimized and containing debug
symbols) under `build/Debug`:

On Linux / macOS:

```shell
# Configure and build release binaries under `build/Release`
$ cmake -B build/Release -DCMAKE_BUILD_TYPE=Release
$ cmake --build build/Release

# Configure and build debug binaries under `build/Debug`
$ cmake -B build/Debug -DCMAKE_BUILD_TYPE=Debug
$ cmake --build build/Debug
```

If the project is succesfully cloned and built, you can then use the native terminal of your
operating system to simply print the image to file.

# Running The Programs

You can run the programs by executing the binaries placed in the build directory:

    $ build\Debug\inOneWeekend > image.ppm

or, run the optimized version (if you compiled with the release configuration):

    $ build\Release\inOneWeekend > image.ppm

The generated PPM file can be viewed directly as a regular computer image, if your operating system
supports this image type. If your system doesn't handle PPM files, then you should be able to find
PPM file viewers online. We like [ImageMagick][].