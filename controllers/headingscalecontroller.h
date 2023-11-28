#ifndef HEADINGSCALECONTROLLER_H
#define HEADINGSCALECONTROLLER_H

#include <QObject>
#include <QTimer>

class HeadingScaleController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentHeading READ currentHeading WRITE setCurrentHeading NOTIFY currentHeadingChanged)
public:
    explicit HeadingScaleController(QObject *parent = nullptr);
    int currentHeading() const;
    Q_INVOKABLE void updateHeading();

signals:
    void currentHeadingChanged(int currentHeading);

public slots:
    void setCurrentHeading(int currentHeading);

private:
    int m_currentHeading;
    QTimer m_timer;
};

#endif // HEADINGSCALECONTROLLER_H