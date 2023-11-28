#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include "controllers/velocityvectorcontroller.h"
#include "controllers/airspeedscalecontroller.h"
#include "controllers/altitudescalecontroller.h"
#include "controllers/headingscalecontroller.h"
#include "controllers/pitchscalecontroller.h"
#include "controllers/systemopacitycontroller.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    VelocityVectorController m_velocityVectorController;
    AirspeedScaleController m_airspeedScaleController;
    AltitudeScaleController m_altitudeScaleController;
    HeadingScaleController m_headingScaleController;
    PitchScaleController m_pitchScaleController;
    SystemOpacityController m_systemOpacityController;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("velocityVectorController", &m_velocityVectorController);
    engine.rootContext()->setContextProperty("airspeedScaleController", &m_airspeedScaleController);
    engine.rootContext()->setContextProperty("altitudeScaleController", &m_altitudeScaleController);
    engine.rootContext()->setContextProperty("headingScaleController", &m_headingScaleController);
    engine.rootContext()->setContextProperty("pitchScaleController", &m_pitchScaleController);
    engine.rootContext()->setContextProperty("systemOpacityController", &m_systemOpacityController);

    engine.load(url);

    app.setWindowIcon(QIcon("./ui/assets/IDS.png"));

    return app.exec();
}
