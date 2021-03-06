# Autogenerated from C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


# Variables needed for common clang config.
config.lit_tools_dir = ""
config.clang_tools_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.llvm_tools_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.clang_libs_dir = ""
config.llvm_libs_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/lib"
config.target_triple = "x86_64-pc-windows-msvc"
config.host_triple = "x86_64-pc-windows-msvc"
config.python_executable = "C:/Program Files/Python39/python.exe"

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

config.clangd_source_dir = "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/.."
config.clangd_binary_dir = "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/.."
config.clangd_build_xpc = 0
config.clangd_enable_remote = 0
config.clangd_tidy_checks = 1
config.have_zlib = 0

# Delegate logic to lit.cfg.py.
lit_config.load_config(config, "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/lit.cfg.py")
