ExternalProject_Add(
  mingw-w64
  EXCLUDE_FROM_ALL 1
  PREFIX mingw-w64-prefix
  URL https://github.com/mirror/mingw-w64/archive/166b83cc85eb515a49764480600dca10862b6d55.tar.gz
  URL_HASH MD5=21fe156e5c6f83dec03455449da8c50f
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  LOG_DOWNLOAD 1
  LOG_UPDATE 1
  LOG_CONFIGURE 1
  LOG_BUILD 1
  LOG_INSTALL 1)
