# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Ludum Dare 58 game jam entry project using Godot Engine 4.4. The project is currently in its initial setup phase with a basic Godot project structure.

## Project Structure

- `godot/` - Contains the Godot game project
  - `project.godot` - Main Godot project configuration file
  - `.godot/` - Godot engine-generated files (ignored in git)
  - Game scenes (.tscn), scripts (.gd), and resources (.tres) will be added here as the project develops

## Development Commands

### Running the Game
```bash
cd godot
godot --path .
```

Or to run the project directly:
```bash
godot --path godot/
```

### Opening the Godot Editor
```bash
godot --path godot/ --editor
```

### Exporting the Game
```bash
godot --path godot/ --export-release <preset_name> <output_path>
```

## Technical Details

- **Engine**: Godot 4.4
- **Rendering**: GL Compatibility mode (for broader hardware support)
- **Language**: GDScript (Godot's native scripting language)

## Godot Project Notes

- Game scripts use GDScript (`.gd` files) - a Python-like language specific to Godot
- Scenes are stored in `.tscn` files (text-based scene format)
- Resources use `.tres` files (text-based resource format)
- The `.godot/` directory is auto-generated and should not be edited manually
- Asset imports are configured via `.import` files generated automatically by Godot
