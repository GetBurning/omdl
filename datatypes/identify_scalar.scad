//! Scalar data type tests.
/***************************************************************************//**
  \file
  \author Roy Allen Sutton
  \date   2015-2018

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

    \amu_pathid path        (++path)

    \amu_define parent      (${path}_identify)
    \amu_pathid group       (++path ++stem)

    \amu_define group_name  (Scalars)
    \amu_define group_brief (Scalar data type tests.)

  \ingroup \amu_eval(${parent} ${group})
*******************************************************************************/

//----------------------------------------------------------------------------//
// validation.
//----------------------------------------------------------------------------//

/***************************************************************************//**
  \amu_scope       tv_scope (index=1)
  \amu_file          tv_log (file="${tv_scope}.log" ++rmecho ++read)
  \amu_replace      tv_pass (t=${tv_log} s="passed:" r="1," ++fnc)
  \amu_replace      tv_skip (t=${tv_log} s="-skip-:" r="1," ++fnc)
  \amu_replace      tv_fail (t=${tv_log} s="failed:" r="1," ++fnc)
  \amu_source       tv_file (++file)
  \amu_word           tv_td (t="," w=${tv_file} ++s w="\ref ${group}" ++s
                             w="\ref tv_${group}_s" ++s w="\ref tv_${group}_r" ++s
                             w=${tv_pass} ++c w=${tv_skip} ++c w=${tv_fail} ++c)
  \amu_define         tv_th (file^group^script^results^passed^skipped^failed)
  \amu_word           tv_tc (w=${tv_th} ++c)
  \amu_word       tv_fail_c (w=${tv_fail} ++c)
  \amu_replace   tv_fail_td (t=${tv_log} s="^.*failed:.*$" r="&^" ++snl ++fsd ++fnc)
*******************************************************************************/

/***************************************************************************//**
  \page tv_\amu_eval(${parent})
    \li \subpage tv_\amu_eval(${group})

  \page tv_\amu_eval(${group} ${group_name})
    \li \subpage tv_\amu_eval(${group})_s
    \li \subpage tv_\amu_eval(${group})_r

  \page tv_\amu_eval(${group})_s Script
    \dontinclude \amu_eval(${tv_scope}).scad
    \skip include
    \until end-of-tests

  \page tv_\amu_eval(${group})_r Results
    ### Summary ###
    \amu_table(columns=${tv_tc} column_headings=${tv_th} cell_texts=${tv_td})

    ### \amu_if( -z ${tv_fail_td} ) {All Passed} else {Failed} endif ###
    \amu_table(columns=1 cell_texts=${tv_fail_td})

    ### All ###
    \code
    \amu_eval(${tv_log})
    \endcode

  \page tv_summary
    \amu_table(columns=${tv_tc} cell_texts=${tv_td})

  \page validation
    \amu_if( -n ${tv_fail} ) {\ref ${group} failed ${tv_fail_c}} endif
*******************************************************************************/

//----------------------------------------------------------------------------//
// group.
//----------------------------------------------------------------------------//

/***************************************************************************//**
  \addtogroup \amu_eval(${parent})
  @{

  \defgroup \amu_eval(${group} ${group_name})
  \brief    \amu_eval(${group_brief})

  \details

    ### Validation Summary ###
    \amu_table(columns=${tv_tc} column_headings=${tv_th} cell_texts=${tv_td})

    ### \amu_if( -z ${tv_fail_td} ) {No Failures} else {Failures} endif ###
    \amu_table(columns=1 cell_texts=${tv_fail_td})

    See complete validation \ref tv_\amu_eval(${group})_r "results".
  @{
*******************************************************************************/

//----------------------------------------------------------------------------//

//! Test if a value is defined.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is defined
            and \b false otherwise.
*******************************************************************************/
function is_defined
(
  v
) = (v == undef) ? false
  : true;

//! Test if a value is not defined.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is not defined
            and \b false otherwise.
*******************************************************************************/
function not_defined
(
  v
) = (v == undef) ? true
  : false;

//! Test if a numerical value is invalid.
/***************************************************************************//**
  \param    v \<value> A numerical value.

  \returns  <boolean> \b true when the value is determined to be
            \b nan (Not A Number) and \b false otherwise.
*******************************************************************************/
function is_nan( v ) = ( v != v );

//! Test if a numerical value is infinite.
/***************************************************************************//**
  \param    v \<value> A numerical value.

  \returns  <boolean> \b true when the value is determined to be
            \b inf (greater than the largest representable number)
            and \b false otherwise.
*******************************************************************************/
function is_inf( v ) = ( v == (number_max * number_max) );

//! Test if a value is a single non-iterable value.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a single non-iterable value
            and \b false otherwise.

  \details

     data type     | defined
    :-------------:|:-----------------:
     number(s)     | \b true
     boolean       | \b true
     string        | \b false
     list          | \b false
     range         | not defined
     \b undef      | \b true
     \b inf        | \b true
     \b nan        | \b true
*******************************************************************************/
function is_scalar( v ) = (len(v) == undef);

//! Test if a value has multiple parts and is iterable.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is an iterable multi-part value
            and \b false otherwise.

  \details

     data type     | defined
    :-------------:|:-----------------:
     number(s)     | \b false
     boolean       | \b false
     string        | \b true
     list          | \b true
     range         | not defined
     \b undef      | \b false
     \b inf        | \b false
     \b nan        | \b false
*******************************************************************************/
function is_iterable( v ) = (len(v) != undef);

//! Test if an iterable value is empty.
/***************************************************************************//**
  \param    v \<value> An iterable value.

  \returns  <boolean> \b true when the iterable value has zero elements
            and \b false otherwise.
*******************************************************************************/
function is_empty( v ) = (len(v) == 0);

//! Test if a value is a number.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a number
            and \b false otherwise.

  \note     Returns \b true for \b inf and \b nan values.
*******************************************************************************/
function is_number( v ) = is_defined(v % 1);

//! Test if a value is an integer.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is an integer
            and \b false otherwise.
*******************************************************************************/
function is_integer
(
  v
) = not_defined(v) ? false
  : ((v % 1) == 0);

//! Test if a value is a decimal.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a decimal
            and \b false otherwise.
*******************************************************************************/
function is_decimal( v ) = ((v % 1) > 0);

//! Test if a value is a predefined boolean constant.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is one of the predefined
            boolean constants <tt>[true|false]</tt> and \b false otherwise.
*******************************************************************************/
function is_boolean
(
  v
) = is_string(v) ? false
  : (str(v) == "true") ? true
  : (str(v) == "false") ? true
  : false;

//! Test if a value is a string.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a string
            and \b false otherwise.
*******************************************************************************/
function is_string( v ) = (str(v) == v);

//! Test if a value is an iterable list of values.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a list
            and \b false otherwise.
*******************************************************************************/
function is_list( v ) =  is_iterable(v) && !is_string(v);

//! Test if a value is a range definition.
/***************************************************************************//**
  \param    v \<value> A value.

  \returns  <boolean> \b true when the value is a range definition
            and \b false otherwise.

  \details

  \internal
    Currently a range is determined to be that which does not fit in any
    other value category. This is likely to fail as OpenSCAD matures.
    This exclusion test should be replaced by a suitable inclusion test
    when possible.
  \endinternal
*******************************************************************************/
function is_range
(
  v
) = is_defined(v) &&
    !is_iterable(v) &&
    !is_boolean(v) &&
    !is_integer(v) &&
    !is_decimal(v) &&
    !is_nan(v) &&
    !is_inf(v);

//! Test if a numerical value is even.
/***************************************************************************//**
  \param    v \<value> A numerical value.

  \returns  <boolean> \b true when the value is determined to be \e even
            and \b false otherwise (The value may be positive or negative).
*******************************************************************************/
function is_even
(
  v
) = !is_integer(v) ? false
  : ((v % 2) == 0);

//! Test if a numerical value is odd.
/***************************************************************************//**
  \param    v \<value> A numerical value.

  \returns  <boolean> \b true when the value is determined to be \e odd
            and \b false otherwise (The value may be positive or negative).
*******************************************************************************/
function is_odd
(
  v
) = !is_integer(v) ? false
  : ((v % 2) != 0);

//! Test if a numerical value is between an upper and lower bounds.
/***************************************************************************//**
  \param    v <number> A numerical value.
  \param    l <number> The minimum value.
  \param    u <number> The maximum value.

  \returns  <boolean> \b true when the value is between the upper and
            lower bounds and \b false otherwise.
*******************************************************************************/
function is_between
(
  v,
  l,
  u
) = ((v >= l) && (v <=u));

//! @}
//! @}

//----------------------------------------------------------------------------//
// openscad-amu auxiliary scripts
//----------------------------------------------------------------------------//

/*
BEGIN_SCOPE validate;
  BEGIN_OPENSCAD;
    include <console.scad>;
    include <datatypes/datatypes-base.scad>;
    include <datatypes/table.scad>;
    include <validation.scad>;

    echo( str("openscad version ", version()) );

    // test-values columns
    test_c =
    [
      ["id", "identifier"],
      ["td", "description"],
      ["tv", "test value"]
    ];

    // test-values rows
    test_r =
    [
      ["t01", "The undefined value",        undef],
      ["t02", "An odd integer",             1],
      ["t03", "An small even integer",      10],
      ["t04", "A large integer",            100000000],
      ["t05", "A small decimal (epsilon)",  aeps],
      ["t06", "The max number",             number_max],
      ["t07", "The min number",             number_min],
      ["t08", "The max number^2",           number_max * number_max],
      ["t09", "The invalid number nan",     0 / 0],
      ["t10", "The boolean true",           true],
      ["t11", "The boolean false",          false],
      ["t12", "A character string",         "a"],
      ["t13", "A string",                   "This is a longer string"],
      ["t14", "The empty string",           empty_str],
      ["t15", "The empty list",             empty_lst],
      ["t16", "A 1-tuple list of undef",    [undef]],
      ["t17", "A 1-tuple list",             [10]],
      ["t18", "A 3-tuple list",             [1, 2, 3]],
      ["t19", "A list of lists",            [[1,2,3], [4,5,6], [7,8,9]]],
      ["t20", "A shorthand range",          [0:9]],
      ["t21", "A range",                    [0:0.5:9]]
    ];

    test_ids = get_table_ridl( test_r );

    // expected columns: ("id" + one column for each test)
    good_c = pmerge([concat("id", test_ids), concat("identifier", test_ids)]);

    // expected rows: ("golden" test results), use 's' to skip test
    t = true;   // shortcuts
    f = false;
    u = undef;
    s = -1;     // skip test

    good_r =
    [ // function       01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21
      ["is_defined",    f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t],
      ["not_defined",   t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_nan",        f, f, f, f, f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_inf",        f, f, f, f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_scalar",     t, t, t, t, t, t, t, t, t, t, t, f, f, f, f, f, f, f, f, s, s],
      ["is_iterable",   f, f, f, f, f, f, f, f, f, f, f, t, t, t, t, t, t, t, t, s, s],
      ["is_empty",      f, f, f, f, f, f, f, f, f, f, f, f, f, t, t, f, f, f, f, f, f],
      ["is_number",     f, t, t, t, t, t, t, t, t, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_integer",    f, t, t, t, f, t, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_decimal",    f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f],
      ["is_boolean",    f, f, f, f, f, f, f, f, f, t, t, f, f, f, f, f, f, f, f, f, f],
      ["is_string",     f, f, f, f, f, f, f, f, f, f, f, t, t, t, f, f, f, f, f, f, f],
      ["is_list",       f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, t, t, t, t, s, s],
      ["is_range",      f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, t],
      ["is_even",       s, f, t, t, f, t, t, s, s, s, s, s, s, s, s, s, s, s, s, s, s],
      ["is_odd",        s, t, f, f, f, f, f, s, s, s, s, s, s, s, s, s, s, s, s, s, s],
      ["is_between_MM", f, t, t, t, t, t, t, f, f, t, t, f, f, f, f, f, f, f, f, f, f]
    ];

    // sanity-test tables
    table_check( test_r, test_c, false );
    table_check( good_r, good_c, false );

    // validate helper function and module
    function get_value( vid ) = get_table_v(test_r, test_c, vid, "tv");
    module log_test( m ) { log_type ( "test", m ); }
    module log_notest( f ) { log_test ( str("not tested: '", f, "'") ); }
    module run_test( fname, fresult, vid )
    {
      value_text = get_table_v(test_r, test_c, vid, "td");
      pass_value = get_table_v(good_r, good_c, fname, vid);

      test_pass = validate( cv=fresult, t=pass_value, pf=true );
      test_text = validate( str(fname, "(", get_value(vid), ")=", pass_value), fresult, pass_value );

      if ( pass_value != s )
      {
        if ( !test_pass )
          log_test( str(vid, " ", test_text, " (", value_text, ")") );
        else
          log_test( str(vid, " ", test_text) );
      }
      else
        log_test( str(vid, " -skip-: '", fname, "(", value_text, ")'") );
    }

    // Indirect function calls would be very useful here!!!
    for (vid=test_ids) run_test( "is_defined", is_defined(get_value(vid)), vid );
    for (vid=test_ids) run_test( "not_defined", not_defined(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_nan", is_nan(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_inf", is_inf(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_scalar", is_scalar(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_iterable", is_iterable(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_empty", is_empty(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_number", is_number(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_integer", is_integer(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_decimal", is_decimal(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_boolean", is_boolean(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_string", is_string(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_list", is_list(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_range", is_range(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_even", is_even(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_odd", is_odd(get_value(vid)), vid );
    for (vid=test_ids) run_test( "is_between_MM", is_between(get_value(vid),number_min,number_max), vid );

    // end-of-tests
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_csg}.mfs;
    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;
*/

//----------------------------------------------------------------------------//
// end of file
//----------------------------------------------------------------------------//
