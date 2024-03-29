FROM archlinux/archlinux:base-devel

RUN pacman -Syu --noconfirm --needed base-devel ccache namcap \
        ; pacman -Scc --noconfirm

# FreeCAD depends
RUN pacman -S --noconfirm --needed boost-libs fmt glew jsoncpp med-openmpi \
        netcdf opencascade openmpi pyside2 pyside2-tools python-yaml \
        python-matplotlib python-pivy python-ply python-packaging \
        qt5-svg qt5-tools qt5-webengine qt5-webchannel qt5-x11extras \
        qt5-xmlpatterns qt5-base shared-mime-info xerces-c vtk adios2 verdict fast_float \
        ; pacman -Scc --noconfirm
# FreeCAD makedepends
RUN pacman -S --noconfirm --needed boost cmake coin eigen git\
        ninja python-shiboken2 shiboken2 swig gendesk \
        ; pacman -Scc --noconfirm
# FreeCAD checkdepends and optional
RUN pacman -S --noconfirm --needed pugixml libspnav povray \
        ; pacman -Scc --noconfirm

# xflr5
# RUN pacman -S --noconfirm --needed qt5-base

# parmetis
# RUN pacman -S --noconfirm --needed openmpi metis

# scotch
# RUN pacman -S --noconfirm --needed openmpi zlib bzip2

# openfoam-com
# RUN pacman -S --noconfirm --needed openmpi gcc cgal fftw boost \
#        paraview utf8cpp scotch parmetis

# gmsh depends
# RUN pacman -S --noconfirm --needed fltk med-openmpi opencascade cairo \
#        metis alglib glu cgns lapack ann

# gmsh makedepends
# RUN pacman -S --noconfirm --needed cmake desktop-file-utils sed swig \
#        texlive-core voro++ fltk med opencascade cairo metis alglib \
#        ann glu cgns lapack

RUN useradd -mg wheel build
