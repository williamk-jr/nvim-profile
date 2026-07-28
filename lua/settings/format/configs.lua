return {
  formatter_file_type = {
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
    c = { "clang-format" }
  },
  settings = {
    clang_format = {
      command = "clang-format"
    },
    cmake_format = {
      command = "cmake-format"
    }
  }
}
