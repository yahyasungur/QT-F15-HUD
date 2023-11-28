#ifndef PITCHSCALECONTROLLER_H
#define PITCHSCALECONTROLLER_H

#include <QObject>
#include <QTimer>

class PitchScaleController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentPitch READ currentPitch WRITE setCurrentPitch NOTIFY currentPitchChanged)
    Q_PROPERTY(int currentInclination READ currentInclination WRITE setCurrentInclination NOTIFY currentInclinationChanged)
    Q_PROPERTY(int currentXCoordinate READ currentXCoordinate WRITE setCurrentXCoordinate NOTIFY currentXCoordinateChanged)
    Q_PROPERTY(int currentYCoordinate READ currentYCoordinate WRITE setCurrentYCoordinate NOTIFY currentYCoordinateChanged)

public:
    explicit PitchScaleController(QObject *parent = nullptr);

    int currentPitch() const;
    int currentInclination() const;
    int currentXCoordinate() const;
    int currentYCoordinate() const;

    Q_INVOKABLE void updatePitch();
    Q_INVOKABLE void updateInclination();
    Q_INVOKABLE void updateXCoordinate();
    Q_INVOKABLE void updateYCoordinate();

signals:
    void currentPitchChanged(int currentPitch);
    void currentInclinationChanged(int currentInclination);
    void currentXCoordinateChanged(int currentXCoordinate);
    void currentYCoordinateChanged(int currentYCoordinate);

public slots:
    void setCurrentPitch(int currentPitch);
    void setCurrentInclination(int currentInclination);
    void setCurrentXCoordinate(int currentXCoordinate);
    void setCurrentYCoordinate(int currentYCoordinate);

private:
    int m_currentPitch;
    int m_currentInclination;
    int m_currentXCoordinate;
    int m_currentYCoordinate;
    QTimer m_timer;

    bool isPitchIncreasing = true;
    bool isInclinationIncreasing = true;
};

#endif // PITCHSCALECONTROLLER_H
