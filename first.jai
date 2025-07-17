OUTPUT_EXECUTABLE_NAME := "hextrade";
BUILD_OUTPUT_DIRECTORY := "build";

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

  set_build_options(options, w);

  compiler_begin_intercept(w);
  add_build_file("src/main.jai", w);

  while true {
    message := compiler_wait_for_message();
    if message.kind == {
      case .COMPLETE;
        break;
    }
  }
}
