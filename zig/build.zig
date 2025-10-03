const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we default to the native target.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const optimize = b.standardOptimizeOption(.{});

    // Import the raylib-zig module
    const raylib_dep = b.dependency("raylib_zig", .{
        .target = target,
        .optimize = optimize,
    });

    // Get the raylib and raylib-zig modules from the dependency
    const raylib = raylib_dep.module("raylib");
    const raylib_artifact = raylib_dep.artifact("raylib");

    // Create the main executable
    const exe = b.addExecutable(.{
        .name = "ld58-game",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Link raylib to the executable
    exe.linkLibrary(raylib_artifact);

    // Add the raylib module to the executable so we can @import("raylib")
    exe.root_module.addImport("raylib", raylib);

    // Install the executable to zig-out/bin/
    b.installArtifact(exe);

    // Create a run step for executing the game
    const run_cmd = b.addRunArtifact(exe);

    // Allow the run step to inherit stdio/stderr so we can see output
    run_cmd.step.dependOn(b.getInstallStep());

    // Forward any command line arguments to the application
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // Create the "run" step that can be invoked with `zig build run`
    const run_step = b.step("run", "Run the game");
    run_step.dependOn(&run_cmd.step);

    // Create a unit test step (for future testing)
    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    // Create the "test" step that can be invoked with `zig build test`
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}
