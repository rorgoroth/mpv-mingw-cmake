ExternalProject_Add(
  theora
  DEPENDS ogg
          vorbis
  GIT_REPOSITORY https://github.com/xiph/theora.git
  GIT_SHALLOW 1
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND
    ${EXEC} <SOURCE_DIR>/configure
    --host=${TARGET_ARCH}
    --prefix=${MINGW_INSTALL_PREFIX}
    --disable-examples
    --disable-oggtest
    --disable-sdltest
    --disable-shared
    --disable-vorbistest
    --enable-static
  BUILD_COMMAND ${MAKE}
  INSTALL_COMMAND ${MAKE} install
  LOG_DOWNLOAD 1
  LOG_UPDATE 1
  LOG_CONFIGURE 1
  LOG_BUILD 1
  LOG_INSTALL 1)

force_rebuild_git(theora)
autogen(theora)