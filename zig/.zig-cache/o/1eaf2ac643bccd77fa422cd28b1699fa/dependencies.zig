pub const packages = struct {
    pub const @"N-V-__8AABHMqAWYuRdIlflwi8gksPnlUMQBiSxAqQAAZFms" = struct {
        pub const available = true;
        pub const build_root = "/Users/mrphil/.cache/zig/p/N-V-__8AABHMqAWYuRdIlflwi8gksPnlUMQBiSxAqQAAZFms";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"N-V-__8AAEp9UgBJ2n1eks3_3YZk3GCO1XOENazWaCO7ggM2" = struct {
        pub const build_root = "/Users/mrphil/.cache/zig/p/N-V-__8AAEp9UgBJ2n1eks3_3YZk3GCO1XOENazWaCO7ggM2";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"N-V-__8AAJl1DwBezhYo_VE6f53mPVm00R-Fk28NPW7P14EQ" = struct {
        pub const available = true;
        pub const build_root = "/Users/mrphil/.cache/zig/p/N-V-__8AAJl1DwBezhYo_VE6f53mPVm00R-Fk28NPW7P14EQ";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
    pub const @"lib/raylib-zig" = struct {
        pub const build_root = "/Users/mrphil/Fun/LududDare58/zig/lib/raylib-zig";
        pub const build_zig = @import("lib/raylib-zig");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "raylib", "raylib-5.5.0-whq8uExcNgQBBys4-PIIEqPuWO-MpfOJkwiM4Q1nLXVN" },
            .{ "raygui", "N-V-__8AAEp9UgBJ2n1eks3_3YZk3GCO1XOENazWaCO7ggM2" },
        };
    };
    pub const @"raylib-5.5.0-whq8uExcNgQBBys4-PIIEqPuWO-MpfOJkwiM4Q1nLXVN" = struct {
        pub const build_root = "/Users/mrphil/.cache/zig/p/raylib-5.5.0-whq8uExcNgQBBys4-PIIEqPuWO-MpfOJkwiM4Q1nLXVN";
        pub const build_zig = @import("raylib-5.5.0-whq8uExcNgQBBys4-PIIEqPuWO-MpfOJkwiM4Q1nLXVN");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "xcode_frameworks", "N-V-__8AABHMqAWYuRdIlflwi8gksPnlUMQBiSxAqQAAZFms" },
            .{ "emsdk", "N-V-__8AAJl1DwBezhYo_VE6f53mPVm00R-Fk28NPW7P14EQ" },
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "raylib_zig", "lib/raylib-zig" },
};
