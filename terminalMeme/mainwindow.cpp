#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSerialPort>

#include "QDebug"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->pushButton, SIGNAL(pressed()), this, SLOT(sendText()));
    serialPort = new QSerialPort();
    serialPort->setBaudRate(QSerialPort::Baud115200);
    serialPort->setDataBits(QSerialPort::Data8);
    serialPort->setFlowControl(QSerialPort::NoFlowControl);
    serialPort->setParity(QSerialPort::NoParity);
    serialPort->setStopBits(QSerialPort::OneStop);
    serialPort->setPortName("COM4");
    serialPort->open(QIODevice::ReadWrite);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::sendText(void){
    qDebug() << "MainWindow::sendText";
    QString tempString = ui->plainTextEdit->toPlainText();
    qDebug() << tempString;
    serialPort->write(tempString.toLatin1());
}
