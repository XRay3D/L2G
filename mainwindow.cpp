#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QGraphicsPolygonItem>
#include <QtDebug>

#include <2geom/angle.h>
//#include <2geom/ellipse.h>
#include <2geom/bezier.h>
#include <2geom/circle.h>
#include <2geom/ellipse.h>
#include <2geom/elliptical-arc.h>
#include <2geom/intersection-graph.h>
#include <2geom/intersection.h>

using namespace Geom;

MainWindow::MainWindow(QWidget* parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->graphicsView->setScene(scene = new QGraphicsScene(ui->graphicsView));
    ui->graphicsView->scene()->setObjectName("scene");
    draw();

    //    Path p1(Circle({ 0, 0 }, 2));
    //    Path p2(Circle({ 1, 1 }, 2));

    //    PathIntersectionGraph pi({ p1 }, { p2 });
    //    auto r = pi.getXOR();
    //    qDebug() << r.size();

    //    auto c = p1.intersect(p2);
    //    qDebug() << c.size();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::draw()
{
    //    PathVector as, bs;
    Line ah({ -1, -1 }, { +1, +1 });
    Line bh({ +1, -1 }, { -1, +1 });

    Line aht({ -1, -1 }, { +1, +1 });
    Line bht({ +1, -1 }, { -1, +1 });

    //    PathVector ast = as * ah.transformTo(aht);
    //    PathVector bst = bs * bh.transformTo(bht);

    //    Timer tm;
    //    tm.start();

    PathVector ast(Path(Rect(Point { -0.5, -0.5 }, { +1.0, +1.0 })));
    //    Path p2(Rect(Point { -1.0, -1.0 }, { +0.5, +0.5 }));
    PathVector bst(Path(Ellipse(Circle(Point { +0.6, +0.6 }, 0.8))));

    //        PathVector ast(Path(Ellipse(Circle({ 0, 0 }, 1))));
    //        PathVector bst(Path(Ellipse(Circle({ 1, 1 }, 1))));

    //    ast *= PathVector(Path(Circle({ 0, 0 }, 0.1)));

    PathIntersectionGraph pig(ast, bst);

    std::vector<Point> dix, ix, wpoints;

    ix = pig.intersectionPoints();
    dix = pig.intersectionPoints(true);
    wpoints = pig.windingPoints();

    PathVector result, f_in, f_out;
    int c = 0;
    if (pig.valid()) {
        qDebug() << "valid";
        for (int i = 0; i < 7; ++i) {
            if (i == 0)
                result = pig.getXOR();
            if (i == 1)
                result = pig.getIntersection();
            if (i == 2)
                result = pig.getBminusA();
            if (i == 3)
                result = pig.getUnion();
            if (i == 4)
                result = pig.getAminusB();
            if (i == 5)
                result = ast;
            if (i == 6)
                result = bst;
            qDebug() << i << result.size();
            for (auto& var : result) {
                QPolygonF p;
                for (auto& v : var) {
                    if (v.isLineSegment()) {
                        qDebug() << "LineSegment";
                        auto p1 = v.pointAt(0);
                        p.append({ p1.x(), p1.y() });
                        p1 = v.pointAt(1);
                        p.append({ p1.x(), p1.y() });
                        continue;
                    } else if (dynamic_cast<const BezierCurve*>(&v))
                        qDebug() << "BezierCurve";
                    else if (auto a = dynamic_cast<const EllipticalArc*>(&v); a) {
                        qDebug() << "EllipticalArc";
                        std::cout << a->center() << std::endl;
                        std::cout << a->initialAngle() * 180 / M_PI << std::endl;
                        std::cout << a->finalAngle() * 180 / M_PI << std::endl;
                    } else if (dynamic_cast<const LineSegment*>(&v))
                        qDebug() << "LineSegment";
                    else if (dynamic_cast<const SBasisCurve*>(&v))
                        qDebug() << "SBasisCurve";

                    //                    for (auto& p1 : v.pointAndDerivatives(0.1, 10)) {
                    for (double j = 0; j <= 1; j += 0.01) {
                        auto p1 = v.pointAt(j);
                        p.append({ p1.x(), p1.y() });
                    }
                }
                scene->addPolygon(p, Qt::NoPen, c % 2 ? Qt::red : Qt::blue)->setPos(i * 3, 0);
                ++c;
            }
        }
    }

    pig.fragments(f_in, f_out);
    qDebug() << "f_in" << f_in.size();
    for (auto& var : f_in) {
        QPolygonF p;
        qDebug() << var.size();
        for (auto& v : var) {
            if (v.isLineSegment()) {
                qDebug() << "LineSegment";
                auto p1 = v.pointAt(0);
                p.append({ p1.x(), p1.y() });
                p1 = v.pointAt(1);
                p.append({ p1.x(), p1.y() });
                continue;
            }
            if (dynamic_cast<const EllipticalArc*>(&v))
                qDebug() << "EllipticalArc";
            for (double j = 0; j <= 1; j += 0.01) {
                auto p1 = v.pointAt(j);
                p.append({ p1.x(), p1.y() });
            }
        }
        scene->addPolygon(p, Qt::NoPen, c % 2 ? Qt::red : Qt::blue)->setPos(0, 3);
        ++c;
    }
    qDebug() << "f_out" << f_out.size();
    for (auto& var : f_out) {
        QPolygonF p;
        qDebug() << var.size();
        for (auto& v : var) {
            if (v.isLineSegment()) {
                qDebug() << "LineSegment";
                auto p1 = v.pointAt(0);
                p.append({ p1.x(), p1.y() });
                p1 = v.pointAt(1);
                p.append({ p1.x(), p1.y() });
                continue;
            }
            if (auto a = dynamic_cast<const EllipticalArc*>(&v); a) {
                std::cout << a->center() << std::endl;
                std::cout << a->initialAngle() * 180 / M_PI << std::endl;
                std::cout << a->finalAngle() * 180 / M_PI << std::endl;
                qDebug() << "EllipticalArc";
                for (double j = 0; j <= 1; j += 0.01) {
                    auto p1 = v.pointAt(j);
                    p.append({ p1.x(), p1.y() });
                }
            }
        }
        scene->addPolygon(p, Qt::NoPen, c % 2 ? Qt::red : Qt::blue)->setPos(0, 6);
        ++c;
    }

    QPointF p { 0.02, 0.02 };
    for (auto& pvar : dix) { // intersectionPoints(true);
        scene->addEllipse({ QPointF { pvar.x(), pvar.y() } + p, QPointF { pvar.x(), pvar.y() } - p }, QPen(Qt::red, 0.0), QColor(255, 0, 0, 100));
    }
    for (auto& pvar : ix) { // intersectionPoints();
        scene->addEllipse({ QPointF { pvar.x(), pvar.y() } + p, QPointF { pvar.x(), pvar.y() } - p }, QPen(Qt::green, 0.0), QColor(0, 255, 0, 100));
    }
    for (auto& pvar : wpoints) { // windingPoints();
        scene->addEllipse({ QPointF { pvar.x(), pvar.y() } + p, QPointF { pvar.x(), pvar.y() } - p }, QPen(Qt::blue, 0.0), QColor(0, 0, 255, 100));
    }
}

void MainWindow::draw2()
{

    //    PathVector as, bs;
    Line ah({ -1, -1 }, { +1, +1 });
    Line bh({ +1, -2 }, { -1, +1 });

    Line aht({ -10, -10 }, { +10, +10 });
    Line bht({ +1, -1 }, { -1, +1 });

    PathVector ast(Path(Rect(Point { -0.5, -0.5 }, { +1.0, +1.0 })));
    PathVector bst(Path(Ellipse(Circle(Point { +0.6, +0.6 }, 0.8))));

    //ast *= ah.transformTo(aht);
    Affine a;
    Rotate r(45 * (M_PI / 180));
    ast *= r;

    int c = 0;
    for (auto& var : ast) {
        QPolygonF p;
        qDebug() << var.size();
        for (auto& v : var) {
            if (v.isLineSegment()) {
                qDebug() << "LineSegment";
                auto p1 = v.pointAt(0);
                p.append({ p1.x(), p1.y() });
                p1 = v.pointAt(1);
                p.append({ p1.x(), p1.y() });
                continue;
            }
            if (auto a = dynamic_cast<const EllipticalArc*>(&v); a) {
                std::cout << a->center() << std::endl;
                std::cout << a->initialAngle() * 180 / M_PI << std::endl;
                std::cout << a->finalAngle() * 180 / M_PI << std::endl;
                qDebug() << "EllipticalArc";
                for (double j = 0; j <= 1; j += 0.01) {
                    auto p1 = v.pointAt(j);
                    p.append({ p1.x(), p1.y() });
                }
            }
        }
        scene->addPolygon(p, Qt::NoPen, c % 2 ? Qt::red : Qt::blue)->setPos(0, 6);
        ++c;
    }
    for (auto& var : bst) {
        break;
        QPolygonF p;
        qDebug() << var.size();
        for (auto& v : var) {
            if (v.isLineSegment()) {
                qDebug() << "LineSegment";
                auto p1 = v.pointAt(0);
                p.append({ p1.x(), p1.y() });
                p1 = v.pointAt(1);
                p.append({ p1.x(), p1.y() });
                continue;
            }
            if (auto a = dynamic_cast<const EllipticalArc*>(&v); a) {
                std::cout << a->center() << std::endl;
                std::cout << a->initialAngle() * 180 / M_PI << std::endl;
                std::cout << a->finalAngle() * 180 / M_PI << std::endl;
                qDebug() << "EllipticalArc";
                for (double j = 0; j <= 1; j += 0.01) {
                    auto p1 = v.pointAt(j);
                    p.append({ p1.x(), p1.y() });
                }
            }
        }
        scene->addPolygon(p, Qt::NoPen, c % 2 ? Qt::red : Qt::blue)->setPos(0, 6);
        ++c;
    }
    //    Timer tm;
    //    tm.start();
}

void MainWindow::showEvent(QShowEvent* event)
{
    QMainWindow::showEvent(event);
    ui->graphicsView->fitInView(scene->itemsBoundingRect(), Qt::KeepAspectRatio);
}
