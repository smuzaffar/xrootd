include( FindPackageHandleStandardArgs )

if( OPENSSL_INCLUDE_DIR AND OPENSSL_LIBRARIES )
  set( OPENSSL_FOUND TRUE )
else()
  find_path(
    OPENSSL_INCLUDE_DIR
    NAMES openssl/ssl.h
    HINTS
    ${OPENSSL_ROOT_DIR}
    PATH_SUFFIXES
    include )

  find_library(
    OPENSSL_SSL_LIBRARY
    NAMES ssl
    HINTS
    ${OPENSSL_ROOT_DIR}
    PATH_SUFFIXES
    ${LIBRARY_PATH_PREFIX}
    ${LIB_SEARCH_OPTIONS})

  find_library(
    OPENSSL_CRYPTO_LIBRARY
    NAMES crypto
    HINTS
    ${OPENSSL_ROOT_DIR}
    PATH_SUFFIXES
    ${LIBRARY_PATH_PREFIX}
    ${LIB_SEARCH_OPTIONS})

  set( OPENSSL_LIBRARIES ${OPENSSL_SSL_LIBRARY} ${OPENSSL_CRYPTO_LIBRARY} )

  find_package_handle_standard_args(
    OpenSSL
    DEFAULT_MSG
    OPENSSL_LIBRARIES OPENSSL_INCLUDE_DIR )

  mark_as_advanced( OPENSSL_INCLUDE_DIR OPENSSL_LIBRARIES )
endif()
