#ifndef VELOCITYVECTORCONTROLLER_H
#define VELOCITYVECTORCONTROLLER_H

#include <QObject>
#include <QTimer>

class VelocityVectorController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double xCoordinateWeight READ xCoordinateWeight WRITE setXCoordinateWeight NOTIFY xCoordinateWeightChanged)
    Q_PROPERTY(double yCoordinateWeight READ yCoordinateWeight WRITE setYCoordinateWeight NOTIFY yCoordinateWeightChanged)
public:
    explicit VelocityVectorController(QObject *parent = nullptr);
    double xCoordinateWeight() const;
    double yCoordinateWeight() const;

    Q_INVOKABLE void updateCoordinates();

signals:
    void xCoordinateWeightChanged(double xCoordinateWeight);
    void yCoordinateWeightChanged(double yCoordinateWeight);

public slots:
    void setXCoordinateWeight(double xCoordinateWeight);
    void setYCoordinateWeight(double yCoordinateWeight);

private:
    double m_xCoordinateWeight;
    double m_yCoordinateWeight;
    QTimer m_timer;

    int counter = 0;
    bool negativeFlagX = false;
    bool negativeFlagY = false;
};

#endif // VELOCITYVECTORCONTROLLER_H
