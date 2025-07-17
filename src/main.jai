#import "Basic";

InitWindow :: (width: s64, height: s64, title: string) #c_call #foreign raylib;

raylib :: #library "../external/raylib-5.5_win64_msvc16/lib/raylib";

WIDTH :: 1280;
HEIGHT :: 720;
TITLE :: "HexTrade";

main :: () {
  print("Hello, HexTrade!\n");

  InitWindow(WIDTH, HEIGHT, TITLE);
}
