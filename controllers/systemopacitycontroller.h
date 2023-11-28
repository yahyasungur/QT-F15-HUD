#ifndef SYSTEMOPACITYCONTROLLER_H
#define SYSTEMOPACITYCONTROLLER_H

#include <QObject>
#include <QTimer>

class SystemOpacityController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double currentOpacity READ currentOpacity WRITE setCurrentOpacity NOTIFY currentOpacityChanged)
public:
    explicit SystemOpacityController(QObject *parent = nullptr);

    double currentOpacity() const;
    Q_INVOKABLE void updateOpacity();

signals:
    void currentOpacityChanged(double currentOpacity);

public slots:
    void setCurrentOpacity(double currentOpacity);

private:
    double m_currentOpacity;
    QTimer m_timer;

    bool isOpacityIncreasing = true;
};

#endif // SYSTEMOPACITYCONTROLLER_H
