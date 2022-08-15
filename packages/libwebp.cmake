ExternalProject_Add(
  libwebp
  GIT_REPOSITORY https://chromium.googlesource.com/webm/libwebp.git
  GIT_SHALLOW 1
  GIT_REMOTE_NAME origin
  GIT_TAG main
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND
    ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR> -G Ninja
    -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
    -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
    -DCMAKE_BUILD_TYPE=Release
    -DWEBP_BUILD_ANIM_UTILS=OFF
    -DWEBP_BUILD_CWEBP=ON
    -DWEBP_BUILD_DWEBP=ON
    -DWEBP_BUILD_EXTRAS=OFF
    -DWEBP_BUILD_GIF2WEBP=OFF
    -DWEBP_BUILD_IMG2WEBP=OFF
    -DWEBP_BUILD_LIBWEBPMUX=ON
    -DWEBP_BUILD_VWEBP=OFF
    -DWEBP_BUILD_WEBPINFO=ON
    -DWEBP_BUILD_WEBPMUX=OFF
    -DWEBP_BUILD_WEBP_JS=OFF
    -DWEBP_ENABLE_SIMD=ON
    -DWEBP_LINK_STATIC=ON
    -DWEBP_NEAR_LOSSLESS=ON
    -DWEBP_UNICODE=ON
    -DWEBP_USE_THREAD=ON
  BUILD_COMMAND ${NINJA} -C <BINARY_DIR>
  INSTALL_COMMAND ${NINJA} -C <BINARY_DIR> install
  LOG_DOWNLOAD 1
  LOG_UPDATE 1
  LOG_CONFIGURE 1
  LOG_BUILD 1
  LOG_INSTALL 1)

force_rebuild_git(libwebp)
autogen(libwebp)
