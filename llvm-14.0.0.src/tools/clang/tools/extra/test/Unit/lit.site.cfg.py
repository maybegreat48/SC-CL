# Autogenerated from C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/Unit/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


config.extra_tools_obj_dir = "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/../unittests"
config.extra_tools_src_dir = "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/../unittests"
config.llvm_libs_dir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/lib"
config.shlibdir = "C:/projects/SC-CL/llvm-14.0.0.src/%(build_mode)s/bin"
config.target_triple = "x86_64-pc-windows-msvc"

lit_config.load_config(config, "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/../test/Unit/lit.cfg.py")