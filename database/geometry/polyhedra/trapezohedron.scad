//! Polyhedra data table: \c trapezohedron.
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

    This [omdl] formatted data table has been assembled using a script
    that converts the polyhedra data obtained from [Anthony Thyssen]'s
    [Studies into Polyhedra]. The vertices are tabulated in both their
    original Cartesian as well as their converted spherical coordinate
    form, which is convenient when scaling. The data originates from
    one of three sources:

      \li Exact Mathematics as presented by [Anthony Thyssen],
      \li the [Polyhedron Database] maintained by [Netlib], and
      \li an [Encyclopedia of Polyhedra] by [George W. Hart].

  \note Include this library file using the \b include statement.

  [omdl]: https://github.com/royasutton/omdl

  [Anthony Thyssen]: http://www.ict.griffith.edu.au/anthony/anthony.html
  [Studies into Polyhedra]: http://www.ict.griffith.edu.au/anthony/graphics/polyhedra

  [George W. Hart]: http://www.georgehart.com
  [Encyclopedia of Polyhedra]: http://www.georgehart.com/virtual-polyhedra/vp.html

  [Netlib]: http://www.netlib.org
  [Polyhedron Database]: http://www.netlib.org/polyhedra

    \amu_pathid parent  (++path_parent)
    \amu_pathid group   (++path)

  \ingroup \amu_eval(${group})
*******************************************************************************/

//----------------------------------------------------------------------------//
/***************************************************************************//**
  \addtogroup \amu_eval(${group})
  @{
    <br>
    ### File: trapezohedron.scad ###

    \amu_eval
      (
        ++global
        title="Trapezohedron"
        stem=trapezohedron scope=db_dim size=qvga view=diag
      )

    \amu_define  image_stem (${stem}_${scope}_${size}_${view}_${shape})
    \amu_make     png_files (append=db_dim extension=png)
    \amu_make     stl_files (append=db_dim extension=stl)
    \amu_word      file_cnt (words="${png_files}" ++count)
    \amu_seq       cell_num (p="(" s=")" l="${file_cnt}" ++n)
    \amu_eval       iprefix (shape="" ${image_stem})
    \amu_filename  cell_txt (f="${png_files}" r="^" ++stem)
    \amu_replace    cell_id (t="${cell_txt}" s="${iprefix}" r="id: ")
    \amu_replace   cell_end (t="${cell_txt}" s="${iprefix}")
    \amu_replace   cell_end (t="${cell_end}" s="_" replace="<br>")
    \amu_combine   cell_end (p="<center>" s="</center>" j="" f="^" t="^" ${cell_end})

    \htmlonly
      \amu_image_table
        (
          type=html columns=4 image_width="200" cell_files="${png_files}"
          table_caption="${title}" cell_captions="${cell_num}"
          cell_titles="${cell_id}" cell_end="${cell_end}"
          cell_urls="${stl_files}"
        )
    \endhtmlonly

    \amu_make     eps_files (append=db_dim extension=png2eps)

    \latexonly
      \amu_image_table
        (
          type=latex columns=4 image_width="1.25in" cell_files="${eps_files}"
          table_caption="${title}" cell_captions="${cell_num}"
        )
    \endlatexonly

    \amu_scope        scope (index=1)
    \amu_file       heading (file="${scope}.log"  last=1 ++rmecho ++rmnl ++read)
    \amu_file         texts (file="${scope}.log" first=2 ++rmecho ++rmnl ++read)
    \amu_word       columns (tokenizer="^" words="${heading}" ++count)

    \amu_table
      (
        columns=${columns} column_headings="${heading}" cell_texts="${texts}"
      )
*******************************************************************************/
//----------------------------------------------------------------------------//

//! <matrix-2x9> \c trapezohedron polyhedra data table columns definition.
//! \hideinitializer
dtc_polyhedra_trapezohedron =
[
  ["id", "identifier"],
  ["n", "name"],
  ["o", "other name"],
  ["g", "group"],
  ["d", "data source"],
  ["c", "cartesian vertices"],
  ["s", "spherical vertices"],
  ["f", "faces"],
  ["e", "edges"]
];

//! <matrix-9xR> \c trapezohedron polyhedra data table rows.
//! \hideinitializer
dtr_polyhedra_trapezohedron =
[
  [
    "decagonal_trapezohedron",
    "Decagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.08157055488, -0.02508562274,  0.26071794615],
      [-0.00298807954,  0.02508563214,  0.27316418436],
      [-0.08725421480, -0.02508563451,  0.25887120879],
      [-0.00000000660, -0.99999999536, -0.00000000747],
      [ 0.21923812649, -0.02508563811,  0.16297927459],
      [ 0.15814447884,  0.02508563160,  0.22275080640],
      [-0.00000000000,  1.00000000000, -0.00000000000],
      [-0.16297928808,  0.02508564700,  0.21923811357],
      [-0.22275082301, -0.02508562356,  0.15814446589],
      [ 0.27316413424, -0.02508562845,  0.00298807495],
      [ 0.25887121980,  0.02508563643,  0.08725421294],
      [-0.26071794390,  0.02508563415,  0.08157054936],
      [-0.27316412166, -0.02508563048, -0.00298808116],
      [ 0.22275080881, -0.02508563042, -0.15814448224],
      [ 0.26071794489,  0.02508562885, -0.08157054801],
      [-0.25887121794,  0.02508563696, -0.08725420881],
      [-0.21923811508, -0.02508563337, -0.16297929533],
      [ 0.08725419904, -0.02508564175, -0.25887120317],
      [ 0.16297928994,  0.02508562639, -0.21923810944],
      [-0.15814447873,  0.02508562100, -0.22275080783],
      [-0.08157054158, -0.02508562972, -0.26071793387],
      [ 0.00298807400,  0.02508561395, -0.27316415966]
    ],
    [
      [0.27432989509,  -17.09438091172,  18.12481356295],
      [0.27432989114,   96.79279130227,   5.28383970309],
      [0.27432989228, -163.96002773134,  19.32627339448],
      [0.99999999536,  -90.00000037787,  90.00000042785],
      [0.27432989135,   -6.52750264244,  53.55152986257],
      [0.27432988692,    9.01343241109,  35.71001165929],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.27432988986,  171.24974747226,  36.94842526900],
      [0.27432989220, -173.57456962451,  54.79697096798],
      [0.27432984085,   -5.24695718319,  89.37590650495],
      [0.27432990225,    5.53490397494,  71.45417161203],
      [0.27432989235,  174.50406060693,  72.70180860768],
      [0.27432982858, -174.75304215454,  90.62409482042],
      [0.27432989072,   -6.42543252564, 125.20303342952],
      [0.27432989240,    5.49593821872, 107.29819109356],
      [0.27432989923,  174.46509587012, 108.54582768974],
      [0.27432989412, -173.47249824405, 126.44847509514],
      [0.27432988263,  -16.03997941196, 160.67372880945],
      [0.27432988578,    8.75024535050, 143.05157442959],
      [0.27432988704,  170.98657132818, 144.28998881634],
      [0.27432988010, -162.90561198533, 161.87518775511],
      [0.27432986483,   83.20721630672, 174.71616371452]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [12,11,8,3],
      [14,13,3,9],
      [6,14,9,10],
      [12,15,6,11],
      [16,15,12,3],
      [18,17,3,13],
      [6,18,13,14],
      [16,19,6,15],
      [20,19,16,3],
      [21,20,3,17],
      [6,21,17,18],
      [20,21,6,19]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [3,12],
      [3,13],
      [3,16],
      [3,17],
      [3,20],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [6,14],
      [6,15],
      [6,18],
      [6,19],
      [6,21],
      [7,8],
      [8,11],
      [9,10],
      [9,14],
      [11,12],
      [12,15],
      [13,14],
      [13,18],
      [15,16],
      [16,19],
      [17,18],
      [17,21],
      [19,20],
      [20,21]
    ]
  ],
  [
    "enneagonal_trapezohedron",
    "Enneagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.09967569853, -0.03109121041,  0.28700473236],
      [-0.00449688147,  0.03109120560,  0.30378732765],
      [-0.10812707432, -0.03109120337,  0.28392868530],
      [-0.00000000000, -1.00000000000, -0.00000000000],
      [ 0.26083909572, -0.03109119912,  0.15578806357],
      [ 0.19182591719,  0.03109121011,  0.23560511930],
      [ 0.00000000000,  1.00000000000,  0.00000000000],
      [-0.19871552184,  0.03109120431,  0.22982403661],
      [-0.26533596988, -0.03109120286,  0.14799923301],
      [ 0.29995285209, -0.03109119664, -0.04832353760],
      [ 0.29839124041,  0.03109120428,  0.05718066821],
      [-0.29995285209,  0.03109119664,  0.04832353760],
      [-0.29839124041, -0.03109120428, -0.05718066821],
      [ 0.19871552184, -0.03109120431, -0.22982403661],
      [ 0.26533596988,  0.03109120286, -0.14799923301],
      [-0.26083909572,  0.03109119912, -0.15578806357],
      [-0.19182591719, -0.03109121011, -0.23560511930],
      [ 0.00449688147, -0.03109120560, -0.30378732765],
      [ 0.10812707432,  0.03109120337, -0.28392868530],
      [-0.09967569853,  0.03109121041, -0.28700473236]
    ],
    [
      [0.30540730941,  -17.32393663862,  19.99136596564],
      [0.30540731073,   98.22991277939,   5.90398591727],
      [0.30540731076, -163.95777128867,  21.61622610532],
      [1.00000000000,  -89.99999999999,  89.99999999999],
      [0.30540729734,   -6.79740536654,  59.32955244196],
      [0.30540729869,    9.20645860564,  39.51611872633],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.30540728448,  171.10754696024,  41.19115786195],
      [0.30540728999, -173.31674427607,  61.01397561204],
      [0.30540717128,   -5.91778120996,  99.10397657184],
      [0.30540730861,    5.94853149631,  79.20896763446],
      [0.30540717128,  174.08221879003,  80.89602342815],
      [0.30540730861, -174.05146850368, 100.79103236553],
      [0.30540728448,   -8.89245303975, 138.80884213804],
      [0.30540728999,    6.68325572392, 118.98602438795],
      [0.30540729734,  173.20259463344, 120.67044755803],
      [0.30540729869, -170.79354139435, 140.48388127366],
      [0.30540731073,  -81.77008722060, 174.09601408272],
      [0.30540731076,   16.04222871132, 158.38377389467],
      [0.30540730941,  162.67606336137, 160.00863403435]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [12,11,8,3],
      [14,13,3,9],
      [6,14,9,10],
      [12,15,6,11],
      [16,15,12,3],
      [18,17,3,13],
      [6,18,13,14],
      [16,19,6,15],
      [17,19,16,3],
      [6,19,17,18]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [3,12],
      [3,13],
      [3,16],
      [3,17],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [6,14],
      [6,15],
      [6,18],
      [6,19],
      [7,8],
      [8,11],
      [9,10],
      [9,14],
      [11,12],
      [12,15],
      [13,14],
      [13,18],
      [15,16],
      [16,19],
      [17,18],
      [17,19]
    ]
  ],
  [
    "heptagonal_trapezohedron",
    "Heptagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.15933687369, -0.05209510052,  0.35802671535],
      [-0.01178440532,  0.05209506563,  0.39170460464],
      [-0.18057162842, -0.05209509977,  0.34780059309],
      [ 0.00000000000, -1.00000000000,  0.00000000000],
      [ 0.37926145196, -0.05209508876,  0.09865141109],
      [ 0.29889951735,  0.05209507083,  0.25343724148],
      [-0.00000000000,  1.00000000000, -0.00000000000],
      [-0.31359442195,  0.05209507236,  0.23501040648],
      [-0.38450602213, -0.05209507830,  0.07567352614],
      [ 0.31359442195, -0.05209507236, -0.23501040648],
      [ 0.38450602213,  0.05209507830, -0.07567352614],
      [-0.37926145196,  0.05209508876, -0.09865141109],
      [-0.29889951735, -0.05209507083, -0.25343724148],
      [ 0.01178440532, -0.05209506563, -0.39170460464],
      [ 0.18057162842,  0.05209509977, -0.34780059309],
      [-0.15933687369,  0.05209510052, -0.35802671535]
    ],
    [
      [0.39532931553,  -18.10512730588,  25.09015092726],
      [0.39532931256,  102.74633327200,   7.76474182503],
      [0.39532931205, -163.90709508767,  28.38484324140],
      [1.00000000000,  -89.99999999999,  89.99999999999],
      [0.39532929075,   -7.82116460645,  75.54956589793],
      [0.39532929722,    9.88674610587,  50.12768809629],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.39532929211,  170.56801928124,  53.52532102116],
      [0.39532930678, -172.28422195910,  78.96439512595],
      [0.39532929211,   -9.43198071875, 126.47467897883],
      [0.39532930678,    7.71577804089, 101.03560487404],
      [0.39532929075,  172.17883539354, 104.45043410206],
      [0.39532929722, -170.11325389411, 129.87231190370],
      [0.39532931256,  -77.25366672798, 172.23525817496],
      [0.39532931205,   16.09290491232, 151.61515675859],
      [0.39532931553,  161.89487269411, 154.90984907273]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [12,11,8,3],
      [14,13,3,9],
      [6,14,9,10],
      [12,15,6,11],
      [13,15,12,3],
      [6,15,13,14]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [3,12],
      [3,13],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [6,14],
      [6,15],
      [7,8],
      [8,11],
      [9,10],
      [9,14],
      [11,12],
      [12,15],
      [13,14],
      [13,15]
    ]
  ],
  [
    "hexagonal_trapezohedron",
    "Hexagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.21077945274, -0.07179671220,  0.40719463133],
      [-0.02105696444,  0.07179681426,  0.45803062041],
      [-0.24725117903, -0.07179674075,  0.38613767351],
      [ 0.00000001746, -1.00000000000, -0.00000001939],
      [ 0.45803058721, -0.07179671638,  0.02105695657],
      [ 0.38613769213,  0.07179681752,  0.24725117466],
      [-0.00000000000,  0.99999999466, -0.00000000000],
      [-0.40719463483,  0.07179675601,  0.21077944864],
      [-0.45803063391, -0.07179678648, -0.02105696269],
      [ 0.24725117677, -0.07179676068, -0.38613770590],
      [ 0.40719468018,  0.07179677996, -0.21077948352],
      [-0.38613769009,  0.07179672747, -0.24725120767],
      [-0.21077946131, -0.07179681703, -0.40719467592],
      [ 0.02105695713,  0.07179664363, -0.45803045003]
    ],
    [
      [0.46410151192,  -18.81011682832,  28.67176760585],
      [0.46410152717,  106.34564790761,   9.27753217454],
      [0.46410151952, -163.80777174223,  33.69410290051],
      [1.00000000000,  -89.99999899976,  90.00000111118],
      [0.46410147891,   -8.90867366573,  87.39951472962],
      [0.46410154456,   10.53305205986,  57.80839267192],
      [0.99999999466,   89.99999999999,  89.99999999999],
      [0.46410151990,  170.00036088461,  62.98866993565],
      [0.46410153612, -171.09131867014,  92.60048570555],
      [0.46410154835,  -16.19223265656, 146.30589896998],
      [0.46410157924,    9.99964129133, 117.01133116296],
      [0.46410154652,  169.46696080222, 122.19161199084],
      [0.46410157115, -161.18985834971, 151.32823049523],
      [0.46410133229,   73.65432069463, 170.72248463514]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [12,11,8,3],
      [13,12,3,9],
      [6,13,9,10],
      [12,13,6,11]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [3,12],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [6,13],
      [7,8],
      [8,11],
      [9,10],
      [9,13],
      [11,12],
      [12,13]
    ]
  ],
  [
    "octagonal_trapezohedron",
    "Octagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.12440374180, -0.03956610710,  0.31883630933],
      [-0.00707929049,  0.03956612081,  0.34217358778],
      [-0.13748458654, -0.03956612082,  0.31341805381],
      [ 0.00000000328, -0.99999999972, -0.00000000691],
      [ 0.31341805431, -0.03956611462,  0.13748458160],
      [ 0.23694744249,  0.03956612970,  0.24695906900],
      [ 0.00000000000,  1.00000000000,  0.00000000000],
      [-0.24695908004,  0.03956613350,  0.23694744807],
      [-0.31883629862, -0.03956614368,  0.12440375701],
      [ 0.31883630448, -0.03956613242, -0.12440374250],
      [ 0.34217360200,  0.03956614317,  0.00707928788],
      [-0.34217356974,  0.03956611153, -0.00707929452],
      [-0.31341804435, -0.03956612986, -0.13748455659],
      [ 0.13748456384, -0.03956610907, -0.31341806002],
      [ 0.24695907885,  0.03956612319, -0.23694744766],
      [-0.23694744654,  0.03956610486, -0.24695907595],
      [-0.12440376449, -0.03956612279, -0.31883631554],
      [ 0.00707928976,  0.03956611334, -0.34217359479]
    ],
    [
      [0.34452628340,  -17.64305529000,  22.26612222536],
      [0.34452628121,  100.14419358069,   6.69971877848],
      [0.34452629204, -163.94492938135,  24.53507780455],
      [0.99999999972,  -89.99999981201,  90.00000039578],
      [0.34452628981,   -7.19499886627,  66.48094949675],
      [0.34452627024,    9.47994070259,  44.20846013907],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.34452628242,  170.89780636105,  46.54785043727],
      [0.34452628318, -172.92601715801,  68.83306913392],
      [0.34452628207,   -7.07398072018, 111.16692834963],
      [0.34452629784,    6.59591976996,  88.82260986090],
      [0.34452626231,  173.40408484199,  91.17739136390],
      [0.34452627252, -172.80499816432, 113.51904721890],
      [0.34452628728,  -16.05506861288, 155.46492641463],
      [0.34452628011,    9.10219134903, 133.45214983518],
      [0.34452627515,  170.52006530125, 135.79154067723],
      [0.34452629914, -162.35694116392, 157.73387410580],
      [0.34452628730,   79.85580556086, 173.30028259374]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [12,11,8,3],
      [14,13,3,9],
      [6,14,9,10],
      [12,15,6,11],
      [16,15,12,3],
      [17,16,3,13],
      [6,17,13,14],
      [16,17,6,15]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [3,12],
      [3,13],
      [3,16],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [6,14],
      [6,15],
      [6,17],
      [7,8],
      [8,11],
      [9,10],
      [9,14],
      [11,12],
      [12,15],
      [13,14],
      [13,17],
      [15,16],
      [16,17]
    ]
  ],
  [
    "pentagonal_trapezohedron",
    "Pentagonal Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.29061700374, -0.10557280512,  0.47022819599],
      [-0.04127909262,  0.10557281662,  0.55124299653],
      [-0.35740800281, -0.10557280588,  0.42170170398],
      [ 0.00000000000, -1.00000000000,  0.00000000000],
      [ 0.53701907744, -0.10557277682, -0.13108468003],
      [ 0.51150729951,  0.10557282394,  0.20960220829],
      [-0.00000000000,  1.00000000000, -0.00000000000],
      [-0.53701907744,  0.10557277682,  0.13108468003],
      [-0.51150729951, -0.10557282394, -0.20960220829],
      [ 0.04127909262, -0.10557281662, -0.55124299653],
      [ 0.35740800281,  0.10557280588, -0.42170170398],
      [-0.29061700374,  0.10557280512, -0.47022819599]
    ],
    [
      [0.56277741279,  -19.96462853971,  33.32693587180],
      [0.56277741988,  111.35555548884,  11.62015183686],
      [0.56277742044, -163.54367316283,  41.46828745750],
      [1.00000000000,  -89.99999999999,  89.99999999999],
      [0.56277730416,  -11.12196599899, 103.46931672415],
      [0.56277741988,   11.66183878548,  68.13367063006],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.56277730416,  168.87803400100,  76.53068327584],
      [0.56277741988, -168.33816121451, 111.86632936993],
      [0.56277741988,  -68.64444451115, 168.37984816312],
      [0.56277742044,   16.45632683715, 138.53171254249],
      [0.56277741279,  160.03537146028, 146.67306412819]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [10,9,3,4],
      [6,10,4,5],
      [8,11,6,7],
      [9,11,8,3],
      [6,11,9,10]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [3,9],
      [4,5],
      [4,10],
      [5,6],
      [6,7],
      [6,10],
      [6,11],
      [7,8],
      [8,11],
      [9,10],
      [9,11]
    ]
  ],
  [
    "square_trapezohedron",
    "Square Trapezohedron",
    empty_str,
    "trapezohedron",
    "George W. Hart, 1997.  george@li.net",
    [
      [ 0.42339344824, -0.17157294543,  0.55319018257],
      [-0.09178014666,  0.17157285464,  0.69054892905],
      [-0.55319020733, -0.17157287656,  0.42339344003],
      [-0.00000002205, -0.99999998335, -0.00000000805],
      [ 0.55319017981, -0.17157290218, -0.42339346671],
      [ 0.69054891796,  0.17157284736,  0.09178015628],
      [-0.00000000000,  1.00000000000, -0.00000000000],
      [-0.69054887577,  0.17157293950, -0.09178015299],
      [-0.42339347576, -0.17157283330, -0.55319020925],
      [ 0.09178018156,  0.17157289932, -0.69054887093]
    ],
    [
      [0.71743896305,  -22.05940926920,  39.55061574902],
      [0.71743896130,  118.14383936173,  15.73644755891],
      [0.71743896083, -162.76863505583,  53.83265949178],
      [0.99999998335,  -90.00000126364,  90.00000046134],
      [0.71743896148,  -17.23136817104, 126.16734310920],
      [0.71743895011,   13.95309503880,  82.65015437581],
      [1.00000000000,   89.99999999999,  89.99999999999],
      [0.71743893111,  166.04689694206,  97.34984555507],
      [0.71743897305, -157.94060506039, 140.44938663065],
      [0.71743892050,   61.85615778289, 164.26354688847]
    ],
    [
      [2,1,0,3],
      [5,4,3,0],
      [6,5,0,1],
      [7,6,1,2],
      [8,7,2,3],
      [9,8,3,4],
      [6,9,4,5],
      [8,9,6,7]
    ],
    [
      [0,1],
      [0,3],
      [0,5],
      [1,2],
      [1,6],
      [2,3],
      [2,7],
      [3,4],
      [3,8],
      [4,5],
      [4,9],
      [5,6],
      [6,7],
      [6,9],
      [7,8],
      [8,9]
    ]
  ],
  [
    "triangular_trapezohedron",
    "Triangular Trapezohedron",
    "Cube",
    "trapezohedron",
    "Exact Mathematics",
    [
      [ 0.00000000000,  1.00000000000,  0.00000000000],
      [ 0.00000000000,  0.33333333333,  0.94280904158],
      [-0.81649658093,  0.33333333333, -0.47140452079],
      [-0.81649658093, -0.33333333333,  0.47140452079],
      [ 0.81649658093,  0.33333333333, -0.47140452079],
      [ 0.81649658093, -0.33333333333,  0.47140452079],
      [-0.00000000000, -0.33333333333, -0.94280904158],
      [ 0.00000000000, -1.00000000000,  0.00000000000]
    ],
    [
      [1.00000000000,   89.99999999999,  89.99999999999],
      [1.00000000000,   89.99999999999,  19.47122063449],
      [1.00000000000,  157.79234570139, 118.12550570205],
      [1.00000000000, -157.79234570139,  61.87449429794],
      [1.00000000000,   22.20765429859, 118.12550570205],
      [1.00000000000,  -22.20765429859,  61.87449429794],
      [1.00000000000,  -89.99999999999, 160.52877936550],
      [1.00000000000,  -89.99999999999,  89.99999999999]
    ],
    [
      [6,4,0,2],
      [5,1,0,4],
      [7,5,4,6],
      [1,3,2,0],
      [3,7,6,2],
      [7,3,1,5]
    ],
    [
      [0,1],
      [0,2],
      [0,4],
      [1,3],
      [1,5],
      [2,3],
      [2,6],
      [3,7],
      [4,5],
      [4,6],
      [5,7],
      [6,7]
    ]
  ]
];

//! @}

//----------------------------------------------------------------------------//
// openscad-amu auxiliary scripts
//----------------------------------------------------------------------------//

/*
BEGIN_SCOPE db;
BEGIN_SCOPE autostat;
  BEGIN_OPENSCAD;
    include <math/polytope.scad>;
    include <math/utility.scad>;
    include <datatypes/table.scad>;
    include <database/geometry/polyhedra/trapezohedron.scad>;

    fs  = "^";

    tc = dtc_polyhedra_trapezohedron;
    tr = dtr_polyhedra_trapezohedron;

    ids = get_table_ridl(tr);

    echo
    (
      str
      (
        "no.", fs, "table id", fs, "other name", fs,
        "vertices", fs, "faces", fs, "edges",

        fs, "face-verticies",
        fs, "face-angles",
        fs, "edge-lengths",
        fs, "edge-angles"
      )
    );

    for ( id = ids )
    {
      i = first(find(id, ids, c=1))+1;

      n = get_table_v(tr, tc, id, "n");
      o = get_table_v(tr, tc, id, "o");
      g = get_table_v(tr, tc, id, "g");
      d = get_table_v(tr, tc, id, "d");

      c = get_table_v(tr, tc, id, "c");
      s = get_table_v(tr, tc, id, "s");
      f = get_table_v(tr, tc, id, "f");
      e = get_table_v(tr, tc, id, "e");

      fo = is_empty(o) ? "-" : o;

      echo
      (
        str
        (
          i, fs, id, fs, fo, fs,
          len(c), fs, len(f), fs, len(e),

          fs, hist(qsort(polytope_face_vcounts(f)), m=9),
          fs, hist(qsort(dround(polytope_face_angles(c, f), d=1)), m=9),
          fs, hist(qsort(sround(polytope_edge_lengths(c, e), d=3)), m=9),
          fs, hist(qsort(dround(polytope_edge_angles(c, f), d=1)), m=9),

          fs
        )
      );
    }
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_csg}.mfs;
    include --path "${INCLUDE_PATH}" script_std.mfs;
  END_MFSCRIPT;
END_SCOPE;
END_SCOPE;
*/

/*
BEGIN_SCOPE db;
BEGIN_SCOPE dim;
  BEGIN_OPENSCAD;
    include <units/coordinate.scad>;
    include <tools/polytope.scad>;
    include <datatypes/table.scad>;
    include <database/geometry/polyhedra/trapezohedron.scad>;

    config = 0;

    tc = dtc_polyhedra_trapezohedron;
    tr = dtr_polyhedra_trapezohedron;

    id = "default";
    sr = 100;

    pv = get_table_v(tr, tc, id, "c");
    pf = get_table_v(tr, tc, id, "f");
    pe = get_table_v(tr, tc, id, "e");

    sv = coordinates_csc(pv, sr);

    if (config == 0)  // png preview
    {
      $fn = 25;

      %polyhedron(sv, pf);

      polytope_frame(sv, pf, pe)
      {
        circle(r = sr / 25);
        color("lightblue")
        sphere(r = sr / 25 * (1 + 1/2));
      }
    }

    if (config == 1)  // stl model
    {
      polyhedron(sv, pf);
    }
  END_OPENSCAD;

  BEGIN_MFSCRIPT;
    include --path "${INCLUDE_PATH}" {config_base,config_png}.mfs;

    views     name "views" views "diag";
    defines   name "ids" define "id"
              strings
              "
                decagonal_trapezohedron
                enneagonal_trapezohedron
                heptagonal_trapezohedron
                hexagonal_trapezohedron
                octagonal_trapezohedron
                pentagonal_trapezohedron
                square_trapezohedron
                triangular_trapezohedron
              ";
    variables add_opts_combine "views ids";
    variables add_opts "-D config=0 --viewall --autocenter";

    include --path "${INCLUDE_PATH}" script_new.mfs;

    include --path "${INCLUDE_PATH}" config_stl.mfs;
    variables add_opts_combine "ids";
    variables add_opts "-D config=1";

    include --path "${INCLUDE_PATH}" script_app.mfs;
  END_MFSCRIPT;
END_SCOPE;
END_SCOPE;
*/

//----------------------------------------------------------------------------//
// end of file
//----------------------------------------------------------------------------//
