#ifndef ALTITUDESCALECONTROLLER_H
#define ALTITUDESCALECONTROLLER_H

#include <QObject>
#include <QTimer>

class AltitudeScaleController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentAltitude READ currentAltitude WRITE setCurrentAltitude NOTIFY currentAltitudeChanged)
public:
    explicit AltitudeScaleController(QObject *parent = nullptr);
    int currentAltitude() const;
    Q_INVOKABLE void updateAltitude();

signals:
    void currentAltitudeChanged(int currentAltitude);

public slots:
    void setCurrentAltitude(int currentAltitude);

private:
    int m_currentAltitude;
    QTimer m_timer;
};

#endif // ALTITUDESCALECONTROLLER_H