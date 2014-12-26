# TODO: move this to include(EtlegacyCPack)
# CPack general configuration
set(CPACK_PACKAGE_NAME        "etlegacy")
set(CPACK_BUNDLE_NAME       "etlegacy")
set(CPACK_PACKAGE_FILE_NAME     "etlegacy")
set(CPACK_BUNDLE_STARTUP_COMMAND    "etl")
set(CPACK_PACKAGE_ICON        "${CMAKE_SOURCE_DIR}/misc/etl.icns")
set(CPACK_BUNDLE_ICON       "${CMAKE_SOURCE_DIR}/misc/etl.icns")
set(CPACK_BUNDLE_PLIST        "${CMAKE_SOURCE_DIR}/misc/Info.plist")
set(CPACK_PACKAGE_VENDOR      "ET:Legacy")
set(CPACK_PACKAGE_CONTACT     "mail@etlegacy.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY   "ET: Legacy is an online FPS game compatible with Wolfenstein: Enemy Territory 2.60b.")
set(CPACK_PACKAGE_DESCRIPTION     ${CPACK_PACKAGE_DESCRIPTION_SUMMARY}) # TODO: expand
set(CPACK_PACKAGE_DESCRIPTION_FILE    "${CMAKE_SOURCE_DIR}/README.md")
#set(CPACK_RESOURCE_FILE_LICENSE    "${CMAKE_SOURCE_DIR}/COPYING.txt") # FIXME: breaks bundle generator
set(CPACK_PACKAGE_VERSION_MAJOR     ${ETLEGACY_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR     ${ETLEGACY_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH     ${ETLEGACY_VERSION_PATCH})

if(WIN32)
  set(CPACK_GENERATOR "NSIS")
  set(CPACK_PACKAGE_VERSION     ${ETL_CMAKE_PROD_VERSIONSTR})
endif()

if(UNIX)
  set(CPACK_GENERATOR "TGZ" "STGZ")
  set(CPACK_PACKAGE_VERSION     ${ETL_CMAKE_VERSION})
endif()

set(CPACK_PACKAGE_FILE_NAME     "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${ARCH}")
set(CPACK_PROJECT_CONFIG_FILE     "${CMAKE_CURRENT_BINARY_DIR}/CPackOptions.cmake")

# CPack generator-specific configuration
configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/CPackOptions.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/CPackOptions.cmake"
  IMMEDIATE @ONLY
)

include(CPack) # Has to be included after the package configuration!
