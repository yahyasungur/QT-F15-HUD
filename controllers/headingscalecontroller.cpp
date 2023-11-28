#include "headingscalecontroller.h"

HeadingScaleController::HeadingScaleController(QObject *parent)
    : QObject(parent)
    , m_currentHeading(150)
{
    connect(&m_timer, &QTimer::timeout, this, &HeadingScaleController::updateHeading);
    m_timer.start(50);
}

int HeadingScaleController::currentHeading() const
{
    return m_currentHeading;
}

void HeadingScaleController::setCurrentHeading(int currentHeading)
{
    if (m_currentHeading == currentHeading)
        return;

    m_currentHeading = currentHeading;
    emit currentHeadingChanged(m_currentHeading);
}

void HeadingScaleController::updateHeading()
{
    if(m_currentHeading >= 1800)
    {
        m_currentHeading = 0;
    }
    else
    {
        setCurrentHeading(m_currentHeading + 1);
    }
}
