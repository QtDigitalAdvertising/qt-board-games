#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include "settings.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QCoreApplication::setOrganizationName("The Qt Company");
    QCoreApplication::setOrganizationDomain("qt.io");
    QCoreApplication::setApplicationName("Qt Board Games");

    Settings* settings = new Settings();

    // Access C++ object "settings" from QML as "settings"
    engine.rootContext()->setContextProperty("settings", settings);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
