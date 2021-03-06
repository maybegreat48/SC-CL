# Autogenerated from C:/projects/SC-CL/llvm-14.0.0.src/test/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


import sys

config.host_triple = "x86_64-pc-windows-msvc"
config.target_triple = "x86_64-pc-windows-msvc"
config.llvm_src_root = path(r"..")
config.llvm_obj_root = path(r"..")
config.llvm_tools_dir = path(r"..\%(build_mode)s\bin")
config.llvm_lib_dir = path(r"..\%(build_mode)s\lib")
config.llvm_shlib_dir = path(r"..\%(build_mode)s\bin")
config.llvm_shlib_ext = ".dll"
config.llvm_plugin_ext = ".dll"
config.llvm_exe_ext = ".exe"
config.lit_tools_dir = path(r"")
config.errc_messages = "no such file or directory;is a directory;invalid argument;permission denied"
config.python_executable = "C:/Program Files/Python39/python.exe"
config.gold_executable = "GOLD_EXECUTABLE-NOTFOUND"
config.ld64_executable = ""
config.osx_sysroot = path(r"")
config.ocamlfind_executable = "OCAMLFIND-NOTFOUND"
config.have_ocamlopt = 0
config.ocaml_flags = ""
config.include_go_tests = 0
config.go_executable = "GO_EXECUTABLE-NOTFOUND"
config.enable_shared = 0
config.enable_assertions = 0
config.targets_to_build = " AArch64 AMDGPU ARM AVR BPF Hexagon Lanai Mips MSP430 NVPTX PowerPC RISCV Sparc SystemZ VE WebAssembly X86 XCore"
config.native_target = "X86"
config.llvm_bindings = "".split(' ')
config.host_os = "Windows"
config.host_cc = "C:/Program Files/Microsoft Visual Studio/2022/Preview/VC/Tools/MSVC/14.32.31114/bin/Hostx64/x64/cl.exe "
config.host_cxx = "C:/Program Files/Microsoft Visual Studio/2022/Preview/VC/Tools/MSVC/14.32.31114/bin/Hostx64/x64/cl.exe "
# Note: ldflags can contain double-quoted paths, so must use single quotes here.
config.host_ldflags = '/machine:x64 /STACK:10000000'
config.llvm_use_intel_jitevents = 0
config.llvm_use_sanitizer = ""
config.have_zlib = 0
config.have_libxar = 0
config.have_libxml2 = 0
config.have_curl = 0
config.have_dia_sdk = 0
config.enable_ffi = 0
config.build_examples = 0
config.enable_threads = 1
config.build_shared_libs = 0
config.link_llvm_dylib = 0
config.llvm_dylib_version = "14"
config.llvm_host_triple = 'x86_64-pc-windows-msvc'
config.host_arch = "AMD64"
config.have_opt_viewer_modules = 0
config.libcxx_used = 0
config.has_plugins = 0
config.linked_bye_extension = 0
config.have_tf_aot = 0
config.have_tf_api = 0
config.llvm_inliner_model_autogenerated = 0
config.llvm_raevict_model_autogenerated = 0
config.expensive_checks = 0

# Support substitution of the tools_dir with user parameters. This is
# used when we can't determine the tool dir at configuration time.
try:
    config.llvm_tools_dir = config.llvm_tools_dir % lit_config.params
    config.llvm_lib_dir = config.llvm_lib_dir % lit_config.params
    config.llvm_shlib_dir = config.llvm_shlib_dir % lit_config.params
except KeyError:
    e = sys.exc_info()[1]
    key, = e.args
    lit_config.fatal("unable to find %r parameter, use '--param=%s=VALUE'" % (key,key))

import lit.llvm
lit.llvm.initialize(lit_config, config)

# Let the main config do the real work.
lit_config.load_config(
    config, os.path.join(config.llvm_src_root, "test/lit.cfg.py"))
