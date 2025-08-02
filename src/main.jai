#import "Basic";
#import "Math";

raylib :: #library "../external/raylib-5.5_win64_msvc16/lib/raylib";

// Some enums
KeyboardKey :: enum s32 {
    KEY_NULL            :: 0;        // Key: NULL, used for no key pressed
    // Alphanumeric keys
    KEY_APOSTROPHE      :: 39;       // Key: '
    KEY_COMMA           :: 44;       // Key: ,
    KEY_MINUS           :: 45;       // Key: -
    KEY_PERIOD          :: 46;       // Key: .
    KEY_SLASH           :: 47;       // Key: /
    KEY_ZERO            :: 48;       // Key: 0
    KEY_ONE             :: 49;       // Key: 1
    KEY_TWO             :: 50;       // Key: 2
    KEY_THREE           :: 51;       // Key: 3
    KEY_FOUR            :: 52;       // Key: 4
    KEY_FIVE            :: 53;       // Key: 5
    KEY_SIX             :: 54;       // Key: 6
    KEY_SEVEN           :: 55;       // Key: 7
    KEY_EIGHT           :: 56;       // Key: 8
    KEY_NINE            :: 57;       // Key: 9
    KEY_SEMICOLON       :: 59;       // Key: ;
    KEY_EQUAL           :: 61;       // Key: =
    KEY_A               :: 65;       // Key: A | a
    KEY_B               :: 66;       // Key: B | b
    KEY_C               :: 67;       // Key: C | c
    KEY_D               :: 68;       // Key: D | d
    KEY_E               :: 69;       // Key: E | e
    KEY_F               :: 70;       // Key: F | f
    KEY_G               :: 71;       // Key: G | g
    KEY_H               :: 72;       // Key: H | h
    KEY_I               :: 73;       // Key: I | i
    KEY_J               :: 74;       // Key: J | j
    KEY_K               :: 75;       // Key: K | k
    KEY_L               :: 76;       // Key: L | l
    KEY_M               :: 77;       // Key: M | m
    KEY_N               :: 78;       // Key: N | n
    KEY_O               :: 79;       // Key: O | o
    KEY_P               :: 80;       // Key: P | p
    KEY_Q               :: 81;       // Key: Q | q
    KEY_R               :: 82;       // Key: R | r
    KEY_S               :: 83;       // Key: S | s
    KEY_T               :: 84;       // Key: T | t
    KEY_U               :: 85;       // Key: U | u
    KEY_V               :: 86;       // Key: V | v
    KEY_W               :: 87;       // Key: W | w
    KEY_X               :: 88;       // Key: X | x
    KEY_Y               :: 89;       // Key: Y | y
    KEY_Z               :: 90;       // Key: Z | z
    KEY_LEFT_BRACKET    :: 91;       // Key: [
    KEY_BACKSLASH       :: 92;       // Key: '\'
    KEY_RIGHT_BRACKET   :: 93;       // Key: ]
    KEY_GRAVE           :: 96;       // Key: `
    // Function keys
    KEY_SPACE           :: 32;       // Key: Space
    KEY_ESCAPE          :: 256;      // Key: Esc
    KEY_ENTER           :: 257;      // Key: Enter
    KEY_TAB             :: 258;      // Key: Tab
    KEY_BACKSPACE       :: 259;      // Key: Backspace
    KEY_INSERT          :: 260;      // Key: Ins
    KEY_DELETE          :: 261;      // Key: Del
    KEY_RIGHT           :: 262;      // Key: Cursor right
    KEY_LEFT            :: 263;      // Key: Cursor left
    KEY_DOWN            :: 264;      // Key: Cursor down
    KEY_UP              :: 265;      // Key: Cursor up
    KEY_PAGE_UP         :: 266;      // Key: Page up
    KEY_PAGE_DOWN       :: 267;      // Key: Page down
    KEY_HOME            :: 268;      // Key: Home
    KEY_END             :: 269;      // Key: End
    KEY_CAPS_LOCK       :: 280;      // Key: Caps lock
    KEY_SCROLL_LOCK     :: 281;      // Key: Scroll down
    KEY_NUM_LOCK        :: 282;      // Key: Num lock
    KEY_PRINT_SCREEN    :: 283;      // Key: Print screen
    KEY_PAUSE           :: 284;      // Key: Pause
    KEY_F1              :: 290;      // Key: F1
    KEY_F2              :: 291;      // Key: F2
    KEY_F3              :: 292;      // Key: F3
    KEY_F4              :: 293;      // Key: F4
    KEY_F5              :: 294;      // Key: F5
    KEY_F6              :: 295;      // Key: F6
    KEY_F7              :: 296;      // Key: F7
    KEY_F8              :: 297;      // Key: F8
    KEY_F9              :: 298;      // Key: F9
    KEY_F10             :: 299;      // Key: F10
    KEY_F11             :: 300;      // Key: F11
    KEY_F12             :: 301;      // Key: F12
    KEY_LEFT_SHIFT      :: 340;      // Key: Shift left
    KEY_LEFT_CONTROL    :: 341;      // Key: Control left
    KEY_LEFT_ALT        :: 342;      // Key: Alt left
    KEY_LEFT_SUPER      :: 343;      // Key: Super left
    KEY_RIGHT_SHIFT     :: 344;      // Key: Shift right
    KEY_RIGHT_CONTROL   :: 345;      // Key: Control right
    KEY_RIGHT_ALT       :: 346;      // Key: Alt right
    KEY_RIGHT_SUPER     :: 347;      // Key: Super right
    KEY_KB_MENU         :: 348;      // Key: KB menu
    // Keypad keys
    KEY_KP_0            :: 320;      // Key: Keypad 0
    KEY_KP_1            :: 321;      // Key: Keypad 1
    KEY_KP_2            :: 322;      // Key: Keypad 2
    KEY_KP_3            :: 323;      // Key: Keypad 3
    KEY_KP_4            :: 324;      // Key: Keypad 4
    KEY_KP_5            :: 325;      // Key: Keypad 5
    KEY_KP_6            :: 326;      // Key: Keypad 6
    KEY_KP_7            :: 327;      // Key: Keypad 7
    KEY_KP_8            :: 328;      // Key: Keypad 8
    KEY_KP_9            :: 329;      // Key: Keypad 9
    KEY_KP_DECIMAL      :: 330;      // Key: Keypad .
    KEY_KP_DIVIDE       :: 331;      // Key: Keypad /
    KEY_KP_MULTIPLY     :: 332;      // Key: Keypad *
    KEY_KP_SUBTRACT     :: 333;      // Key: Keypad -
    KEY_KP_ADD          :: 334;      // Key: Keypad +
    KEY_KP_ENTER        :: 335;      // Key: Keypad Enter
    KEY_KP_EQUAL        :: 336;      // Key: Keypad =
    // Android key buttons
    KEY_BACK            :: 4;        // Key: Android back button
    KEY_MENU            :: 5;        // Key: Android menu button
    KEY_VOLUME_UP       :: 24;       // Key: Android volume up button
    KEY_VOLUME_DOWN     :: 25;        // Key: Android volume down button
}

// Mouse buttons
MouseButton :: enum s32 {
    MOUSE_BUTTON_LEFT    :: 0;  // Mouse left button
    MOUSE_BUTTON_RIGHT   :: 1;  // Mouse right button
    MOUSE_BUTTON_MIDDLE  :: 2;  // Mouse middle button (pressed)
    MOUSE_BUTTON_SIDE    :: 3;  // Mouse side button
    MOUSE_BUTTON_EXTRA   :: 4;  // Mouse extra button
    MOUSE_BUTTON_FORWARD :: 5; // Mouse forward button
    MOUSE_BUTTON_BACK    :: 6;  // Mouse back button
}

MOUSE_LEFT_BUTTON   :: MouseButton.MOUSE_BUTTON_LEFT;
MOUSE_RIGHT_BUTTON  :: MouseButton.MOUSE_BUTTON_RIGHT;
MOUSE_MIDDLE_BUTTON :: MouseButton.MOUSE_BUTTON_MIDDLE;

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
InitWindow :: (width: s64, height: s64, title: *u8) #c_call #foreign raylib;
SetTargetFPS :: (fps: s64) #c_call #foreign raylib;
WindowShouldClose :: () -> bool #c_call #foreign raylib;
CloseWindow :: () #c_call #foreign raylib;

BeginDrawing :: () #c_call #foreign raylib;
EndDrawing :: () #c_call #foreign raylib;

BeginMode3D :: (camera: Camera3D) #c_call #foreign raylib;
EndMode3D :: () #c_call #foreign raylib;

UpdateCamera :: (camera: *Camera3D, mode: CameraMode) #c_call #foreign raylib;
UpdateCameraPro :: (camera: *Camera3D, movement: Vector3, rotation: Vector3, zoom: float) #c_call #foreign raylib;

ClearBackground :: (color: Color) #c_call #foreign raylib;

DrawCube :: (position: Vector3, width: float, height: float, length: float, color: Color) #c_call #foreign raylib;
DrawCubeWires :: (position: Vector3, width: float, height: float, length: float, color: Color) #c_call #foreign raylib;
DrawGrid :: (slices: s32, spacing: float) #c_call #foreign raylib;

HideCursor :: () #c_call #foreign raylib;
ShowCursor :: () #c_call #foreign raylib;

// Mouse related functions bindings

IsKeyPressed :: (key: KeyboardKey) -> bool #c_call #foreign raylib;
IsKeyReleased :: (key: KeyboardKey) -> bool #c_call #foreign raylib;
IsMouseButtonDown :: (button: MouseButton) -> bool #c_call #foreign raylib;
IsMouseButtonReleased :: (button: MouseButton) -> bool #c_call #foreign raylib;

GetMousePosition :: () -> Vector2 #c_call #foreign raylib;
GetMouseDelta :: () -> Vector2 #c_call #foreign raylib;

LoadFont :: (file_name: *u8) -> Font #c_call #foreign raylib;
LoadFontEx :: (file_name: *u8, font_size: s64, chars: *s64, chars_count: s64) -> Font #c_call #foreign raylib;
UnloadFont :: (font: Font) #c_call #foreign raylib;

DrawText :: (text: *u8, pos_x: s64, pos_y: s64, font_size: s64, color: Color) #c_call #foreign raylib;
DrawTextEx :: (font: Font, text: *u8, position: Vector2, font_size: float, spacing: float, tint: Color) #c_call #foreign raylib;
MeasureTextEx :: (font: Font, text: *u8, font_size: float, spacing: float) -> Vector2 #c_call #foreign raylib;

CameraMode :: enum s32 {
  CAMERA_CUSTOM :: 0;
  CAMERA_FREE;
  CAMERA_ORBITAL;
  CAMERA_FIRST_PERSON;
  CAMERA_THIRD_PERSON;
};

CameraProjection :: enum s32 {
  CAMERA_PERSPECTIVE :: 0;
  CAMERA_ORTHOGRAPHIC;
};

Camera3D :: struct {
  position, target, up: Vector3;
  fovy: float;
  projections: CameraProjection;
};

// Main background color
RAYWHITE : Color = .{245, 245, 245, 255};

// Some constant colors
DARKGRAY : Color = .{80, 80, 80, 255};
BLACK : Color = .{0, 0, 0, 255};
RED : Color = .{255, 0, 0, 255};
MAROON : Color = .{128, 0, 0, 255};
PURPLE : Color = .{128, 0, 128, 255};

WIDTH :: 1280;
HEIGHT :: 720;
TITLE :: "HexTrade";
WELCOME_TEXT :: "Welcome to HexTrade!";

Vec3Normalize :: (v: Vector3) -> Vector3 {
  len: float = sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
  if len == 0.0 return .{0.0, 0.0, 0.0};
  return .{v.x / len, v.y / len, v.z / len};
}

Vec3Subtract :: (a: Vector3, b: Vector3) -> Vector3 {
  return .{a.x - b.x, a.y - b.y, a.z - b.z};
}

main :: () {
  print("Hello, HexTrade!\n");

  // Allocations of strings
  // welcome_text: *u8 = to_c_string(WELCOME_TEXT);

  InitWindow(WIDTH, HEIGHT, TITLE.data);
  defer CloseWindow();

  // Changing font in raylib
  // TODO: check how paths are read from binary
  new_font: Font = LoadFontEx("external/assets/fonts/Merriweather_Sans/static/MerriweatherSans-Bold.ttf", 32, null, 255);
  defer UnloadFont(new_font); // Free the font if necessary
  font_size: float = cast(float) new_font.base_size;
  new_font_position: Vector2 = .{
    // x = WIDTH / 2.0 - MeasureTextEx(new_font, welcome_text, cast(float) new_font.base_size, 0).x / 2.0,
    // y = HEIGHT / 2.0 - new_font.base_size / 2.0,
    x = 10.0,
    y = 10.0,
  };

  camera : Camera3D = .{
    position = .{10.0, 10.0, 10.0},
    target = .{0.0, 0.0, 0.0},
    up = .{0.0, 1.0, 0.0},
    fovy = 45.0,
    projections = .CAMERA_PERSPECTIVE,
  };

  // TODO: move it to some struct
  camera_movement : Vector3 = .{0.0, 0.0, 0.0};
  camera_rotation : Vector3 = .{0.0, 0.0, 0.0};
  camera_zoom : float = 0.0;

  hello_world_cube: Vector3 = .{0.0, 0.0, 0.0};

  SetTargetFPS(60);

  while !WindowShouldClose() {
    // Input checking

    // Get camera front vector
    camera_front : Vector3 = Vec3Normalize(Vec3Subtract(camera.target, camera.position));
    DrawTextEx(new_font, sprint("Camera front: %, %, %", camera_front.x, camera_front.y, camera_front.z).data,
      .{10.0, HEIGHT - 90.0}, font_size, 0, DARKGRAY);
    DrawTextEx(new_font, sprint("Camera position: %, %, %", camera.position.x, camera.position.y, camera.position.z).data,
      .{10.0, HEIGHT - 120.0}, font_size, 0, DARKGRAY);
    DrawTextEx(new_font, sprint("Camera target: %, %, %", camera.target.x, camera.target.y, camera.target.z).data,
      .{10.0, HEIGHT - 150.0}, font_size, 0, DARKGRAY);

    // Keyboard input
    if IsKeyPressed(.KEY_H) HideCursor();
    if IsKeyReleased(.KEY_H) ShowCursor();

    // Check for qweasd keys to move the camera
    if IsKeyPressed(.KEY_Q) camera_movement.z = 0.1;
    if IsKeyPressed(.KEY_E) camera_movement.z = -0.1;
    if IsKeyPressed(.KEY_W) camera_movement.x = 0.1;
    if IsKeyPressed(.KEY_S) camera_movement.x = -0.1;
    if IsKeyPressed(.KEY_A) camera_movement.y = -0.1;
    if IsKeyPressed(.KEY_D) camera_movement.y = 0.1;

    // Check for those keys released
    if IsKeyReleased(.KEY_Q) camera_movement.z = 0.0;
    if IsKeyReleased(.KEY_E) camera_movement.z = 0.0;
    if IsKeyReleased(.KEY_W) camera_movement.x = 0.0;
    if IsKeyReleased(.KEY_S) camera_movement.x = 0.0;
    if IsKeyReleased(.KEY_A) camera_movement.y = 0.0;
    if IsKeyReleased(.KEY_D) camera_movement.y = 0.0;

    // Check for arrow keys to rotate the camera
    if IsKeyPressed(.KEY_LEFT) camera_rotation.x = -1.0;
    if IsKeyPressed(.KEY_RIGHT) camera_rotation.x = 1.0;
    if IsKeyPressed(.KEY_UP) camera_rotation.y = -1.0;
    if IsKeyPressed(.KEY_DOWN) camera_rotation.y = 1.0;

    // Check for those keys released
    if IsKeyReleased(.KEY_LEFT) camera_rotation.x = 0.0;
    if IsKeyReleased(.KEY_RIGHT) camera_rotation.x = 0.0;
    if IsKeyReleased(.KEY_UP) camera_rotation.y = 0.0;
    if IsKeyReleased(.KEY_DOWN) camera_rotation.y = 0.0;


    // Mouse input
    if IsMouseButtonDown(MOUSE_LEFT_BUTTON) {
      HideCursor();
      // Get mouse position and delta TODO: see how they behave
      mouse_position : Vector2 = GetMousePosition();
      mouse_delta : Vector2 = GetMouseDelta();

      mouse_position_string := sprint("Mouse position: %, %", mouse_position.x, mouse_position.y);
      mouse_delta_string := sprint("Mouse delta: %, %", mouse_delta.x, mouse_delta.y);
      mouse_text_position_vector : Vector2 = .{10, HEIGHT - 30};
      mouse_text_delta_vector : Vector2 = .{10, HEIGHT - 60};

      // Draw the mouse position on the screen bottom left corner
      DrawTextEx(new_font, mouse_position_string.data, mouse_text_position_vector, 20, 0, DARKGRAY);
      DrawTextEx(new_font, mouse_delta_string.data, mouse_text_delta_vector, 20, 0, DARKGRAY);

    }
    else if IsMouseButtonReleased(MOUSE_LEFT_BUTTON)  {
      ShowCursor();
      // Reset camera movement and rotation when mouse button is released
      camera_movement = .{0.0, 0.0, 0.0};
      camera_rotation = .{0.0, 0.0, 0.0};
    }

    UpdateCameraPro(*camera, camera_movement, camera_rotation, camera_zoom);

    {
      BeginDrawing();
      defer EndDrawing();
      ClearBackground(RAYWHITE);

      {
        BeginMode3D(camera);
        defer EndMode3D();
        // 3D rendering code goes here

        // DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, RED);
        // DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, MAROON);
        // DrawGrid(10, 1.0f);

        DrawCube(hello_world_cube, 1.5, 1.5, 1.5, RED);
        DrawCubeWires(hello_world_cube, 1.5, 1.5, 1.5, MAROON);
        DrawGrid(100, 1.0);
      }
      // Rendering 2D stuff

      // Here you would normally draw your game content.
      // For now, we just clear the screen with a white background.

      DrawTextEx(new_font, WELCOME_TEXT.data, new_font_position,
      font_size, 0, DARKGRAY);
    }
  } // End of main loop
}
