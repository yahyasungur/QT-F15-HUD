#include "velocityvectorcontroller.h"

VelocityVectorController::VelocityVectorController(QObject *parent)
    : QObject(parent)
    , m_xCoordinateWeight(0.5)
    , m_yCoordinateWeight(0.7)
{
    connect(&m_timer, &QTimer::timeout, this, &VelocityVectorController::updateCoordinates);
    m_timer.start(50);
}

double VelocityVectorController::xCoordinateWeight() const
{
    return m_xCoordinateWeight;
}

double VelocityVectorController::yCoordinateWeight() const
{
    return m_yCoordinateWeight;
}

void VelocityVectorController::setXCoordinateWeight(double xCoordinateWeight)
{
    if (qFuzzyCompare(m_xCoordinateWeight, xCoordinateWeight))
        return;

    m_xCoordinateWeight = xCoordinateWeight;
    emit xCoordinateWeightChanged(m_xCoordinateWeight);
}

void VelocityVectorController::setYCoordinateWeight(double yCoordinateWeight)
{
    if (qFuzzyCompare(m_yCoordinateWeight, yCoordinateWeight))
        return;

    m_yCoordinateWeight = yCoordinateWeight;
    emit yCoordinateWeightChanged(m_yCoordinateWeight);
}

void VelocityVectorController::updateCoordinates()
{
    if(m_xCoordinateWeight >= 0.8)
    {
        negativeFlagX = true;
    }
    else if(m_xCoordinateWeight <= 0.2)
    {
        negativeFlagX = false;
    }
    else
    {
    }

    if(m_yCoordinateWeight >= 0.9)
    {
        negativeFlagY = true;
    }
    else if(m_yCoordinateWeight <= 0.49)
    {
        negativeFlagY = false;
    }
    else
    {
    }

    if(counter > 35)
    {
        rand() % 2 == 0 ? negativeFlagX = true : negativeFlagX = false;
        rand() % 2 == 0 ? negativeFlagY = true : negativeFlagY = false;
        counter = 0;
    }

    counter++;

    negativeFlagX ? setXCoordinateWeight(m_xCoordinateWeight - 0.01) : setXCoordinateWeight(m_xCoordinateWeight + 0.01);
    negativeFlagY ? setYCoordinateWeight(m_yCoordinateWeight - 0.01) : setYCoordinateWeight(m_yCoordinateWeight + 0.01);
}
