#import "Basic";
#import "Math";

raylib :: #library "../external/raylib-5.5_win64_msvc16/lib/raylib";

// Foreign types
Color :: struct {
  r, g, b, a: u8;
};

PixelFormat :: enum s32 {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE :: 1; // 8 bit per pixel (no alpha)
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA;    // 8*2 bpp (2 channels)
    PIXELFORMAT_UNCOMPRESSED_R5G6B5;        // 16 bpp
    PIXELFORMAT_UNCOMPRESSED_R8G8B8;        // 24 bpp
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1;      // 16 bpp (1 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4;      // 16 bpp (4 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;      // 32 bpp
    PIXELFORMAT_UNCOMPRESSED_R32;           // 32 bpp (1 channel - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32;     // 32*3 bpp (3 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32;  // 32*4 bpp (4 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R16;           // 16 bpp (1 channel - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16;     // 16*3 bpp (3 channels - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16;  // 16*4 bpp (4 channels - half float)
    PIXELFORMAT_COMPRESSED_DXT1_RGB;        // 4 bpp (no alpha)
    PIXELFORMAT_COMPRESSED_DXT1_RGBA;       // 4 bpp (1 bit alpha)
    PIXELFORMAT_COMPRESSED_DXT3_RGBA;       // 8 bpp
    PIXELFORMAT_COMPRESSED_DXT5_RGBA;       // 8 bpp
    PIXELFORMAT_COMPRESSED_ETC1_RGB;        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_RGB;        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA;   // 8 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGB;        // 4 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGBA;       // 4 bpp
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA;   // 8 bpp
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA;    // 2 bpp
}

Texture :: struct {
    id: u32; // Texture ID
    width, height, mipmaps: s32;
    format: PixelFormat;
};

Texture2D :: Texture;

Rectangle :: struct {
    x, y, width, height: float;
};

Image :: struct {
    data: *void;
    width, height, mipmaps: s32;
    format: PixelFormat;
};

GlyphInfo :: struct {
    value, offset_x, offset_y, advance_x: s32;
    image: Image;
};

Font :: struct {
    base_size, glyph_count, glyph_padding: s32;
    texture: Texture2D; // Texture containing the font glyphs
    recs: *Rectangle; // Array of rectangles for each glyph
    glyphs: *GlyphInfo; // Array of glyph information
};

// Foreign function declarations
InitWindow :: (width: s64, height: s64, title: string) #c_call #foreign raylib;
SetTargetFPS :: (fps: s64) #c_call #foreign raylib;
WindowShouldClose :: () -> bool #c_call #foreign raylib;
CloseWindow :: () #c_call #foreign raylib;
BeginDrawing :: () #c_call #foreign raylib;
EndDrawing :: () #c_call #foreign raylib;
ClearBackground :: (color: Color) #c_call #foreign raylib;
DrawText :: (text: *u8, pos_x: s64, pos_y: s64, font_size: s64, color: Color) #c_call #foreign raylib;
DrawTextEx :: (font: Font, text: *u8, position: Vector2, font_size: float, spacing: float, tint: Color) #c_call #foreign raylib;
LoadFont :: (file_name: *u8) -> Font #c_call #foreign raylib;
LoadFontEx :: (file_name: *u8, font_size: s64, chars: *s64, chars_count: s64) -> Font #c_call #foreign raylib;
UnloadFont :: (font: Font) #c_call #foreign raylib;
MeasureTextEx :: (font: Font, text: *u8, font_size: float, spacing: float) -> Vector2 #c_call #foreign raylib;

// Main background color
RAYWHITE : Color = .{245, 245, 245, 255};

// Some constant colors
DARKGRAY : Color = .{80, 80, 80, 255};
BLACK : Color = .{0, 0, 0, 255};

WIDTH :: 1280;
HEIGHT :: 720;
TITLE :: "HexTrade";
WELCOME_TEXT :: "Welcome to HexTrade!";

main :: () {
  print("Hello, HexTrade!\n");

  // Allocations of strings
  welcome_text: *u8 = to_c_string(WELCOME_TEXT);

  InitWindow(WIDTH, HEIGHT, TITLE);
  defer CloseWindow();

  // Changing font in raylib
  // TODO: check how paths are read from binary
  new_font: Font = LoadFontEx("external/assets/fonts/Merriweather_Sans/static/MerriweatherSans-Bold.ttf", 32, null, 255);
  defer UnloadFont(new_font); // Free the font if necessary
  font_size: float = cast(float) new_font.base_size;
  new_font_position: Vector2 = .{
    x = WIDTH / 2.0 - MeasureTextEx(new_font, welcome_text, cast(float) new_font.base_size, 0).x / 2.0,
    y = HEIGHT / 2.0 - new_font.base_size / 2.0,
  };

  SetTargetFPS(60);

  while !WindowShouldClose() {
    BeginDrawing();
    defer EndDrawing();
    {
      ClearBackground(RAYWHITE);

      // Here you would normally draw your game content.
      // For now, we just clear the screen with a white background.

      // DrawText(welcome_text, 10, 10, 20, DARKGRAY);
      DrawTextEx(new_font, welcome_text, new_font_position,
      font_size, 2, BLACK);
    }
  } // End of main loop
}
