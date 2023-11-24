# List recipes.
_help:
	just -l

# Run cmake & build CommonLibSSE-NG.
cmake:
	cmake extern/CommonLibSSE-NG

# Build the commonlib dll.
build: cmake
	cmake --build --preset vs2022-windows --config Release

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
