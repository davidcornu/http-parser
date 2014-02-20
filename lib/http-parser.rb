require "ffi"
require "ffi-compiler/loader"

module HTTPParser
  extend FFI::Library

  ffi_lib FFI::Compiler::Loader.find("http_parser")

  attach_function :http_parser_version, [], :ulong

  callback :http_data_cb, [:pointer, :char, :size_t], :int
  callback :http_cb, [:pointer], :int

  class Settings < FFI::Struct
    layout :on_message_begin,    :http_cb,
           :on_url,              :http_data_cb,
           :on_header_field,     :http_data_cb,
           :on_header_value,     :http_data_cb,
           :on_headers_complete, :http_cb,
           :on_body,             :http_data_cb,
           :on_message_complete, :http_cb
  end

  PARSER_TYPE = enum(:HTTP_REQUEST, :HTTP_RESPONSE, :HTTP_BOTH)   
    
  class Parser < FFI::Struct
    layout :type,           PARSER_TYPE, 2,
           :flags,          :uint, 6,
           :state,          :uint, 8,
           :header_state,   :uint, 8,
           :index,          :uint, 8,

           :nread,          :uint32,
           :content_length, :uint64,

           :http_major,     :ushort,
           :http_minor,     :ushort,
           :status_code,    :uint, 16,
           :method,         :uint, 8,
           :http_errno,     :uint, 7,

           :upgrade,        :uint, 1,
           :data,           :pointer
  end

  attach_function :http_parser_init, [Parser.by_ref, PARSER_TYPE], :void
end

require "http-parser/version"
