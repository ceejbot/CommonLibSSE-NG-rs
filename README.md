# CommonLibSSE-NG-rs

An experiment in using [bindgen](https://lib.rs/crates/bindgen) to generate not-necessarily-safe Rust bindings for [CommonLibSSE-NG](https://github.com/CharmedBaryon/CommonLibSSE-NG), the Skyrim reverse-engineered library.

This project is intended as a learning project for me, though I might end up using it in mod projects if it works out.

Requires the following:

- [Rust](https://rustup.rs) set up for Windows (not for WSL)
- [Visual Studio 2022](https://visualstudio.microsoft.com) with C++ compilers installed
- [CMake](https://cmake.org)
- [vcpkg](https://github.com/microsoft/vcpkg) with `VCPKG_ROOT` set in a user environment variable
- [LLVM](https://github.com/llvm/llvm-project/releases) installed from an official release.

Run `just bindgen` to build if you have [just](https://just.systems) installed. Otherwise look at what just does and run those commands in a pwsh 7 shell.

The license will end up being whatever CommonLibSSE-NG's license is.
