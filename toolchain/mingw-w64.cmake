ExternalProject_Add(mingw-w64
    PREFIX mingw-w64-prefix
    GIT_REPOSITORY https://github.com/mirror/mingw-w64.git
    GIT_TAG f3855e2caa576b1a6288129f8f99a56d2ef969dd
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(mingw-w64)
