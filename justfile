# Default: list recipes
default:
    @just --list

# Build the package (result symlink)
build:
    nix build

# Run the config without installing
run *args:
    nix run . -- {{args}}

# Rebuild and install/upgrade the live nvim in the user profile
update-live:
    nix profile upgrade nvim-flake || nix profile add .

# Update flake inputs, then upgrade the live nvim
upgrade: update-inputs update-live

# Update all flake inputs
update-inputs:
    nix flake update

# Update a single flake input, e.g. `just update-input nvf`
update-input input:
    nix flake update {{input}}

# Remove the live nvim from the user profile
uninstall:
    nix profile remove nvim-flake

# Format nix files
fmt:
    nix fmt

# Check formatting and flake validity
check:
    nix fmt -- --check .
    nix flake check

# Print the generated init.lua
print-config:
    nix shell . -c nvf-print-config

# Show what changed in flake.lock
lock-diff:
    git diff flake.lock

# Garbage-collect old nix store paths
gc:
    nix store gc

# Show installed profile entry for this flake
status:
    nix profile list
