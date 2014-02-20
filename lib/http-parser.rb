require "ffi"
require "ffi-compiler/loader"

module HTTPParser
  extend FFI::Library

  ffi_lib FFI::Compiler::Loader.find("http_parser")

  attach_function :http_parser_version, [], :ulong
end

require "http-parser/version"
