#ifndef AIRSPEEDSCALECONTROLLER_H
#define AIRSPEEDSCALECONTROLLER_H

#include <QObject>
#include <QTimer>

class AirspeedScaleController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentAirspeed READ currentAirspeed WRITE setCurrentAirspeed NOTIFY currentAirspeedChanged)
public:
    explicit AirspeedScaleController(QObject *parent = nullptr);
    int currentAirspeed() const;
    Q_INVOKABLE void updateAirspeed();

signals:
    void currentAirspeedChanged(int currentAirspeed);

public slots:
    void setCurrentAirspeed(int currentAirspeed);

private:
    int m_currentAirspeed;
    QTimer m_timer;
};

#endif // AIRSPEEDSCALECONTROLLER_H
