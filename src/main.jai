#import "Basic";

raylib :: #library "../external/raylib-5.5_win64_msvc16/lib/raylib";

// Foreign types
Color :: struct {r, g, b, a: u8; };

// Foreign function declarations
InitWindow :: (width: s64, height: s64, title: string) #c_call #foreign raylib;
SetTargetFPS :: (fps: s64) #c_call #foreign raylib;
WindowShouldClose :: () -> bool #c_call #foreign raylib;
CloseWindow :: () #c_call #foreign raylib;
BeginDrawing :: () #c_call #foreign raylib;
EndDrawing :: () #c_call #foreign raylib;
ClearBackground :: (color: Color) #c_call #foreign raylib;

RAYWHITE : Color = .{245, 245, 245, 255};

WIDTH :: 1280;
HEIGHT :: 720;
TITLE :: "HexTrade";

main :: () {
  print("Hello, HexTrade!\n");

  InitWindow(WIDTH, HEIGHT, TITLE);

  SetTargetFPS(60);

  while !WindowShouldClose() {
    BeginDrawing();
    {
      ClearBackground(RAYWHITE);

      // Here you would normally draw your game content.
      // For now, we just clear the screen with a white background.
    }
    EndDrawing();
  } // End of main loop
  CloseWindow();
}
