if (TARGET ZLIB::zlib)
    return()
endif()

find_library(ZLIB_LIBRARY
        NAMES libz.a zlib_a.lib
        PATHS ${AMXX_EASY_HTTP_ROOT}/dep/zlib/lib NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(zlib REQUIRED_VARS ZLIB_LIBRARY)

add_library(ZLIB::zlib STATIC IMPORTED GLOBAL)
set_target_properties(ZLIB::zlib PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${ZLIB_LIBRARY}"
)

unset(ZLIB_LIBRARY CACHE)