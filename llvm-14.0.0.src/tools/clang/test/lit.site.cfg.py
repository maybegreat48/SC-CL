# Autogenerated from C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/test/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


import sys

config.llvm_src_root = path(r"..\..\..")
config.llvm_obj_root = path(r"..\..\..")
config.llvm_tools_dir = path(r"..\..\..\%(build_mode)s\bin")
config.llvm_libs_dir = path(r"..\..\..\%(build_mode)s\lib")
config.llvm_shlib_dir = path(r"..\..\..\%(build_mode)s\bin")
config.llvm_plugin_ext = ".dll"
config.lit_tools_dir = path(r"")
config.errc_messages = "no such file or directory;is a directory;invalid argument;permission denied"
config.clang_lit_site_cfg = __file__
config.clang_obj_root = path(r"..")
config.clang_src_dir = path(r"..")
config.clang_tools_dir = path(r"..\..\..\%(build_mode)s\bin")
config.clang_lib_dir = path(r"..\..\..\lib")
config.host_triple = "x86_64-pc-windows-msvc"
config.target_triple = "x86_64-pc-windows-msvc"
config.host_cc = "C:/Program Files/Microsoft Visual Studio/2022/Preview/VC/Tools/MSVC/14.32.31114/bin/Hostx64/x64/cl.exe"
config.host_cxx = "C:/Program Files/Microsoft Visual Studio/2022/Preview/VC/Tools/MSVC/14.32.31114/bin/Hostx64/x64/cl.exe"
config.llvm_use_sanitizer = ""
config.have_zlib = 0
config.clang_arcmt = 1
config.clang_default_pie_on_linux = 0
config.clang_default_cxx_stdlib = ""
config.clang_staticanalyzer = 1
config.clang_staticanalyzer_z3 = 0
config.clang_examples = 0
config.enable_shared = 0
config.enable_backtrace = 1
config.enable_experimental_new_pass_manager = 1
config.enable_threads = 1
config.host_arch = "AMD64"
config.python_executable = "C:/Program Files/Python39/python.exe"
config.use_z3_solver = lit_config.params.get('USE_Z3_SOLVER', "")
config.has_plugins = 0
config.clang_vendor_uti = "org.llvm.clang"
config.llvm_external_lit = path(r"")

# Support substitution of the tools and libs dirs with user parameters. This is
# used when we can't determine the tool dir at configuration time.
try:
    config.clang_tools_dir = config.clang_tools_dir % lit_config.params
    config.llvm_tools_dir = config.llvm_tools_dir % lit_config.params
    config.llvm_shlib_dir = config.llvm_shlib_dir % lit_config.params
    config.llvm_libs_dir = config.llvm_libs_dir % lit_config.params
except KeyError:
    e = sys.exc_info()[1]
    key, = e.args
    lit_config.fatal("unable to find %r parameter, use '--param=%s=VALUE'" % (key,key))

import lit.llvm
lit.llvm.initialize(lit_config, config)

# Let the main config do the real work.
lit_config.load_config(
    config, os.path.join(config.clang_src_dir, "test/lit.cfg.py"))
