#include "airspeedscalecontroller.h"

AirspeedScaleController::AirspeedScaleController(QObject *parent)
    : QObject(parent)
    , m_currentAirspeed(150)
{
    connect(&m_timer, &QTimer::timeout, this, &AirspeedScaleController::updateAirspeed);
    m_timer.start(50);
}

int AirspeedScaleController::currentAirspeed() const
{
    return m_currentAirspeed;
}

void AirspeedScaleController::setCurrentAirspeed(int currentAirspeed)
{
    if (m_currentAirspeed == currentAirspeed)
        return;

    m_currentAirspeed = currentAirspeed;
    emit currentAirspeedChanged(m_currentAirspeed);
}

void AirspeedScaleController::updateAirspeed()
{
    if(m_currentAirspeed >= 9999)
    {
        m_currentAirspeed = 150;
    }
    else
    {
        setCurrentAirspeed(m_currentAirspeed + 1);
    }
}