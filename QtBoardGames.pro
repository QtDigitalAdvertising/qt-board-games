TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    settings.cpp

RESOURCES += qml.qrc
android: include(/Users/octavian.cimpu/Library/Android/sdk/android_openssl/openssl.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

DEPENDS = "qtquickcontrols2"

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    settings.h
