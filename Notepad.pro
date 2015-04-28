#-------------------------------------------------
#
# Project created by QtCreator 2015-03-17T16:08:37
#
#-------------------------------------------------

#TODO
# copy our Info.plist into the repo
#

QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Notepad
TEMPLATE = app


SOURCES += src/main.cpp\
        src/notepad.cpp

HEADERS  += src/notepad.h

FORMS    += notepad.ui

RESOURCES += images.qrc

# including internal library -- test
#INCLUDEPATH += $$PWD/src/3rdparth/NotepadLib/include
#LIBS += -L"$$PWD/src/3rdparty/NotepadLib/lib" -lNotepadLib


release: DESTDIR = $$PWD/build/release
debug: DESTDIR = $$PWD/build/debug

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.rcc
UI_DIR = $$DESTDIR/.ui

######################
# General settings
######################
CONFIG += warn_on   # turn on compiler warnings
CONFIG += c++11    # do we need to enable c++11 support?  not enabled by default, no effect if compiler doesn't support it
#DEFINES +=         # add preprocessor macros here (like -D)
#QMAKE_CXX          # specify c++ compiler to use

win32 {
    # win32 specific settings here
    #DEF_FILE =
    #RC_FILE =
    #RES_FILE =
    # RC_ICONS = myappicon.ico    # http://doc.qt.io/qt-5/appicon.html
    # QMAKE_TARGET_COMPANY ?
    # QMAKE_TARGET_DESCRIPTION ?
    # QMAKE_TARGET_COPYRIGHT ?
    # QMAKE_TARGET_PRODUCT ?
    # RC_CODEPAGE ?
    # RC_ICONS ?
    # RC_LANG ?

}
win32:debug {
    CONFIG += windows console
}
win64 {
    # win64 specific settings here
    # ?? QT += winextras    # also needs #include <QtWinExtras>
    # DEF_FILE = ??
    # RC_FILE = ??
    # RES_FILE = ??
    # DLLDESTDIR = ??
    # IDLSOURCES = ??
    CONFIG += embed_manifest_exe
    QMAKE_TARGET_COMPANY = "Other Machine Co."
    QMAKE_TARGET_DESCRIPTION = "Target description goes here. boosh."
    QMAKE_TARGET_COPYRIGHT = "2015"
    QMAKE_TARGET_PRODUCT = "Otherplan"
    # RC_CODEPAGE = ??
    # RC_ICONS = ??
    # RC_LANG = ??
    # RC_INCLUDEPATH = ??
    # RCC_DIR = ??
    # ?? RES_FILE = ??
    # WINRT_MANIFEST = ??

}
win64:debug {
    CONFIG += windows console
}
unix {
    # unix specific settings here
}
unix:debug {
    CONFIG += console
}
macx {
    QMAKE_INFO_PLIST = Notepad.plist # overwrite generic Info.plist with this one
    # ICON = Notepad.icns   # http://doc.qt.io/qt-5/appicon.html
    # QMAKE_BUNDLE_DATA ?
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.8

    # to add a non standard framework
    # QMAKE_LFLAGS += -F/path/to/framework
    # LIBS += -framework FrameworkName

    # QMAKE_SONAME_PREFIX = @executable_path/../Frameworks ?
}

!exists(notepad.ui) {
    error("No notepad.ui file found")
}
!exists(images.qrc) {
    error("No images.qrc file found")
}


# Extra targets appended below
#PRE_TARGETDEPS += foo
#QMAKE_EXTRA_TARGETS += foo
#foo.commands = @echo Building ... $$TARGET as an $$TEMPLATE with config: $$CONFIG
