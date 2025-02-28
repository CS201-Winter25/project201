import sys

config.llvm_tools_dir = "/usr/lib/llvm-19/bin"
config.llvm_shlib_ext = ".so"
config.llvm_shlib_dir = "/home/shr/Documents/temp/project201/build/lib"

import lit.llvm
# lit_config is a global instance of LitConfig
lit.llvm.initialize(lit_config, config)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join("/home/shr/Documents/temp/project201/build/test")

# Let the main config do the real work.
lit_config.load_config(config, "/home/shr/Documents/temp/project201/test/lit.cfg.py")
