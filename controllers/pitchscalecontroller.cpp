#include "pitchscalecontroller.h"

PitchScaleController::PitchScaleController(QObject *parent) 
    : QObject(parent),
    m_currentPitch(0),
    m_currentInclination(0),
    m_currentXCoordinate(0),
    m_currentYCoordinate(0)
{
    connect(&m_timer, &QTimer::timeout, this, &PitchScaleController::updatePitch);
    connect(&m_timer, &QTimer::timeout, this, &PitchScaleController::updateInclination);
    connect(&m_timer, &QTimer::timeout, this, &PitchScaleController::updateXCoordinate);
    //connect(&m_timer, &QTimer::timeout, this, &PitchScaleController::updateYCoordinate);
    m_timer.start(50);
}

int PitchScaleController::currentPitch() const
{
    return m_currentPitch;
}

int PitchScaleController::currentInclination() const
{
    return m_currentInclination;
}

int PitchScaleController::currentXCoordinate() const
{
    return m_currentXCoordinate;
}

int PitchScaleController::currentYCoordinate() const
{
    return m_currentYCoordinate;
}

void PitchScaleController::setCurrentPitch(int currentPitch)
{
    if (m_currentPitch == currentPitch)
        return;

    m_currentPitch = currentPitch;
    emit currentPitchChanged(m_currentPitch);
}

void PitchScaleController::setCurrentInclination(int currentInclination)
{
    if (m_currentInclination == currentInclination)
        return;

    m_currentInclination = currentInclination;
    emit currentInclinationChanged(m_currentInclination);
}

void PitchScaleController::setCurrentXCoordinate(int currentXCoordinate)
{
    if (m_currentXCoordinate == currentXCoordinate)
        return;

    m_currentXCoordinate = currentXCoordinate;
    emit currentXCoordinateChanged(m_currentXCoordinate);
}

void PitchScaleController::setCurrentYCoordinate(int currentYCoordinate)
{
    if (m_currentYCoordinate == currentYCoordinate)
        return;

    m_currentYCoordinate = currentYCoordinate;
    emit currentYCoordinateChanged(m_currentYCoordinate);
}

void PitchScaleController::updatePitch()
{
    if(m_currentPitch >= 30*4)
    {
        isPitchIncreasing = false;
    }
    else if(m_currentPitch <= -30*4)
    {
        isPitchIncreasing = true;
    }

    if(isPitchIncreasing)
    {
        setCurrentPitch(m_currentPitch + 1);
    }
    else
    {
        setCurrentPitch(m_currentPitch - 1);
    }
}

int counter = 0;

void PitchScaleController::updateInclination()
{ 
    if(m_currentInclination >= 150)
    {
        isInclinationIncreasing = false;
    }
    else if(m_currentInclination <= -150)
    {
        isInclinationIncreasing = true;
    }

    if(isInclinationIncreasing)
    {
        setCurrentInclination(m_currentInclination + 1);
    }
    else
    {
        setCurrentInclination(m_currentInclination - 1);
    }
}

void PitchScaleController::updateXCoordinate()
{   
    if(m_currentXCoordinate >= 20)
    {
        setCurrentXCoordinate(19);
    }
    else if(m_currentXCoordinate <= -20)
    {
        setCurrentXCoordinate(-19);
    }

    if(isInclinationIncreasing)
    {
        setCurrentXCoordinate(m_currentXCoordinate + 1);
    }
    else
    {
        setCurrentXCoordinate(m_currentXCoordinate - 1);
    }
}

void PitchScaleController::updateYCoordinate()
{

}
