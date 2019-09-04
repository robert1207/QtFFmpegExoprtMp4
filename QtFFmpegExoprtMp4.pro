#-------------------------------------------------
#
# Project created by QtCreator 2019-07-29T20:22:51
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtFFmpegExoprtMp4
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        exportvideomanager/exportvideomanager.cpp \
        ffmpeg/inputstream.c \
        ffmpeg/outputstream.c \
        importvideomanager/importvideomanager.cpp \
        main.cpp \
        mainwindow.cpp \
        utils/directoryutil.cpp \
        utils/stringutil.cpp

HEADERS += \
        exportvideomanager/exportvideomanager.h \
        ffmpeg/inputstream.h \
        ffmpeg/outputstream.h \
        importvideomanager/importvideomanager.h \
        mainwindow.h \
        utils/directoryutil.h \
        utils/stringutil.h

FORMS += \
        mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

macx {
    INCLUDEPATH += $$PWD/../ffmpeg-macos64-shared/include
    DEPENDPATH += $$PWD/../ffmpeg-macos64-shared/include

    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lavcodec.58
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lavdevice.58
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lavfilter.7
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lavformat.58
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lavutil.56
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lpostproc.55
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lswresample.3
    macx: LIBS += -L$$PWD/../ffmpeg-macos64-shared/bin/ -lswscale.5
}

win32 {
    INCLUDEPATH += $$PWD/../ffmpeg-win32-shared/include
    DEPENDPATH += $$PWD/../ffmpeg-win32-shared/include

    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lavcodec
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lavdevice
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lavfilter
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lavformat
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lavutil
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lpostproc
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lswresample
    win32: LIBS += -L$$PWD/../ffmpeg-win32-shared/lib/ -lswscale
}
