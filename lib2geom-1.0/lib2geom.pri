INCLUDEPATH += C:/local/boost_1_71_0
INCLUDEPATH += D:/PRO/QT/gsl-2.5.0
INCLUDEPATH += $$PWD/src
INCLUDEPATH += $$PWD

DEFINES += HAVE_GSL
DEFINES += CPP11
DEFINES += _USE_MATH_DEFINES

CONFIG(debug, debug|release){
    message("debug")
    TARGET = $$TARGET"_d"
    LIBS += "-lD:/QtPro/L2G/gsl/x32/Debug/gsl"
    LIBS += "-lD:/QtPro/L2G/gsl/x32/Debug/gslcblas"
#    LIBS += "-lD:/PRO/QT/gsl-2.5.0/Debug/gsl"
#    LIBS += "-lD:/PRO/QT/gsl-2.5.0/Debug/gslcblas"
}else{
    message("release")
    TARGET = $$TARGET"_r"
    LIBS += "-lD:/QtPro/L2G/gsl/x32/Release/gsl"
    LIBS += "-lD:/QtPro/L2G/gsl/x32/Release/gslcblas"
#    LIBS += "-lD:/PRO/QT/gsl-2.5.0/Release/gsl"
#    LIBS += "-lD:/PRO/QT/gsl-2.5.0/Release/gslcblas"
}
HEADERS += \
#    $$PWD/config.h \
#    $$PWD/src/2geom/2geom.h \
#    $$PWD/src/2geom/affine.h \
#    $$PWD/src/2geom/angle.h \
#    $$PWD/src/2geom/basic-intersection.h \
#    $$PWD/src/2geom/bezier-curve.h \
#    $$PWD/src/2geom/bezier-to-sbasis.h \
#    $$PWD/src/2geom/bezier-utils.h \
#    $$PWD/src/2geom/bezier.h \
##    $$PWD/src/2geom/cairo-path-sink.h \
#    $$PWD/src/2geom/choose.h \
#    $$PWD/src/2geom/circle.h \
#    $$PWD/src/2geom/concepts.h \
#    $$PWD/src/2geom/conic_section_clipper.h \
#    $$PWD/src/2geom/conic_section_clipper_cr.h \
#    $$PWD/src/2geom/conic_section_clipper_impl.h \
#    $$PWD/src/2geom/conicsec.h \
#    $$PWD/src/2geom/convex-hull.h \
#    $$PWD/src/2geom/coord.h \
#    $$PWD/src/2geom/crossing.h \
#    $$PWD/src/2geom/curve.h \
#    $$PWD/src/2geom/curves.h \
#    $$PWD/src/2geom/d2.h \
#    $$PWD/src/2geom/ellipse.h \
##    $$PWD/src/2geom/elliptical-arc.h \
#    $$PWD/src/2geom/exception.h \
#    $$PWD/src/2geom/forward.h \
#    $$PWD/src/2geom/generic-interval.h \
#    $$PWD/src/2geom/generic-rect.h \
#    $$PWD/src/2geom/geom.h \
#    $$PWD/src/2geom/int-interval.h \
#    $$PWD/src/2geom/int-point.h \
#    $$PWD/src/2geom/int-rect.h \
#    $$PWD/src/2geom/intersection-graph.h \
#    $$PWD/src/2geom/intersection.h \
#    $$PWD/src/2geom/interval.h \
#    $$PWD/src/2geom/intervaltree/interval_tree.h \
#    $$PWD/src/2geom/line.h \
#    $$PWD/src/2geom/linear.h \
#    $$PWD/src/2geom/math-utils.h \
#    $$PWD/src/2geom/nearest-time.h \
#    $$PWD/src/2geom/numeric/fitting-model.h \
#    $$PWD/src/2geom/numeric/fitting-tool.h \
#    $$PWD/src/2geom/numeric/linear_system.h \
#    $$PWD/src/2geom/numeric/matrix.h \
#    $$PWD/src/2geom/numeric/symmetric-matrix-fs-operation.h \
#    $$PWD/src/2geom/numeric/symmetric-matrix-fs-trace.h \
#    $$PWD/src/2geom/numeric/symmetric-matrix-fs.h \
#    $$PWD/src/2geom/numeric/vector.h \
#    $$PWD/src/2geom/ord.h \
##    $$PWD/src/2geom/orphan-code/arc-length.h \
##    $$PWD/src/2geom/orphan-code/chebyshev.h \
##    $$PWD/src/2geom/orphan-code/intersection-by-smashing.h \
##    $$PWD/src/2geom/orphan-code/linear-of.h \
##    $$PWD/src/2geom/orphan-code/linearN.h \
##    $$PWD/src/2geom/orphan-code/redblacktree.h \
##    $$PWD/src/2geom/orphan-code/rtree.h \
##    $$PWD/src/2geom/orphan-code/sbasis-of.h \
##    $$PWD/src/2geom/orphan-code/sbasisN.h \
#    $$PWD/src/2geom/path-intersection.h \
#    $$PWD/src/2geom/path-sink.h \
#    $$PWD/src/2geom/path.h \
#    $$PWD/src/2geom/pathvector.h \
#    $$PWD/src/2geom/piecewise.h \
#    $$PWD/src/2geom/point.h \
#    $$PWD/src/2geom/polynomial.h \
#    $$PWD/src/2geom/ray.h \
#    $$PWD/src/2geom/rect.h \
#    $$PWD/src/2geom/sbasis-2d.h \
#    $$PWD/src/2geom/sbasis-curve.h \
#    $$PWD/src/2geom/sbasis-geometric.h \
#    $$PWD/src/2geom/sbasis-math.h \
#    $$PWD/src/2geom/sbasis-poly.h \
#    $$PWD/src/2geom/sbasis-to-bezier.h \
#    $$PWD/src/2geom/sbasis.h \
#    $$PWD/src/2geom/solver.h \
##    $$PWD/src/2geom/svg-path-parser.h \
##    $$PWD/src/2geom/svg-path-writer.h \
#    $$PWD/src/2geom/sweep-bounds.h \
#    $$PWD/src/2geom/sweeper.h \
#    $$PWD/src/2geom/symbolic/determinant-minor.h \
#    $$PWD/src/2geom/symbolic/implicit.h \
#    $$PWD/src/2geom/symbolic/matrix.h \
#    $$PWD/src/2geom/symbolic/multi-index.h \
#    $$PWD/src/2geom/symbolic/multipoly.h \
#    $$PWD/src/2geom/symbolic/mvpoly-tools.h \
#    $$PWD/src/2geom/symbolic/polynomial.h \
#    $$PWD/src/2geom/symbolic/unity-builder.h \
#    $$PWD/src/2geom/transforms.h \
#    $$PWD/src/2geom/utils.h

SOURCES += \
    $$PWD/src/2geom/affine.cpp \
    $$PWD/src/2geom/basic-intersection.cpp \
    $$PWD/src/2geom/bezier-clipping.cpp \
    $$PWD/src/2geom/bezier-curve.cpp \
    $$PWD/src/2geom/bezier-utils.cpp \
    $$PWD/src/2geom/bezier.cpp \
#    $$PWD/src/2geom/cairo-path-sink.cpp \
    $$PWD/src/2geom/circle.cpp \
    $$PWD/src/2geom/concepts.cpp \
    $$PWD/src/2geom/conic_section_clipper_impl.cpp \
    $$PWD/src/2geom/conicsec.cpp \
    $$PWD/src/2geom/convex-hull.cpp \
    $$PWD/src/2geom/coord.cpp \
    $$PWD/src/2geom/crossing.cpp \
    $$PWD/src/2geom/curve.cpp \
    $$PWD/src/2geom/d2-sbasis.cpp \
    $$PWD/src/2geom/doxygen.cpp \
    $$PWD/src/2geom/ellipse.cpp \
    $$PWD/src/2geom/elliptical-arc-from-sbasis.cpp \
    $$PWD/src/2geom/elliptical-arc.cpp \
    $$PWD/src/2geom/geom.cpp \
    $$PWD/src/2geom/intersection-graph.cpp \
    $$PWD/src/2geom/intervaltree/interval_tree.cc \
    $$PWD/src/2geom/line.cpp \
    $$PWD/src/2geom/nearest-time.cpp \
    $$PWD/src/2geom/numeric/matrix.cpp \
#    $$PWD/src/2geom/orphan-code/arc-length.cpp \
#    $$PWD/src/2geom/orphan-code/chebyshev.cpp \
#    $$PWD/src/2geom/orphan-code/intersection-by-bezier-clipping.cpp \
#    $$PWD/src/2geom/orphan-code/intersection-by-smashing.cpp \
#    $$PWD/src/2geom/orphan-code/nearestpoint.cpp \
#    $$PWD/src/2geom/orphan-code/redblack-toy.cpp \
#    $$PWD/src/2geom/orphan-code/redblacktree.cpp \
#    $$PWD/src/2geom/orphan-code/rtree.cpp \
    $$PWD/src/2geom/path-intersection.cpp \
    $$PWD/src/2geom/path-sink.cpp \
    $$PWD/src/2geom/path.cpp \
    $$PWD/src/2geom/pathvector.cpp \
    $$PWD/src/2geom/piecewise.cpp \
    $$PWD/src/2geom/point.cpp \
    $$PWD/src/2geom/polynomial.cpp \
    $$PWD/src/2geom/rect.cpp \
    $$PWD/src/2geom/recursive-bezier-intersection.cpp \
    $$PWD/src/2geom/sbasis-2d.cpp \
    $$PWD/src/2geom/sbasis-geometric.cpp \
    $$PWD/src/2geom/sbasis-math.cpp \
    $$PWD/src/2geom/sbasis-poly.cpp \
    $$PWD/src/2geom/sbasis-roots.cpp \
    $$PWD/src/2geom/sbasis-to-bezier.cpp \
    $$PWD/src/2geom/sbasis.cpp \
    $$PWD/src/2geom/solve-bezier-one-d.cpp \
    $$PWD/src/2geom/solve-bezier-parametric.cpp \
    $$PWD/src/2geom/solve-bezier.cpp \
#    $$PWD/src/2geom/svg-path-parser.cpp \
#    $$PWD/src/2geom/svg-path-writer.cpp \
    $$PWD/src/2geom/sweep-bounds.cpp \
    $$PWD/src/2geom/transforms.cpp \
    $$PWD/src/2geom/utils.cpp
