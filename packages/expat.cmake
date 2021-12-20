ExternalProject_Add(expat
  URL https://github.com/libexpat/libexpat/releases/download/R_2_4_2/expat-2.4.2.tar.gz
  URL_HASH MD5=e775057495be1a7ba748f3230e668038
  CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR>
    -G Ninja
    -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
    -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
    -DCMAKE_BUILD_TYPE=Release
    -DEXPAT_BUILD_DOCS=OFF
    -DEXPAT_BUILD_EXAMPLES=OFF
    -DEXPAT_BUILD_FUZZERS=OFF
    -DEXPAT_BUILD_PKGCONFIG=ON
    -DEXPAT_BUILD_TESTS=OFF
    -DEXPAT_BUILD_TOOLS=OFF
    -DEXPAT_CHAR_TYPE=char
    -DEXPAT_ENABLE_INSTALL=ON
    -DEXPAT_OSSFUZZ_BUILD=OFF
    -DEXPAT_SHARED_LIBS=OFF
    -DEXPAT_WARNINGS_AS_ERRORS=OFF
    -DEXPAT_WITH_GETRANDOM=AUTO
    -DEXPAT_WITH_LIBBSD=OFF
    -DEXPAT_WITH_SYS_GETRANDOM=AUTO
  BUILD_COMMAND ${EXEC} ninja -j${MAKEJOBS} -C <BINARY_DIR>
  INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
  LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
