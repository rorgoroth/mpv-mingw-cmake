ExternalProject_Add(mingw-w64
    PREFIX mingw-w64-prefix
    GIT_REPOSITORY git://github.com/mirror/mingw-w64.git
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/mingw-w64-*.patch
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(mingw-w64)
