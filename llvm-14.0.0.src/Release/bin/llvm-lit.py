#!C:/Program Files/Python39/python.exe
# -*- coding: utf-8 -*-

import os
import sys

config_map = {}

def map_config(source_dir, site_config):
    global config_map
    source_dir = os.path.realpath(source_dir)
    source_dir = os.path.normcase(source_dir)
    site_config = os.path.normpath(site_config)
    config_map[source_dir] = site_config

# Set up some builtin parameters, so that by default the LLVM test suite
# configuration file knows how to find the object tree.
builtin_parameters = { 'build_mode' : 'Release' }

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/Unit/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/test/Unit/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/tools/extra/clangd/test/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/test/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/test/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/test/Unit/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/test/Unit/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/utils/lit/tests/lit.cfg'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/utils/lit/lit.site.cfg'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/test/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/test/lit.site.cfg.py'))
map_config(path(r'C:/projects/SC-CL/llvm-14.0.0.src/test/Unit/lit.cfg.py'), path(r'C:/projects/SC-CL/llvm-14.0.0.src/test/Unit/lit.site.cfg.py'))

builtin_parameters['config_map'] = config_map

# Make sure we can find the lit package.
llvm_source_root = path(r'C:/projects/SC-CL/llvm-14.0.0.src')
sys.path.insert(0, os.path.join(llvm_source_root, 'utils', 'lit'))

if __name__=='__main__':
    from lit.main import main
    main(builtin_parameters)
