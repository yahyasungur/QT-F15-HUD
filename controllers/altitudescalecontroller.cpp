#include "altitudescalecontroller.h"

AltitudeScaleController::AltitudeScaleController(QObject *parent)
    : QObject(parent)
    , m_currentAltitude(15000)
{
    connect(&m_timer, &QTimer::timeout, this, &AltitudeScaleController::updateAltitude);
    m_timer.start(50);
}

int AltitudeScaleController::currentAltitude() const
{
    return m_currentAltitude;
}

void AltitudeScaleController::setCurrentAltitude(int currentAltitude)
{
    if (m_currentAltitude == currentAltitude)
        return;

    m_currentAltitude = currentAltitude;
    emit currentAltitudeChanged(m_currentAltitude);
}

void AltitudeScaleController::updateAltitude()
{
    if(m_currentAltitude <= 1000)
    {
        m_currentAltitude = 15000;
    }
    else
    {
        setCurrentAltitude(m_currentAltitude + 10);
    }
}
