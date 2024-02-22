TEMPLATE = app

QT += qml quick widgets quickcontrols2
CONFIG += c++11
CONFIG+=sdk_no_version_check

HEADERS += \
    src/settings.h
SOURCES += src/main.cpp \
    src/settings.cpp

RESOURCES += qml.qrc

DEPENDS = "qtquickcontrols2"

ios {
    QMAKE_LFLAGS += -ObjC
    QMAKE_CXXFLAGS += -F $$PWD/3rdparty

    QMAKE_INFO_PLIST = $$PWD/Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST

    HEADERS += src/digitaladvertising.h

    ios:QMAKE_CXXFLAGS += -fobjc-arc
    ios:LIBS += -F $$PWD/3rdparty/ -framework FBLPromises \
                -F $$PWD/3rdparty/ -framework GoogleAppMeasurement \
                -F $$PWD/3rdparty/ -framework GoogleAppMeasurementIdentitySupport \
                -F $$PWD/3rdparty/ -framework GoogleUtilities \
                -F $$PWD/3rdparty/ -framework GoogleMobileAds \
                -F $$PWD/3rdparty/ -framework nanopb \
                -F $$PWD/3rdparty/ -framework UserMessagingPlatform \
                -framework AVFoundation \
                -framework AudioToolbox \
                -framework CoreTelephony \
                -framework MessageUI \
                -framework SystemConfiguration \
                -framework CoreGraphics \
                -framework AdSupport \
                -framework StoreKit \
                -framework EventKit \
                -framework EventKitUI \
                -framework CoreMedia \
                -framework MediaPlayer \
                -framework SafariServices \
                -framework GLKit \
                -framework CoreMotion \
                -framework CoreVideo \
                -framework JavaScriptCore \
                -ObjC \
}

android{
    ANDROID_DIRECTORY = android_qt6
    lessThan(QT_MAJOR_VERSION, 6) {
        message($$QT_MAJOR_VERSION)
        QT += androidextras
        ANDROID_DIRECTORY = android_qt5
    }

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/$$ANDROID_DIRECTORY

    DISTFILES += \
        $$ANDROID_DIRECTORY/AndroidManifest.xml \
        $$ANDROID_DIRECTORY/build.gradle \
        $$ANDROID_DIRECTORY/gradle.properties \
        $$ANDROID_DIRECTORY/gradle/wrapper/gradle-wrapper.jar \
        $$ANDROID_DIRECTORY/gradle/wrapper/gradle-wrapper.properties \
        $$ANDROID_DIRECTORY/gradlew \
        $$ANDROID_DIRECTORY/gradlew.bat \
        $$ANDROID_DIRECTORY/settings.gradle \
        $$ANDROID_DIRECTORY/res/values/libs.xml
}
