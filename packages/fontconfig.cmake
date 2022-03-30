ExternalProject_Add(fontconfig
  DEPENDS
    bzip2
    expat
    freetype2
    libiconv
    zlib
  GIT_REPOSITORY https://github.com/freedesktop/fontconfig.git
  GIT_REMOTE_NAME origin
  GIT_TAG main
  UPDATE_COMMAND ""
  GIT_SHALLOW 1
  PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/fontconfig-*.patch
  CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
    --host=${TARGET_ARCH}
    --prefix=${MINGW_INSTALL_PREFIX}
    --disable-docs
    --disable-shared
    --enable-iconv
  BUILD_COMMAND ${MAKE}
  INSTALL_COMMAND ${MAKE} install
  LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(fontconfig)
autogen(fontconfig)
