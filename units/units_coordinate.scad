//! Coordinate systems and conversions.
/***************************************************************************//**
  \file
  \author Roy Allen Sutton
  \date   2017-2018

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

  \details

  \ingroup units units_coordinate
*******************************************************************************/

include <../constants.scad>;

//----------------------------------------------------------------------------//
/***************************************************************************//**
  \addtogroup units
  @{

  \defgroup units_coordinate Coordinates
  \brief    Coordinate systems and conversions.

  \details

    These functions allow for geometric points in space to be specified
    using multiple coordinate systems. Some geometric calculations are
    specified more naturally in one or another coordinate system. These
    conversion functions allow for the movement between the most
    convenient for a particular application.

    For more information see Wikipedia on [coordinate system].

    The table below enumerates the supported coordinate systems.

    | system id  | description    | dimensions  | point convention    |
    |:----------:|:--------------:|:-----------:|:-------------------:|
    |  c         | [cartesian]    | 2d or 3d    | [x, y] or [x, y, z] |
    |  p         | [polar]        | 2d          | [r, aa]             |
    |  y         | [cylindrical]  | 3d          | [r, aa, z]          |
    |  s         | [spherical]    | 3d          | [r, aa, pa]         |

    The symbols used in the convention column are as follows:

    | symbol  | description             | units   | reference           |
    |:-------:|:------------------------|:-------:|:-------------------:|
    | x, y, z | coordinate distance     | any     | xyz-axis            |
    | r       | radial distance         | any     | z-axis / xyz-origin |
    | aa      | [azimuthal] angle       | degrees | positive x-axis     |
    | pa      | polar / [zenith] angle  | degrees | positive z-axis     |

  \note The [azimuthal] angle is a measure of the radial vector orthogonal
        projection onto the xy-plane measured from the positive x-axis.
  \note The polar angle is measured from the z-axis ([zenith]) to the
        radial vector.

    \b Example

      \dontinclude units_coordinate_example.scad
      \skip include
      \until to="c");

    \b Result (base_coordinates = \b c): \include units_coordinate_example_c.log
    \b Result (base_coordinates = \b p): \include units_coordinate_example_p.log
    \b Result (base_coordinates = \b y): \include units_coordinate_example_y.log
    \b Result (base_coordinates = \b s): \include units_coordinate_example_s.log

    [coordinate system]: https://en.wikipedia.org/wiki/Coordinate_system
    [cartesian]: https://en.wikipedia.org/wiki/Cartesian_coordinate_system
    [polar]: https://en.wikipedia.org/wiki/Polar_coordinate_system
    [cylindrical]: https://en.wikipedia.org/wiki/Cylindrical_coordinate_system
    [spherical]: https://en.wikipedia.org/wiki/Spherical_coordinate_system
    [azimuthal]: https://en.wikipedia.org/wiki/Azimuth
    [zenith]: https://en.wikipedia.org/wiki/Zenith

  @{
*******************************************************************************/
//----------------------------------------------------------------------------//

//! <string> The base coordinate system.
base_coordinates = "c";

//! <boolean> When converting to angular measures add 360 to negative angles.
coordinates_positive_angles = true;

//! Return the name of the given coordinate system identifier.
/***************************************************************************//**
  \param    s <string> A coordinate system identifier.

  \returns  <string> The system name for the given identifier.
            Returns \b undef for identifiers that are not defined.
*******************************************************************************/
function coordinates_name
(
  s = base_coordinates
) = (s == "c") ? "cartesian"
  : (s == "p") ? "polar"
  : (s == "y") ? "cylindrical"
  : (s == "s") ? "spherical"
  : undef;

//! Convert a point from Cartesian to other coordinate systems.
/***************************************************************************//**
  \param    c <point> A point to convert.
  \param    to <string> The coordinate system identifier to which the point
            should be converted.

  \returns  <point> The converted result.
            Returns \b undef for identifiers that are not defined.

  \private
*******************************************************************************/
function coordinate_c_to
(
  c,
  to
) = (to == "c") ? ( c )
  : (to == "p") ?
    (
      let
      (
        r   = sqrt(pow(c.x,2) + pow(c.y,2)),
        aa  = atan2(c.y, c.x),
        aap = ((aa<0) && (coordinates_positive_angles==true)) ? aa+360 : aa
      )
      [r, aap]
    )
  : (to == "y") ?
    (
      let
      (
        r   = sqrt(pow(c.x,2) + pow(c.y,2)),
        aa  = atan2(c.y, c.x),
        aap = ((aa<0) && (coordinates_positive_angles==true)) ? aa+360 : aa,
        z   = (c.z !=undef) ? c.z : 0
      )
      [r, aap, z]
    )
  : (to == "s") ?
    (
      let
      (
        r   = sqrt(pow(c.x,2) + pow(c.y,2) + pow(c.z,2)),
        aa  = atan2(c.y, c.x),
        aap = ((aa<0) && (coordinates_positive_angles==true)) ? aa+360 : aa,
        pa  = acos(c.z / r)
      )
      [r, aap, pa]
    )
  : undef;

//! Convert a point from some coordinate system to the Cartesian coordinate system.
/***************************************************************************//**
  \param    c <point> A point to convert.
  \param    from <string> The coordinate system identifier of the point
            to be converted.

  \returns  <point> The converted result.
            Returns \b undef for identifiers that are not defined.

  \private
*******************************************************************************/
function coordinate_to_c
(
  c,
  from
) = (from == "c") ? ( c )
  : (from == "p") ?
    (
      let
      (
        x = c[0]*cos(c[1]),
        y = c[0]*sin(c[1])
      )
      [x, y]
    )
  : (from == "y") ?
    (
      let
      (
        x = c[0]*cos(c[1]),
        y = c[0]*sin(c[1]),
        z = (c[2] != undef) ? c[2] : 0
      )
      [x, y, z]
    )
  : (from == "s") ?
    (
      let
      (
        x = c[0]*sin(c[2])*cos(c[1]),
        y = c[0]*sin(c[2])*sin(c[1]),
        z = c[0]*cos(c[2])
      )
      [x, y, z]
    )
  : undef;

//! Convert point from one coordinate system to another.
/***************************************************************************//**
  \param    c <point> A point to convert.
  \param    from <string> The coordinate system identifier of the point
            to be converted.
  \param    to <string> The coordinate system identifier to which the point
            should be converted.

  \returns  <point> The converted result.
            Returns \b undef for identifiers that are not defined.
*******************************************************************************/
function convert_coordinate
(
  c,
  from = base_coordinates,
  to   = base_coordinates
) = coordinate_c_to( coordinate_to_c( c, from ), to );

//! Radially scale a list of 2d cartesian coordinates.
/***************************************************************************//**
  \param    c <coords-2d> A list of cartesian coordinates [[x, y], ...].
  \param    r <decimal> A polar radius.
  \param    t <boolean> Translate or scale radius.

  \returns  <coords-2d> A list of scaled cartesian coordinates.

  \details

    When \p t is \b true, all coordinates will terminate on a circle of
    radius \p r. When \p t is \b false, the radius of each coordinate
    is scaled by \p r.
*******************************************************************************/
function coordinates_cpc
(
  c,
  r,
  t = false
) =
  [
    for (i = c)
    let (p = convert_coordinate(i, from="c", to="p"))
      convert_coordinate([(t == true) ? r : r*p[0], p[1]], from="p", to="c")
  ];

//! Radially scale and convert a list of 2d polar coordinates to cartesian.
/***************************************************************************//**
  \param    c <coords-2d> A list of polar coordinates [[r, aa], ...].
  \param    r <decimal> A polar radius.
  \param    t <boolean> Translate or scale radius.

  \returns  <coords-2d> A list of scaled cartesian coordinates.

  \details

    When \p t is \b true, all coordinates will terminate on a circle of
    radius \p r. When \p t is \b false, the radius of each coordinate
    is scaled by \p r.
*******************************************************************************/
function coordinates_pc
(
  p,
  r,
  t = false
) =
  [
    for (i = p)
      convert_coordinate([(t == true) ? r : r*i[0], i[1]], from="p", to="c")
  ];

//! Radially scale a list of 3d cartesian coordinates.
/***************************************************************************//**
  \param    c <coords-3d> A list of cartesian coordinates [[x, y, z], ...].
  \param    r <decimal> A spherical radius.
  \param    t <boolean> Translate or scale radius.

  \returns  <coords-3d> A list of scaled cartesian coordinates.

  \details

    When \p t is \b true, all coordinates will terminate on a sphere of
    radius \p r. When \p t is \b false, the radius of each coordinate
    is scaled by \p r.
*******************************************************************************/
function coordinates_csc
(
  c,
  r,
  t = false
) =
  [
    for (i = c)
    let (s = convert_coordinate(i, from="c", to="s"))
      convert_coordinate([(t == true) ? r : r*s[0], s[1], s[2]], from="s", to="c")
  ];

//! Radially scale and convert a list of 3d spherical coordinates to cartesian.
/***************************************************************************//**
  \param    c <coords-3d> A list of spherical coordinates [[r, aa, pa], ...].
  \param    r <decimal> A spherical radius.
  \param    t <boolean> Translate or scale radius.

  \returns  <coords-3d> A list of scaled cartesian coordinates.

  \details

    When \p t is \b true, all coordinates will terminate on a sphere of
    radius \p r. When \p t is \b false, the radius of each coordinate
    is scaled by \p r.
*******************************************************************************/
function coordinates_sc
(
  s,
  r,
  t = false
) =
  [
    for (i = s)
      convert_coordinate([(t == true) ? r : r*i[0], i[1], i[2]], from="s", to="c")
  ];

//! @}
//! @}

//----------------------------------------------------------------------------//
// openscad-amu auxiliary scripts
//----------------------------------------------------------------------------//

/*
BEGIN_SCOPE example;
  BEGIN_OPENSCAD;
    include <units/units_coordinate.scad>;

    base_coordinates = "c";

    // get the base coordinate system name
    cs = coordinates_name();

    // absolute coordinates in a specified coordinate system.
    c1 = convert_coordinate([1, 1, 1], "c");
    c2 = convert_coordinate([1, 180], "p");
    c3 = convert_coordinate([1, 90, -1], "y");
    c4 = convert_coordinate([1, 5, 50], "s");

    // convert between system.
    c5 = convert_coordinate([10*sqrt(2), 45, 45], from="s", to="y");
    c6 = convert_coordinate([sqrt(2), 45], from="p", to="c");

    echo( cs=cs );
    echo( c1=c1 );
    echo( c2=c2 );
    echo( c3=c3 );
    echo( c4=c4 );
    echo( c5=c5 );
    echo( c6=c6 );
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_csg}.mfs;

    defines   name "system" define "base_coordinates" strings "c p y s";
    variables add_opts_combine "system";

    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;
*/

//----------------------------------------------------------------------------//
// end of file
//----------------------------------------------------------------------------//
