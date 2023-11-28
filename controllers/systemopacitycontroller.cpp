#include "systemopacitycontroller.h"

SystemOpacityController::SystemOpacityController(QObject *parent)
    : QObject(parent)
    , m_currentOpacity(1.0)
{
//    connect(&m_timer, &QTimer::timeout, this, &SystemOpacityController::updateOpacity);
//    m_timer.start(50);
}

double SystemOpacityController::currentOpacity() const
{
    return m_currentOpacity;
}

void SystemOpacityController::setCurrentOpacity(double currentOpacity)
{
    if (qFuzzyCompare(m_currentOpacity, currentOpacity))
        return;

    m_currentOpacity = currentOpacity;
    emit currentOpacityChanged(m_currentOpacity);
}

void SystemOpacityController::updateOpacity()
{
    if (m_currentOpacity >= 1.0)
    {
        isOpacityIncreasing = false;
    }
    else if (m_currentOpacity <= 0.0)
    {
        isOpacityIncreasing = true;
    }

    if (isOpacityIncreasing)
    {
        setCurrentOpacity(m_currentOpacity + 0.03);
    }
    else
    {
        setCurrentOpacity(m_currentOpacity - 0.03);
    }
}
