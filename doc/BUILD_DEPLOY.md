# Sequoia-HAL Build and Deployment

## Scope

Sequoia-HAL is a C++/CMake hardware-abstraction and protocol component. Its
Makefile supports native Ninja builds, ARM64 Docker/QEMU builds, CTest, CPack
DEB/RPM/IPK packaging, remote deployment, and Doxygen/quality targets.

## 1. Prerequisites

- CMake, Ninja, a C++ compiler, `nproc`, and dependencies from the CMake files.
- Docker for ARM64 builds; `make docker-install` can install Docker using
  `sudo apt` when absent.
- `clang-format`, `cppcheck`, Doxygen, and Graphviz for quality/doc targets.
- `sshpass`, reachable Raspberry Pi 5 targets, and credentials for deployment.
  Defaults are `nvidia`/`nvidia`; override with `HAL_SSH_USER`, `HAL_SSH_PASS`,
  `IP_A`, and `IP_B`. **Credential/device required.**

## 2. Setup

## 3. Build

```sh
make configure                 # native CMake/Ninja in build/native
make build                     # native build
make docker-image              # conditional image sequoia
make docker-configure          # ARM64 cross configuration
make docker-build              # ARM64 cross build in build/cross
```

`make all` defaults to `docker-build`. Set `JOBS=N` to control native and test
parallelism. The Docker path mounts this repository at `/workspace`.

## 4. Test and lint

```sh
make test                      # native CTest
make docker-test               # ARM64/QEMU CTest
make format                    # clang-format and optional CMake formatting
make cppcheck                  # static analysis
make doc                       # Doxygen via ninja doc_doxygen
```

The quality targets fail early if their required host tool is missing.

## 5. Artifacts

```sh
make package                   # native DEB and IPK
make package-deb               # build/native CPack DEB
make package-ipk               # build/native IPK target
make package-rpm               # requires rpmbuild
make docker-package             # cross DEB and IPK
make docker-package-deb
make docker-package-rpm        # requires rpmbuild in the image
make docker-package-ipk
```

Native packages are written under `build/native/`; cross packages are under
`build/cross/`. The repository also contains a checked-in DEB, which is an
existing artifact rather than output of this documentation change.

## 6. Deploy, install, and run

```sh
make deploy-a IP_A=192.168.1.3 HAL_SSH_USER=pi HAL_SSH_PASS='...'
make deploy-b IP_B=192.168.1.13 HAL_SSH_USER=pi HAL_SSH_PASS='...'
make run-a [APP] [ARGS...]
make run-b [APP] [ARGS...]
make run [APP] [ARGS...]      # local test applications
make list
```

Deployment replaces `/tmp/acu-test` and copies cross-built `lib/` and `bin/`.
There is no cloud deployment target.

## 7. Cleanup

```sh
make clean                    # remove native and cross build directories
make docker-clean             # remove cross build artifacts through Docker
```

## 8. Verification caveats

ARM64 QEMU tests are not a substitute for physical GPIO, timing, peripheral,
or Raspberry Pi 5 validation. Remote targets and credentials are conditional;
manually inspect service behavior, ABI compatibility, and protocol interaction
after deployment. Package generation alone does not validate installation on a
target OS.