ExternalProject_Add(libepoxy
  GIT_REPOSITORY https://github.com/anholt/libepoxy.git
  GIT_SHALLOW 1
  PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/libepoxy-*.patch
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND ${EXEC} meson <BINARY_DIR> <SOURCE_DIR>
    --prefix=${MINGW_INSTALL_PREFIX}
    --libdir=${MINGW_INSTALL_PREFIX}/lib
    --cross-file=${MESON_CROSS}
    --buildtype=release
    --default-library=static
    -Dtests=false
    -Ddocs=false
  BUILD_COMMAND ${NINJA} -C <BINARY_DIR>
  INSTALL_COMMAND ${NINJA} -C <BINARY_DIR> install
  LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(libepoxy)
force_meson_configure(libepoxy)
