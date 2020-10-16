// DO NOT EDIT!  Generated automatically by subst-default-vals.
/*

Copyright (C) 1993-2017 John W. Eaton

This file is part of Octave.

Octave is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 3 of the License, or (at your
option) any later version.

Octave is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with Octave; see the file COPYING.  If not, see
<http://www.gnu.org/licenses/>.

*/

#if ! defined (octave_defaults_h)
#define octave_defaults_h 1

#include "octave-config.h"

#include <string>

#include "pathsearch.h"

#if ! defined (OCTAVE_CANONICAL_HOST_TYPE)
#  define OCTAVE_CANONICAL_HOST_TYPE "x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_DEFAULT_PAGER)
#  define OCTAVE_DEFAULT_PAGER "less"
#endif

#if ! defined (OCTAVE_ARCHLIBDIR)
#  define OCTAVE_ARCHLIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec/octave/4.2.1/exec/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_BINDIR)
#  define OCTAVE_BINDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/bin"
#endif

#if ! defined (OCTAVE_DATADIR)
#  define OCTAVE_DATADIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share"
#endif

#if ! defined (OCTAVE_DATAROOTDIR)
#  define OCTAVE_DATAROOTDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share"
#endif

#if ! defined (OCTAVE_DOC_CACHE_FILE)
#  define OCTAVE_DOC_CACHE_FILE "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/etc/doc-cache"
#endif

#if ! defined (OCTAVE_TEXI_MACROS_FILE)
#  define OCTAVE_TEXI_MACROS_FILE "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/etc/macros.texi"
#endif

#if ! defined (OCTAVE_EXEC_PREFIX)
#  define OCTAVE_EXEC_PREFIX "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_FCNFILEDIR)
#  define OCTAVE_FCNFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/m"
#endif

#if ! defined (OCTAVE_IMAGEDIR)
#  define OCTAVE_IMAGEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/imagelib"
#endif

#if ! defined (OCTAVE_INCLUDEDIR)
#  define OCTAVE_INCLUDEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/include"
#endif

#if ! defined (OCTAVE_INFODIR)
#  define OCTAVE_INFODIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/info"
#endif

#if ! defined (OCTAVE_INFOFILE)
#  define OCTAVE_INFOFILE "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/info/octave.info"
#endif

#if ! defined (OCTAVE_LIBDIR)
#  define OCTAVE_LIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib"
#endif

#if ! defined (OCTAVE_LIBEXECDIR)
#  define OCTAVE_LIBEXECDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec"
#endif

#if ! defined (OCTAVE_LIBEXECDIR)
#  define OCTAVE_LIBEXECDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec"
#endif

#if ! defined (OCTAVE_LOCALAPIFCNFILEDIR)
#  define OCTAVE_LOCALAPIFCNFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/site/api-v51/m"
#endif

#if ! defined (OCTAVE_LOCALAPIOCTFILEDIR)
#  define OCTAVE_LOCALAPIOCTFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib/octave/site/oct/api-v51/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_LOCALARCHLIBDIR)
#  define OCTAVE_LOCALARCHLIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec/octave/site/exec/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_LOCALFCNFILEDIR)
#  define OCTAVE_LOCALFCNFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/site/m"
#endif

#if ! defined (OCTAVE_LOCALOCTFILEDIR)
#  define OCTAVE_LOCALOCTFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib/octave/site/oct/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_LOCALSTARTUPFILEDIR)
#  define OCTAVE_LOCALSTARTUPFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/site/m/startup"
#endif

#if ! defined (OCTAVE_LOCALAPIARCHLIBDIR)
#  define OCTAVE_LOCALAPIARCHLIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec/octave/api-v51/site/exec/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_LOCALVERARCHLIBDIR)
#  define OCTAVE_LOCALVERARCHLIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/libexec/octave/4.2.1/site/exec/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_LOCALVERFCNFILEDIR)
#  define OCTAVE_LOCALVERFCNFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/site/m"
#endif

#if ! defined (OCTAVE_LOCALVEROCTFILEDIR)
#  define OCTAVE_LOCALVEROCTFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib/octave/4.2.1/site/oct/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_MAN1DIR)
#  define OCTAVE_MAN1DIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/man/man1"
#endif

#if ! defined (OCTAVE_MAN1EXT)
#  define OCTAVE_MAN1EXT ".1"
#endif

#if ! defined (OCTAVE_MANDIR)
#  define OCTAVE_MANDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/man"
#endif

#if ! defined (OCTAVE_OCTDATADIR)
#  define OCTAVE_OCTDATADIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/data"
#endif

#if ! defined (OCTAVE_OCTFILEDIR)
#  define OCTAVE_OCTFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib/octave/4.2.1/oct/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_OCTETCDIR)
#  define OCTAVE_OCTETCDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/etc"
#endif

#if ! defined (OCTAVE_OCTLOCALEDIR)
#  define OCTAVE_OCTLOCALEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/locale"
#endif

#if ! defined (OCTAVE_OCTINCLUDEDIR)
#  define OCTAVE_OCTINCLUDEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/include/octave-4.2.1/octave"
#endif

#if ! defined (OCTAVE_OCTLIBDIR)
#  define OCTAVE_OCTLIBDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/lib/octave/4.2.1"
#endif

#if ! defined (OCTAVE_OCTTESTSDIR)
#  define OCTAVE_OCTTESTSDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/etc/tests"
#endif

#if ! defined (OCTAVE_PREFIX)
#  define OCTAVE_PREFIX "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32"
#endif

#if ! defined (OCTAVE_STARTUPFILEDIR)
#  define OCTAVE_STARTUPFILEDIR "/scratch/jwe/mxe-octave/4.2.1/w64-32/usr/x86_64-w64-mingw32/share/octave/4.2.1/m/startup"
#endif

#if ! defined (OCTAVE_RELEASE)
#  define OCTAVE_RELEASE ""
#endif

extern OCTINTERP_API std::string Voctave_home;

extern OCTINTERP_API std::string Vbin_dir;
extern OCTINTERP_API std::string Vinfo_dir;
extern OCTINTERP_API std::string Vdata_dir;
extern OCTINTERP_API std::string Vlibexec_dir;
extern OCTINTERP_API std::string Varch_lib_dir;
extern OCTINTERP_API std::string Vlocal_arch_lib_dir;
extern OCTINTERP_API std::string Vlocal_ver_arch_lib_dir;

extern OCTINTERP_API std::string Vlocal_ver_oct_file_dir;
extern OCTINTERP_API std::string Vlocal_api_oct_file_dir;
extern OCTINTERP_API std::string Vlocal_oct_file_dir;

extern OCTINTERP_API std::string Vlocal_ver_fcn_file_dir;
extern OCTINTERP_API std::string Vlocal_api_fcn_file_dir;
extern OCTINTERP_API std::string Vlocal_fcn_file_dir;

extern OCTINTERP_API std::string Voct_data_dir;
extern OCTINTERP_API std::string Voct_etc_dir;
extern OCTINTERP_API std::string Voct_locale_dir;

extern OCTINTERP_API std::string Voct_file_dir;
extern OCTINTERP_API std::string Vfcn_file_dir;

extern OCTINTERP_API std::string Vimage_dir;

// Name of the editor to be invoked by the edit_history command.
extern OCTINTERP_API std::string VEDITOR;

extern OCTINTERP_API std::string Vlocal_site_defaults_file;
extern OCTINTERP_API std::string Vsite_defaults_file;

extern OCTINTERP_API std::string Vbuilt_in_docstrings_file;

// Name of the FFTW wisdom program.
extern OCTINTERP_API std::string Vfftw_wisdom_program;

extern OCTINTERP_API std::string subst_octave_home (const std::string&);

extern OCTINTERP_API void install_defaults (void);

extern OCTINTERP_API void
set_exec_path (const std::string& path = "");

extern OCTINTERP_API void
set_image_path (const std::string& path = "");

#endif
