# This file allows users to call find_package(Clang) and pick up our targets.



find_package(LLVM REQUIRED CONFIG
             HINTS "C:/projects/SC-CL/llvm-14.0.0.src/lib/cmake/llvm")

set(CLANG_EXPORTED_TARGETS "clangBasic;clangAPINotes;clangLex;clangParse;clangAST;clangDynamicASTMatchers;clangASTMatchers;clangCrossTU;clangSema;clangCodeGen;clangAnalysis;clangAnalysisFlowSensitive;clangEdit;clangRewrite;clangARCMigrate;clangDriver;clangSerialization;clangRewriteFrontend;clangFrontend;clangFrontendTool;clangToolingCore;clangToolingInclusions;clangToolingRefactoring;clangToolingASTDiff;clangToolingSyntax;clangDependencyScanning;clangTransformer;clangTooling;clangDirectoryWatcher;clangIndex;clangIndexSerialization;clangStaticAnalyzerCore;clangStaticAnalyzerCheckers;clangStaticAnalyzerFrontend;clangFormat;clangTesting;clangInterpreter;diagtool;clang;clang-format;clangHandleCXX;clangHandleLLVM;clang-offload-bundler;clang-offload-wrapper;clang-scan-deps;clang-repl;clang-rename;clang-refactor;clang-check;clang-extdef-mapping;clangApplyReplacements;clang-apply-replacements;clangReorderFields;clang-reorder-fields;modularize;clangTidy;clangTidyAndroidModule;clangTidyAbseilModule;clangTidyAlteraModule;clangTidyBoostModule;clangTidyBugproneModule;clangTidyCERTModule;clangTidyConcurrencyModule;clangTidyCppCoreGuidelinesModule;clangTidyDarwinModule;clangTidyFuchsiaModule;clangTidyGoogleModule;clangTidyHICPPModule;clangTidyLinuxKernelModule;clangTidyLLVMModule;clangTidyLLVMLibcModule;clangTidyMiscModule;clangTidyModernizeModule;clangTidyMPIModule;clangTidyObjCModule;clangTidyOpenMPModule;clangTidyPerformanceModule;clangTidyPortabilityModule;clangTidyReadabilityModule;clangTidyZirconModule;clangTidyPlugin;clangTidyMain;clang-tidy;clangTidyUtils;clangChangeNamespace;clang-change-namespace;clangDoc;clang-doc;clangIncludeFixer;clangIncludeFixerPlugin;clang-include-fixer;findAllSymbols;find-all-symbols;clangMove;clang-move;clangQuery;clang-query;pp-trace;clangdSupport;clangDaemon;clangDaemonTweaks;clangd;clangdRemoteIndex;libclang")
set(CLANG_CMAKE_DIR "C:/projects/SC-CL/llvm-14.0.0.src/lib/cmake/clang")
set(CLANG_INCLUDE_DIRS "C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/include;C:/projects/SC-CL/llvm-14.0.0.src/tools/clang/include")
set(CLANG_LINK_CLANG_DYLIB "OFF")

# Provide all our library targets to users.
include("C:/projects/SC-CL/llvm-14.0.0.src/lib/cmake/clang/ClangTargets.cmake")

# By creating clang-tablegen-targets here, subprojects that depend on Clang's
# tablegen-generated headers can always depend on this target whether building
# in-tree with Clang or not.
if(NOT TARGET clang-tablegen-targets)
  add_custom_target(clang-tablegen-targets)
endif()
