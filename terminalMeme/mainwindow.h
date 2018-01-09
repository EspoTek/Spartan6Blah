#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class QSerialPort;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    QSerialPort *serialPort;
private slots:
    void sendText(void);
};

#endif // MAINWINDOW_H
