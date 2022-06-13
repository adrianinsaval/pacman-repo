FROM archlinux/archlinux:base-devel

RUN pacman -Syu --noconfirm --needed base-devel ccache namcap

# FreeCAD depends
RUN pacman -S --noconfirm --needed boost-libs glew jsoncpp med netcdf \
        opencascade openmpi pyside2 pyside2-tools python-yaml \
        python-matplotlib python-pivy python-ply qt5-svg qt5-tools \
        qt5-webkit qt5-webengine qt5-webchannel qt5-x11extras \
        qt5-xmlpatterns qt5-base shared-mime-info xerces-c vtk
# FreeCAD makedepends
RUN pacman -S --noconfirm --needed boost cmake coin eigen git\
        ninja python-shiboken2 shiboken2 swig gendesk
# FreeCAD checkdepends and optional
RUN pacman -S --noconfirm --needed fmt pugixml libspnav povray

# clear cache to reduce size
RUN pacman -Scc --noconfirm

RUN useradd -mg wheel build
