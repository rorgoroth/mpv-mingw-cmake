# luajit ships with a broken pkg-config file
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/luajit.pc.in ${CMAKE_CURRENT_BINARY_DIR}/luajit.pc @ONLY)

ExternalProject_Add(luajit
  DEPENDS libiconv
  GIT_REPOSITORY https://github.com/LuaJIT/LuaJIT.git
  GIT_SHALLOW 1
  PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/luajit-*.patch
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ${MAKE} -C <SOURCE_DIR>/src
    "HOST_CC='gcc -m64'"
    CROSS=${TARGET_ARCH}-
    TARGET_SYS=Windows
    BUILDMODE=static
    CFLAGS='-D_WIN32_WINNT=0x0602 -DUNICODE'
    XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64'
    amalg
  INSTALL_COMMAND ${MAKE}
    "HOST_CC='gcc -m64'"
    CROSS=${TARGET_ARCH}-
    TARGET_SYS=Windows
    BUILDMODE=static
    FILE_T=luajit.exe
    CFLAGS='-D_WIN32_WINNT=0x0602 -DUNICODE'
    XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64'
    PREFIX=${MINGW_INSTALL_PREFIX}
    install
  BUILD_IN_SOURCE 1
  LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

ExternalProject_Add_Step(luajit install-pc
  DEPENDEES install
  COMMAND ${CMAKE_COMMAND} -E copy  ${CMAKE_CURRENT_BINARY_DIR}/luajit.pc
                                    ${MINGW_INSTALL_PREFIX}/lib/pkgconfig/luajit.pc
)

force_rebuild_git(luajit)
