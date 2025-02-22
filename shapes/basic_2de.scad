//! Basic 2D derivative shapes linearly extruded along the z-axis.
/***************************************************************************//**
  \file
  \author Roy Allen Sutton
  \date   2015-2019

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

    \amu_define group_name  (2d Extrusions)
    \amu_define group_brief (Basic 2D derivative shapes linearly extruded along the z-axis.)
    \amu_define view        (diag)

  \amu_include (include/amu/pgid_path_pstem_pg.amu)
*******************************************************************************/

//----------------------------------------------------------------------------//
// group and macros.
//----------------------------------------------------------------------------//

/***************************************************************************//**
  \amu_include (include/amu/group_in_parent_start.amu)

  \amu_include (include/amu/example_dim_table.amu)
*******************************************************************************/

//----------------------------------------------------------------------------//

//! An extruded rectangle with edge, round, or chamfer corners.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc rectangle()

  \details

    \b Example
    \amu_eval ( function=erectangle ${example_dim} )
*******************************************************************************/
module erectangle
(
  h,
  center = false,

  size,
  vr,
  vrm = 0
)
{
  linear_extrude_uls(h=h, center=center)
  rectangle(size=size, vr=vr, vrm=vrm, center=center);
}

//! An extruded rectangle with a removed rectangular core.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc rectangle_c()

  \details

    \b Example
    \amu_eval ( function=erectangle_c ${example_dim} )
*******************************************************************************/
module erectangle_c
(
  h,
  center = false,

  size,
  core,
  t,
  co,
  cr = 0,
  vr,
  vr1,
  vr2,
  vrm = 0,
  vrm1,
  vrm2
)
{
  linear_extrude_uls(h=h, center=center)
  rectangle_c
  (
    size=size, core=core, t=t,
    co=co, cr=cr,
    vr=vr, vr1=vr1, vr2=vr2,
    vrm=vrm, vrm1=vrm1, vrm2=vrm2,
    center=center
  );
}

//! An extruded rhombus.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc rhombus()

  \details

    \b Example
    \amu_eval ( function=erhombus ${example_dim} )
*******************************************************************************/
module erhombus
(
  h,
  center = false,

  size,
  vr
)
{
  linear_extrude_uls(h=h, center=center)
  rhombus(size=size, vr=vr, center=center);
}

//! An extruded general triangle specified by three vertices.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc triangle_ppp()

  \details

    \b Example
    \amu_eval ( function=etriangle_ppp ${example_dim} )
*******************************************************************************/
module etriangle_ppp
(
  h,
  center = false,

  v1,
  v2,
  v3,
  vr,
  v1r,
  v2r,
  v3r,
  centroid = false,
  incenter = false
)
{
  linear_extrude_uls(h=h, center=center)
  triangle_ppp
  (
    v1=v1, v2=v2, v3=v3,
    vr=vr, v1r=v1r, v2r=v2r, v3r=v3r,
    centroid=centroid, incenter=incenter
  );
}

//! A general triangle specified by its sides with a removed triangular core.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc triangle_ls_c()

  \details

    \b Example
    \amu_eval ( function=etriangle_ls_c ${example_dim} )
*******************************************************************************/
module etriangle_ls_c
(
  h,
  center = false,

  vs,
  vc,
  co,
  cr = 0,
  vr,
  vr1,
  vr2,
  centroid = false,
  incenter = false
)
{
  linear_extrude_uls(h=h, center=center)
  triangle_ls_c
  (
    vs=vs, vc=vc,
    co=co, cr=cr,
    vr=vr, vr1=vr1, vr2=vr2,
    centroid=centroid, incenter=incenter
  );
}

//! An extruded n-sided equiangular/equilateral regular polygon.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc ngon()

  \details

    \b Example
    \amu_eval ( function=engon ${example_dim} )
*******************************************************************************/
module engon
(
  h,
  center = false,

  n,
  r,
  vr
)
{
  linear_extrude_uls(h=h, center=center)
  ngon(n=n, r=r, vr=vr);
}

//! An extruded ellipse.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc ellipse()

  \details

    \b Example
    \amu_eval ( function=eellipse ${example_dim} )
*******************************************************************************/
module eellipse
(
  h,
  center = false,

  size
)
{
  linear_extrude_uls(h=h, center=center)
  ellipse(size=size);
}

//! An extruded ellipse with a removed elliptical core.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc ellipse_c()

  \details

    \b Example
    \amu_eval ( function=eellipse_c ${example_dim} )
*******************************************************************************/
module eellipse_c
(
  h,
  center = false,

  size,
  core,
  t,
  co,
  cr = 0
)
{
  linear_extrude_uls(h=h, center=center)
  ellipse_c(size=size, core=core, t=t, co=co, cr=cr);
}

//! An extruded ellipse sector.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc ellipse_s()

  \details

    \b Example
    \amu_eval ( function=eellipse_s ${example_dim} )
*******************************************************************************/
module eellipse_s
(
  h,
  center = false,

  size,
  a1 = 0,
  a2 = 0
)
{
  linear_extrude_uls(h=h, center=center)
  ellipse_s(size=size, a1=a1, a2=a2);
}

//! An extruded sector of an ellipse with a removed elliptical core.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc ellipse_cs()

  \details

    \b Example
    \amu_eval ( function=eellipse_cs ${example_dim} )
*******************************************************************************/
module eellipse_cs
(
  h,
  center = false,

  size,
  core,
  t,
  a1 = 0,
  a2 = 0,
  co,
  cr = 0
)
{
  linear_extrude_uls(h=h, center=center)
  ellipse_cs(a1=a1, a2=a2, size=size, core=core, t=t, co=co, cr=cr);
}

//! An extruded two-dimensional star.
/***************************************************************************//**
  \copydoc linear_extrude_uls()

  \copydoc star2d()

  \details

    \b Example
    \amu_eval ( function=estar2d ${example_dim} )
*******************************************************************************/
module estar2d
(
  h,
  center = false,

  size,
  n = 5,
  vr
)
{
  linear_extrude_uls(h=h, center=center)
  star2d(size=size, n=n, vr=vr);
}

//! @}
//! @}

//----------------------------------------------------------------------------//
// openscad-amu auxiliary scripts
//----------------------------------------------------------------------------//

/*
BEGIN_SCOPE dim;
  BEGIN_OPENSCAD;
    include <omdl-base.scad>;

    shape = "eellipse_cs";
    $fn = 36;

    if (shape == "erectangle")
      erectangle( size=[25,40], vr=5, vrm=3, h=20, center=true );
    else if (shape == "erectangle_c")
      erectangle_c( size=[40,20], t=[10,1], co=[0,-6], cr=10, vr=5, vrm1=12, h=30, center=true );
    else if (shape == "erhombus")
      erhombus( size=[40,25], h=10, vr=[3,0,3,9], center=true );
    else if (shape == "etriangle_ppp")
      etriangle_ppp( v1=[0,0], v2=[5,25], v3=[40,5], h=20, vr=2, centroid=true, center=true );
    else if (shape == "etriangle_ls_c")
      etriangle_ls_c(vs=50, vc=30, h=15, co=[0,-10], cr=180, vr=[2,2,8], centroid=true, center=true);
    else if (shape == "engon")
      engon( n=6, r=25, h=20, vr=6, center=true );
    else if (shape == "eellipse")
      eellipse( size=[25, 40], h=20, center=true );
    else if (shape == "eellipse_c")
      eellipse_c( size=[25,40], core=[16,10], co=[0,10], cr=45, h=20, center=true );
    else if (shape == "eellipse_s")
      eellipse_s( size=[25,40], h=20, a1=90, a2=180, center=true );
    else if (shape == "eellipse_cs")
      eellipse_cs( size=[25,40], t=[10,5], a1=90, a2=180, co=[10,0], cr=45, h=20, center=true );
    else if (shape == "estar2d")
      estar2d( size=[40, 15], h=15, n=5, vr=2, center=true );
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_png}.mfs;

    views     name "views" views "diag";
    defines   name "shapes" define "shape"
              strings "
                erectangle
                erectangle_c
                erhombus
                etriangle_ppp
                etriangle_ls_c
                engon
                eellipse
                eellipse_c
                eellipse_s
                eellipse_cs
                estar2d
              ";
    variables add_opts_combine "views shapes";
    variables add_opts "--viewall --autocenter --view=axes";

    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;

BEGIN_SCOPE manifest;
  BEGIN_OPENSCAD;
    include <omdl-base.scad>;

    $fn = 36;

    grid_repeat( g=5, i=60, center=true )
    {
      erectangle( size=[25,40], vr=5, vrm=3, h=20, center=true );
      erectangle_c( size=[40,20], t=[10,1], co=[0,-6], cr=10, vr=5, vrm1=12, h=30, center=true );
      erhombus( size=[40,25], h=10, vr=[3,0,3,9], center=true );
      etriangle_ppp( v1=[0,0], v2=[5,25], v3=[40,5], h=20, vr=2, centroid=true, center=true );
      etriangle_ls_c( vs=50, vc=30, h=15, co=[0,-10], cr=180, vr=[2,2,8], centroid=true, center=true );
      engon( n=6, r=25, h=20, vr=6, center=true );
      eellipse( size=[25, 40], h=20, center=true );
      eellipse_c( size=[25,40], core=[16,10], co=[0,10], cr=45, h=20, center=true );
      eellipse_s( size=[25,40], h=20, a1=90, a2=180, center=true );
      eellipse_cs( size=[25,40], t=[10,5], a1=90, a2=180, co=[10,0], cr=45, h=20, center=true );
      estar2d( size=[40, 15], h=15, n=5, vr=2, center=true );
    }
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_stl}.mfs;
    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;
*/

//----------------------------------------------------------------------------//
// end of file
//----------------------------------------------------------------------------//
