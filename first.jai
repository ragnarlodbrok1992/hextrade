OUTPUT_EXECUTABLE_NAME := "hextrade";
BUILD_OUTPUT_DIRECTORY := "build/";
RAYLIB_LIBRARY_PATH := "external/raylib-5.5_win64_msvc16/lib/raylibdll.lib";
RAYLIB_DLL_PATH := "external/raylib-5.5_win64_msvc16/lib/raylib.dll";

#import "Basic";
#import "Compiler";
#import "File";
#import "File_Utilities";

#run {
  set_build_options_dc(.{do_output = false});

  // Do not need arguments for now.
  //args := get_build_options().compile_time_command_line;

  make_directory_if_it_does_not_exist(BUILD_OUTPUT_DIRECTORY, recursive = true);

  w := compiler_create_workspace("Target workspace");
  options := get_build_options(w);
  copy_commonly_propagated_fields(get_build_options(), *options);

  options.output_path = BUILD_OUTPUT_DIRECTORY;
  options.output_executable_name = OUTPUT_EXECUTABLE_NAME;
  options.additional_linker_arguments = .[RAYLIB_LIBRARY_PATH];

  set_build_options(options, w);

  compiler_begin_intercept(w);
  add_build_file("src/main.jai", w);

  // Copy raylib DLL to the build output directory.
  copy_file(RAYLIB_DLL_PATH, tprint("%/raylib.dll", BUILD_OUTPUT_DIRECTORY));

  while true {
    message := compiler_wait_for_message();
    if message.kind == {
      case .COMPLETE;
        break;
    }
  }
}
