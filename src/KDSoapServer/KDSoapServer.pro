TEMPLATE = lib
TARGET = $${KDSOAPSERVERLIB}
QT -= gui

QT += network

# Workaround for visual studio integration
DESTDIR = $${TOP_BUILD_DIR}/lib
win32:DLLDESTDIR = $${TOP_BUILD_DIR}/bin

include($${TOP_SOURCE_DIR}/variables.pri)

# Only used by Mac frameworks.
# See the include subdir for standard header installation
# TODO: install these from include/ as well
INSTALLHEADERS = KDSoapServer.h \
                 KDSoapServerAuthInterface.h \
                 KDSoapServerRawXMLInterface.h \
                 KDSoapServerObjectInterface.h \
                 KDSoapServerGlobal.h \
                 KDSoapDelayedResponseHandle.h \
                 KDSoapServerCustomVerbRequestInterface.h

HEADERS = $$INSTALLHEADERS \
    KDSoapThreadPool.h \
    KDSoapServerSocket_p.h \
    KDSoapServerThread_p.h \
    KDSoapSocketList_p.h \

SOURCES = KDSoapServer.cpp \
    KDSoapThreadPool.cpp \
    KDSoapServerSocket.cpp \
    KDSoapServerThread.cpp \
    KDSoapSocketList.cpp \
    KDSoapServerAuthInterface.cpp \
    KDSoapServerRawXMLInterface.cpp \
    KDSoapServerObjectInterface.cpp \
    KDSoapDelayedResponseHandle.cpp \
    KDSoapServerCustomVerbRequestInterface.cpp

DEFINES += KDSOAP_BUILD_KDSOAPSERVER_LIB

# We use the soap client library, for xml parsing
INCLUDEPATH += . $${TOP_SOURCE_DIR}/src
DEPENDPATH += . $${TOP_SOURCE_DIR}/src
LIBS        += -L$$DESTDIR -l$$KDSOAPLIB

# installation targets:
target.path = $$INSTALL_PREFIX/usr/lib
INSTALLS += target

# Mac frameworks
macx:lib_bundle: {
    FRAMEWORK_HEADERS.version = Versions
    FRAMEWORK_HEADERS.files = $$INSTALLHEADERS
    FRAMEWORK_HEADERS.path = Headers
    QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS
}
