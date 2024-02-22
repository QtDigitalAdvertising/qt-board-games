#include <QQmlContext>
#include <QSettings>
#include <QDir>
#include <QGuiApplication>
#include <QLibrary>
#include <QPluginLoader>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickWindow>
#include <QtPlugin>
#include <qglobal.h>
#include "settings.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    #include "digitaladvertising.h"
    Q_IMPORT_PLUGIN(DigitalAdvertising)
#endif

int main(int argc, char *argv[])
{

    #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        DigitalAdvertising::initialize();
    #endif

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QCoreApplication::setOrganizationName("The Qt Company");
    QCoreApplication::setOrganizationDomain("qt.io");
    QCoreApplication::setApplicationName("Board Games");

    Settings* settings = new Settings();

    // Access C++ object "settings" from QML as "settings"
    engine.rootContext()->setContextProperty("settings", settings);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
