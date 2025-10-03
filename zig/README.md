# Ludum Dare 58 - Zig + RayLib

This is a Zig implementation using RayLib for the Ludum Dare 58 game jam. This project serves as an alternative implementation approach alongside the Godot version.

## Project Structure

```
zig/
├── src/           # Source code
│   └── main.zig   # Main game entry point with interactive demo
├── lib/           # Third-party libraries
│   └── raylib-zig/ # RayLib bindings for Zig
├── build.zig      # Build configuration
├── build.zig.zon  # Package manifest
└── zig-out/       # Build output (generated)
```

## Requirements

- **Zig 0.14.1** (or compatible 0.14.x version)
- **RayLib** (automatically fetched via raylib-zig)

## Building and Running

### Build the project

```bash
cd zig
zig build
```

The executable will be output to `zig-out/bin/ld58-game`.

### Run the project

```bash
cd zig
zig build run
```

This will build and immediately run the game.

### Build modes

```bash
# Debug build (default)
zig build

# Release with safety checks
zig build -Doptimize=ReleaseSafe

# Fast release build
zig build -Doptimize=ReleaseFast

# Small release build
zig build -Doptimize=ReleaseSmall
```

## Current Features

The current implementation includes:

- **Window Management**: 800x600 game window with proper initialization and cleanup
- **Animation**: Rainbow-colored text bouncing around the screen
- **Visual Effects**: Animated bouncing circle with sine wave movement
- **Input Handling**: ESC key to exit
- **Performance Monitoring**: FPS counter display
- **Game Loop**: 60 FPS target with proper update/draw separation

## Code Organization

### `src/main.zig`

The main game file is heavily commented to help with learning Zig and RayLib:

- **Initialization section**: Window setup and configuration
- **Game variables**: State management for animations
- **Main game loop**: Standard game loop pattern with update and draw phases
- **Update section**: Game logic and state updates (movement, color cycling, physics)
- **Draw section**: All rendering calls

## Learning Resources

### Zig

- [Zig Language Reference](https://ziglang.org/documentation/master/)
- [Zig Learn](https://ziglearn.org/)

### RayLib

- [RayLib Cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)
- [RayLib Examples](https://www.raylib.com/examples.html)
- [raylib-zig GitHub](https://github.com/raylib-zig/raylib-zig)

## Development Tips

### Key Zig Concepts Used

- `defer`: Ensures cleanup code runs when leaving scope (window closing, end drawing)
- `const` vs `var`: Immutable vs mutable variables
- `@import`: Module import system
- Type coercion: `@intFromFloat`, `@floatFromInt`
- Error handling: Functions with `!` can return errors

### RayLib Functions Used

- `initWindow()` / `closeWindow()`: Window lifecycle
- `setTargetFPS()`: Frame rate control
- `windowShouldClose()`: Input handling
- `beginDrawing()` / `endDrawing()`: Render frame
- `clearBackground()`: Clear screen
- `drawText()` / `drawCircle()`: Drawing primitives
- `colorFromHSV()`: Color manipulation
- `getTime()`: Animation timing

## Next Steps for Game Development

1. **Input System**: Add keyboard/mouse input handling
2. **Entity System**: Create player, enemies, and game objects
3. **Game States**: Menu, playing, game over screens
4. **Asset Loading**: Load textures, sounds, and fonts
5. **Physics**: Collision detection and response
6. **Audio**: Background music and sound effects
7. **UI**: HUD, score display, health bars

## Troubleshooting

### Build fails with dependency errors

```bash
# Clean and rebuild
rm -rf zig-cache zig-out
zig build
```

### Window doesn't appear

- Ensure your system supports OpenGL
- Check that no other process is blocking the window
- Try running with different optimize modes

### Performance issues

- Use release builds for better performance: `zig build -Doptimize=ReleaseFast`
- Check FPS counter in-game
- Ensure graphics drivers are up to date
