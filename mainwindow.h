#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE

class QGraphicsScene;
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
    MainWindow(QWidget* parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow* ui;
    QGraphicsScene* scene;
    void draw();
    void draw2();

    // QWidget interface
protected:
    void showEvent(QShowEvent *event) override;
};
#endif // MAINWINDOW_H
