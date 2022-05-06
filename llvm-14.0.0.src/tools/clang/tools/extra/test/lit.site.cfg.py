# Autogenerated from C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


import sys

config.llvm_tools_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.llvm_libs_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/lib"
config.llvm_plugin_ext = ".dll"
config.lit_tools_dir = ""
config.clang_tools_binary_dir = "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/.."
config.clang_tools_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.clang_libs_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.python_executable = "C:/Program Files/Python39/python.exe"
config.target_triple = "x86_64-pc-windows-msvc"
config.clang_tidy_staticanalyzer = 1
config.has_plugins = 0 & ~0

# Support substitution of the tools and libs dirs with user parameters. This is
# used when we can't determine the tool dir at configuration time.
try:
    config.clang_tools_dir = config.clang_tools_dir % lit_config.params
    config.llvm_tools_dir = config.llvm_tools_dir % lit_config.params
    config.llvm_libs_dir = config.llvm_libs_dir % lit_config.params
except KeyError:
    e = sys.exc_info()[1]
    key, = e.args
    lit_config.fatal("unable to find %r parameter, use '--param=%s=VALUE'" % (key,key))

import lit.llvm
lit.llvm.initialize(lit_config, config)

# Let the main config do the real work.
lit_config.load_config(config, "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/../test/lit.cfg.py")