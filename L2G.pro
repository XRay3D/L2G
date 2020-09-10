QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#contains(QT_ARCH, i386) {
#    message("32-bit")
#    TARGET = $$TARGET"_x32"
#} else {
#    message("64-bit")
#    TARGET = $$TARGET"_x64"
#}

#msvc* {
#    LIBS += -lsetupapi -lAdvapi32
#    RC_FILE = myapp.rc
#    TARGET = $$TARGET"_msvc"
#    message($$TARGET)
#}

#gcc* {
#    RC_FILE = myapp.rc
#    win32 {
#        LIBS += -lsetupapi -lAdvapi32 -lpsapi
#    }
#    TARGET = $$TARGET"_gcc"
#}



message($$TARGET)

include(lib2geom-1.0/lib2geom.pri)

DESTDIR = $$_PRO_FILE_PWD_/bin

SOURCES += \
    graphicsview.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    graphicsview.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
