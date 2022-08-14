ExternalProject_Add(
  c-ares
  GIT_REPOSITORY https://github.com/c-ares/c-ares.git
  GIT_REMOTE_NAME origin
  GIT_TAG main
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND
    ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR> -G Ninja
    -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
    -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
    -DCMAKE_BUILD_TYPE=Release
    -DCARES_BUILD_CONTAINER_TESTS=OFF
    -DCARES_BUILD_TESTS=OFF
    -DCARES_BUILD_TOOLS=OFF
    -DCARES_INSTALL=ON
    -DCARES_SHARED=OFF
    -DCARES_STATIC_PIC=ON
    -DCARES_STATIC=ON
  BUILD_COMMAND ${NINJA} -C <BINARY_DIR>
  INSTALL_COMMAND ${NINJA} -C <BINARY_DIR> install
  LOG_DOWNLOAD 1
  LOG_UPDATE 1
  LOG_CONFIGURE 1
  LOG_BUILD 1
  LOG_INSTALL 1)

force_rebuild_git(c-ares)