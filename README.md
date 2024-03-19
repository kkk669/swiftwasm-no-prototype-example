# swiftwasm-no-prototype-example

This repository is an example that occurs a fatal error during building with SwiftWasm.

## Logs

Environment:

```console
$ uname -a
Linux Brown-rhinoceros-beetle 6.6.3-413.asahi.fc39.aarch64+16k #1 SMP PREEMPT_DYNAMIC Sat Jan 27 17:19:54 UTC 2024 aarch64 GNU/Linux
$ cat /etc/os-release
NAME="Fedora Linux Asahi Remix"
VERSION="39 (Thirty Nine)"
ID=fedora-asahi-remix
ID_LIKE=fedora
VERSION_ID=39
VERSION_CODENAME=""
PLATFORM_ID="platform:f39"
PRETTY_NAME="Fedora Linux Asahi Remix 39 (Thirty Nine)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora-asahi-remix:39"
DEFAULT_HOSTNAME="fedora"
HOME_URL="https://fedora-asahi-remix.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f39/system-administrators-guide/"
SUPPORT_URL="https://discussion.fedoraproject.org/c/neighbors/asahi/asahi-help/94"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=39
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=39
$ swift --version
Swift version 6.0-dev (LLVM d1625da873daa4c, Swift bae6450bf96dceb)
Target: aarch64-unknown-linux-gnu
$ swift experimental-sdk list
DEVELOPMENT-SNAPSHOT-2024-03-14-a-wasm
```

Building for `aarch64-unknown-linux-gnu`:

```console
$ swift build
Building for debugging...
[6/6] Compiling foobar foobar.swift
Build complete! (1.42s)
```

Building for `wasm32-unknown-wasi`:

```console
$ swift build --experimental-swift-sdk wasm32-unknown-wasi
Building for debugging...
warning: Could not read SDKSettings.json for SDK at: /home/kebo/.swiftpm/swift-sdks/swift-wasm-DEVELOPMENT-SNAPSHOT-2024-03-14-a-ubuntu20.04_aarch64.artifactbundle/DEVELOPMENT-SNAPSHOT-
2024-03-14-a-wasm/wasm32-unknown-wasi/WASI.sdk
error: compile command failed due to signal 6 (use -v to see invocation)
<unknown>:0: error: fatal error encountered during compilation; please submit a bug report (https://swift.org/contributing/#reporting-bugs)
<unknown>:0: note: Functions with 'no-prototype' attribute must take varargs: foobar
Please submit a bug report (https://swift.org/contributing/#reporting-bugs) and include the crash backtrace.
Stack dump:
0.      Program arguments: /home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend -frontend -c -primary-file /home/kebo/swiftwasm-no-prototype-exampl
e/Sources/foobar/foobar.swift -emit-dependencies-path /home/kebo/swiftwasm-no-prototype-example/.build/wasm32-unknown-wasi/debug/foobar.build/foobar.d -emit-reference-dependencies-path 
/home/kebo/swiftwasm-no-prototype-example/.build/wasm32-unknown-wasi/debug/foobar.build/foobar.swiftdeps -target wasm32-unknown-wasi -disable-objc-interop -sdk /home/kebo/.swiftpm/swift
-sdks/swift-wasm-DEVELOPMENT-SNAPSHOT-2024-03-14-a-ubuntu20.04_aarch64.artifactbundle/DEVELOPMENT-SNAPSHOT-2024-03-14-a-wasm/wasm32-unknown-wasi/WASI.sdk -I /home/kebo/swiftwasm-no-prot
otype-example/.build/wasm32-unknown-wasi/debug/Modules -color-diagnostics -enable-testing -g -debug-info-format=dwarf -dwarf-version=4 -module-cache-path /home/kebo/swiftwasm-no-prototy
pe-example/.build/wasm32-unknown-wasi/debug/ModuleCache -swift-version 5 -Onone -D SWIFT_PACKAGE -D DEBUG -empty-abi-descriptor -resource-dir /home/kebo/.swiftpm/swift-sdks/swift-wasm-D
EVELOPMENT-SNAPSHOT-2024-03-14-a-ubuntu20.04_aarch64.artifactbundle/DEVELOPMENT-SNAPSHOT-2024-03-14-a-wasm/wasm32-unknown-wasi/swift.xctoolchain/usr/lib/swift_static -use-static-resourc
e-dir -enable-anonymous-context-mangled-names -file-compilation-dir /home/kebo/swiftwasm-no-prototype-example -Xcc -fmodule-map-file=/home/kebo/swiftwasm-no-prototype-example/.build/was
m32-unknown-wasi/debug/cfoobar.build/module.modulemap -Xcc -I -Xcc /home/kebo/swiftwasm-no-prototype-example/Sources/cfoobar/include -Xcc --sysroot -Xcc /home/kebo/.swiftpm/swift-sdks/s
wift-wasm-DEVELOPMENT-SNAPSHOT-2024-03-14-a-ubuntu20.04_aarch64.artifactbundle/DEVELOPMENT-SNAPSHOT-2024-03-14-a-wasm/wasm32-unknown-wasi/WASI.sdk -Xcc -g -module-name foobar -plugin-pa
th /home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/lib/swift/host/plugins -plugin-path /home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/lo
cal/lib/swift/host/plugins -parse-as-library -o /home/kebo/swiftwasm-no-prototype-example/.build/wasm32-unknown-wasi/debug/foobar.build/foobar.swift.o -index-store-path /home/kebo/swift
wasm-no-prototype-example/.build/wasm32-unknown-wasi/debug/index/store -index-system-modules
1.      Swift version 6.0-dev (LLVM d1625da873daa4c, Swift bae6450bf96dceb)
2.      Compiling with effective version 5.10
3.      Running pass 'Add prototypes to prototypes-less functions' on module '/home/kebo/swiftwasm-no-prototype-example/.build/wasm32-unknown-wasi/debug/foobar.build/foobar.swift.o'.
 #0 0x0000aaaac04adf10 llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x735df10)
 #1 0x0000aaaac04abf04 llvm::sys::RunSignalHandlers() (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x735bf04)
 #2 0x0000aaaac04ae61c SignalHandler(int) Signals.cpp:0:0
 #3 0x0000ffffb6b0c800 (linux-vdso.so.1+0x800)
 #4 0x0000ffffb4df2280 __pthread_kill_implementation (/lib64/libc.so.6+0x92280)
 #5 0x0000ffffb4da5800 gsignal (/lib64/libc.so.6+0x45800)
 #6 0x0000ffffb4d90288 abort (/lib64/libc.so.6+0x30288)
 #7 0x0000aaaab9e64ef0 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*)::$_4::__invoke(void*, char const*, bool) FrontendTool.cpp:0:0
 #8 0x0000aaaac04058dc llvm::report_fatal_error(llvm::Twine const&, bool) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x72b58dc)
 #9 0x0000aaaabc82ac1c std::pair<llvm::Function*, llvm::Function*>& std::vector<std::pair<llvm::Function*, llvm::Function*>, std::allocator<std::pair<llvm::Function*, llvm::Function*>>>
::emplace_back<llvm::Function*, llvm::Function*&>(llvm::Function*&&, llvm::Function*&) crtstuff.c:0:0
#10 0x0000aaaac013fea4 llvm::legacy::PassManagerImpl::run(llvm::Module&) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x6fefea4)
#11 0x0000aaaaba2292d8 swift::compileAndWriteLLVM(llvm::Module*, llvm::TargetMachine*, swift::IRGenOptions const&, swift::UnifiedStatsReporter*, swift::DiagnosticEngine&, llvm::raw_pwri
te_stream&, llvm::sys::SmartMutex<false>*, llvm::raw_pwrite_stream*) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x10d92d8)
#12 0x0000aaaaba228a90 swift::performLLVM(swift::IRGenOptions const&, swift::DiagnosticEngine&, llvm::sys::SmartMutex<false>*, llvm::GlobalVariable*, llvm::Module*, llvm::TargetMachine*
, llvm::StringRef, llvm::vfs::OutputBackend&, swift::UnifiedStatsReporter*) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0x10d8a90)
#13 0x0000aaaab9e61284 generateCode(swift::CompilerInstance&, llvm::StringRef, llvm::Module*, llvm::GlobalVariable*) FrontendTool.cpp:0:0
#14 0x0000aaaab9e5c7f0 performCompileStepsPostSILGen(swift::CompilerInstance&, std::unique_ptr<swift::SILModule, std::default_delete<swift::SILModule>>, llvm::PointerUnion<swift::Module
Decl*, swift::SourceFile*>, swift::PrimarySpecificPaths const&, int&, swift::FrontendObserver*) FrontendTool.cpp:0:0
#15 0x0000aaaab9e5b770 swift::performCompileStepsPostSema(swift::CompilerInstance&, int&, swift::FrontendObserver*) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/
usr/bin/swift-frontend+0xd0b770)
#16 0x0000aaaab9e6e220 withSemanticAnalysis(swift::CompilerInstance&, swift::FrontendObserver*, llvm::function_ref<bool (swift::CompilerInstance&)>, bool) FrontendTool.cpp:0:0
#17 0x0000aaaab9e5e9e8 performCompile(swift::CompilerInstance&, int&, swift::FrontendObserver*) FrontendTool.cpp:0:0
#18 0x0000aaaab9e5d2bc swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-0
3-13/usr/bin/swift-frontend+0xd0d2bc)
#19 0x0000aaaab9c4ecdc swift::mainEntry(int, char const**) (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0xafecdc)
#20 0x0000ffffb4d909dc __libc_start_call_main (/lib64/libc.so.6+0x309dc)
#21 0x0000ffffb4d90ab0 __libc_start_main@GLIBC_2.17 (/lib64/libc.so.6+0x30ab0)
#22 0x0000aaaab9c4dcb0 _start (/home/kebo/.local/share/swiftly/toolchains/main-snapshot-2024-03-13/usr/bin/swift-frontend+0xafdcb0)
```
