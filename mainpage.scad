//! Documentation main page.
/***************************************************************************//**
  \file   mainpage.scad
  \author Roy Allen Sutton
  \date   2015-2017

  \copyright

    This file is part of [omdl] (https://github.com/royasutton/omdl),
    an OpenSCAD mechanical design library.

    The \em omdl is free software; you can redistribute it and/or modify
    it under the terms of the [GNU Lesser General Public License]
    (http://www.gnu.org/licenses/lgpl.html) as published by the Free
    Software Foundation; either version 2.1 of the License, or (at
    your option) any later version.

    The \em omdl is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with the \em omdl; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
    02110-1301, USA; or see <http://www.gnu.org/licenses/>.

*******************************************************************************/

/***************************************************************************//**
  \mainpage omdl
  \tableofcontents

    A collection of documented design primitives for [OpenSCAD]
    inspired by *MCAD*.

  \section what_is_omdl What is omdl?

    It is an [OpenSCAD] mechanical design library ([omdl]) that aims to
    offer open-source high-level design primitives with coherent
    documentation generated by [Doxygen] using [openscad-amu].

    With [Doxygen], the code documentation is written within the code
    itself, and is thus easy to keep current. Moreover, it provides a
    standard way to both write and present [OpenSCAD] script
    documentation, compilable to multiple common output formats.

    With [omdl], all library primitives are \em parametric with
    minimal, mostly zero, global variable dependencies and all library
    API's include [Doxygen markups] that describe its parameters,
    behavior, and use. Validation scripts are used to check that the
    core building blocks work as expected across evolving [OpenSCAD]
    versions. These validation are performed automatically when
    rebuilding the documentation.

    See the \ref validation "validation section" for the results
    generated with this documentation.

  \section quickstart Quick Start

    The library components may be \c used or \c included as expected.

    \b Example:

    \dontinclude mainpage_quickstart.scad
    \skip include
    \until valign="center" );

    \amu_make png_files (append=quickstart extension=png)
    \amu_make eps_files (append=quickstart extension=png2eps)
    \amu_make stl_files (append=quickstart extension=stl)

    \htmlonly
      \amu_image_table
        (
          type=html columns=4 image_width="200" table_caption="Example Result"
          cell_captions="Bottom^Diagonal^Right^Top"
          cell_files="${png_files}"
          cell_urls="${stl_files} ${stl_files} ${stl_files} ${stl_files}"
        )
    \endhtmlonly
    \latexonly
      \amu_image_table
        (
          type=latex columns=4 image_width="1.25in" table_caption="Example Result"
          cell_captions="Bottom^Diagonal^Right^Top"
          cell_files="${eps_files}"
        )
    \endlatexonly

  \section using Using omdl

    To use [omdl] the library files must be copied to one of the
    [OpenSCAD Library Locations]. This can be done manually, as
    described in the [OpenSCAD] documentation, or can be automated
    using [openscad-amu].

    The ladder is recommended and has several advantages. When using
    [openscad-amu], the library reference documentation is installed
    together with the library source code. This reference documentation
    is also added to a browsable data-table of installed libraries,
    which facilitates design reference searches. Moreover, with
    [openscad-amu] installed, one can rebuild the [omdl] reference
    manual or develop documentation for new [OpenSCAD] designs.

    Library release files are made available in the source [repository]
    in a sub-directory called *snapshots*.

  \subsection openscad-amu Recommended install method

    More information on installing [openscad-amu] can be found
    [published](http://www.thingiverse.com/thing:1858181) on
    [Thingiverse] and in the GitHib [openscad-amu repository] where the
    source is maintained.

    A build script exists for \em Linux and \em Cygwin (pull requests
    for \em macos are welcome). If \c wget is not available, here is a
    downloadable link to the [bootstrap script].

    \verbatim
    $ mkdir tmp && cd tmp

    $ wget https://raw.githubusercontent.com/royasutton/openscad-amu/master/snapshots/bootstrap.{bash,conf} .
    $ chmod +x bootstrap.bash

    $ ./bootstrap.bash --yes --install

    $ openscad-seam -v -V
    \endverbatim

    If the last step reports the tool build version, then the install
    most likely completed successfully and the temporary directory
    created in the first step may be removed when desired.

    Now the documentation for [omdl] can be compiled and installed with
    a single command. First download the source from [Thingiverse] or
    clone the source repository and install as follows:

    \verbatim
    $ git clone https://github.com/royasutton/omdl.git
    $ cd omdl

    $ make install
    \endverbatim

    The library and documentation should now have been installed to the
    [OpenSCAD] \em built-in library location along with the reference
    manual that can be views with a web browser.

    Have a look in:
    \li \b Linux: $HOME/.local/share/OpenSCAD/libraries
    \li \b Windows: My Documents\\\\OpenSCAD\\\\libraries

    Now you may include the desired library primitives in your project
    as follows, replacing the version number as needed (multiple
    version of a library may coexists):

    \verbatim
    include <omdl-v0.4/shapes2de.scad>;
    include <omdl-v0.4/shapes3d.scad>;
    ...
    \endverbatim

  \section contributing Contributing

    [omdl] uses [git] for development tracking, and is hosted on
    [GitHub] following the usual practice of [forking] and submitting
    [pull requests] to the source repository.

    As it is released under the [GNU Lesser General Public License],
    any file you change should bear your copyright notice alongside the
    original authors' copyright notices typically located at the top of
    each file.

    Ideas, requests, comments, contributions, and constructive
    criticism are welcome.

  \section support Contact and Support

    In case you have any questions or would like to make feature
    requests, you can contact the maintainer of the project or file an
    [issue].


  [GNU Lesser General Public License]: https://www.gnu.org/licenses/lgpl.html

  [omdl]: https://royasutton.github.io/omdl
  [repository]: https://github.com/royasutton/omdl
  [issue]: https://github.com/royasutton/omdl/issues

  [openscad-amu]: https://royasutton.github.io/openscad-amu
  [openscad-amu repository]: https://github.com/royasutton/openscad-amu
  [bootstrap script]: https://raw.githubusercontent.com/royasutton/openscad-amu/master/snapshots/bootstrap.bash

  [Doxygen]: http://www.stack.nl/~dimitri/doxygen/index.html
  [Doxygen markups]: http://www.stack.nl/~dimitri/doxygen/manual/commands.html

  [OpenSCAD]: http://www.openscad.org
  [OpenSCAD Library Locations]: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries

  [Thingiverse]: http://www.thingiverse.com

  [git]: http://git-scm.com
  [GitHub]: http://github.com
  [forking]: http://help.github.com/forking
  [pull requests]: https://help.github.com/articles/about-pull-requests/

*******************************************************************************/

// validation results root page.
/***************************************************************************//**
  \page validation Validation
    \li \subpage tv_prim
    \li \subpage tv_math
*******************************************************************************/

// base group categories.
/***************************************************************************//**
  \defgroup constants Constants
  \brief    General design constants.
*******************************************************************************/

/***************************************************************************//**
  \defgroup containers Containers
  \brief    Data container storage and reference.
*******************************************************************************/

/***************************************************************************//**
  \defgroup database Database
  \brief    Design specifications stored in data containers.

  \addtogroup database
  @{

  \defgroup database_components Components
  \brief    Components specifications.

  \defgroup database_electrical Electrical
  \brief    Electrical specifications.

  \defgroup database_geometry Geometry
  \brief    Predefined geometry.

  \defgroup database_materials Materials
  \brief    Material specifications.

  @}
*******************************************************************************/

/***************************************************************************//**
  \defgroup math Math
  \brief    Mathematical functions.
*******************************************************************************/

/***************************************************************************//**
  \defgroup parts Parts
  \brief    Parametric parts and assemblies.
*******************************************************************************/

/***************************************************************************//**
  \defgroup shapes Shapes
  \brief    2D and 3D shapes.
*******************************************************************************/

/***************************************************************************//**
  \defgroup tools Tools
  \brief    Design tools and techniques.
*******************************************************************************/

/***************************************************************************//**
  \defgroup transforms Transformations
  \brief    Shape transformations.
*******************************************************************************/

/***************************************************************************//**
  \defgroup units Units
  \brief    Units and unit conversions.
*******************************************************************************/

/***************************************************************************//**
  \defgroup utilities Utilities
  \brief General utilities.
*******************************************************************************/

//----------------------------------------------------------------------------//
// openscad-amu auxiliary scripts
//----------------------------------------------------------------------------//

/*
BEGIN_SCOPE logo;
  BEGIN_OPENSCAD;
    include <shapes2de.scad>;
    include <shapes3d.scad>;

    $fn = 36;

    frame = triangle_vp2vl( [ [30,0], [0,40], [30,40] ] );
    core  = 2 * frame / 3;
    vrnd  = [1, 2, 4];

    cone( h=20, r=10, vr=2 );
    rotate([0, 0, 360/20])
    st_radial_copy( n=5, angle=true )
      etriangle_vl_c( vs=frame, vc=core, vr=vrnd, h=10 );
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_png}.mfs;

    views     name "views" distance "250" views "top";
    images    name "slogo" aspect "1:1" xsizes "55";
    variables set_opts_combine "views slogo";

    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;

BEGIN_SCOPE quickstart;
  BEGIN_OPENSCAD;
    include <shapes2de.scad>;
    include <shapes3d.scad>;

    $fn = 36;

    frame = triangle_vp2vl( [ [30,0], [0,40], [30,40] ] );
    core  = 2 * frame / 3;
    vrnd  = [1, 2, 4];

    cone( h=20, r=10, vr=2 );
    rotate([0, 0, 360/20])
    st_radial_copy( n=5, angle=true )
      etriangle_vl_c( vs=frame, vc=core, vr=vrnd, h=10 );

    translate([0, -50,0])
    linear_extrude(height=10)
    text( text="omdl", size=20, halign="center", valign="center" );
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_png}.mfs;

    views     name "views" views "top bottom right diag";
    variables add_opts_combine "views";
    variables add_opts "--viewall --autocenter";

    include --path "${INCLUDE_PATH}" script_new.mfs;

    include --path "${INCLUDE_PATH}" config_stl.mfs;
    include --path "${INCLUDE_PATH}" script_app.mfs;
  END_MFSCRIPT;
END_SCOPE;
*/

//----------------------------------------------------------------------------//
// end of file
//----------------------------------------------------------------------------//
