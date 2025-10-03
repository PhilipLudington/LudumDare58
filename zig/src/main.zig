// Import the Zig standard library for basic functionality
const std = @import("std");

// Import the RayLib library for graphics, window management, and input
const rl = @import("raylib");

// Main entry point of the application
pub fn main() !void {
    // ===== Window Initialization =====
    // Set the initial window size
    const screen_width = 800;
    const screen_height = 600;

    // Initialize the window with a title
    // This creates the window but doesn't show it yet
    rl.initWindow(screen_width, screen_height, "Ludum Dare 58 - Zig + RayLib Hello World");

    // Ensure the window is properly closed when the program exits
    defer rl.closeWindow();

    // Set the target frames per second (FPS) for smooth animation
    // 60 FPS is standard for most games
    rl.setTargetFPS(60);

    // ===== Game Variables =====
    // Position for our animated text
    var text_x: f32 = 50.0;
    var text_y: f32 = 250.0;

    // Velocity for text movement
    var velocity_x: f32 = 2.0;
    var velocity_y: f32 = 1.5;

    // Color animation variables
    var hue: f32 = 0.0;

    // ===== Main Game Loop =====
    // This loop runs every frame until the window is closed
    // windowShouldClose() returns true when user clicks X or presses ESC
    while (!rl.windowShouldClose()) {
        // ----- Update Section -----
        // This is where game logic and state updates happen

        // Update text position
        text_x += velocity_x;
        text_y += velocity_y;

        // Bounce text off window edges (screen wrapping)
        if (text_x <= 0 or text_x >= screen_width - 300) {
            velocity_x = -velocity_x;
        }
        if (text_y <= 0 or text_y >= screen_height - 60) {
            velocity_y = -velocity_y;
        }

        // Update color animation (cycle through hues)
        hue += 1.0;
        if (hue >= 360.0) {
            hue = 0.0;
        }

        // Convert HSV to RGB for rainbow effect
        // RayLib uses RGB colors, so we create a cycling rainbow
        const color = rl.colorFromHSV(hue, 0.8, 0.9);

        // ----- Draw Section -----
        // Everything between beginDrawing() and endDrawing() is rendered to screen
        rl.beginDrawing();
        defer rl.endDrawing(); // Automatically called at end of scope

        // Clear the background with a dark color
        rl.clearBackground(rl.Color.init(20, 20, 30, 255));

        // Draw the main animated text
        rl.drawText(
            "Hello, Ludum Dare 58!",
            @intFromFloat(text_x),
            @intFromFloat(text_y),
            40,
            color
        );

        // Draw instructions
        rl.drawText(
            "Press ESC to exit",
            10,
            screen_height - 30,
            20,
            rl.Color.light_gray
        );

        // Draw FPS counter (useful for performance monitoring)
        rl.drawFPS(10, 10);

        // Draw a simple bouncing circle for visual interest
        const circle_x = @as(f32, @floatFromInt(screen_width)) / 2.0;
        const circle_y = 450.0 + @sin(rl.getTime() * 3.0) * 30.0;
        rl.drawCircle(
            @intFromFloat(circle_x),
            @intFromFloat(circle_y),
            20.0,
            rl.Color.init(100, 200, 255, 200)
        );
    }
}
