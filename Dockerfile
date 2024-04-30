FROM archlinux/archlinux:base-devel

RUN pacman -Syu --noconfirm --needed base-devel ccache namcap \
        ; pacman -Scc --noconfirm

# FreeCAD depends
RUN pacman -S --noconfirm --needed boost-libs coin fmt glew jsoncpp \
        med-openmpi netcdf opencascade openmpi pyside6 pyside6-tools python-yaml \
        python-matplotlib python-pivy python-ply python-packaging qt6-svg \
        qt6-tools qt6-base qt6-5compat shared-mime-info verdict vtk xerces-c yaml-cpp \
        ; pacman -Scc --noconfirm
# FreeCAD makedepends
RUN pacman -S --noconfirm --needed boost cmake eigen git ninja nlohmann-json \
        shiboken6 swig gendesk fast_float \
        ; pacman -Scc --noconfirm
# FreeCAD checkdepends and optional
RUN pacman -S --noconfirm --needed pugixml libspnav \
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
