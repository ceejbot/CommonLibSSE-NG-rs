set windows-shell := ["pwsh.exe", "-Command"]
set shell := ["bash", "-uc"]

PRESET := "release-msvc-vcpkg-all"

# List recipes.
_help:
	just -l

# Run cmake & build CommonLibSSE-NG.
cmake:
	cd extern/CommonLibSSE-NG; cmake -G "Visual Studio 17 2022" -B build -S . --preset build-{{PRESET}}

# Build the commonlib dll.
build: cmake
    cd extern/CommonLibSSE-NG; cmake --build build --config Release
    cp extern/CommonLibSSE-NG/build/Release/CommonLibSSE.lib libs

# Build rust bindings.
bindgen: build
	cargo build --release

# Set the crate version and tag the repo to match. Requires bash.
tag VERSION:
    #!/usr/bin/env bash
    set -e
    tomato set package.version {{VERSION}} Cargo.toml
    cargo check
    git commit Cargo.toml Cargo.lock -m "v{{VERSION}}"
    git tag "{{VERSION}}"
    echo "Release tagged for version {{VERSION}}"
