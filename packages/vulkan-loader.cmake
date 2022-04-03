ExternalProject_Add(vulkan-loader
  DEPENDS vulkan-headers
  URL https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/v1.3.210.tar.gz
  URL_HASH MD5=707b552aa6d40d17782ccc8356f4972b
  UPDATE_COMMAND ""
  PATCH_COMMAND ${EXEC} patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/vulkan-loader-0001.patch
        COMMAND ${EXEC} patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/vulkan-loader-0002.patch
  CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR> -B<BINARY_DIR>
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
    -DVULKAN_HEADERS_INSTALL_DIR=${MINGW_INSTALL_PREFIX}
    -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
    -DBUILD_TESTS=OFF
    -DENABLE_STATIC_LOADER=ON
    -DENABLE_WERROR=OFF
    -DCMAKE_C_FLAGS='${CMAKE_C_FLAGS} -D_WIN32_WINNT=0x0600 -D__STDC_FORMAT_MACROS -DSTRSAFE_NO_DEPRECATE'
    -DCMAKE_CXX_FLAGS='${CMAKE_CXX_FLAGS} -D__USE_MINGW_ANSI_STDIO -D__STDC_FORMAT_MACROS -fpermissive -D_WIN32_WINNT=0x0600'
  BUILD_COMMAND ${NINJA} -C <BINARY_DIR>
  INSTALL_COMMAND ${NINJA} -C <BINARY_DIR> install
  LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
