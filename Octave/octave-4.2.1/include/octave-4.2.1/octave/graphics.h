// DO NOT EDIT!  Generated automatically by genprops.awk.

/*

Copyright (C) 2007-2017 John W. Eaton

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

#if ! defined (octave_graphics_h)
#define octave_graphics_h 1

#include "octave-config.h"

#include <cctype>

#include <algorithm>
#include <list>
#include <map>
#include <set>
#include <sstream>
#include <string>

#include "caseless-str.h"

#include "errwarn.h"
#include "oct-handle.h"
#include "oct-map.h"
#include "oct-mutex.h"
#include "oct-refcount.h"
#include "ov.h"
#include "text-renderer.h"

// FIXME: maybe this should be a configure option?
// Matlab defaults to "Helvetica", but that causes problems for many
// gnuplot users.
#if ! defined (OCTAVE_DEFAULT_FONTNAME)
#define OCTAVE_DEFAULT_FONTNAME "*"
#endif

typedef octave_handle graphics_handle;

// ---------------------------------------------------------------------

class base_scaler
{
public:
  base_scaler (void) { }

  virtual ~base_scaler (void) { }

  virtual Matrix scale (const Matrix&) const
  {
    error ("invalid axis scale");
  }

  virtual NDArray scale (const NDArray&) const
  {
    error ("invalid axis scale");
  }

  virtual double scale (double) const
  {
    error ("invalid axis scale");
  }

  virtual double unscale (double) const
  {
    error ("invalid axis scale");
  }

  virtual base_scaler* clone () const
  { return new base_scaler (); }

  virtual bool is_linear (void) const
  { return false; }
};

class lin_scaler : public base_scaler
{
public:
  lin_scaler (void) { }

  Matrix scale (const Matrix& m) const { return m; }

  NDArray scale (const NDArray& m) const { return m; }

  double scale (double d) const { return d; }

  double unscale (double d) const { return d; }

  base_scaler* clone (void) const { return new lin_scaler (); }

  bool is_linear (void) const { return true; }
};

class log_scaler : public base_scaler
{
public:
  log_scaler (void) { }

  Matrix scale (const Matrix& m) const
  {
    Matrix retval (m.rows (), m.cols ());

    do_scale (m.data (), retval.fortran_vec (), m.numel ());

    return retval;
  }

  NDArray scale (const NDArray& m) const
  {
    NDArray retval (m.dims ());

    do_scale (m.data (), retval.fortran_vec (), m.numel ());

    return retval;
  }

  double scale (double d) const
  { return log10 (d); }

  double unscale (double d) const
  { return pow (10.0, d); }

  base_scaler* clone (void) const
  { return new log_scaler (); }

private:
  void do_scale (const double *src, double *dest, int n) const
  {
    for (int i = 0; i < n; i++)
      dest[i] = log10 (src[i]);
  }
};

class neg_log_scaler : public base_scaler
{
public:
  neg_log_scaler (void) { }

  Matrix scale (const Matrix& m) const
  {
    Matrix retval (m.rows (), m.cols ());

    do_scale (m.data (), retval.fortran_vec (), m.numel ());

    return retval;
  }

  NDArray scale (const NDArray& m) const
  {
    NDArray retval (m.dims ());

    do_scale (m.data (), retval.fortran_vec (), m.numel ());

    return retval;
  }

  double scale (double d) const
  { return -log10 (-d); }

  double unscale (double d) const
  { return -pow (10.0, -d); }

  base_scaler* clone (void) const
  { return new neg_log_scaler (); }

private:
  void do_scale (const double *src, double *dest, int n) const
  {
    for (int i = 0; i < n; i++)
      dest[i] = -log10 (-src[i]);
  }
};

class scaler
{
public:
  scaler (void) : rep (new base_scaler ()) { }

  scaler (const scaler& s) : rep (s.rep->clone ()) { }

  scaler (const std::string& s)
    : rep (s == "log"
           ? new log_scaler ()
           : (s == "neglog" ? new neg_log_scaler ()
              : (s == "linear" ? new lin_scaler () : new base_scaler ())))
  { }

  ~scaler (void) { delete rep; }

  Matrix scale (const Matrix& m) const
  { return rep->scale (m); }

  NDArray scale (const NDArray& m) const
  { return rep->scale (m); }

  double scale (double d) const
  { return rep->scale (d); }

  double unscale (double d) const
  { return rep->unscale (d); }

  bool is_linear (void) const
  { return rep->is_linear (); }

  scaler& operator = (const scaler& s)
  {
    if (rep)
      {
        delete rep;
        rep = 0;
      }

    rep = s.rep->clone ();

    return *this;
  }

  scaler& operator = (const std::string& s)
  {
    if (rep)
      {
        delete rep;
        rep = 0;
      }

    if (s == "log")
      rep = new log_scaler ();
    else if (s == "neglog")
      rep = new neg_log_scaler ();
    else if (s == "linear")
      rep = new lin_scaler ();
    else
      rep = new base_scaler ();

    return *this;
  }

private:
  base_scaler *rep;
};

// ---------------------------------------------------------------------

class property;

enum listener_mode { POSTSET, PERSISTENT, PREDELETE };

class base_property
{
public:
  friend class property;

public:
  base_property (void)
    : id (-1), count (1), name (), parent (), hidden (), listeners ()
  { }

  base_property (const std::string& s, const graphics_handle& h)
    : id (-1), count (1), name (s), parent (h), hidden (false), listeners ()
  { }

  base_property (const base_property& p)
    : id (-1), count (1), name (p.name), parent (p.parent),
      hidden (p.hidden), listeners ()
  { }

  virtual ~base_property (void) { }

  bool ok (void) const { return parent.ok (); }

  std::string get_name (void) const { return name; }

  void set_name (const std::string& s) { name = s; }

  graphics_handle get_parent (void) const { return parent; }

  void set_parent (const graphics_handle& h) { parent = h; }

  bool is_hidden (void) const { return hidden; }

  void set_hidden (bool flag) { hidden = flag; }

  virtual bool is_radio (void) const { return false; }

  int get_id (void) const { return id; }

  void set_id (int d) { id = d; }

  // Sets property value, notifies graphics toolkit.
  // If do_run is true, runs associated listeners.
  OCTINTERP_API bool set (const octave_value& v, bool do_run = true,
                          bool do_notify_toolkit = true);

  virtual octave_value get (void) const
  {
    error ("get: invalid property \"%s\"", name.c_str ());
  }

  virtual std::string values_as_string (void) const
  {
    error ("values_as_string: invalid property \"%s\"", name.c_str ());
  }

  virtual Cell values_as_cell (void) const
  {
    error ("values_as_cell: invalid property \"%s\"", name.c_str ());
  }

  base_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  void add_listener (const octave_value& v, listener_mode mode = POSTSET)
  {
    octave_value_list& l = listeners[mode];
    l.resize (l.length () + 1, v);
  }

  void delete_listener (const octave_value& v = octave_value (),
                        listener_mode mode = POSTSET)
  {
    octave_value_list& l = listeners[mode];

    if (v.is_defined ())
      {
        bool found = false;
        int i;

        for (i = 0; i < l.length (); i++)
          {
            if (v.internal_rep () == l(i).internal_rep ())
              {
                found = true;
                break;
              }
          }
        if (found)
          {
            for (int j = i; j < l.length () - 1; j++)
              l(j) = l(j + 1);

            l.resize (l.length () - 1);
          }
      }
    else
      {
        if (mode == PERSISTENT)
          l.resize (0);
        else
          {
            octave_value_list lnew (0);
            octave_value_list& lp = listeners[PERSISTENT];
            for (int i = l.length () - 1; i >= 0 ; i--)
              {
                for (int j = 0; j < lp.length (); j++)
                  {
                    if (l(i).internal_rep () == lp(j).internal_rep ())
                      {
                        lnew.resize (lnew.length () + 1, l(i));
                        break;
                      }
                  }
              }
            l = lnew;
          }
      }

  }

  OCTINTERP_API void run_listeners (listener_mode mode = POSTSET);

  virtual base_property* clone (void) const
  { return new base_property (*this); }

protected:
  virtual bool do_set (const octave_value&)
  {
    error ("set: invalid property \"%s\"", name.c_str ());
  }

private:
  typedef std::map<listener_mode, octave_value_list> listener_map;
  typedef std::map<listener_mode, octave_value_list>::iterator
    listener_map_iterator;
  typedef std::map<listener_mode, octave_value_list>::const_iterator
    listener_map_const_iterator;

private:
  int id;
  octave_refcount<int> count;
  std::string name;
  graphics_handle parent;
  bool hidden;
  listener_map listeners;
};

// ---------------------------------------------------------------------

class string_property : public base_property
{
public:
  string_property (const std::string& s, const graphics_handle& h,
                   const std::string& val = "")
    : base_property (s, h), str (val) { }

  string_property (const string_property& p)
    : base_property (p), str (p.str) { }

  octave_value get (void) const
  { return octave_value (str); }

  std::string string_value (void) const { return str; }

  string_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new string_property (*this); }

protected:
  bool do_set (const octave_value& val)
  {
    if (! val.is_string ())
      error ("set: invalid string property value for \"%s\"",
             get_name ().c_str ());

    std::string new_str = val.string_value ();

    if (new_str != str)
      {
        str = new_str;
        return true;
      }
    return false;
  }

private:
  std::string str;
};

// ---------------------------------------------------------------------

class string_array_property : public base_property
{
public:
  enum desired_enum { string_t, cell_t };

  string_array_property (const std::string& s, const graphics_handle& h,
                         const std::string& val = "", const char& sep = '|',
                         const desired_enum& typ = string_t)
    : base_property (s, h), desired_type (typ), separator (sep), str ()
  {
    size_t pos = 0;

    while (true)
      {
        size_t new_pos = val.find_first_of (separator, pos);

        if (new_pos == std::string::npos)
          {
            str.append (val.substr (pos));
            break;
          }
        else
          str.append (val.substr (pos, new_pos - pos));

        pos = new_pos + 1;
      }
  }

  string_array_property (const std::string& s, const graphics_handle& h,
                         const Cell& c, const char& sep = '|',
                         const desired_enum& typ = string_t)
    : base_property (s, h), desired_type (typ), separator (sep), str ()
  {
    if (! c.is_cellstr ())
      error ("set: invalid order property value for \"%s\"",
             get_name ().c_str ());

    string_vector strings (c.numel ());

    for (octave_idx_type i = 0; i < c.numel (); i++)
      strings[i] = c(i).string_value ();

    str = strings;
  }

  string_array_property (const string_array_property& p)
    : base_property (p), desired_type (p.desired_type),
      separator (p.separator), str (p.str) { }

  octave_value get (void) const
  {
    if (desired_type == string_t)
      return octave_value (string_value ());
    else
      return octave_value (cell_value ());
  }

  std::string string_value (void) const
  {
    std::string s;

    for (octave_idx_type i = 0; i < str.numel (); i++)
      {
        s += str[i];
        if (i != str.numel () - 1)
          s += separator;
      }

    return s;
  }

  Cell cell_value (void) const {return Cell (str);}

  string_vector string_vector_value (void) const { return str; }

  string_array_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const
  { return new string_array_property (*this); }

protected:
  bool do_set (const octave_value& val)
  {
    if (val.is_string () && val.rows () == 1)
      {
        bool replace = false;
        std::string new_str = val.string_value ();
        string_vector strings;
        size_t pos = 0;

        // Split single string on delimiter (usually '|')
        while (pos != std::string::npos)
          {
            size_t new_pos = new_str.find_first_of (separator, pos);

            if (new_pos == std::string::npos)
              {
                strings.append (new_str.substr (pos));
                break;
              }
            else
              strings.append (new_str.substr (pos, new_pos - pos));

            pos = new_pos + 1;
          }

        if (str.numel () == strings.numel ())
          {
            for (octave_idx_type i = 0; i < str.numel (); i++)
              if (strings[i] != str[i])
                {
                  replace = true;
                  break;
                }
          }
        else
          replace = true;

        desired_type = string_t;

        if (replace)
          {
            str = strings;
            return true;
          }
      }
    else if (val.is_string ())  // multi-row character matrix
      {
        bool replace = false;
        charMatrix chm = val.char_matrix_value ();
        octave_idx_type nel = chm.rows ();
        string_vector strings (nel);

        if (nel != str.numel ())
          replace = true;
        for (octave_idx_type i = 0; i < nel; i++)
          {
            strings[i] = chm.row_as_string (i);
            if (! replace && strings[i] != str[i])
              replace = true;
          }

        desired_type = string_t;

        if (replace)
          {
            str = strings;
            return true;
          }
      }
    else if (val.is_cellstr ())
      {
        bool replace = false;
        Cell new_cell = val.cell_value ();

        string_vector strings = new_cell.cellstr_value ();

        octave_idx_type nel = strings.numel ();

        if (nel != str.numel ())
          replace = true;
        else
          {
            for (octave_idx_type i = 0; i < nel; i++)
              {
                if (strings[i] != str[i])
                  {
                    replace = true;
                    break;
                  }
              }
          }

        desired_type = cell_t;

        if (replace)
          {
            str = strings;
            return true;
          }
      }
    else
      error ("set: invalid string property value for \"%s\"",
             get_name ().c_str ());

    return false;
  }

private:
  desired_enum desired_type;
  char separator;
  string_vector str;
};

// ---------------------------------------------------------------------

class text_label_property : public base_property
{
public:
  enum type { char_t, cellstr_t };

  text_label_property (const std::string& s, const graphics_handle& h,
                       const std::string& val = "")
    : base_property (s, h), value (val), stored_type (char_t)
  { }

  text_label_property (const std::string& s, const graphics_handle& h,
                       const NDArray& nda)
    : base_property (s, h), stored_type (char_t)
  {
    octave_idx_type nel = nda.numel ();

    value.resize (nel);

    for (octave_idx_type i = 0; i < nel; i++)
      {
        std::ostringstream buf;
        buf << nda(i);
        value[i] = buf.str ();
      }
  }

  text_label_property (const std::string& s, const graphics_handle& h,
                       const Cell& c)
    : base_property (s, h), stored_type (cellstr_t)
  {
    octave_idx_type nel = c.numel ();

    value.resize (nel);

    for (octave_idx_type i = 0; i < nel; i++)
      {
        octave_value tmp = c(i);

        if (tmp.is_string ())
          value[i] = c(i).string_value ();
        else
          {
            double d = c(i).double_value ();

            std::ostringstream buf;
            buf << d;
            value[i] = buf.str ();
          }
      }
  }

  text_label_property (const text_label_property& p)
    : base_property (p), value (p.value), stored_type (p.stored_type)
  { }

  bool empty (void) const
  {
    octave_value tmp = get ();
    return tmp.is_empty ();
  }

  octave_value get (void) const
  {
    if (stored_type == char_t)
      return octave_value (char_value ());
    else
      return octave_value (cell_value ());
  }

  std::string string_value (void) const
  {
    return value.empty () ? "" : value[0];
  }

  string_vector string_vector_value (void) const { return value; }

  charMatrix char_value (void) const { return charMatrix (value, ' '); }

  Cell cell_value (void) const {return Cell (value); }

  text_label_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new text_label_property (*this); }

protected:

  bool do_set (const octave_value& val)
  {
    if (val.is_string ())
      {
        value = val.string_vector_value ();

        stored_type = char_t;
      }
    else if (val.is_cell ())
      {
        Cell c = val.cell_value ();

        octave_idx_type nel = c.numel ();

        value.resize (nel);

        for (octave_idx_type i = 0; i < nel; i++)
          {
            octave_value tmp = c(i);

            if (tmp.is_string ())
              value[i] = c(i).string_value ();
            else
              {
                double d = c(i).double_value ();

                std::ostringstream buf;
                buf << d;
                value[i] = buf.str ();
              }
          }

        stored_type = cellstr_t;
      }
    else
      {
        NDArray nda;

        try
          {
            nda = val.array_value ();
          }
        catch (octave::execution_exception& e)
          {
            error (e, "set: invalid string property value for \"%s\"",
                   get_name ().c_str ());
          }

        octave_idx_type nel = nda.numel ();

        value.resize (nel);

        for (octave_idx_type i = 0; i < nel; i++)
          {
            std::ostringstream buf;
            buf << nda(i);
            value[i] = buf.str ();
          }

        stored_type = char_t;
      }

    return true;
  }

private:
  string_vector value;
  type stored_type;
};

// ---------------------------------------------------------------------

class radio_values
{
public:
  OCTINTERP_API radio_values (const std::string& opt_string = "");

  radio_values (const radio_values& a)
    : default_val (a.default_val), possible_vals (a.possible_vals) { }

  radio_values& operator = (const radio_values& a)
  {
    if (&a != this)
      {
        default_val = a.default_val;
        possible_vals = a.possible_vals;
      }

    return *this;
  }

  std::string default_value (void) const { return default_val; }

  bool validate (const std::string& val, std::string& match)
  {
    bool retval = true;

    if (! contains (val, match))
      error ("invalid value = %s", val.c_str ());

    return retval;
  }

  bool contains (const std::string& val, std::string& match)
  {
    size_t k = 0;

    size_t len = val.length ();

    std::string first_match;

    for (const auto& possible_val : possible_vals)
      {
        if (possible_val.compare (val, len))
          {
            if (len == possible_val.length ())
              {
                // We found a full match (consider the case of val == "replace"
                // with possible values "replace" and "replacechildren").  Any
                // other matches are irrelevant, so set match and return now.
                match = possible_val;
                return true;
              }
            else
              {
                if (k == 0)
                  first_match = possible_val;

                k++;
              }
          }
      }

    if (k == 1)
      {
        match = first_match;
        return true;
      }
    else
      return false;
  }

  std::string values_as_string (void) const;

  Cell values_as_cell (void) const;

  octave_idx_type nelem (void) const { return possible_vals.size (); }

private:
  // Might also want to cache
  std::string default_val;
  std::set<caseless_str> possible_vals;
};

class radio_property : public base_property
{
public:
  radio_property (const std::string& nm, const graphics_handle& h,
                  const radio_values& v = radio_values ())
    : base_property (nm, h),
      vals (v), current_val (v.default_value ()) { }

  radio_property (const std::string& nm, const graphics_handle& h,
                  const std::string& v)
    : base_property (nm, h),
      vals (v), current_val (vals.default_value ()) { }

  radio_property (const std::string& nm, const graphics_handle& h,
                  const radio_values& v, const std::string& def)
    : base_property (nm, h),
      vals (v), current_val (def) { }

  radio_property (const radio_property& p)
    : base_property (p), vals (p.vals), current_val (p.current_val) { }

  octave_value get (void) const { return octave_value (current_val); }

  const std::string& current_value (void) const { return current_val; }

  std::string values_as_string (void) const { return vals.values_as_string (); }

  Cell values_as_cell (void) const { return vals.values_as_cell (); }

  bool is (const caseless_str& v) const
  { return v.compare (current_val); }

  bool is_radio (void) const { return true; }

  radio_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new radio_property (*this); }

protected:
  bool do_set (const octave_value& newval)
  {
    if (! newval.is_string ())
      error ("set: invalid value for radio property \"%s\"",
             get_name ().c_str ());

    std::string s = newval.string_value ();

    std::string match;

    if (! vals.validate (s, match))
      error ("set: invalid value for radio property \"%s\" (value = %s)",
             get_name ().c_str (), s.c_str ());

    if (match != current_val)
      {
        if (s.length () != match.length ())
          warning_with_id ("Octave:abbreviated-property-match",
                           "%s: allowing %s to match %s value %s",
                           "set", s.c_str (), get_name ().c_str (),
                           match.c_str ());
        current_val = match;
        return true;
      }
    return false;
  }

private:
  radio_values vals;
  std::string current_val;
};

// ---------------------------------------------------------------------

class color_values
{
public:
  color_values (double r = 0, double g = 0, double b = 1)
    : xrgb (1, 3)
  {
    xrgb(0) = r;
    xrgb(1) = g;
    xrgb(2) = b;

    validate ();
  }

  color_values (const std::string& str)
    : xrgb (1, 3)
  {
    if (! str2rgb (str))
      error ("invalid color specification: %s", str.c_str ());
  }

  color_values (const color_values& c)
    : xrgb (c.xrgb)
  { }

  color_values& operator = (const color_values& c)
  {
    if (&c != this)
      xrgb = c.xrgb;

    return *this;
  }

  bool operator == (const color_values& c) const
  {
    return (xrgb(0) == c.xrgb(0)
            && xrgb(1) == c.xrgb(1)
            && xrgb(2) == c.xrgb(2));
  }

  bool operator != (const color_values& c) const
  { return ! (*this == c); }

  Matrix rgb (void) const { return xrgb; }

  operator octave_value (void) const { return xrgb; }

  void validate (void) const
  {
    for (int i = 0; i < 3; i++)
      {
        if (xrgb(i) < 0 ||  xrgb(i) > 1)
          error ("invalid RGB color specification");
      }
  }

private:
  Matrix xrgb;

  OCTINTERP_API bool str2rgb (const std::string& str);
};

class color_property : public base_property
{
public:
  color_property (const color_values& c, const radio_values& v)
    : base_property ("", graphics_handle ()),
      current_type (color_t), color_val (c), radio_val (v),
      current_val (v.default_value ())
  { }

  color_property (const radio_values& v, const color_values& c)
    : base_property ("", graphics_handle ()),
      current_type (radio_t), color_val (c), radio_val (v),
      current_val (v.default_value ())
  { }

  color_property (const std::string& nm, const graphics_handle& h,
                  const color_values& c = color_values (),
                  const radio_values& v = radio_values ())
    : base_property (nm, h),
      current_type (color_t), color_val (c), radio_val (v),
      current_val (v.default_value ())
  { }

  color_property (const std::string& nm, const graphics_handle& h,
                  const radio_values& v)
    : base_property (nm, h),
      current_type (radio_t), color_val (color_values ()), radio_val (v),
      current_val (v.default_value ())
  { }

  color_property (const std::string& nm, const graphics_handle& h,
                  const std::string& v)
    : base_property (nm, h),
      current_type (radio_t), color_val (color_values ()), radio_val (v),
      current_val (radio_val.default_value ())
  { }

  color_property (const std::string& nm, const graphics_handle& h,
                  const color_property& v)
    : base_property (nm, h),
      current_type (v.current_type), color_val (v.color_val),
      radio_val (v.radio_val), current_val (v.current_val)
  { }

  color_property (const color_property& p)
    : base_property (p), current_type (p.current_type),
      color_val (p.color_val), radio_val (p.radio_val),
      current_val (p.current_val) { }

  octave_value get (void) const
  {
    if (current_type == color_t)
      return color_val.rgb ();

    return current_val;
  }

  bool is_rgb (void) const { return (current_type == color_t); }

  bool is_radio (void) const { return (current_type == radio_t); }

  bool is (const std::string& v) const
  { return (is_radio () && current_val == v); }

  Matrix rgb (void) const
  {
    if (current_type != color_t)
      error ("color has no RGB value");

    return color_val.rgb ();
  }

  const std::string& current_value (void) const
  {
    if (current_type != radio_t)
      error ("color has no radio value");

    return current_val;
  }

  color_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  operator octave_value (void) const { return get (); }

  base_property* clone (void) const { return new color_property (*this); }

  std::string values_as_string (void) const
  { return radio_val.values_as_string (); }

  Cell values_as_cell (void) const { return radio_val.values_as_cell (); }

protected:
  OCTINTERP_API bool do_set (const octave_value& newval);

private:
  enum current_enum { color_t, radio_t } current_type;
  color_values color_val;
  radio_values radio_val;
  std::string current_val;
};

// ---------------------------------------------------------------------

class double_property : public base_property
{
public:
  double_property (const std::string& nm, const graphics_handle& h,
                   double d = 0)
    : base_property (nm, h),
      current_val (d) { }

  double_property (const double_property& p)
    : base_property (p), current_val (p.current_val) { }

  octave_value get (void) const { return octave_value (current_val); }

  double double_value (void) const { return current_val; }

  double_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new double_property (*this); }

protected:
  bool do_set (const octave_value& v)
  {
    if (! v.is_scalar_type () || ! v.is_real_type ())
      error ("set: invalid value for double property \"%s\"",
             get_name ().c_str ());

    double new_val = v.double_value ();

    if (new_val != current_val)
      {
        current_val = new_val;
        return true;
      }

    return false;
  }

private:
  double current_val;
};

// ---------------------------------------------------------------------

class double_radio_property : public base_property
{
public:
  double_radio_property (double d, const radio_values& v)
    : base_property ("", graphics_handle ()),
      current_type (double_t), dval (d), radio_val (v),
      current_val (v.default_value ())
  { }

  double_radio_property (const std::string& nm, const graphics_handle& h,
                         const std::string& v)
    : base_property (nm, h),
      current_type (radio_t), dval (0), radio_val (v),
      current_val (radio_val.default_value ())
  { }

  double_radio_property (const std::string& nm, const graphics_handle& h,
                         const double_radio_property& v)
    : base_property (nm, h),
      current_type (v.current_type), dval (v.dval),
      radio_val (v.radio_val), current_val (v.current_val)
  { }

  double_radio_property (const double_radio_property& p)
    : base_property (p), current_type (p.current_type),
      dval (p.dval), radio_val (p.radio_val),
      current_val (p.current_val) { }

  octave_value get (void) const
  {
    if (current_type == double_t)
      return dval;

    return current_val;
  }

  bool is_double (void) const { return (current_type == double_t); }

  bool is_radio (void) const { return (current_type == radio_t); }

  bool is (const std::string& v) const
  { return (is_radio () && current_val == v); }

  double double_value (void) const
  {
    if (current_type != double_t)
      error ("%s: property has no double", get_name ().c_str ());

    return dval;
  }

  const std::string& current_value (void) const
  {
    if (current_type != radio_t)
      error ("%s: property has no radio value");

    return current_val;
  }

  double_radio_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  operator octave_value (void) const { return get (); }

  base_property* clone (void) const
  { return new double_radio_property (*this); }

protected:
  OCTINTERP_API bool do_set (const octave_value& v);

private:
  enum current_enum { double_t, radio_t } current_type;
  double dval;
  radio_values radio_val;
  std::string current_val;
};

// ---------------------------------------------------------------------

class array_property : public base_property
{
public:
  array_property (void)
    : base_property ("", graphics_handle ()), data (Matrix ()),
      xmin (), xmax (), xminp (), xmaxp (),
      type_constraints (), size_constraints ()
  {
    get_data_limits ();
  }

  array_property (const std::string& nm, const graphics_handle& h,
                  const octave_value& m)
    : base_property (nm, h), data (m.is_sparse_type () ? m.full_value () : m),
      xmin (), xmax (), xminp (), xmaxp (),
      type_constraints (), size_constraints ()
  {
    get_data_limits ();
  }

  // This copy constructor is only intended to be used
  // internally to access min/max values; no need to
  // copy constraints.
  array_property (const array_property& p)
    : base_property (p), data (p.data),
      xmin (p.xmin), xmax (p.xmax), xminp (p.xminp), xmaxp (p.xmaxp),
      type_constraints (), size_constraints ()
  { }

  octave_value get (void) const { return data; }

  void add_constraint (const std::string& type)
  { type_constraints.insert (type); }

  void add_constraint (const dim_vector& dims)
  { size_constraints.push_back (dims); }

  double min_val (void) const { return xmin; }
  double max_val (void) const { return xmax; }
  double min_pos (void) const { return xminp; }
  double max_neg (void) const { return xmaxp; }

  Matrix get_limits (void) const
  {
    Matrix m (1, 4);

    m(0) = min_val ();
    m(1) = max_val ();
    m(2) = min_pos ();
    m(3) = max_neg ();

    return m;
  }

  array_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const
  {
    array_property *p = new array_property (*this);

    p->type_constraints = type_constraints;
    p->size_constraints = size_constraints;

    return p;
  }

protected:
  bool do_set (const octave_value& v)
  {
    octave_value tmp = v.is_sparse_type () ? v.full_value () : v;

    if (! validate (tmp))
      error ("invalid value for array property \"%s\"",
             get_name ().c_str ());

    // FIXME: should we check for actual data change?
    if (! is_equal (tmp))
      {
        data = tmp;

        get_data_limits ();

        return true;
      }

    return false;
  }

private:
  OCTINTERP_API bool validate (const octave_value& v);

  OCTINTERP_API bool is_equal (const octave_value& v) const;

  OCTINTERP_API void get_data_limits (void);

protected:
  octave_value data;
  double xmin;
  double xmax;
  double xminp;
  double xmaxp;
  std::set<std::string> type_constraints;
  std::list<dim_vector> size_constraints;
};

class row_vector_property : public array_property
{
public:
  row_vector_property (const std::string& nm, const graphics_handle& h,
                       const octave_value& m)
    : array_property (nm, h, m)
  {
    add_constraint (dim_vector (-1, 1));
    add_constraint (dim_vector (1, -1));
    add_constraint (dim_vector (0, 0));
  }

  row_vector_property (const row_vector_property& p)
    : array_property (p)
  {
    add_constraint (dim_vector (-1, 1));
    add_constraint (dim_vector (1, -1));
    add_constraint (dim_vector (0, 0));
  }

  void add_constraint (const std::string& type)
  {
    array_property::add_constraint (type);
  }

  void add_constraint (const dim_vector& dims)
  {
    array_property::add_constraint (dims);
  }

  void add_constraint (octave_idx_type len)
  {
    size_constraints.remove (dim_vector (1, -1));
    size_constraints.remove (dim_vector (-1, 1));
    size_constraints.remove (dim_vector (0, 0));

    add_constraint (dim_vector (1, len));
    add_constraint (dim_vector (len, 1));
  }

  row_vector_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const
  {
    row_vector_property *p = new row_vector_property (*this);

    p->type_constraints = type_constraints;
    p->size_constraints = size_constraints;

    return p;
  }

protected:
  bool do_set (const octave_value& v)
  {
    bool retval = array_property::do_set (v);

    dim_vector dv = data.dims ();

    if (dv(0) > 1 && dv(1) == 1)
      {
        int tmp = dv(0);
        dv(0) = dv(1);
        dv(1) = tmp;

        data = data.reshape (dv);
      }

    return retval;
  }

private:
  OCTINTERP_API bool validate (const octave_value& v);
};

// ---------------------------------------------------------------------

class bool_property : public radio_property
{
public:
  bool_property (const std::string& nm, const graphics_handle& h,
                 bool val)
    : radio_property (nm, h, radio_values (val ? "{on}|off" : "on|{off}"))
  { }

  bool_property (const std::string& nm, const graphics_handle& h,
                 const char* val)
    : radio_property (nm, h, radio_values ("on|off"), val)
  { }

  bool_property (const bool_property& p)
    : radio_property (p) { }

  bool is_on (void) const { return is ("on"); }

  bool_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new bool_property (*this); }

protected:
  bool do_set (const octave_value& val)
  {
    if (val.is_bool_scalar ())
      return radio_property::do_set (val.bool_value () ? "on" : "off");
    else
      return radio_property::do_set (val);
  }
};

// ---------------------------------------------------------------------

class handle_property : public base_property
{
public:
  handle_property (const std::string& nm, const graphics_handle& h,
                   const graphics_handle& val = graphics_handle ())
    : base_property (nm, h),
      current_val (val) { }

  handle_property (const handle_property& p)
    : base_property (p), current_val (p.current_val) { }

  octave_value get (void) const { return current_val.as_octave_value (); }

  graphics_handle handle_value (void) const { return current_val; }

  handle_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  handle_property& operator = (const graphics_handle& h)
  {
    set (octave_value (h.value ()));
    return *this;
  }

  void invalidate (void) { current_val = octave::numeric_limits<double>::NaN (); }

  base_property* clone (void) const { return new handle_property (*this); }

protected:
  OCTINTERP_API bool do_set (const octave_value& v);

private:
  graphics_handle current_val;
};

// ---------------------------------------------------------------------

class any_property : public base_property
{
public:
  any_property (const std::string& nm, const graphics_handle& h,
                const octave_value& m = Matrix ())
    : base_property (nm, h), data (m) { }

  any_property (const any_property& p)
    : base_property (p), data (p.data) { }

  octave_value get (void) const { return data; }

  any_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new any_property (*this); }

protected:
  bool do_set (const octave_value& v)
  {
    data = v;
    return true;
  }

private:
  octave_value data;
};

// ---------------------------------------------------------------------

class children_property : public base_property
{
public:
  children_property (void)
    : base_property ("", graphics_handle ()), children_list ()
  {
    do_init_children (Matrix ());
  }

  children_property (const std::string& nm, const graphics_handle& h,
                     const Matrix& val)
    : base_property (nm, h), children_list ()
  {
    do_init_children (val);
  }

  children_property (const children_property& p)
    : base_property (p), children_list ()
  {
    do_init_children (p.children_list);
  }

  children_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new children_property (*this); }

  bool remove_child (double val)
  {
    return do_remove_child (val);
  }

  void adopt (double val)
  {
    do_adopt_child (val);
  }

  Matrix get_children (void) const
  {
    return do_get_children (false);
  }

  Matrix get_hidden (void) const
  {
    return do_get_children (true);
  }

  Matrix get_all (void) const
  {
    return do_get_all_children ();
  }

  octave_value get (void) const
  {
    return octave_value (get_children ());
  }

  void delete_children (bool clear = false)
  {
    do_delete_children (clear);
  }

  void renumber (graphics_handle old_gh, graphics_handle new_gh)
  {
    for (auto& hchild : children_list)
      {
        if (hchild == old_gh)
          {
            hchild = new_gh.value ();
            return;
          }
      }

    error ("children_list::renumber: child not found!");
  }

private:
  typedef std::list<double>::iterator children_list_iterator;
  typedef std::list<double>::const_iterator const_children_list_iterator;
  std::list<double> children_list;

protected:
  bool do_set (const octave_value& val)
  {
    Matrix new_kids;

    try
      {
        new_kids = val.matrix_value ();
      }
    catch (octave::execution_exception& e)
      {
        error (e, "set: children must be an array of graphics handles");
      }

    octave_idx_type nel = new_kids.numel ();

    const Matrix new_kids_column = new_kids.reshape (dim_vector (nel, 1));

    bool is_ok = true;
    bool add_hidden = true;

    const Matrix visible_kids = do_get_children (false);

    if (visible_kids.numel () == new_kids.numel ())
      {
        Matrix t1 = visible_kids.sort ();
        Matrix t2 = new_kids_column.sort ();
        Matrix t3 = get_hidden ().sort ();

        if (t1 != t2)
          is_ok = false;

        if (t1 == t3)
          add_hidden = false;
      }
    else
      is_ok = false;

    if (! is_ok)
      error ("set: new children must be a permutation of existing children");

    if (is_ok)
      {
        Matrix tmp = new_kids_column;

        if (add_hidden)
          tmp.stack (get_hidden ());

        children_list.clear ();

        // Don't use do_init_children here, as that reverses the
        // order of the list, and we don't want to do that if setting
        // the child list directly.

        for (octave_idx_type i = 0; i < tmp.numel (); i++)
          children_list.push_back (tmp.xelem (i));
      }

    return is_ok;
  }

private:
  void do_init_children (const Matrix& val)
  {
    children_list.clear ();
    for (octave_idx_type i = 0; i < val.numel (); i++)
      children_list.push_front (val.xelem (i));
  }

  void do_init_children (const std::list<double>& val)
  {
    children_list.clear ();
    children_list = val;
  }

  Matrix do_get_children (bool return_hidden) const;

  Matrix do_get_all_children (void) const
  {
    Matrix retval (children_list.size (), 1);
    octave_idx_type i = 0;

    for (const auto& hchild : children_list)
      retval(i++) = hchild;

    return retval;
  }

  bool do_remove_child (double child)
  {
    for (auto it = children_list.begin (); it != children_list.end (); it++)
      {
        if (*it == child)
          {
            children_list.erase (it);
            return true;
          }
      }
    return false;
  }

  void do_adopt_child (double val)
  {
    children_list.push_front (val);
  }

  void do_delete_children (bool clear);
};

// ---------------------------------------------------------------------

class callback_property : public base_property
{
public:
  callback_property (const std::string& nm, const graphics_handle& h,
                     const octave_value& m)
    : base_property (nm, h), callback (m), executing (false) { }

  callback_property (const callback_property& p)
    : base_property (p), callback (p.callback), executing (false) { }

  octave_value get (void) const { return callback; }

  OCTINTERP_API void execute (const octave_value& data = octave_value ()) const;

  bool is_defined (void) const
  {
    return (callback.is_defined () && ! callback.is_empty ());
  }

  callback_property& operator = (const octave_value& val)
  {
    set (val);
    return *this;
  }

  base_property* clone (void) const { return new callback_property (*this); }

protected:
  bool do_set (const octave_value& v)
  {
    if (! validate (v))
      error ("invalid value for callback property \"%s\"",
             get_name ().c_str ());

    callback = v;
    return true;
    return false;
  }

private:
  OCTINTERP_API bool validate (const octave_value& v) const;

private:
  octave_value callback;

  // If TRUE, we are executing this callback.
  mutable bool executing;
};

// ---------------------------------------------------------------------

class property
{
public:
  property (void) : rep (new base_property ("", graphics_handle ()))
  { }

  property (base_property *bp, bool persist = false) : rep (bp)
  { if (persist) rep->count++; }

  property (const property& p) : rep (p.rep)
  {
    rep->count++;
  }

  ~property (void)
  {
    if (--rep->count == 0)
      delete rep;
  }

  bool ok (void) const
  { return rep->ok (); }

  std::string get_name (void) const
  { return rep->get_name (); }

  void set_name (const std::string& name)
  { rep->set_name (name); }

  graphics_handle get_parent (void) const
  { return rep->get_parent (); }

  void set_parent (const graphics_handle& h)
  { rep->set_parent (h); }

  bool is_hidden (void) const
  { return rep->is_hidden (); }

  void set_hidden (bool flag)
  { rep->set_hidden (flag); }

  bool is_radio (void) const
  { return rep->is_radio (); }

  int get_id (void) const
  { return rep->get_id (); }

  void set_id (int d)
  { rep->set_id (d); }

  octave_value get (void) const
  { return rep->get (); }

  bool set (const octave_value& val, bool do_run = true,
            bool do_notify_toolkit = true)
  { return rep->set (val, do_run, do_notify_toolkit); }

  std::string values_as_string (void) const
  { return rep->values_as_string (); }

  Cell values_as_cell (void) const
  { return rep->values_as_cell (); }

  property& operator = (const octave_value& val)
  {
    *rep = val;
    return *this;
  }

  property& operator = (const property& p)
  {
    if (rep && --rep->count == 0)
      delete rep;

    rep = p.rep;
    rep->count++;

    return *this;
  }

  void add_listener (const octave_value& v, listener_mode mode = POSTSET)
  { rep->add_listener (v, mode); }

  void delete_listener (const octave_value& v = octave_value (),
                        listener_mode mode = POSTSET)
  { rep->delete_listener (v, mode); }

  void run_listeners (listener_mode mode = POSTSET)
  { rep->run_listeners (mode); }

  OCTINTERP_API static
  property create (const std::string& name, const graphics_handle& parent,
                   const caseless_str& type,
                   const octave_value_list& args);

  property clone (void) const
  { return property (rep->clone ()); }

#if 0
  const string_property& as_string_property (void) const
  { return *(dynamic_cast<string_property*> (rep)); }

  const radio_property& as_radio_property (void) const
  { return *(dynamic_cast<radio_property*> (rep)); }

  const color_property& as_color_property (void) const
  { return *(dynamic_cast<color_property*> (rep)); }

  const double_property& as_double_property (void) const
  { return *(dynamic_cast<double_property*> (rep)); }

  const bool_property& as_bool_property (void) const
  { return *(dynamic_cast<bool_property*> (rep)); }

  const handle_property& as_handle_property (void) const
  { return *(dynamic_cast<handle_property*> (rep)); }
#endif

private:
  base_property *rep;
};

// ---------------------------------------------------------------------

typedef std::pair<std::string, octave_value> pval_pair;

class pval_vector : public std::vector<pval_pair>
{
public:
  const_iterator find (const std::string pname) const
  {
    const_iterator it;

    for (it = (*this).begin (); it != (*this).end (); it++)
      if (pname == (*it).first)
        return it;

    return (*this).end ();
  }

  iterator find (const std::string pname)
  {
    iterator it;

    for (it = (*this).begin (); it != (*this).end (); it++)
      if (pname == (*it).first)
        return it;

    return (*this).end ();
  }

  octave_value lookup (const std::string pname) const
  {
    octave_value retval;

    const_iterator it = find (pname);

    if (it != (*this).end ())
      retval = (*it).second;

    return retval;
  }

  octave_value& operator [] (const std::string pname)
  {
    iterator it = find (pname);

    if (it == (*this).end ())
      {
        push_back (pval_pair (pname, octave_value ()));
        return (*this).back ().second;
      }

    return (*it).second;
  }

  void erase (const std::string pname)
  {
    iterator it = find (pname);
    if (it != (*this).end ())
      erase (it);
  }

  void erase (iterator it)
  {
    std::vector<pval_pair>::erase (it);
  }

};

class property_list
{
public:
  typedef pval_vector pval_map_type;
  typedef std::map<std::string, pval_map_type> plist_map_type;

  typedef pval_map_type::iterator pval_map_iterator;
  typedef pval_map_type::const_iterator pval_map_const_iterator;

  typedef plist_map_type::iterator plist_map_iterator;
  typedef plist_map_type::const_iterator plist_map_const_iterator;

  property_list (const plist_map_type& m = plist_map_type ())
    : plist_map (m) { }

  ~property_list (void) { }

  void set (const caseless_str& name, const octave_value& val);

  octave_value lookup (const caseless_str& name) const;

  plist_map_iterator begin (void) { return plist_map.begin (); }
  plist_map_const_iterator begin (void) const { return plist_map.begin (); }

  plist_map_iterator end (void) { return plist_map.end (); }
  plist_map_const_iterator end (void) const { return plist_map.end (); }

  plist_map_iterator find (const std::string& go_name)
  {
    return plist_map.find (go_name);
  }

  plist_map_const_iterator find (const std::string& go_name) const
  {
    return plist_map.find (go_name);
  }

  octave_scalar_map as_struct (const std::string& prefix_arg) const;

private:
  plist_map_type plist_map;
};

// ---------------------------------------------------------------------

class graphics_toolkit;
class graphics_object;

class base_graphics_toolkit
{
public:
  friend class graphics_toolkit;

public:
  base_graphics_toolkit (const std::string& nm)
    : name (nm), count (0) { }

  virtual ~base_graphics_toolkit (void) { }

  std::string get_name (void) const { return name; }

  virtual bool is_valid (void) const { return false; }

  virtual void redraw_figure (const graphics_object&) const
  { gripe_if_tkit_invalid ("redraw_figure"); }

  virtual void print_figure (const graphics_object&, const std::string&,
                             const std::string&,
                             const std::string& = "") const
  { gripe_if_tkit_invalid ("print_figure"); }

  virtual Matrix get_canvas_size (const graphics_handle&) const
  {
    gripe_if_tkit_invalid ("get_canvas_size");
    return Matrix (1, 2, 0.0);
  }

  virtual double get_screen_resolution (void) const
  {
    gripe_if_tkit_invalid ("get_screen_resolution");
    return 72.0;
  }

  virtual Matrix get_screen_size (void) const
  {
    gripe_if_tkit_invalid ("get_screen_size");
    return Matrix (1, 2, 0.0);
  }

  // Callback function executed when the given graphics object
  // changes.  This allows the graphics toolkit to act on property
  // changes if needed.
  virtual void update (const graphics_object&, int)
  { gripe_if_tkit_invalid ("base_graphics_toolkit::update"); }

  void update (const graphics_handle&, int);

  // Callback function executed when the given graphics object is
  // created.  This allows the graphics toolkit to do toolkit-specific
  // initializations for a newly created object.
  virtual bool initialize (const graphics_object&)
  {
    gripe_if_tkit_invalid ("base_graphics_toolkit::initialize");
    return false;
  }

  bool initialize (const graphics_handle&);

  // Callback function executed just prior to deleting the given
  // graphics object.  This allows the graphics toolkit to perform
  // toolkit-specific cleanup operations before an object is deleted.
  virtual void finalize (const graphics_object&)
  { gripe_if_tkit_invalid ("base_graphics_toolkit::finalize"); }

  void finalize (const graphics_handle&);

  // Close the graphics toolkit.
  virtual void close (void)
  { gripe_if_tkit_invalid ("base_graphics_toolkit::close"); }

private:
  std::string name;
  octave_refcount<int> count;

private:
  void gripe_if_tkit_invalid (const std::string& fname) const
  {
    if (! is_valid ())
      error ("%s: invalid graphics toolkit", fname.c_str ());
  }
};

class graphics_toolkit
{
public:
  graphics_toolkit (void)
    : rep (new base_graphics_toolkit ("unknown"))
  {
    rep->count++;
  }

  graphics_toolkit (base_graphics_toolkit* b)
    : rep (b)
  {
    rep->count++;
  }

  graphics_toolkit (const graphics_toolkit& b)
    : rep (b.rep)
  {
    rep->count++;
  }

  ~graphics_toolkit (void)
  {
    if (--rep->count == 0)
      delete rep;
  }

  graphics_toolkit& operator = (const graphics_toolkit& b)
  {
    if (rep != b.rep)
      {
        if (--rep->count == 0)
          delete rep;

        rep = b.rep;
        rep->count++;
      }

    return *this;
  }

  operator bool (void) const { return rep->is_valid (); }

  std::string get_name (void) const { return rep->get_name (); }

  void redraw_figure (const graphics_object& go) const
  { rep->redraw_figure (go); }

  void print_figure (const graphics_object& go, const std::string& term,
                     const std::string& file,
                     const std::string& debug_file = "") const
  { rep->print_figure (go, term, file, debug_file); }

  Matrix get_canvas_size (const graphics_handle& fh) const
  { return rep->get_canvas_size (fh); }

  double get_screen_resolution (void) const
  { return rep->get_screen_resolution (); }

  Matrix get_screen_size (void) const
  { return rep->get_screen_size (); }

  // Notifies graphics toolkit that object't property has changed.
  void update (const graphics_object& go, int id)
  { rep->update (go, id); }

  void update (const graphics_handle& h, int id)
  { rep->update (h, id); }

  // Notifies graphics toolkit that new object was created.
  bool initialize (const graphics_object& go)
  { return rep->initialize (go); }

  bool initialize (const graphics_handle& h)
  { return rep->initialize (h); }

  // Notifies graphics toolkit that object was destroyed.
  // This is called only for explicitly deleted object.
  // Children are deleted implicitly and graphics toolkit isn't notified.
  void finalize (const graphics_object& go)
  { rep->finalize (go); }

  void finalize (const graphics_handle& h)
  { rep->finalize (h); }

  // Close the graphics toolkit.
  void close (void) { rep->close (); }

private:

  base_graphics_toolkit *rep;
};

class gtk_manager
{
public:

  static graphics_toolkit get_toolkit (void)
  {
    return instance_ok () ? instance->do_get_toolkit () : graphics_toolkit ();
  }

  static void register_toolkit (const std::string& name)
  {
    if (instance_ok ())
      instance->do_register_toolkit (name);
  }

  static void unregister_toolkit (const std::string& name)
  {
    if (instance_ok ())
      instance->do_unregister_toolkit (name);
  }

  static void load_toolkit (const graphics_toolkit& tk)
  {
    if (instance_ok ())
      instance->do_load_toolkit (tk);
  }

  static void unload_toolkit (const std::string& name)
  {
    if (instance_ok ())
      instance->do_unload_toolkit (name);
  }

  static graphics_toolkit find_toolkit (const std::string& name)
  {
    return instance_ok ()
           ? instance->do_find_toolkit (name) : graphics_toolkit ();
  }

  static Cell available_toolkits_list (void)
  {
    return instance_ok () ? instance->do_available_toolkits_list () : Cell ();
  }

  static Cell loaded_toolkits_list (void)
  {
    return instance_ok () ? instance->do_loaded_toolkits_list () : Cell ();
  }

  static void unload_all_toolkits (void)
  {
    if (instance_ok ())
      instance->do_unload_all_toolkits ();
  }

  static std::string default_toolkit (void)
  {
    return instance_ok () ? instance->do_default_toolkit () : "";
  }

private:

  gtk_manager (void) { }

  ~gtk_manager (void) { }

  OCTINTERP_API static void create_instance (void);

  static bool instance_ok (void)
  {
    bool retval = true;

    if (! instance)
      create_instance ();

    if (! instance)
      error ("unable to create gh_manager!");

    return retval;
  }

  static void cleanup_instance (void) { delete instance; instance = 0; }

  OCTINTERP_API static gtk_manager *instance;

  // The name of the default toolkit.
  std::string dtk;

  // The list of toolkits that we know about.
  std::set<std::string> available_toolkits;

  // The list of toolkits we have actually loaded.
  std::map<std::string, graphics_toolkit> loaded_toolkits;

  typedef std::set<std::string>::iterator available_toolkits_iterator;

  typedef std::set<std::string>::const_iterator
    const_available_toolkits_iterator;

  typedef std::map<std::string, graphics_toolkit>::iterator
    loaded_toolkits_iterator;

  typedef std::map<std::string, graphics_toolkit>::const_iterator
    const_loaded_toolkits_iterator;

  graphics_toolkit do_get_toolkit (void) const;

  void do_register_toolkit (const std::string& name);

  void do_unregister_toolkit (const std::string& name);

  void do_load_toolkit (const graphics_toolkit& tk)
  {
    loaded_toolkits[tk.get_name ()] = tk;
  }

  void do_unload_toolkit (const std::string& name)
  {
    loaded_toolkits.erase (name);
  }

  graphics_toolkit do_find_toolkit (const std::string& name) const
  {
    const_loaded_toolkits_iterator p = loaded_toolkits.find (name);

    if (p != loaded_toolkits.end ())
      return p->second;
    else
      return graphics_toolkit ();
  }

  Cell do_available_toolkits_list (void) const
  {
    Cell m (1, available_toolkits.size ());

    octave_idx_type i = 0;
    for (const auto& tkit : available_toolkits)
      m(i++) = tkit;

    return m;
  }

  Cell do_loaded_toolkits_list (void) const
  {
    Cell m (1, loaded_toolkits.size ());

    octave_idx_type i = 0;
    for (const auto& nm_tkit_p : loaded_toolkits)
      m(i++) = nm_tkit_p.first;

    return m;
  }

  void do_unload_all_toolkits (void)
  {
    while (! loaded_toolkits.empty ())
      {
        loaded_toolkits_iterator p = loaded_toolkits.begin ();

        std::string name = p->first;

        p->second.close ();

        // The toolkit may have unloaded itself.  If not, we'll do it here.
        if (loaded_toolkits.find (name) != loaded_toolkits.end ())
          unload_toolkit (name);
      }
  }

  std::string do_default_toolkit (void) { return dtk; }
};

// ---------------------------------------------------------------------

class base_graphics_object;
class graphics_object;

class OCTINTERP_API base_properties
{
public:
  base_properties (const std::string& ty = "unknown",
                   const graphics_handle& mh = graphics_handle (),
                   const graphics_handle& p = graphics_handle ());

  virtual ~base_properties (void) { }

  virtual std::string graphics_object_name (void) const { return "unknown"; }

  void mark_modified (void);

  void override_defaults (base_graphics_object& obj);

  virtual void init_integerhandle (const octave_value&)
  {
    panic_impossible ();
  }

  // Look through DEFAULTS for properties with given CLASS_NAME, and
  // apply them to the current object with set (virtual method).

  void set_from_list (base_graphics_object& obj, property_list& defaults);

  void insert_property (const std::string& name, property p)
  {
    p.set_name (name);
    p.set_parent (__myhandle__);
    all_props[name] = p;
  }

  virtual void set (const caseless_str&, const octave_value&);

  virtual octave_value get (const caseless_str& pname) const;

  virtual octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  virtual octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  virtual octave_value get (bool all = false) const;

  virtual property get_property (const caseless_str& pname);

  virtual bool has_property (const caseless_str&) const
  {
    panic_impossible ();
    return false;
  }

  bool is_modified (void) const { return is___modified__ (); }

  virtual void remove_child (const graphics_handle& h)
  {
    if (children.remove_child (h.value ()))
      {
        children.run_listeners ();
        mark_modified ();
      }
  }

  virtual void adopt (const graphics_handle& h)
  {
    children.adopt (h.value ());
    children.run_listeners ();
    mark_modified ();
  }

  virtual graphics_toolkit get_toolkit (void) const;

  virtual Matrix
  get_boundingbox (bool /* finternal */ = false,
                   const Matrix& /* parent_pix_size */ = Matrix ()) const
  { return Matrix (1, 4, 0.0); }

  virtual void update_boundingbox (void);

  virtual void update_autopos (const std::string& elem_type);

  virtual void add_listener (const caseless_str&, const octave_value&,
                             listener_mode = POSTSET);

  virtual void delete_listener (const caseless_str&, const octave_value&,
                                listener_mode = POSTSET);

  void set_tag (const octave_value& val) { tag = val; }

  void set_parent (const octave_value& val);

  Matrix get_children (void) const
  {
    return children.get_children ();
  }

  Matrix get_all_children (void) const
  {
    return children.get_all ();
  }

  Matrix get_hidden_children (void) const
  {
    return children.get_hidden ();
  }

  void set_modified (const octave_value& val) { set___modified__ (val); }

  void set___modified__ (const octave_value& val) { __modified__ = val; }

  void reparent (const graphics_handle& new_parent) { parent = new_parent; }

  // Update data limits for AXIS_TYPE (xdata, ydata, etc.) in the parent
  // axes object.

  virtual void update_axis_limits (const std::string& axis_type) const;

  virtual void update_axis_limits (const std::string& axis_type,
                                   const graphics_handle& h) const;

  virtual void update_uicontextmenu (void) const;

  virtual void delete_children (bool clear = false)
  {
    children.delete_children (clear);
  }

  void renumber_child (graphics_handle old_gh, graphics_handle new_gh)
  {
    children.renumber (old_gh, new_gh);
  }

  void renumber_parent (graphics_handle new_gh)
  {
    parent = new_gh;
  }

  static property_list::pval_map_type factory_defaults (void);

  // FIXME: these functions should be generated automatically by the
  //        genprops.awk script.
  //
  // EMIT_BASE_PROPERTIES_GET_FUNCTIONS

  virtual octave_value get_alim (void) const { return octave_value (); }
  virtual octave_value get_clim (void) const { return octave_value (); }
  virtual octave_value get_xlim (void) const { return octave_value (); }
  virtual octave_value get_ylim (void) const { return octave_value (); }
  virtual octave_value get_zlim (void) const { return octave_value (); }

  virtual bool is_aliminclude (void) const { return false; }
  virtual bool is_climinclude (void) const { return false; }
  virtual bool is_xliminclude (void) const { return false; }
  virtual bool is_yliminclude (void) const { return false; }
  virtual bool is_zliminclude (void) const { return false; }

  bool is_handle_visible (void) const;

  std::set<std::string> dynamic_property_names (void) const;

  bool has_dynamic_property (const std::string& pname);

protected:
  std::set<std::string> dynamic_properties;

  void set_dynamic (const caseless_str& pname, const octave_value& val);

  octave_value get_dynamic (const caseless_str& pname) const;

  octave_value get_dynamic (bool all = false) const;

  property get_property_dynamic (const caseless_str& pname);

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

protected:

  bool_property beingdeleted;
  radio_property busyaction;
  callback_property buttondownfcn;
  children_property children;
  bool_property clipping;
  callback_property createfcn;
  callback_property deletefcn;
  radio_property handlevisibility;
  bool_property hittest;
  bool_property interruptible;
  handle_property parent;
  bool_property selected;
  bool_property selectionhighlight;
  string_property tag;
  string_property type;
  handle_property uicontextmenu;
  any_property userdata;
  bool_property visible;
  bool_property __modified__;
  graphics_handle __myhandle__;

public:

  enum
  {
    ID_BEINGDELETED = 0,
    ID_BUSYACTION = 1,
    ID_BUTTONDOWNFCN = 2,
    ID_CHILDREN = 3,
    ID_CLIPPING = 4,
    ID_CREATEFCN = 5,
    ID_DELETEFCN = 6,
    ID_HANDLEVISIBILITY = 7,
    ID_HITTEST = 8,
    ID_INTERRUPTIBLE = 9,
    ID_PARENT = 10,
    ID_SELECTED = 11,
    ID_SELECTIONHIGHLIGHT = 12,
    ID_TAG = 13,
    ID_TYPE = 14,
    ID_UICONTEXTMENU = 15,
    ID_USERDATA = 16,
    ID_VISIBLE = 17,
    ID___MODIFIED__ = 18,
    ID___MYHANDLE__ = 19
  };

  bool is_beingdeleted (void) const { return beingdeleted.is_on (); }
  std::string get_beingdeleted (void) const { return beingdeleted.current_value (); }

  bool busyaction_is (const std::string& v) const { return busyaction.is (v); }
  std::string get_busyaction (void) const { return busyaction.current_value (); }

  void execute_buttondownfcn (const octave_value& data = octave_value ()) const { buttondownfcn.execute (data); }
  octave_value get_buttondownfcn (void) const { return buttondownfcn.get (); }

  bool is_clipping (void) const { return clipping.is_on (); }
  std::string get_clipping (void) const { return clipping.current_value (); }

  void execute_createfcn (const octave_value& data = octave_value ()) const { createfcn.execute (data); }
  octave_value get_createfcn (void) const { return createfcn.get (); }

  void execute_deletefcn (const octave_value& data = octave_value ()) const { deletefcn.execute (data); }
  octave_value get_deletefcn (void) const { return deletefcn.get (); }

  bool handlevisibility_is (const std::string& v) const { return handlevisibility.is (v); }
  std::string get_handlevisibility (void) const { return handlevisibility.current_value (); }

  bool is_hittest (void) const { return hittest.is_on (); }
  std::string get_hittest (void) const { return hittest.current_value (); }

  bool is_interruptible (void) const { return interruptible.is_on (); }
  std::string get_interruptible (void) const { return interruptible.current_value (); }

  graphics_handle get_parent (void) const { return parent.handle_value (); }

  bool is_selected (void) const { return selected.is_on (); }
  std::string get_selected (void) const { return selected.current_value (); }

  bool is_selectionhighlight (void) const { return selectionhighlight.is_on (); }
  std::string get_selectionhighlight (void) const { return selectionhighlight.current_value (); }

  std::string get_tag (void) const { return tag.string_value (); }

  std::string get_type (void) const { return type.string_value (); }

  graphics_handle get_uicontextmenu (void) const { return uicontextmenu.handle_value (); }

  octave_value get_userdata (void) const { return userdata.get (); }

  bool is_visible (void) const { return visible.is_on (); }
  std::string get_visible (void) const { return visible.current_value (); }

  bool is___modified__ (void) const { return __modified__.is_on (); }
  std::string get___modified__ (void) const { return __modified__.current_value (); }

  graphics_handle get___myhandle__ (void) const { return __myhandle__; }


  void set_beingdeleted (const octave_value& val)
  {
      {
        if (beingdeleted.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_busyaction (const octave_value& val)
  {
      {
        if (busyaction.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_buttondownfcn (const octave_value& val)
  {
      {
        if (buttondownfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_children (const octave_value& val)
  {
      {
        if (children.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clipping (const octave_value& val)
  {
      {
        if (clipping.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_createfcn (const octave_value& val)
  {
      {
        if (createfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_deletefcn (const octave_value& val)
  {
      {
        if (deletefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_handlevisibility (const octave_value& val)
  {
      {
        if (handlevisibility.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_hittest (const octave_value& val)
  {
      {
        if (hittest.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_interruptible (const octave_value& val)
  {
      {
        if (interruptible.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_selected (const octave_value& val)
  {
      {
        if (selected.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_selectionhighlight (const octave_value& val)
  {
      {
        if (selectionhighlight.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_uicontextmenu (const octave_value& val)
  {
      {
        if (uicontextmenu.set (val, true))
          {
            update_uicontextmenu ();
            mark_modified ();
          }
      }
  }

  void set_userdata (const octave_value& val)
  {
      {
        if (userdata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_visible (const octave_value& val)
  {
      {
        if (visible.set (val, true))
          {
            mark_modified ();
          }
      }
  }


protected:
  struct cmp_caseless_str
  {
    bool operator () (const caseless_str& a, const caseless_str& b) const
    {
      std::string a1 = a;
      std::transform (a1.begin (), a1.end (), a1.begin (), tolower);
      std::string b1 = b;
      std::transform (b1.begin (), b1.end (), b1.begin (), tolower);

      return a1 < b1;
    }
  };

  std::map<caseless_str, property, cmp_caseless_str> all_props;

protected:
  void insert_static_property (const std::string& name, base_property& p)
  { insert_property (name, property (&p, true)); }

  virtual void init (void) { }
};

class OCTINTERP_API base_graphics_object
{
public:
  friend class graphics_object;

  base_graphics_object (void) : count (1), toolkit_flag (false) { }

  virtual ~base_graphics_object (void) { }

  virtual void mark_modified (void)
  {
    if (! valid_object ())
      error ("base_graphics_object::mark_modified: invalid graphics object");

    get_properties ().mark_modified ();
  }

  virtual void override_defaults (base_graphics_object& obj)
  {
    if (! valid_object ())
      error ("base_graphics_object::override_defaults: invalid graphics object");
    get_properties ().override_defaults (obj);
  }

  void build_user_defaults_map (property_list::pval_map_type &def,
                                const std::string go_name) const;

  virtual void set_from_list (property_list& plist)
  {
    if (! valid_object ())
      error ("base_graphics_object::set_from_list: invalid graphics object");

    get_properties ().set_from_list (*this, plist);
  }

  virtual void set (const caseless_str& pname, const octave_value& pval)
  {
    if (! valid_object ())
      error ("base_graphics_object::set: invalid graphics object");

    get_properties ().set (pname, pval);
  }

  virtual void set_defaults (const std::string&)
  {
    error ("base_graphics_object::set_defaults: invalid graphics object");
  }

  virtual octave_value get (bool all = false) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get: invalid graphics object");

    return get_properties ().get (all);
  }

  virtual octave_value get (const caseless_str& pname) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get: invalid graphics object");

    return get_properties ().get (pname);
  }

  virtual octave_value get_default (const caseless_str&) const;

  virtual octave_value get_factory_default (const caseless_str&) const;

  virtual octave_value get_defaults (void) const
  {
    error ("base_graphics_object::get_defaults: invalid graphics object");
  }

  virtual property_list get_defaults_list (void) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get_defaults_list: invalid graphics object");

    return property_list ();
  }

  virtual octave_value get_factory_defaults (void) const
  {
    error ("base_graphics_object::get_factory_defaults: invalid graphics object");
  }

  virtual property_list get_factory_defaults_list (void) const
  {
    error ("base_graphics_object::get_factory_defaults_list: invalid graphics object");
  }

  virtual bool has_readonly_property (const caseless_str& pname) const
  {
    return base_properties::has_readonly_property (pname);
  }

  virtual std::string values_as_string (void);

  virtual std::string value_as_string (const std::string& prop);

  virtual octave_scalar_map values_as_struct (void);

  virtual graphics_handle get_parent (void) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get_parent: invalid graphics object");

    return get_properties ().get_parent ();
  }

  graphics_handle get_handle (void) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get_handle: invalid graphics object");

    return get_properties ().get___myhandle__ ();
  }

  virtual void remove_child (const graphics_handle& h)
  {
    if (! valid_object ())
      error ("base_graphics_object::remove_child: invalid graphics object");

    get_properties ().remove_child (h);
  }

  virtual void adopt (const graphics_handle& h)
  {
    if (! valid_object ())
      error ("base_graphics_object::adopt: invalid graphics object");

    get_properties ().adopt (h);
  }

  virtual void reparent (const graphics_handle& np)
  {
    if (! valid_object ())
      error ("base_graphics_object::reparent: invalid graphics object");

    get_properties ().reparent (np);
  }

  virtual void defaults (void) const
  {
    if (! valid_object ())
      error ("base_graphics_object::default: invalid graphics object");

    std::string msg = (type () + "::defaults");
    err_not_implemented (msg.c_str ());
  }

  virtual base_properties& get_properties (void)
  {
    static base_properties properties;
    warning ("base_graphics_object::get_properties: invalid graphics object");
    return properties;
  }

  virtual const base_properties& get_properties (void) const
  {
    static base_properties properties;
    warning ("base_graphics_object::get_properties: invalid graphics object");
    return properties;
  }

  virtual void update_axis_limits (const std::string& axis_type);

  virtual void update_axis_limits (const std::string& axis_type,
                                   const graphics_handle& h);

  virtual bool valid_object (void) const { return false; }

  bool valid_toolkit_object (void) const { return toolkit_flag; }

  virtual std::string type (void) const
  {
    return (valid_object () ? get_properties ().graphics_object_name ()
                            : "unknown");
  }

  bool isa (const std::string& go_name) const
  {
    return type () == go_name;
  }

  virtual graphics_toolkit get_toolkit (void) const
  {
    if (! valid_object ())
      error ("base_graphics_object::get_toolkit: invalid graphics object");

    return get_properties ().get_toolkit ();
  }

  virtual void add_property_listener (const std::string& nm,
                                      const octave_value& v,
                                      listener_mode mode = POSTSET)
  {
    if (valid_object ())
      get_properties ().add_listener (nm, v, mode);
  }

  virtual void delete_property_listener (const std::string& nm,
                                         const octave_value& v,
                                         listener_mode mode = POSTSET)
  {
    if (valid_object ())
      get_properties ().delete_listener (nm, v, mode);
  }

  virtual void remove_all_listeners (void);

  virtual void reset_default_properties (void);

protected:
  virtual void initialize (const graphics_object& go)
  {
    if (! toolkit_flag)
      toolkit_flag = get_toolkit ().initialize (go);
  }

  virtual void finalize (const graphics_object& go)
  {
    if (toolkit_flag)
      {
        get_toolkit ().finalize (go);
        toolkit_flag = false;
      }
  }

  virtual void update (const graphics_object& go, int id)
  {
    if (toolkit_flag)
      get_toolkit ().update (go, id);
  }

protected:
  // A reference count.
  octave_refcount<int> count;

  // A flag telling whether this object is a valid object
  // in the backend context.
  bool toolkit_flag;

  // No copying!

  base_graphics_object (const base_graphics_object&) : count (0) { }

  base_graphics_object& operator = (const base_graphics_object&)
  {
    return *this;
  }
};

class OCTINTERP_API graphics_object
{
public:
  graphics_object (void) : rep (new base_graphics_object ()) { }

  graphics_object (base_graphics_object *new_rep)
    : rep (new_rep) { }

  graphics_object (const graphics_object& obj) : rep (obj.rep)
  {
    rep->count++;
  }

  graphics_object& operator = (const graphics_object& obj)
  {
    if (rep != obj.rep)
      {
        if (--rep->count == 0)
          delete rep;

        rep = obj.rep;
        rep->count++;
      }

    return *this;
  }

  ~graphics_object (void)
  {
    if (--rep->count == 0)
      delete rep;
  }

  void mark_modified (void) { rep->mark_modified (); }

  void override_defaults (base_graphics_object& obj)
  {
    rep->override_defaults (obj);
  }

  void override_defaults (void)
  {
    rep->override_defaults (*rep);
  }

  void build_user_defaults_map (property_list::pval_map_type &def,
                                const std::string go_name) const
  {
    rep->build_user_defaults_map (def, go_name);
  }

  void set_from_list (property_list& plist) { rep->set_from_list (plist); }

  void set (const caseless_str& name, const octave_value& val)
  {
    rep->set (name, val);
  }

  void set (const octave_value_list& args);

  void set (const Array<std::string>& names, const Cell& values,
            octave_idx_type row);

  void set (const octave_map& m);

  void set_value_or_default (const caseless_str& name,
                             const octave_value& val);

  void set_defaults (const std::string& mode) { rep->set_defaults (mode); }

  octave_value get (bool all = false) const { return rep->get (all); }

  octave_value get (const caseless_str& name) const
  {
    return name.compare ("default")
           ? get_defaults ()
           : (name.compare ("factory")
              ? get_factory_defaults () : rep->get (name));
  }

  octave_value get (const std::string& name) const
  {
    return get (caseless_str (name));
  }

  octave_value get (const char *name) const
  {
    return get (caseless_str (name));
  }

  octave_value get_default (const caseless_str& name) const
  {
    return rep->get_default (name);
  }

  octave_value get_factory_default (const caseless_str& name) const
  {
    return rep->get_factory_default (name);
  }

  octave_value get_defaults (void) const { return rep->get_defaults (); }

  property_list get_defaults_list (void) const
  {
    return rep->get_defaults_list ();
  }

  octave_value get_factory_defaults (void) const
  {
    return rep->get_factory_defaults ();
  }

  property_list get_factory_defaults_list (void) const
  {
    return rep->get_factory_defaults_list ();
  }

  bool has_readonly_property (const caseless_str& pname) const
  {
    return rep->has_readonly_property (pname);
  }

  std::string values_as_string (void) { return rep->values_as_string (); }

  std::string value_as_string (const std::string& prop)
  {
    return rep->value_as_string (prop);
  }

  octave_map values_as_struct (void) { return rep->values_as_struct (); }

  graphics_handle get_parent (void) const { return rep->get_parent (); }

  graphics_handle get_handle (void) const { return rep->get_handle (); }

  graphics_object get_ancestor (const std::string& type) const;

  void remove_child (const graphics_handle& h) { rep->remove_child (h); }

  void adopt (const graphics_handle& h) { rep->adopt (h); }

  void reparent (const graphics_handle& h) { rep->reparent (h); }

  void defaults (void) const { rep->defaults (); }

  bool isa (const std::string& go_name) const { return rep->isa (go_name); }

  base_properties& get_properties (void) { return rep->get_properties (); }

  const base_properties& get_properties (void) const
  {
    return rep->get_properties ();
  }

  void update_axis_limits (const std::string& axis_type)
  {
    rep->update_axis_limits (axis_type);
  }

  void update_axis_limits (const std::string& axis_type,
                           const graphics_handle& h)
  {
    rep->update_axis_limits (axis_type, h);
  }

  bool valid_object (void) const { return rep->valid_object (); }

  std::string type (void) const { return rep->type (); }

  operator bool (void) const { return rep->valid_object (); }

  // FIXME: these functions should be generated automatically by the
  //        genprops.awk script.
  //
  // EMIT_GRAPHICS_OBJECT_GET_FUNCTIONS

  octave_value get_alim (void) const
  { return get_properties ().get_alim (); }

  octave_value get_clim (void) const
  { return get_properties ().get_clim (); }

  octave_value get_xlim (void) const
  { return get_properties ().get_xlim (); }

  octave_value get_ylim (void) const
  { return get_properties ().get_ylim (); }

  octave_value get_zlim (void) const
  { return get_properties ().get_zlim (); }

  bool is_aliminclude (void) const
  { return get_properties ().is_aliminclude (); }

  bool is_climinclude (void) const
  { return get_properties ().is_climinclude (); }

  bool is_xliminclude (void) const
  { return get_properties ().is_xliminclude (); }

  bool is_yliminclude (void) const
  { return get_properties ().is_yliminclude (); }

  bool is_zliminclude (void) const
  { return get_properties ().is_zliminclude (); }

  bool is_handle_visible (void) const
  { return get_properties ().is_handle_visible (); }

  graphics_toolkit get_toolkit (void) const { return rep->get_toolkit (); }

  void add_property_listener (const std::string& nm, const octave_value& v,
                              listener_mode mode = POSTSET)
  { rep->add_property_listener (nm, v, mode); }

  void delete_property_listener (const std::string& nm, const octave_value& v,
                                 listener_mode mode = POSTSET)
  { rep->delete_property_listener (nm, v, mode); }

  void initialize (void) { rep->initialize (*this); }

  void finalize (void) { rep->finalize (*this); }

  void update (int id) { rep->update (*this, id); }

  void reset_default_properties (void)
  { rep->reset_default_properties (); }

private:
  base_graphics_object *rep;
};

// ---------------------------------------------------------------------

class OCTINTERP_API root_figure : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    void remove_child (const graphics_handle& h);

    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;

    // See the genprops.awk script for an explanation of the
    // properties declarations.

    // FIXME: Properties that still don't have callbacks are:
    // monitorpositions, pointerlocation, pointerwindow.
    // Note that these properties are not yet used by Octave, so setting
    // them will have no effect.

    // FIXME: The commandwindowsize property has been deprecated in Matlab
    //        and is now available through matlab.desktop.comandwindow.size.
    //        Until Octave has something similar, keep this property in root.

    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  handle_property callbackobject;
  array_property commandwindowsize;
  handle_property currentfigure;
  string_property fixedwidthfontname;
  array_property monitorpositions;
  array_property pointerlocation;
  double_property pointerwindow;
  double_property screendepth;
  double_property screenpixelsperinch;
  array_property screensize;
  bool_property showhiddenhandles;
  radio_property units;

public:

  enum
  {
    ID_CALLBACKOBJECT = 1000,
    ID_COMMANDWINDOWSIZE = 1001,
    ID_CURRENTFIGURE = 1002,
    ID_FIXEDWIDTHFONTNAME = 1003,
    ID_MONITORPOSITIONS = 1004,
    ID_POINTERLOCATION = 1005,
    ID_POINTERWINDOW = 1006,
    ID_SCREENDEPTH = 1007,
    ID_SCREENPIXELSPERINCH = 1008,
    ID_SCREENSIZE = 1009,
    ID_SHOWHIDDENHANDLES = 1010,
    ID_UNITS = 1011
  };

  graphics_handle get_callbackobject (void) const { return callbackobject.handle_value (); }

  octave_value get_commandwindowsize (void) const { return commandwindowsize.get (); }

  graphics_handle get_currentfigure (void) const { return currentfigure.handle_value (); }

  std::string get_fixedwidthfontname (void) const { return fixedwidthfontname.string_value (); }

  octave_value get_monitorpositions (void) const { return monitorpositions.get (); }

  octave_value get_pointerlocation (void) const { return pointerlocation.get (); }

  double get_pointerwindow (void) const { return pointerwindow.double_value (); }

  double get_screendepth (void) const { return screendepth.double_value (); }

  double get_screenpixelsperinch (void) const { return screenpixelsperinch.double_value (); }

  octave_value get_screensize (void) const { return screensize.get (); }

  bool is_showhiddenhandles (void) const { return showhiddenhandles.is_on (); }
  std::string get_showhiddenhandles (void) const { return showhiddenhandles.current_value (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }


  void set_callbackobject (const octave_value& val);

  void set_commandwindowsize (const octave_value& val)
  {
      {
        if (commandwindowsize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_currentfigure (const octave_value& val);

  void set_fixedwidthfontname (const octave_value& val)
  {
      {
        if (fixedwidthfontname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_monitorpositions (const octave_value& val)
  {
      {
        if (monitorpositions.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_pointerlocation (const octave_value& val)
  {
      {
        if (pointerlocation.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_pointerwindow (const octave_value& val)
  {
      {
        if (pointerwindow.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_screendepth (const octave_value& val)
  {
      {
        if (screendepth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_screenpixelsperinch (const octave_value& val)
  {
      {
        if (screenpixelsperinch.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_screensize (const octave_value& val)
  {
      {
        if (screensize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_showhiddenhandles (const octave_value& val)
  {
      {
        if (showhiddenhandles.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val)
  {
      {
        if (units.set (val, true))
          {
            update_units ();
            mark_modified ();
          }
      }
  }

  void update_units (void);


  private:
    std::list<graphics_handle> cbo_stack;

  };

private:
  properties xproperties;

public:

  root_figure (void)
    : xproperties (0, graphics_handle ()), default_properties () { }

  ~root_figure (void) { }

  void mark_modified (void) { }

  void override_defaults (base_graphics_object& obj)
  {
    // Now override with our defaults.  If the default_properties
    // list includes the properties for all defaults (line,
    // surface, etc.) then we don't have to know the type of OBJ
    // here, we just call its set function and let it decide which
    // properties from the list to use.
    obj.set_from_list (default_properties);
  }

  void set (const caseless_str& name, const octave_value& value)
  {
    if (name.compare ("default", 7))
      // strip "default", pass rest to function that will
      // parse the remainder and add the element to the
      // default_properties map.
      default_properties.set (name.substr (7), value);
    else
      xproperties.set (name, value);
  }

  octave_value get (const caseless_str& name) const
  {
    octave_value retval;

    if (name.compare ("default", 7))
      return get_default (name.substr (7));
    else if (name.compare ("factory", 7))
      return get_factory_default (name.substr (7));
    else
      retval = xproperties.get (name);

    return retval;
  }

  octave_value get_default (const caseless_str& name) const
  {
    octave_value retval = default_properties.lookup (name);

    if (retval.is_undefined ())
      {
        // no default property found, use factory default
        retval = factory_properties.lookup (name);

        if (retval.is_undefined ())
          error ("get: invalid default property '%s'", name.c_str ());
      }

    return retval;
  }

  octave_value get_factory_default (const caseless_str& name) const
  {
    octave_value retval = factory_properties.lookup (name);

    if (retval.is_undefined ())
      error ("get: invalid factory default property '%s'", name.c_str ());

    return retval;
  }

  octave_value get_defaults (void) const
  {
    return default_properties.as_struct ("default");
  }

  property_list get_defaults_list (void) const
  {
    return default_properties;
  }

  octave_value get_factory_defaults (void) const
  {
    return factory_properties.as_struct ("factory");
  }

  property_list get_factory_defaults_list (void) const
  {
    return factory_properties;
  }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  void reset_default_properties (void);

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

private:
  property_list default_properties;

  static property_list factory_properties;

  static property_list::plist_map_type init_factory_properties (void);
};

// ---------------------------------------------------------------------

class OCTINTERP_API figure : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    void init_integerhandle (const octave_value& val)
    {
      integerhandle = val;
    }

    void remove_child (const graphics_handle& h);

    void set_visible (const octave_value& val);

    graphics_toolkit get_toolkit (void) const
    {
      if (! toolkit)
        toolkit = gtk_manager::get_toolkit ();

      return toolkit;
    }

    void set_toolkit (const graphics_toolkit& b);

    void set___graphics_toolkit__ (const octave_value& val)
    {
      if (! val.is_string ())
        error ("set___graphics_toolkit__ must be a string");

      std::string nm = val.string_value ();
      graphics_toolkit b = gtk_manager::find_toolkit (nm);

      if (b.get_name () != nm)
        error ("set___graphics_toolkit__: invalid graphics toolkit");

      if (nm != get___graphics_toolkit__ ())
        {
          set_toolkit (b);
          mark_modified ();
        }
    }

    void adopt (const graphics_handle& h);

    void set_position (const octave_value& val,
                       bool do_notify_toolkit = true);

    void set_outerposition (const octave_value& val,
                            bool do_notify_toolkit = true);

    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;

    void set_boundingbox (const Matrix& bb, bool internal = false,
                          bool do_notify_toolkit = true);

    Matrix map_from_boundingbox (double x, double y) const;

    Matrix map_to_boundingbox (double x, double y) const;

    void update_units (const caseless_str& old_units);

    void update_paperunits (const caseless_str& old_paperunits);

    std::string get_title (void) const;

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // FIXME: Several properties have been deleted from Matlab.
    //        We should either immediately remove them or figure out a way
    //        to deprecate them for a release or two.
    // Obsolete properties: doublebuffer, mincolormap, wvisual, wvisualmode,
    // xdisplay, xvisual, xvisualmode

    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  array_property alphamap;
  callback_property buttondownfcn;
  callback_property closerequestfcn;
  color_property color;
  array_property colormap;
  handle_property currentaxes;
  string_property currentcharacter;
  handle_property currentobject;
  array_property currentpoint;
  bool_property dockcontrols;
  string_property filename;
  bool_property graphicssmoothing;
  bool_property integerhandle;
  bool_property inverthardcopy;
  callback_property keypressfcn;
  callback_property keyreleasefcn;
  radio_property menubar;
  string_property name;
  radio_property nextplot;
  bool_property numbertitle;
  array_property outerposition;
  radio_property paperorientation;
  array_property paperposition;
  radio_property paperpositionmode;
  array_property papersize;
  radio_property papertype;
  radio_property paperunits;
  radio_property pointer;
  array_property pointershapecdata;
  array_property pointershapehotspot;
  array_property position;
  radio_property renderer;
  radio_property renderermode;
  bool_property resize;
  callback_property resizefcn;
  radio_property selectiontype;
  callback_property sizechangedfcn;
  radio_property toolbar;
  radio_property units;
  callback_property windowbuttondownfcn;
  callback_property windowbuttonmotionfcn;
  callback_property windowbuttonupfcn;
  callback_property windowkeypressfcn;
  callback_property windowkeyreleasefcn;
  callback_property windowscrollwheelfcn;
  radio_property windowstyle;
  mutable string_property __gl_extensions__;
  mutable string_property __gl_renderer__;
  mutable string_property __gl_vendor__;
  mutable string_property __gl_version__;
  string_property __graphics_toolkit__;
  any_property __guidata__;
  radio_property __mouse_mode__;
  any_property __pan_mode__;
  any_property __plot_stream__;
  any_property __rotate_mode__;
  any_property __zoom_mode__;
  bool_property doublebuffer;
  double_property mincolormap;
  string_property wvisual;
  radio_property wvisualmode;
  string_property xdisplay;
  string_property xvisual;
  radio_property xvisualmode;

public:

  enum
  {
    ID_ALPHAMAP = 2000,
    ID_BUTTONDOWNFCN = 2001,
    ID_CLOSEREQUESTFCN = 2002,
    ID_COLOR = 2003,
    ID_COLORMAP = 2004,
    ID_CURRENTAXES = 2005,
    ID_CURRENTCHARACTER = 2006,
    ID_CURRENTOBJECT = 2007,
    ID_CURRENTPOINT = 2008,
    ID_DOCKCONTROLS = 2009,
    ID_FILENAME = 2010,
    ID_GRAPHICSSMOOTHING = 2011,
    ID_INTEGERHANDLE = 2012,
    ID_INVERTHARDCOPY = 2013,
    ID_KEYPRESSFCN = 2014,
    ID_KEYRELEASEFCN = 2015,
    ID_MENUBAR = 2016,
    ID_NAME = 2017,
    ID_NEXTPLOT = 2018,
    ID_NUMBERTITLE = 2019,
    ID_OUTERPOSITION = 2020,
    ID_PAPERORIENTATION = 2021,
    ID_PAPERPOSITION = 2022,
    ID_PAPERPOSITIONMODE = 2023,
    ID_PAPERSIZE = 2024,
    ID_PAPERTYPE = 2025,
    ID_PAPERUNITS = 2026,
    ID_POINTER = 2027,
    ID_POINTERSHAPECDATA = 2028,
    ID_POINTERSHAPEHOTSPOT = 2029,
    ID_POSITION = 2030,
    ID_RENDERER = 2031,
    ID_RENDERERMODE = 2032,
    ID_RESIZE = 2033,
    ID_RESIZEFCN = 2034,
    ID_SELECTIONTYPE = 2035,
    ID_SIZECHANGEDFCN = 2036,
    ID_TOOLBAR = 2037,
    ID_UNITS = 2038,
    ID_WINDOWBUTTONDOWNFCN = 2039,
    ID_WINDOWBUTTONMOTIONFCN = 2040,
    ID_WINDOWBUTTONUPFCN = 2041,
    ID_WINDOWKEYPRESSFCN = 2042,
    ID_WINDOWKEYRELEASEFCN = 2043,
    ID_WINDOWSCROLLWHEELFCN = 2044,
    ID_WINDOWSTYLE = 2045,
    ID___GL_EXTENSIONS__ = 2046,
    ID___GL_RENDERER__ = 2047,
    ID___GL_VENDOR__ = 2048,
    ID___GL_VERSION__ = 2049,
    ID___GRAPHICS_TOOLKIT__ = 2050,
    ID___GUIDATA__ = 2051,
    ID___MOUSE_MODE__ = 2052,
    ID___PAN_MODE__ = 2053,
    ID___PLOT_STREAM__ = 2054,
    ID___ROTATE_MODE__ = 2055,
    ID___ZOOM_MODE__ = 2056,
    ID_DOUBLEBUFFER = 2057,
    ID_MINCOLORMAP = 2058,
    ID_WVISUAL = 2059,
    ID_WVISUALMODE = 2060,
    ID_XDISPLAY = 2061,
    ID_XVISUAL = 2062,
    ID_XVISUALMODE = 2063
  };

  octave_value get_alphamap (void) const { return alphamap.get (); }

  void execute_buttondownfcn (const octave_value& data = octave_value ()) const { buttondownfcn.execute (data); }
  octave_value get_buttondownfcn (void) const { return buttondownfcn.get (); }

  void execute_closerequestfcn (const octave_value& data = octave_value ()) const { closerequestfcn.execute (data); }
  octave_value get_closerequestfcn (void) const { return closerequestfcn.get (); }

  bool color_is_rgb (void) const { return color.is_rgb (); }
  bool color_is (const std::string& v) const { return color.is (v); }
  Matrix get_color_rgb (void) const { return (color.is_rgb () ? color.rgb () : Matrix ()); }
  octave_value get_color (void) const { return color.get (); }

  octave_value get_colormap (void) const { return colormap.get (); }

  graphics_handle get_currentaxes (void) const { return currentaxes.handle_value (); }

  std::string get_currentcharacter (void) const { return currentcharacter.string_value (); }

  graphics_handle get_currentobject (void) const { return currentobject.handle_value (); }

  octave_value get_currentpoint (void) const { return currentpoint.get (); }

  bool is_dockcontrols (void) const { return dockcontrols.is_on (); }
  std::string get_dockcontrols (void) const { return dockcontrols.current_value (); }

  std::string get_filename (void) const { return filename.string_value (); }

  bool is_graphicssmoothing (void) const { return graphicssmoothing.is_on (); }
  std::string get_graphicssmoothing (void) const { return graphicssmoothing.current_value (); }

  bool is_integerhandle (void) const { return integerhandle.is_on (); }
  std::string get_integerhandle (void) const { return integerhandle.current_value (); }

  bool is_inverthardcopy (void) const { return inverthardcopy.is_on (); }
  std::string get_inverthardcopy (void) const { return inverthardcopy.current_value (); }

  void execute_keypressfcn (const octave_value& data = octave_value ()) const { keypressfcn.execute (data); }
  octave_value get_keypressfcn (void) const { return keypressfcn.get (); }

  void execute_keyreleasefcn (const octave_value& data = octave_value ()) const { keyreleasefcn.execute (data); }
  octave_value get_keyreleasefcn (void) const { return keyreleasefcn.get (); }

  bool menubar_is (const std::string& v) const { return menubar.is (v); }
  std::string get_menubar (void) const { return menubar.current_value (); }

  std::string get_name (void) const { return name.string_value (); }

  bool nextplot_is (const std::string& v) const { return nextplot.is (v); }
  std::string get_nextplot (void) const { return nextplot.current_value (); }

  bool is_numbertitle (void) const { return numbertitle.is_on (); }
  std::string get_numbertitle (void) const { return numbertitle.current_value (); }

  octave_value get_outerposition (void) const { return outerposition.get (); }

  bool paperorientation_is (const std::string& v) const { return paperorientation.is (v); }
  std::string get_paperorientation (void) const { return paperorientation.current_value (); }

  octave_value get_paperposition (void) const { return paperposition.get (); }

  bool paperpositionmode_is (const std::string& v) const { return paperpositionmode.is (v); }
  std::string get_paperpositionmode (void) const { return paperpositionmode.current_value (); }

  octave_value get_papersize (void) const { return papersize.get (); }

  bool papertype_is (const std::string& v) const { return papertype.is (v); }
  std::string get_papertype (void) const { return papertype.current_value (); }

  bool paperunits_is (const std::string& v) const { return paperunits.is (v); }
  std::string get_paperunits (void) const { return paperunits.current_value (); }

  bool pointer_is (const std::string& v) const { return pointer.is (v); }
  std::string get_pointer (void) const { return pointer.current_value (); }

  octave_value get_pointershapecdata (void) const { return pointershapecdata.get (); }

  octave_value get_pointershapehotspot (void) const { return pointershapehotspot.get (); }

  octave_value get_position (void) const { return position.get (); }

  bool renderer_is (const std::string& v) const { return renderer.is (v); }
  std::string get_renderer (void) const { return renderer.current_value (); }

  bool renderermode_is (const std::string& v) const { return renderermode.is (v); }
  std::string get_renderermode (void) const { return renderermode.current_value (); }

  bool is_resize (void) const { return resize.is_on (); }
  std::string get_resize (void) const { return resize.current_value (); }

  void execute_resizefcn (const octave_value& data = octave_value ()) const { resizefcn.execute (data); }
  octave_value get_resizefcn (void) const { return resizefcn.get (); }

  bool selectiontype_is (const std::string& v) const { return selectiontype.is (v); }
  std::string get_selectiontype (void) const { return selectiontype.current_value (); }

  void execute_sizechangedfcn (const octave_value& data = octave_value ()) const { sizechangedfcn.execute (data); }
  octave_value get_sizechangedfcn (void) const { return sizechangedfcn.get (); }

  bool toolbar_is (const std::string& v) const { return toolbar.is (v); }
  std::string get_toolbar (void) const { return toolbar.current_value (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }

  void execute_windowbuttondownfcn (const octave_value& data = octave_value ()) const { windowbuttondownfcn.execute (data); }
  octave_value get_windowbuttondownfcn (void) const { return windowbuttondownfcn.get (); }

  void execute_windowbuttonmotionfcn (const octave_value& data = octave_value ()) const { windowbuttonmotionfcn.execute (data); }
  octave_value get_windowbuttonmotionfcn (void) const { return windowbuttonmotionfcn.get (); }

  void execute_windowbuttonupfcn (const octave_value& data = octave_value ()) const { windowbuttonupfcn.execute (data); }
  octave_value get_windowbuttonupfcn (void) const { return windowbuttonupfcn.get (); }

  void execute_windowkeypressfcn (const octave_value& data = octave_value ()) const { windowkeypressfcn.execute (data); }
  octave_value get_windowkeypressfcn (void) const { return windowkeypressfcn.get (); }

  void execute_windowkeyreleasefcn (const octave_value& data = octave_value ()) const { windowkeyreleasefcn.execute (data); }
  octave_value get_windowkeyreleasefcn (void) const { return windowkeyreleasefcn.get (); }

  void execute_windowscrollwheelfcn (const octave_value& data = octave_value ()) const { windowscrollwheelfcn.execute (data); }
  octave_value get_windowscrollwheelfcn (void) const { return windowscrollwheelfcn.get (); }

  bool windowstyle_is (const std::string& v) const { return windowstyle.is (v); }
  std::string get_windowstyle (void) const { return windowstyle.current_value (); }

  std::string get___gl_extensions__ (void) const { return __gl_extensions__.string_value (); }

  std::string get___gl_renderer__ (void) const { return __gl_renderer__.string_value (); }

  std::string get___gl_vendor__ (void) const { return __gl_vendor__.string_value (); }

  std::string get___gl_version__ (void) const { return __gl_version__.string_value (); }

  std::string get___graphics_toolkit__ (void) const { return __graphics_toolkit__.string_value (); }

  octave_value get___guidata__ (void) const { return __guidata__.get (); }

  bool __mouse_mode___is (const std::string& v) const { return __mouse_mode__.is (v); }
  std::string get___mouse_mode__ (void) const { return __mouse_mode__.current_value (); }

  octave_value get___pan_mode__ (void) const { return __pan_mode__.get (); }

  octave_value get___plot_stream__ (void) const { return __plot_stream__.get (); }

  octave_value get___rotate_mode__ (void) const { return __rotate_mode__.get (); }

  octave_value get___zoom_mode__ (void) const { return __zoom_mode__.get (); }

  bool is_doublebuffer (void) const { return doublebuffer.is_on (); }
  std::string get_doublebuffer (void) const { return doublebuffer.current_value (); }

  double get_mincolormap (void) const { return mincolormap.double_value (); }

  std::string get_wvisual (void) const { return wvisual.string_value (); }

  bool wvisualmode_is (const std::string& v) const { return wvisualmode.is (v); }
  std::string get_wvisualmode (void) const { return wvisualmode.current_value (); }

  std::string get_xdisplay (void) const { return xdisplay.string_value (); }

  std::string get_xvisual (void) const { return xvisual.string_value (); }

  bool xvisualmode_is (const std::string& v) const { return xvisualmode.is (v); }
  std::string get_xvisualmode (void) const { return xvisualmode.current_value (); }


  void set_alphamap (const octave_value& val)
  {
      {
        if (alphamap.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_buttondownfcn (const octave_value& val)
  {
      {
        if (buttondownfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_closerequestfcn (const octave_value& val)
  {
      {
        if (closerequestfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_color (const octave_value& val)
  {
      {
        if (color.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_colormap (const octave_value& val)
  {
      {
        if (colormap.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_currentaxes (const octave_value& val);

  void set_currentcharacter (const octave_value& val)
  {
      {
        if (currentcharacter.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_currentobject (const octave_value& val)
  {
      {
        if (currentobject.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_currentpoint (const octave_value& val)
  {
      {
        if (currentpoint.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_dockcontrols (const octave_value& val)
  {
      {
        if (dockcontrols.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_filename (const octave_value& val)
  {
      {
        if (filename.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_graphicssmoothing (const octave_value& val)
  {
      {
        if (graphicssmoothing.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_integerhandle (const octave_value& val);

  void set_inverthardcopy (const octave_value& val)
  {
      {
        if (inverthardcopy.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_keypressfcn (const octave_value& val)
  {
      {
        if (keypressfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_keyreleasefcn (const octave_value& val)
  {
      {
        if (keyreleasefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_menubar (const octave_value& val)
  {
      {
        if (menubar.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_name (const octave_value& val)
  {
      {
        if (name.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_nextplot (const octave_value& val)
  {
      {
        if (nextplot.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_numbertitle (const octave_value& val)
  {
      {
        if (numbertitle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_paperorientation (const octave_value& val)
  {
      {
        if (paperorientation.set (val, true))
          {
            update_paperorientation ();
            mark_modified ();
          }
      }
  }

  void update_paperorientation (void);

  void set_paperposition (const octave_value& val)
  {
      {
        if (paperposition.set (val, false))
          {
            set_paperpositionmode ("manual");
            paperposition.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_paperpositionmode ("manual");
      }
  }

  void set_paperpositionmode (const octave_value& val)
  {
      {
        if (paperpositionmode.set (val, true))
          {
            update_paperpositionmode ();
            mark_modified ();
          }
      }
  }

  void set_papersize (const octave_value& val)
  {
      {
        if (papersize.set (val, true))
          {
            update_papersize ();
            mark_modified ();
          }
      }
  }

  void update_papersize (void);

  void set_papertype (const octave_value& val);

  void update_papertype (void);

  void set_paperunits (const octave_value& val);

  void set_pointer (const octave_value& val)
  {
      {
        if (pointer.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_pointershapecdata (const octave_value& val)
  {
      {
        if (pointershapecdata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_pointershapehotspot (const octave_value& val)
  {
      {
        if (pointershapehotspot.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_renderer (const octave_value& val)
  {
      {
        if (renderer.set (val, false))
          {
            set_renderermode ("manual");
            renderer.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_renderermode ("manual");
      }
  }

  void set_renderermode (const octave_value& val)
  {
      {
        if (renderermode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_resize (const octave_value& val)
  {
      {
        if (resize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_resizefcn (const octave_value& val)
  {
      {
        if (resizefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_selectiontype (const octave_value& val)
  {
      {
        if (selectiontype.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_sizechangedfcn (const octave_value& val)
  {
      {
        if (sizechangedfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_toolbar (const octave_value& val)
  {
      {
        if (toolbar.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val);

  void set_windowbuttondownfcn (const octave_value& val)
  {
      {
        if (windowbuttondownfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowbuttonmotionfcn (const octave_value& val)
  {
      {
        if (windowbuttonmotionfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowbuttonupfcn (const octave_value& val)
  {
      {
        if (windowbuttonupfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowkeypressfcn (const octave_value& val)
  {
      {
        if (windowkeypressfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowkeyreleasefcn (const octave_value& val)
  {
      {
        if (windowkeyreleasefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowscrollwheelfcn (const octave_value& val)
  {
      {
        if (windowscrollwheelfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_windowstyle (const octave_value& val)
  {
      {
        if (windowstyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set___gl_extensions__ (const octave_value& val) const
  {
      {
        if (__gl_extensions__.set (val, true))
          {
          }
      }
  }

  void set___gl_renderer__ (const octave_value& val) const
  {
      {
        if (__gl_renderer__.set (val, true))
          {
          }
      }
  }

  void set___gl_vendor__ (const octave_value& val) const
  {
      {
        if (__gl_vendor__.set (val, true))
          {
          }
      }
  }

  void set___gl_version__ (const octave_value& val) const
  {
      {
        if (__gl_version__.set (val, true))
          {
          }
      }
  }

  void set___guidata__ (const octave_value& val)
  {
      {
        if (__guidata__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set___mouse_mode__ (const octave_value& val);

  void set___pan_mode__ (const octave_value& val)
  {
      {
        if (__pan_mode__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set___plot_stream__ (const octave_value& val)
  {
      {
        if (__plot_stream__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set___rotate_mode__ (const octave_value& val)
  {
      {
        if (__rotate_mode__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set___zoom_mode__ (const octave_value& val)
  {
      {
        if (__zoom_mode__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_doublebuffer (const octave_value& val)
  {
      {
        if (doublebuffer.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_mincolormap (const octave_value& val)
  {
      {
        if (mincolormap.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_wvisual (const octave_value& val)
  {
      {
        if (wvisual.set (val, false))
          {
            set_wvisualmode ("manual");
            wvisual.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_wvisualmode ("manual");
      }
  }

  void set_wvisualmode (const octave_value& val)
  {
      {
        if (wvisualmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xdisplay (const octave_value& val)
  {
      {
        if (xdisplay.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xvisual (const octave_value& val)
  {
      {
        if (xvisual.set (val, false))
          {
            set_xvisualmode ("manual");
            xvisual.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_xvisualmode ("manual");
      }
  }

  void set_xvisualmode (const octave_value& val)
  {
      {
        if (xvisualmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      alphamap.add_constraint (dim_vector (-1, 1));
      colormap.add_constraint (dim_vector (-1, 3));
      outerposition.add_constraint (dim_vector (1, 4));
      paperposition.add_constraint (dim_vector (1, 4));
      papersize.add_constraint (dim_vector (1, 2));
      pointershapecdata.add_constraint (dim_vector (16, 16));
      pointershapehotspot.add_constraint (dim_vector (1, 2));
      position.add_constraint (dim_vector (1, 4));
    }

  private:
    Matrix get_auto_paperposition (void);

    void update_paperpositionmode (void)
    {
      if (paperpositionmode.is ("auto"))
        paperposition.set (get_auto_paperposition ());
    }

    mutable graphics_toolkit toolkit;
  };

private:
  properties xproperties;

public:
  figure (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p), default_properties ()
  { }

  ~figure (void) { }

  void override_defaults (base_graphics_object& obj)
  {
    // Allow parent (root figure) to override first (properties knows how
    // to find the parent object).
    xproperties.override_defaults (obj);

    // Now override with our defaults.  If the default_properties
    // list includes the properties for all defaults (line,
    // surface, etc.) then we don't have to know the type of OBJ
    // here, we just call its set function and let it decide which
    // properties from the list to use.
    obj.set_from_list (default_properties);
  }

  void set (const caseless_str& name, const octave_value& value)
  {
    if (name.compare ("default", 7))
      // strip "default", pass rest to function that will
      // parse the remainder and add the element to the
      // default_properties map.
      default_properties.set (name.substr (7), value);
    else
      xproperties.set (name, value);
  }

  octave_value get (const caseless_str& name) const
  {
    octave_value retval;

    if (name.compare ("default", 7))
      retval = get_default (name.substr (7));
    else
      retval = xproperties.get (name);

    return retval;
  }

  octave_value get_default (const caseless_str& name) const;

  octave_value get_defaults (void) const
  {
    return default_properties.as_struct ("default");
  }

  property_list get_defaults_list (void) const
  {
    return default_properties;
  }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  void reset_default_properties (void);

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

private:
  property_list default_properties;
};

// ---------------------------------------------------------------------

class OCTINTERP_API graphics_xform
{
public:
  graphics_xform (void)
    : xform (xform_eye ()), xform_inv (xform_eye ()),
      sx ("linear"), sy ("linear"), sz ("linear"),  zlim (1, 2, 0.0)
  {
    zlim(1) = 1.0;
  }

  graphics_xform (const Matrix& xm, const Matrix& xim,
                  const scaler& x, const scaler& y, const scaler& z,
                  const Matrix& zl)
    : xform (xm), xform_inv (xim), sx (x), sy (y), sz (z), zlim (zl) { }

  graphics_xform (const graphics_xform& g)
    : xform (g.xform), xform_inv (g.xform_inv), sx (g.sx),
      sy (g.sy), sz (g.sz), zlim (g.zlim) { }

  ~graphics_xform (void) { }

  graphics_xform& operator = (const graphics_xform& g)
  {
    xform = g.xform;
    xform_inv = g.xform_inv;
    sx = g.sx;
    sy = g.sy;
    sz = g.sz;
    zlim = g.zlim;

    return *this;
  }

  static ColumnVector xform_vector (double x, double y, double z);

  static Matrix xform_eye (void);

  ColumnVector transform (double x, double y, double z,
                          bool use_scale = true) const;

  ColumnVector untransform (double x, double y, double z,
                            bool use_scale = true) const;

  ColumnVector untransform (double x, double y, bool use_scale = true) const
  { return untransform (x, y, (zlim(0)+zlim(1))/2, use_scale); }

  Matrix xscale (const Matrix& m) const { return sx.scale (m); }
  Matrix yscale (const Matrix& m) const { return sy.scale (m); }
  Matrix zscale (const Matrix& m) const { return sz.scale (m); }

  Matrix scale (const Matrix& m) const
  {
    bool has_z = (m.columns () > 2);

    if (sx.is_linear () && sy.is_linear ()
        && (! has_z || sz.is_linear ()))
      return m;

    Matrix retval (m.dims ());

    int r = m.rows ();

    for (int i = 0; i < r; i++)
      {
        retval(i,0) = sx.scale (m(i,0));
        retval(i,1) = sy.scale (m(i,1));
        if (has_z)
          retval(i,2) = sz.scale (m(i,2));
      }

    return retval;
  }

private:
  Matrix xform;
  Matrix xform_inv;
  scaler sx, sy, sz;
  Matrix zlim;
};

enum
{
  AXE_ANY_DIR   = 0,
  AXE_DEPTH_DIR = 1,
  AXE_HORZ_DIR  = 2,
  AXE_VERT_DIR  = 3
};

class OCTINTERP_API axes : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    void set_defaults (base_graphics_object& obj, const std::string& mode);

    void remove_child (const graphics_handle& h);

    const scaler& get_x_scaler (void) const { return sx; }
    const scaler& get_y_scaler (void) const { return sy; }
    const scaler& get_z_scaler (void) const { return sz; }

    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;
    Matrix get_extent (bool with_text = false,
                       bool only_text_height=false) const;

    double get_fontsize_points (double box_pix_height = 0) const;

    void update_boundingbox (void)
    {
      if (units_is ("normalized"))
        {
          sync_positions ();
          base_properties::update_boundingbox ();
        }
    }

    void update_camera (void);
    void update_axes_layout (void);
    void update_aspectratios (void);
    void update_transform (void)
    {
      update_aspectratios ();
      update_camera ();
      update_axes_layout ();
    }

    void sync_positions (void);

    void update_autopos (const std::string& elem_type);
    void update_xlabel_position (void);
    void update_ylabel_position (void);
    void update_zlabel_position (void);
    void update_title_position (void);

    graphics_xform get_transform (void) const
    { return graphics_xform (x_render, x_render_inv, sx, sy, sz, x_zlim); }

    Matrix get_transform_matrix (void) const { return x_render; }
    Matrix get_inverse_transform_matrix (void) const { return x_render_inv; }
    Matrix get_opengl_matrix_1 (void) const { return x_gl_mat1; }
    Matrix get_opengl_matrix_2 (void) const { return x_gl_mat2; }
    Matrix get_transform_zlim (void) const { return x_zlim; }

    int get_xstate (void) const { return xstate; }
    int get_ystate (void) const { return ystate; }
    int get_zstate (void) const { return zstate; }
    double get_xPlane (void) const { return xPlane; }
    double get_xPlaneN (void) const { return xPlaneN; }
    double get_yPlane (void) const { return yPlane; }
    double get_yPlaneN (void) const { return yPlaneN; }
    double get_zPlane (void) const { return zPlane; }
    double get_zPlaneN (void) const { return zPlaneN; }
    double get_xpTick (void) const { return xpTick; }
    double get_xpTickN (void) const { return xpTickN; }
    double get_ypTick (void) const { return ypTick; }
    double get_ypTickN (void) const { return ypTickN; }
    double get_zpTick (void) const { return zpTick; }
    double get_zpTickN (void) const { return zpTickN; }
    double get_x_min (void) const { return std::min (xPlane, xPlaneN); }
    double get_x_max (void) const { return std::max (xPlane, xPlaneN); }
    double get_y_min (void) const { return std::min (yPlane, yPlaneN); }
    double get_y_max (void) const { return std::max (yPlane, yPlaneN); }
    double get_z_min (void) const { return std::min (zPlane, zPlaneN); }
    double get_z_max (void) const { return std::max (zPlane, zPlaneN); }
    double get_fx (void) const { return fx; }
    double get_fy (void) const { return fy; }
    double get_fz (void) const { return fz; }
    double get_xticklen (void) const { return xticklen; }
    double get_yticklen (void) const { return yticklen; }
    double get_zticklen (void) const { return zticklen; }
    double get_xtickoffset (void) const { return xtickoffset; }
    double get_ytickoffset (void) const { return ytickoffset; }
    double get_ztickoffset (void) const { return ztickoffset; }
    bool get_x2Dtop (void) const { return x2Dtop; }
    bool get_y2Dright (void) const { return y2Dright; }
    bool get_layer2Dtop (void) const { return layer2Dtop; }
    bool get_is2D (void) const { return is2D; }
    bool get_xySym (void) const { return xySym; }
    bool get_xyzSym (void) const { return xyzSym; }
    bool get_zSign (void) const { return zSign; }
    bool get_nearhoriz (void) const { return nearhoriz; }

    ColumnVector pixel2coord (double px, double py) const
    { return get_transform ().untransform (px, py, (x_zlim(0)+x_zlim(1))/2); }

    ColumnVector coord2pixel (double x, double y, double z) const
    { return get_transform ().transform (x, y, z); }

    void zoom_about_point (const std::string& mode, double x, double y,
                           double factor, bool push_to_zoom_stack = true);
    void zoom (const std::string& mode, double factor,
               bool push_to_zoom_stack = true);
    void zoom (const std::string& mode, const Matrix& xl, const Matrix& yl,
               bool push_to_zoom_stack = true);

    void translate_view (const std::string& mode,
                         double x0, double x1, double y0, double y1,
                         bool push_to_zoom_stack = true);

    void pan (const std::string& mode, double factor,
              bool push_to_zoom_stack = true);

    void rotate3d (double x0, double x1, double y0, double y1,
                   bool push_to_zoom_stack = true);

    void rotate_view (double delta_az, double delta_el,
                      bool push_to_zoom_stack = true);

    void unzoom (void);
    void push_zoom_stack (void);
    void clear_zoom_stack (bool do_unzoom = true);

    void update_units (const caseless_str& old_units);

    void update_fontunits (const caseless_str& old_fontunits);

  private:
    scaler sx, sy, sz;
    Matrix x_render, x_render_inv;
    Matrix x_gl_mat1, x_gl_mat2;
    Matrix x_zlim;
    std::list<octave_value> zoom_stack;

    // Axes layout data
    int xstate, ystate, zstate;
    double xPlane, xPlaneN, yPlane, yPlaneN, zPlane, zPlaneN;
    double xpTick, xpTickN, ypTick, ypTickN, zpTick, zpTickN;
    double fx, fy, fz;
    double xticklen, yticklen, zticklen;
    double xtickoffset, ytickoffset, ztickoffset;
    bool x2Dtop, y2Dright, layer2Dtop, is2D;
    bool xySym, xyzSym, zSign, nearhoriz;

    // Text renderer, used for calculation of text (tick labels) size
    octave::text_renderer txt_renderer;

    void set_text_child (handle_property& h, const std::string& who,
                         const octave_value& v);

    void delete_text_child (handle_property& h);

    // See the genprops.awk script for an explanation of the
    // properties declarations.

    // FIXME: Several properties have been deleted from Matlab.
    //        We should either immediately remove them or figure out a way
    //        to deprecate them for a release or two.
    // Obsolete properties: drawmode

    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  radio_property activepositionproperty;
  row_vector_property alim;
  radio_property alimmode;
  color_property ambientlightcolor;
  bool_property box;
  radio_property boxstyle;
  array_property cameraposition;
  radio_property camerapositionmode;
  array_property cameratarget;
  radio_property cameratargetmode;
  array_property cameraupvector;
  radio_property cameraupvectormode;
  double_property cameraviewangle;
  radio_property cameraviewanglemode;
  row_vector_property clim;
  radio_property climmode;
  radio_property clippingstyle;
  color_property color;
  array_property colororder;
  double_property colororderindex;
  array_property currentpoint;
  array_property dataaspectratio;
  radio_property dataaspectratiomode;
  radio_property drawmode;
  radio_property fontangle;
  string_property fontname;
  double_property fontsize;
  radio_property fontunits;
  bool_property fontsmoothing;
  radio_property fontweight;
  double_property gridalpha;
  radio_property gridalphamode;
  color_property gridcolor;
  radio_property gridcolormode;
  radio_property gridlinestyle;
  double_property labelfontsizemultiplier;
  radio_property layer;
  any_property linestyleorder;
  double_property linestyleorderindex;
  double_property linewidth;
  double_property minorgridalpha;
  radio_property minorgridalphamode;
  color_property minorgridcolor;
  radio_property minorgridcolormode;
  radio_property minorgridlinestyle;
  radio_property nextplot;
  array_property outerposition;
  array_property plotboxaspectratio;
  radio_property plotboxaspectratiomode;
  radio_property pickableparts;
  array_property position;
  radio_property projection;
  radio_property sortmethod;
  radio_property tickdir;
  radio_property tickdirmode;
  radio_property ticklabelinterpreter;
  array_property ticklength;
  array_property tightinset;
  handle_property title;
  double_property titlefontsizemultiplier;
  radio_property titlefontweight;
  radio_property units;
  array_property view;
  radio_property xaxislocation;
  color_property xcolor;
  radio_property xcolormode;
  radio_property xdir;
  bool_property xgrid;
  handle_property xlabel;
  row_vector_property xlim;
  radio_property xlimmode;
  bool_property xminorgrid;
  bool_property xminortick;
  radio_property xscale;
  row_vector_property xtick;
  any_property xticklabel;
  radio_property xticklabelmode;
  double_property xticklabelrotation;
  radio_property xtickmode;
  radio_property yaxislocation;
  color_property ycolor;
  radio_property ycolormode;
  radio_property ydir;
  bool_property ygrid;
  handle_property ylabel;
  row_vector_property ylim;
  radio_property ylimmode;
  bool_property yminorgrid;
  bool_property yminortick;
  radio_property yscale;
  row_vector_property ytick;
  any_property yticklabel;
  radio_property yticklabelmode;
  double_property yticklabelrotation;
  radio_property ytickmode;
  color_property zcolor;
  radio_property zcolormode;
  radio_property zdir;
  bool_property zgrid;
  handle_property zlabel;
  row_vector_property zlim;
  radio_property zlimmode;
  bool_property zminorgrid;
  bool_property zminortick;
  radio_property zscale;
  row_vector_property ztick;
  any_property zticklabel;
  radio_property zticklabelmode;
  double_property zticklabelrotation;
  radio_property ztickmode;
  double_property mousewheelzoom;
  radio_property autopos_tag;
  array_property looseinset;
  array_property x_viewtransform;
  array_property x_projectiontransform;
  array_property x_viewporttransform;
  array_property x_normrendertransform;
  array_property x_rendertransform;
  row_vector_property xmtick;
  row_vector_property ymtick;
  row_vector_property zmtick;
  double_property fontsize_points;

public:

  enum
  {
    ID_ACTIVEPOSITIONPROPERTY = 3000,
    ID_ALIM = 3001,
    ID_ALIMMODE = 3002,
    ID_AMBIENTLIGHTCOLOR = 3003,
    ID_BOX = 3004,
    ID_BOXSTYLE = 3005,
    ID_CAMERAPOSITION = 3006,
    ID_CAMERAPOSITIONMODE = 3007,
    ID_CAMERATARGET = 3008,
    ID_CAMERATARGETMODE = 3009,
    ID_CAMERAUPVECTOR = 3010,
    ID_CAMERAUPVECTORMODE = 3011,
    ID_CAMERAVIEWANGLE = 3012,
    ID_CAMERAVIEWANGLEMODE = 3013,
    ID_CLIM = 3014,
    ID_CLIMMODE = 3015,
    ID_CLIPPINGSTYLE = 3016,
    ID_COLOR = 3017,
    ID_COLORORDER = 3018,
    ID_COLORORDERINDEX = 3019,
    ID_CURRENTPOINT = 3020,
    ID_DATAASPECTRATIO = 3021,
    ID_DATAASPECTRATIOMODE = 3022,
    ID_DRAWMODE = 3023,
    ID_FONTANGLE = 3024,
    ID_FONTNAME = 3025,
    ID_FONTSIZE = 3026,
    ID_FONTUNITS = 3027,
    ID_FONTSMOOTHING = 3028,
    ID_FONTWEIGHT = 3029,
    ID_GRIDALPHA = 3030,
    ID_GRIDALPHAMODE = 3031,
    ID_GRIDCOLOR = 3032,
    ID_GRIDCOLORMODE = 3033,
    ID_GRIDLINESTYLE = 3034,
    ID_LABELFONTSIZEMULTIPLIER = 3035,
    ID_LAYER = 3036,
    ID_LINESTYLEORDER = 3037,
    ID_LINESTYLEORDERINDEX = 3038,
    ID_LINEWIDTH = 3039,
    ID_MINORGRIDALPHA = 3040,
    ID_MINORGRIDALPHAMODE = 3041,
    ID_MINORGRIDCOLOR = 3042,
    ID_MINORGRIDCOLORMODE = 3043,
    ID_MINORGRIDLINESTYLE = 3044,
    ID_NEXTPLOT = 3045,
    ID_OUTERPOSITION = 3046,
    ID_PLOTBOXASPECTRATIO = 3047,
    ID_PLOTBOXASPECTRATIOMODE = 3048,
    ID_PICKABLEPARTS = 3049,
    ID_POSITION = 3050,
    ID_PROJECTION = 3051,
    ID_SORTMETHOD = 3052,
    ID_TICKDIR = 3053,
    ID_TICKDIRMODE = 3054,
    ID_TICKLABELINTERPRETER = 3055,
    ID_TICKLENGTH = 3056,
    ID_TIGHTINSET = 3057,
    ID_TITLE = 3058,
    ID_TITLEFONTSIZEMULTIPLIER = 3059,
    ID_TITLEFONTWEIGHT = 3060,
    ID_UNITS = 3061,
    ID_VIEW = 3062,
    ID_XAXISLOCATION = 3063,
    ID_XCOLOR = 3064,
    ID_XCOLORMODE = 3065,
    ID_XDIR = 3066,
    ID_XGRID = 3067,
    ID_XLABEL = 3068,
    ID_XLIM = 3069,
    ID_XLIMMODE = 3070,
    ID_XMINORGRID = 3071,
    ID_XMINORTICK = 3072,
    ID_XSCALE = 3073,
    ID_XTICK = 3074,
    ID_XTICKLABEL = 3075,
    ID_XTICKLABELMODE = 3076,
    ID_XTICKLABELROTATION = 3077,
    ID_XTICKMODE = 3078,
    ID_YAXISLOCATION = 3079,
    ID_YCOLOR = 3080,
    ID_YCOLORMODE = 3081,
    ID_YDIR = 3082,
    ID_YGRID = 3083,
    ID_YLABEL = 3084,
    ID_YLIM = 3085,
    ID_YLIMMODE = 3086,
    ID_YMINORGRID = 3087,
    ID_YMINORTICK = 3088,
    ID_YSCALE = 3089,
    ID_YTICK = 3090,
    ID_YTICKLABEL = 3091,
    ID_YTICKLABELMODE = 3092,
    ID_YTICKLABELROTATION = 3093,
    ID_YTICKMODE = 3094,
    ID_ZCOLOR = 3095,
    ID_ZCOLORMODE = 3096,
    ID_ZDIR = 3097,
    ID_ZGRID = 3098,
    ID_ZLABEL = 3099,
    ID_ZLIM = 3100,
    ID_ZLIMMODE = 3101,
    ID_ZMINORGRID = 3102,
    ID_ZMINORTICK = 3103,
    ID_ZSCALE = 3104,
    ID_ZTICK = 3105,
    ID_ZTICKLABEL = 3106,
    ID_ZTICKLABELMODE = 3107,
    ID_ZTICKLABELROTATION = 3108,
    ID_ZTICKMODE = 3109,
    ID_MOUSEWHEELZOOM = 3110,
    ID_AUTOPOS_TAG = 3111,
    ID_LOOSEINSET = 3112,
    ID_X_VIEWTRANSFORM = 3113,
    ID_X_PROJECTIONTRANSFORM = 3114,
    ID_X_VIEWPORTTRANSFORM = 3115,
    ID_X_NORMRENDERTRANSFORM = 3116,
    ID_X_RENDERTRANSFORM = 3117,
    ID_XMTICK = 3118,
    ID_YMTICK = 3119,
    ID_ZMTICK = 3120,
    ID_FONTSIZE_POINTS = 3121
  };

  bool activepositionproperty_is (const std::string& v) const { return activepositionproperty.is (v); }
  std::string get_activepositionproperty (void) const { return activepositionproperty.current_value (); }

  octave_value get_alim (void) const { return alim.get (); }

  bool alimmode_is (const std::string& v) const { return alimmode.is (v); }
  std::string get_alimmode (void) const { return alimmode.current_value (); }

  bool ambientlightcolor_is_rgb (void) const { return ambientlightcolor.is_rgb (); }
  bool ambientlightcolor_is (const std::string& v) const { return ambientlightcolor.is (v); }
  Matrix get_ambientlightcolor_rgb (void) const { return (ambientlightcolor.is_rgb () ? ambientlightcolor.rgb () : Matrix ()); }
  octave_value get_ambientlightcolor (void) const { return ambientlightcolor.get (); }

  bool is_box (void) const { return box.is_on (); }
  std::string get_box (void) const { return box.current_value (); }

  bool boxstyle_is (const std::string& v) const { return boxstyle.is (v); }
  std::string get_boxstyle (void) const { return boxstyle.current_value (); }

  octave_value get_cameraposition (void) const { return cameraposition.get (); }

  bool camerapositionmode_is (const std::string& v) const { return camerapositionmode.is (v); }
  std::string get_camerapositionmode (void) const { return camerapositionmode.current_value (); }

  octave_value get_cameratarget (void) const { return cameratarget.get (); }

  bool cameratargetmode_is (const std::string& v) const { return cameratargetmode.is (v); }
  std::string get_cameratargetmode (void) const { return cameratargetmode.current_value (); }

  octave_value get_cameraupvector (void) const { return cameraupvector.get (); }

  bool cameraupvectormode_is (const std::string& v) const { return cameraupvectormode.is (v); }
  std::string get_cameraupvectormode (void) const { return cameraupvectormode.current_value (); }

  double get_cameraviewangle (void) const { return cameraviewangle.double_value (); }

  bool cameraviewanglemode_is (const std::string& v) const { return cameraviewanglemode.is (v); }
  std::string get_cameraviewanglemode (void) const { return cameraviewanglemode.current_value (); }

  octave_value get_clim (void) const { return clim.get (); }

  bool climmode_is (const std::string& v) const { return climmode.is (v); }
  std::string get_climmode (void) const { return climmode.current_value (); }

  bool clippingstyle_is (const std::string& v) const { return clippingstyle.is (v); }
  std::string get_clippingstyle (void) const { return clippingstyle.current_value (); }

  bool color_is_rgb (void) const { return color.is_rgb (); }
  bool color_is (const std::string& v) const { return color.is (v); }
  Matrix get_color_rgb (void) const { return (color.is_rgb () ? color.rgb () : Matrix ()); }
  octave_value get_color (void) const { return color.get (); }

  octave_value get_colororder (void) const { return colororder.get (); }

  double get_colororderindex (void) const { return colororderindex.double_value (); }

  octave_value get_currentpoint (void) const { return currentpoint.get (); }

  octave_value get_dataaspectratio (void) const { return dataaspectratio.get (); }

  bool dataaspectratiomode_is (const std::string& v) const { return dataaspectratiomode.is (v); }
  std::string get_dataaspectratiomode (void) const { return dataaspectratiomode.current_value (); }

  bool drawmode_is (const std::string& v) const { return drawmode.is (v); }
  std::string get_drawmode (void) const { return drawmode.current_value (); }

  bool fontangle_is (const std::string& v) const { return fontangle.is (v); }
  std::string get_fontangle (void) const { return fontangle.current_value (); }

  std::string get_fontname (void) const { return fontname.string_value (); }

  double get_fontsize (void) const { return fontsize.double_value (); }

  bool fontunits_is (const std::string& v) const { return fontunits.is (v); }
  std::string get_fontunits (void) const { return fontunits.current_value (); }

  bool is_fontsmoothing (void) const { return fontsmoothing.is_on (); }
  std::string get_fontsmoothing (void) const { return fontsmoothing.current_value (); }

  bool fontweight_is (const std::string& v) const { return fontweight.is (v); }
  std::string get_fontweight (void) const { return fontweight.current_value (); }

  double get_gridalpha (void) const { return gridalpha.double_value (); }

  bool gridalphamode_is (const std::string& v) const { return gridalphamode.is (v); }
  std::string get_gridalphamode (void) const { return gridalphamode.current_value (); }

  bool gridcolor_is_rgb (void) const { return gridcolor.is_rgb (); }
  bool gridcolor_is (const std::string& v) const { return gridcolor.is (v); }
  Matrix get_gridcolor_rgb (void) const { return (gridcolor.is_rgb () ? gridcolor.rgb () : Matrix ()); }
  octave_value get_gridcolor (void) const { return gridcolor.get (); }

  bool gridcolormode_is (const std::string& v) const { return gridcolormode.is (v); }
  std::string get_gridcolormode (void) const { return gridcolormode.current_value (); }

  bool gridlinestyle_is (const std::string& v) const { return gridlinestyle.is (v); }
  std::string get_gridlinestyle (void) const { return gridlinestyle.current_value (); }

  double get_labelfontsizemultiplier (void) const { return labelfontsizemultiplier.double_value (); }

  bool layer_is (const std::string& v) const { return layer.is (v); }
  std::string get_layer (void) const { return layer.current_value (); }

  octave_value get_linestyleorder (void) const { return linestyleorder.get (); }

  double get_linestyleorderindex (void) const { return linestyleorderindex.double_value (); }

  double get_linewidth (void) const { return linewidth.double_value (); }

  double get_minorgridalpha (void) const { return minorgridalpha.double_value (); }

  bool minorgridalphamode_is (const std::string& v) const { return minorgridalphamode.is (v); }
  std::string get_minorgridalphamode (void) const { return minorgridalphamode.current_value (); }

  bool minorgridcolor_is_rgb (void) const { return minorgridcolor.is_rgb (); }
  bool minorgridcolor_is (const std::string& v) const { return minorgridcolor.is (v); }
  Matrix get_minorgridcolor_rgb (void) const { return (minorgridcolor.is_rgb () ? minorgridcolor.rgb () : Matrix ()); }
  octave_value get_minorgridcolor (void) const { return minorgridcolor.get (); }

  bool minorgridcolormode_is (const std::string& v) const { return minorgridcolormode.is (v); }
  std::string get_minorgridcolormode (void) const { return minorgridcolormode.current_value (); }

  bool minorgridlinestyle_is (const std::string& v) const { return minorgridlinestyle.is (v); }
  std::string get_minorgridlinestyle (void) const { return minorgridlinestyle.current_value (); }

  bool nextplot_is (const std::string& v) const { return nextplot.is (v); }
  std::string get_nextplot (void) const { return nextplot.current_value (); }

  octave_value get_outerposition (void) const { return outerposition.get (); }

  octave_value get_plotboxaspectratio (void) const { return plotboxaspectratio.get (); }

  bool plotboxaspectratiomode_is (const std::string& v) const { return plotboxaspectratiomode.is (v); }
  std::string get_plotboxaspectratiomode (void) const { return plotboxaspectratiomode.current_value (); }

  bool pickableparts_is (const std::string& v) const { return pickableparts.is (v); }
  std::string get_pickableparts (void) const { return pickableparts.current_value (); }

  octave_value get_position (void) const { return position.get (); }

  bool projection_is (const std::string& v) const { return projection.is (v); }
  std::string get_projection (void) const { return projection.current_value (); }

  bool sortmethod_is (const std::string& v) const { return sortmethod.is (v); }
  std::string get_sortmethod (void) const { return sortmethod.current_value (); }

  bool tickdir_is (const std::string& v) const { return tickdir.is (v); }
  std::string get_tickdir (void) const { return tickdir.current_value (); }

  bool tickdirmode_is (const std::string& v) const { return tickdirmode.is (v); }
  std::string get_tickdirmode (void) const { return tickdirmode.current_value (); }

  bool ticklabelinterpreter_is (const std::string& v) const { return ticklabelinterpreter.is (v); }
  std::string get_ticklabelinterpreter (void) const { return ticklabelinterpreter.current_value (); }

  octave_value get_ticklength (void) const { return ticklength.get (); }

  octave_value get_tightinset (void) const { return tightinset.get (); }

  graphics_handle get_title (void) const { return title.handle_value (); }

  double get_titlefontsizemultiplier (void) const { return titlefontsizemultiplier.double_value (); }

  bool titlefontweight_is (const std::string& v) const { return titlefontweight.is (v); }
  std::string get_titlefontweight (void) const { return titlefontweight.current_value (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }

  octave_value get_view (void) const { return view.get (); }

  bool xaxislocation_is (const std::string& v) const { return xaxislocation.is (v); }
  std::string get_xaxislocation (void) const { return xaxislocation.current_value (); }

  bool xcolor_is_rgb (void) const { return xcolor.is_rgb (); }
  bool xcolor_is (const std::string& v) const { return xcolor.is (v); }
  Matrix get_xcolor_rgb (void) const { return (xcolor.is_rgb () ? xcolor.rgb () : Matrix ()); }
  octave_value get_xcolor (void) const { return xcolor.get (); }

  bool xcolormode_is (const std::string& v) const { return xcolormode.is (v); }
  std::string get_xcolormode (void) const { return xcolormode.current_value (); }

  bool xdir_is (const std::string& v) const { return xdir.is (v); }
  std::string get_xdir (void) const { return xdir.current_value (); }

  bool is_xgrid (void) const { return xgrid.is_on (); }
  std::string get_xgrid (void) const { return xgrid.current_value (); }

  graphics_handle get_xlabel (void) const { return xlabel.handle_value (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  bool xlimmode_is (const std::string& v) const { return xlimmode.is (v); }
  std::string get_xlimmode (void) const { return xlimmode.current_value (); }

  bool is_xminorgrid (void) const { return xminorgrid.is_on (); }
  std::string get_xminorgrid (void) const { return xminorgrid.current_value (); }

  bool is_xminortick (void) const { return xminortick.is_on (); }
  std::string get_xminortick (void) const { return xminortick.current_value (); }

  bool xscale_is (const std::string& v) const { return xscale.is (v); }
  std::string get_xscale (void) const { return xscale.current_value (); }

  octave_value get_xtick (void) const { return xtick.get (); }

  octave_value get_xticklabel (void) const { return xticklabel.get (); }

  bool xticklabelmode_is (const std::string& v) const { return xticklabelmode.is (v); }
  std::string get_xticklabelmode (void) const { return xticklabelmode.current_value (); }

  double get_xticklabelrotation (void) const { return xticklabelrotation.double_value (); }

  bool xtickmode_is (const std::string& v) const { return xtickmode.is (v); }
  std::string get_xtickmode (void) const { return xtickmode.current_value (); }

  bool yaxislocation_is (const std::string& v) const { return yaxislocation.is (v); }
  std::string get_yaxislocation (void) const { return yaxislocation.current_value (); }

  bool ycolor_is_rgb (void) const { return ycolor.is_rgb (); }
  bool ycolor_is (const std::string& v) const { return ycolor.is (v); }
  Matrix get_ycolor_rgb (void) const { return (ycolor.is_rgb () ? ycolor.rgb () : Matrix ()); }
  octave_value get_ycolor (void) const { return ycolor.get (); }

  bool ycolormode_is (const std::string& v) const { return ycolormode.is (v); }
  std::string get_ycolormode (void) const { return ycolormode.current_value (); }

  bool ydir_is (const std::string& v) const { return ydir.is (v); }
  std::string get_ydir (void) const { return ydir.current_value (); }

  bool is_ygrid (void) const { return ygrid.is_on (); }
  std::string get_ygrid (void) const { return ygrid.current_value (); }

  graphics_handle get_ylabel (void) const { return ylabel.handle_value (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  bool ylimmode_is (const std::string& v) const { return ylimmode.is (v); }
  std::string get_ylimmode (void) const { return ylimmode.current_value (); }

  bool is_yminorgrid (void) const { return yminorgrid.is_on (); }
  std::string get_yminorgrid (void) const { return yminorgrid.current_value (); }

  bool is_yminortick (void) const { return yminortick.is_on (); }
  std::string get_yminortick (void) const { return yminortick.current_value (); }

  bool yscale_is (const std::string& v) const { return yscale.is (v); }
  std::string get_yscale (void) const { return yscale.current_value (); }

  octave_value get_ytick (void) const { return ytick.get (); }

  octave_value get_yticklabel (void) const { return yticklabel.get (); }

  bool yticklabelmode_is (const std::string& v) const { return yticklabelmode.is (v); }
  std::string get_yticklabelmode (void) const { return yticklabelmode.current_value (); }

  double get_yticklabelrotation (void) const { return yticklabelrotation.double_value (); }

  bool ytickmode_is (const std::string& v) const { return ytickmode.is (v); }
  std::string get_ytickmode (void) const { return ytickmode.current_value (); }

  bool zcolor_is_rgb (void) const { return zcolor.is_rgb (); }
  bool zcolor_is (const std::string& v) const { return zcolor.is (v); }
  Matrix get_zcolor_rgb (void) const { return (zcolor.is_rgb () ? zcolor.rgb () : Matrix ()); }
  octave_value get_zcolor (void) const { return zcolor.get (); }

  bool zcolormode_is (const std::string& v) const { return zcolormode.is (v); }
  std::string get_zcolormode (void) const { return zcolormode.current_value (); }

  bool zdir_is (const std::string& v) const { return zdir.is (v); }
  std::string get_zdir (void) const { return zdir.current_value (); }

  bool is_zgrid (void) const { return zgrid.is_on (); }
  std::string get_zgrid (void) const { return zgrid.current_value (); }

  graphics_handle get_zlabel (void) const { return zlabel.handle_value (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool zlimmode_is (const std::string& v) const { return zlimmode.is (v); }
  std::string get_zlimmode (void) const { return zlimmode.current_value (); }

  bool is_zminorgrid (void) const { return zminorgrid.is_on (); }
  std::string get_zminorgrid (void) const { return zminorgrid.current_value (); }

  bool is_zminortick (void) const { return zminortick.is_on (); }
  std::string get_zminortick (void) const { return zminortick.current_value (); }

  bool zscale_is (const std::string& v) const { return zscale.is (v); }
  std::string get_zscale (void) const { return zscale.current_value (); }

  octave_value get_ztick (void) const { return ztick.get (); }

  octave_value get_zticklabel (void) const { return zticklabel.get (); }

  bool zticklabelmode_is (const std::string& v) const { return zticklabelmode.is (v); }
  std::string get_zticklabelmode (void) const { return zticklabelmode.current_value (); }

  double get_zticklabelrotation (void) const { return zticklabelrotation.double_value (); }

  bool ztickmode_is (const std::string& v) const { return ztickmode.is (v); }
  std::string get_ztickmode (void) const { return ztickmode.current_value (); }

  double get_mousewheelzoom (void) const { return mousewheelzoom.double_value (); }

  bool autopos_tag_is (const std::string& v) const { return autopos_tag.is (v); }
  std::string get_autopos_tag (void) const { return autopos_tag.current_value (); }

  octave_value get_looseinset (void) const { return looseinset.get (); }

  octave_value get_x_viewtransform (void) const { return x_viewtransform.get (); }

  octave_value get_x_projectiontransform (void) const { return x_projectiontransform.get (); }

  octave_value get_x_viewporttransform (void) const { return x_viewporttransform.get (); }

  octave_value get_x_normrendertransform (void) const { return x_normrendertransform.get (); }

  octave_value get_x_rendertransform (void) const { return x_rendertransform.get (); }

  octave_value get_xmtick (void) const { return xmtick.get (); }

  octave_value get_ymtick (void) const { return ymtick.get (); }

  octave_value get_zmtick (void) const { return zmtick.get (); }


  void set_activepositionproperty (const octave_value& val)
  {
      {
        if (activepositionproperty.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_alim (const octave_value& val)
  {
      {
        if (alim.set (val, false))
          {
            set_alimmode ("manual");
            alim.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_alimmode ("manual");
      }
  }

  void set_alimmode (const octave_value& val)
  {
      {
        if (alimmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ambientlightcolor (const octave_value& val)
  {
      {
        if (ambientlightcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_box (const octave_value& val)
  {
      {
        if (box.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_boxstyle (const octave_value& val)
  {
      {
        if (boxstyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cameraposition (const octave_value& val)
  {
      {
        if (cameraposition.set (val, false))
          {
            set_camerapositionmode ("manual");
            cameraposition.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_camerapositionmode ("manual");
      }
  }

  void set_camerapositionmode (const octave_value& val)
  {
      {
        if (camerapositionmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cameratarget (const octave_value& val)
  {
      {
        if (cameratarget.set (val, false))
          {
            set_cameratargetmode ("manual");
            cameratarget.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_cameratargetmode ("manual");
      }
  }

  void set_cameratargetmode (const octave_value& val)
  {
      {
        if (cameratargetmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cameraupvector (const octave_value& val)
  {
      {
        if (cameraupvector.set (val, false))
          {
            set_cameraupvectormode ("manual");
            cameraupvector.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_cameraupvectormode ("manual");
      }
  }

  void set_cameraupvectormode (const octave_value& val)
  {
      {
        if (cameraupvectormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cameraviewangle (const octave_value& val)
  {
      {
        if (cameraviewangle.set (val, false))
          {
            set_cameraviewanglemode ("manual");
            cameraviewangle.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_cameraviewanglemode ("manual");
      }
  }

  void set_cameraviewanglemode (const octave_value& val)
  {
      {
        if (cameraviewanglemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clim (const octave_value& val)
  {
      {
        if (clim.set (val, false))
          {
            set_climmode ("manual");
            clim.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_climmode ("manual");
      }
  }

  void set_climmode (const octave_value& val)
  {
      {
        if (climmode.set (val, false))
          {
            update_axis_limits ("climmode");
            climmode.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_clippingstyle (const octave_value& val)
  {
      {
        if (clippingstyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_color (const octave_value& val)
  {
      {
        if (color.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_colororder (const octave_value& val)
  {
      {
        if (colororder.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_colororderindex (const octave_value& val)
  {
      {
        if (colororderindex.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_currentpoint (const octave_value& val)
  {
      {
        if (currentpoint.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_dataaspectratio (const octave_value& val)
  {
      {
        if (dataaspectratio.set (val, false))
          {
            set_dataaspectratiomode ("manual");
            update_dataaspectratio ();
            dataaspectratio.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_dataaspectratiomode ("manual");
      }
  }

  void set_dataaspectratiomode (const octave_value& val)
  {
      {
        if (dataaspectratiomode.set (val, true))
          {
            update_dataaspectratiomode ();
            mark_modified ();
          }
      }
  }

  void set_drawmode (const octave_value& val)
  {
      {
        if (drawmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontangle (const octave_value& val)
  {
      {
        if (fontangle.set (val, true))
          {
            update_fontangle ();
            mark_modified ();
          }
      }
  }

  void set_fontname (const octave_value& val)
  {
      {
        if (fontname.set (val, true))
          {
            update_fontname ();
            mark_modified ();
          }
      }
  }

  void set_fontsize (const octave_value& val)
  {
      {
        if (fontsize.set (val, true))
          {
            update_fontsize ();
            mark_modified ();
          }
      }
  }

  void set_fontunits (const octave_value& val);

  void update_fontunits (void);

  void set_fontsmoothing (const octave_value& val)
  {
      {
        if (fontsmoothing.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontweight (const octave_value& val)
  {
      {
        if (fontweight.set (val, true))
          {
            update_fontweight ();
            mark_modified ();
          }
      }
  }

  void set_gridalpha (const octave_value& val)
  {
      {
        if (gridalpha.set (val, false))
          {
            set_gridalphamode ("manual");
            gridalpha.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_gridalphamode ("manual");
      }
  }

  void set_gridalphamode (const octave_value& val)
  {
      {
        if (gridalphamode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_gridcolor (const octave_value& val)
  {
      {
        if (gridcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_gridcolormode (const octave_value& val)
  {
      {
        if (gridcolormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_gridlinestyle (const octave_value& val)
  {
      {
        if (gridlinestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_labelfontsizemultiplier (const octave_value& val)
  {
      {
        if (labelfontsizemultiplier.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_layer (const octave_value& val)
  {
      {
        if (layer.set (val, true))
          {
            update_layer ();
            mark_modified ();
          }
      }
  }

  void set_linestyleorder (const octave_value& val);

  void set_linestyleorderindex (const octave_value& val)
  {
      {
        if (linestyleorderindex.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linewidth (const octave_value& val)
  {
      {
        if (linewidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_minorgridalpha (const octave_value& val)
  {
      {
        if (minorgridalpha.set (val, false))
          {
            set_minorgridalphamode ("manual");
            minorgridalpha.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_minorgridalphamode ("manual");
      }
  }

  void set_minorgridalphamode (const octave_value& val)
  {
      {
        if (minorgridalphamode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_minorgridcolor (const octave_value& val)
  {
      {
        if (minorgridcolor.set (val, false))
          {
            set_minorgridcolormode ("manual");
            minorgridcolor.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_minorgridcolormode ("manual");
      }
  }

  void set_minorgridcolormode (const octave_value& val)
  {
      {
        if (minorgridcolormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_minorgridlinestyle (const octave_value& val)
  {
      {
        if (minorgridlinestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_nextplot (const octave_value& val)
  {
      {
        if (nextplot.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_outerposition (const octave_value& val)
  {
      {
        if (outerposition.set (val, true))
          {
            update_outerposition ();
            mark_modified ();
          }
      }
  }

  void set_plotboxaspectratio (const octave_value& val)
  {
      {
        if (plotboxaspectratio.set (val, false))
          {
            set_plotboxaspectratiomode ("manual");
            update_plotboxaspectratio ();
            plotboxaspectratio.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_plotboxaspectratiomode ("manual");
      }
  }

  void set_plotboxaspectratiomode (const octave_value& val)
  {
      {
        if (plotboxaspectratiomode.set (val, true))
          {
            update_plotboxaspectratiomode ();
            mark_modified ();
          }
      }
  }

  void set_pickableparts (const octave_value& val)
  {
      {
        if (pickableparts.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            update_position ();
            mark_modified ();
          }
      }
  }

  void set_projection (const octave_value& val)
  {
      {
        if (projection.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_sortmethod (const octave_value& val)
  {
      {
        if (sortmethod.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_tickdir (const octave_value& val)
  {
      {
        if (tickdir.set (val, false))
          {
            set_tickdirmode ("manual");
            update_tickdir ();
            tickdir.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_tickdirmode ("manual");
      }
  }

  void set_tickdirmode (const octave_value& val)
  {
      {
        if (tickdirmode.set (val, true))
          {
            update_tickdirmode ();
            mark_modified ();
          }
      }
  }

  void set_ticklabelinterpreter (const octave_value& val)
  {
      {
        if (ticklabelinterpreter.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ticklength (const octave_value& val)
  {
      {
        if (ticklength.set (val, true))
          {
            update_ticklength ();
            mark_modified ();
          }
      }
  }

  void set_tightinset (const octave_value& val)
  {
      {
        if (tightinset.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_title (const octave_value& val);

  void set_titlefontsizemultiplier (const octave_value& val)
  {
      {
        if (titlefontsizemultiplier.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_titlefontweight (const octave_value& val)
  {
      {
        if (titlefontweight.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val);

  void update_units (void);

  void set_view (const octave_value& val)
  {
      {
        if (view.set (val, true))
          {
            update_view ();
            mark_modified ();
          }
      }
  }

  void set_xaxislocation (const octave_value& val)
  {
      {
        if (xaxislocation.set (val, true))
          {
            update_xaxislocation ();
            mark_modified ();
          }
      }
  }

  void set_xcolor (const octave_value& val)
  {
      {
        if (xcolor.set (val, false))
          {
            set_xcolormode ("manual");
            update_xcolor ();
            xcolor.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_xcolormode ("manual");
      }
  }

  void set_xcolormode (const octave_value& val)
  {
      {
        if (xcolormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xdir (const octave_value& val)
  {
      {
        if (xdir.set (val, true))
          {
            update_xdir ();
            mark_modified ();
          }
      }
  }

  void set_xgrid (const octave_value& val)
  {
      {
        if (xgrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xlabel (const octave_value& val);

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            set_xlimmode ("manual");
            update_xlim ();
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_xlimmode ("manual");
      }
  }

  void set_xlimmode (const octave_value& val)
  {
      {
        if (xlimmode.set (val, false))
          {
            update_axis_limits ("xlimmode");
            xlimmode.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xminorgrid (const octave_value& val)
  {
      {
        if (xminorgrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xminortick (const octave_value& val)
  {
      {
        if (xminortick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xscale (const octave_value& val)
  {
      {
        if (xscale.set (val, false))
          {
            update_xscale ();
            update_axis_limits ("xscale");
            xscale.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xtick (const octave_value& val)
  {
      {
        if (xtick.set (val, false))
          {
            set_xtickmode ("manual");
            update_xtick ();
            xtick.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_xtickmode ("manual");
      }
  }

  void set_xticklabel (const octave_value& val);

  void set_xticklabelmode (const octave_value& val)
  {
      {
        if (xticklabelmode.set (val, true))
          {
            update_xticklabelmode ();
            mark_modified ();
          }
      }
  }

  void set_xticklabelrotation (const octave_value& val)
  {
      {
        if (xticklabelrotation.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xtickmode (const octave_value& val)
  {
      {
        if (xtickmode.set (val, true))
          {
            update_xtickmode ();
            mark_modified ();
          }
      }
  }

  void set_yaxislocation (const octave_value& val)
  {
      {
        if (yaxislocation.set (val, true))
          {
            update_yaxislocation ();
            mark_modified ();
          }
      }
  }

  void set_ycolor (const octave_value& val)
  {
      {
        if (ycolor.set (val, false))
          {
            set_ycolormode ("manual");
            update_ycolor ();
            ycolor.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_ycolormode ("manual");
      }
  }

  void set_ycolormode (const octave_value& val)
  {
      {
        if (ycolormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ydir (const octave_value& val)
  {
      {
        if (ydir.set (val, true))
          {
            update_ydir ();
            mark_modified ();
          }
      }
  }

  void set_ygrid (const octave_value& val)
  {
      {
        if (ygrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ylabel (const octave_value& val);

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            set_ylimmode ("manual");
            update_ylim ();
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_ylimmode ("manual");
      }
  }

  void set_ylimmode (const octave_value& val)
  {
      {
        if (ylimmode.set (val, false))
          {
            update_axis_limits ("ylimmode");
            ylimmode.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yminorgrid (const octave_value& val)
  {
      {
        if (yminorgrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_yminortick (const octave_value& val)
  {
      {
        if (yminortick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_yscale (const octave_value& val)
  {
      {
        if (yscale.set (val, false))
          {
            update_yscale ();
            update_axis_limits ("yscale");
            yscale.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ytick (const octave_value& val)
  {
      {
        if (ytick.set (val, false))
          {
            set_ytickmode ("manual");
            update_ytick ();
            ytick.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_ytickmode ("manual");
      }
  }

  void set_yticklabel (const octave_value& val);

  void set_yticklabelmode (const octave_value& val)
  {
      {
        if (yticklabelmode.set (val, true))
          {
            update_yticklabelmode ();
            mark_modified ();
          }
      }
  }

  void set_yticklabelrotation (const octave_value& val)
  {
      {
        if (yticklabelrotation.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ytickmode (const octave_value& val)
  {
      {
        if (ytickmode.set (val, true))
          {
            update_ytickmode ();
            mark_modified ();
          }
      }
  }

  void set_zcolor (const octave_value& val)
  {
      {
        if (zcolor.set (val, false))
          {
            set_zcolormode ("manual");
            update_zcolor ();
            zcolor.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_zcolormode ("manual");
      }
  }

  void set_zcolormode (const octave_value& val)
  {
      {
        if (zcolormode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zdir (const octave_value& val)
  {
      {
        if (zdir.set (val, true))
          {
            update_zdir ();
            mark_modified ();
          }
      }
  }

  void set_zgrid (const octave_value& val)
  {
      {
        if (zgrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zlabel (const octave_value& val);

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, false))
          {
            set_zlimmode ("manual");
            update_zlim ();
            zlim.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_zlimmode ("manual");
      }
  }

  void set_zlimmode (const octave_value& val)
  {
      {
        if (zlimmode.set (val, false))
          {
            update_axis_limits ("zlimmode");
            zlimmode.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zminorgrid (const octave_value& val)
  {
      {
        if (zminorgrid.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zminortick (const octave_value& val)
  {
      {
        if (zminortick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zscale (const octave_value& val)
  {
      {
        if (zscale.set (val, false))
          {
            update_zscale ();
            update_axis_limits ("zscale");
            zscale.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ztick (const octave_value& val)
  {
      {
        if (ztick.set (val, false))
          {
            set_ztickmode ("manual");
            update_ztick ();
            ztick.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_ztickmode ("manual");
      }
  }

  void set_zticklabel (const octave_value& val);

  void set_zticklabelmode (const octave_value& val)
  {
      {
        if (zticklabelmode.set (val, true))
          {
            update_zticklabelmode ();
            mark_modified ();
          }
      }
  }

  void set_zticklabelrotation (const octave_value& val)
  {
      {
        if (zticklabelrotation.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ztickmode (const octave_value& val)
  {
      {
        if (ztickmode.set (val, true))
          {
            update_ztickmode ();
            mark_modified ();
          }
      }
  }

  void set_mousewheelzoom (const octave_value& val)
  {
      {
        if (mousewheelzoom.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_autopos_tag (const octave_value& val)
  {
      {
        if (autopos_tag.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_looseinset (const octave_value& val)
  {
      {
        if (looseinset.set (val, true))
          {
            update_looseinset ();
            mark_modified ();
          }
      }
  }

  void set_x_viewtransform (const octave_value& val)
  {
      {
        if (x_viewtransform.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_x_projectiontransform (const octave_value& val)
  {
      {
        if (x_projectiontransform.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_x_viewporttransform (const octave_value& val)
  {
      {
        if (x_viewporttransform.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_x_normrendertransform (const octave_value& val)
  {
      {
        if (x_normrendertransform.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_x_rendertransform (const octave_value& val)
  {
      {
        if (x_rendertransform.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xmtick (const octave_value& val)
  {
      {
        if (xmtick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ymtick (const octave_value& val)
  {
      {
        if (ymtick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zmtick (const octave_value& val)
  {
      {
        if (zmtick.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontsize_points (const octave_value& val)
  {
      {
        if (fontsize_points.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void);

  private:

    std::string
    get_scale (const std::string& scale, const Matrix& lims)
    {
      std::string retval = scale;

      if (scale == "log" && lims.numel () > 1 && lims(0) < 0 && lims(1) < 0)
        retval = "neglog";

      return retval;
    }

    void update_xscale (void)
    {
      sx = get_scale (get_xscale (), xlim.get ().matrix_value ());
    }

    void update_yscale (void)
    {
      sy = get_scale (get_yscale (), ylim.get ().matrix_value ());
    }

    void update_zscale (void)
    {
      sz = get_scale (get_zscale (), zlim.get ().matrix_value ());
    }

    void update_label_color (handle_property label, color_property col);
    void update_xcolor (void)
    { update_label_color (xlabel, xcolor); }

    void update_ycolor (void)
    { update_label_color (ylabel, ycolor); }

    void update_zcolor (void)
    { update_label_color (zlabel, zcolor); }

    void update_view (void) { sync_positions (); }
    void update_dataaspectratio (void) { sync_positions (); }
    void update_dataaspectratiomode (void) { sync_positions (); }
    void update_plotboxaspectratio (void) { sync_positions (); }
    void update_plotboxaspectratiomode (void) { sync_positions (); }

    void update_layer (void) { update_axes_layout (); }
    void update_yaxislocation (void)
    {
      // FIXME: Remove warning with "zero" in 4.6
      if (yaxislocation_is ("zero"))
        warning_with_id ("Octave:deprecated-property",
                         "Setting 'yaxislocation' to 'zero' is deprecated, "
                         "set to 'origin' instead.");
      sync_positions ();
      update_axes_layout ();
      update_ylabel_position ();
    }
    void update_xaxislocation (void)
    {
      // FIXME: Remove warning with "zero" in 4.6
      if (xaxislocation_is ("zero"))
        warning_with_id ("Octave:deprecated-property",
                         "Setting 'xaxislocation' to 'zero' is deprecated, "
                         "set to 'origin' instead.");
      sync_positions ();
      update_axes_layout ();
      update_xlabel_position ();
    }

    void update_xdir (void) { update_camera (); update_axes_layout (); }
    void update_ydir (void) { update_camera (); update_axes_layout (); }
    void update_zdir (void) { update_camera (); update_axes_layout (); }

    void update_ticklength (void);
    void update_tickdir (void) { update_ticklength (); }
    void update_tickdirmode (void) { update_ticklength (); }

    void update_xtick (void)
    {
      if (xticklabelmode.is ("auto"))
        calc_ticklabels (xtick, xticklabel, xscale.is ("log"));
      sync_positions ();
    }
    void update_ytick (void)
    {
      if (yticklabelmode.is ("auto"))
        calc_ticklabels (ytick, yticklabel, yscale.is ("log"));
      sync_positions ();
    }
    void update_ztick (void)
    {
      if (zticklabelmode.is ("auto"))
        calc_ticklabels (ztick, zticklabel, zscale.is ("log"));
      sync_positions ();
    }

    void update_xtickmode (void)
    {
      if (xtickmode.is ("auto"))
        {
          calc_ticks_and_lims (xlim, xtick, xmtick, xlimmode.is ("auto"),
                               xscale.is ("log"));
          update_xtick ();
        }
    }
    void update_ytickmode (void)
    {
      if (ytickmode.is ("auto"))
        {
          calc_ticks_and_lims (ylim, ytick, ymtick, ylimmode.is ("auto"),
                               yscale.is ("log"));
          update_ytick ();
        }
    }
    void update_ztickmode (void)
    {
      if (ztickmode.is ("auto"))
        {
          calc_ticks_and_lims (zlim, ztick, zmtick, zlimmode.is ("auto"),
                               zscale.is ("log"));
          update_ztick ();
        }
    }

    void update_xticklabelmode (void)
    {
      if (xticklabelmode.is ("auto"))
        calc_ticklabels (xtick, xticklabel, xscale.is ("log"));
    }
    void update_yticklabelmode (void)
    {
      if (yticklabelmode.is ("auto"))
        calc_ticklabels (ytick, yticklabel, yscale.is ("log"));
    }
    void update_zticklabelmode (void)
    {
      if (zticklabelmode.is ("auto"))
        calc_ticklabels (ztick, zticklabel, zscale.is ("log"));
    }

    void update_font (void);
    void update_fontname (void)
    {
      update_font ();
      sync_positions ();
    }
    void update_fontsize (void)
    {
      update_font ();
      sync_positions ();
    }
    void update_fontangle (void)
    {
      update_font ();
      sync_positions ();
    }
    void update_fontweight (void)
    {
      update_font ();
      sync_positions ();
    }

    void update_outerposition (void)
    {
      set_activepositionproperty ("outerposition");
      caseless_str old_units = get_units ();
      set_units ("normalized");
      Matrix outerbox = outerposition.get ().matrix_value ();
      Matrix innerbox = position.get ().matrix_value ();
      Matrix linset = looseinset.get ().matrix_value ();
      Matrix tinset = tightinset.get ().matrix_value ();
      outerbox(2) = outerbox(2) + outerbox(0);
      outerbox(3) = outerbox(3) + outerbox(1);
      innerbox(0) = outerbox(0) + std::max (linset(0), tinset(0));
      innerbox(1) = outerbox(1) + std::max (linset(1), tinset(1));
      innerbox(2) = outerbox(2) - std::max (linset(2), tinset(2));
      innerbox(3) = outerbox(3) - std::max (linset(3), tinset(3));
      innerbox(2) = innerbox(2) - innerbox(0);
      innerbox(3) = innerbox(3) - innerbox(1);
      position = innerbox;
      set_units (old_units);
      update_transform ();
    }

    void update_position (void)
    {
      set_activepositionproperty ("position");
      caseless_str old_units = get_units ();
      set_units ("normalized");
      Matrix outerbox = outerposition.get ().matrix_value ();
      Matrix innerbox = position.get ().matrix_value ();
      Matrix linset = looseinset.get ().matrix_value ();
      Matrix tinset = tightinset.get ().matrix_value ();
      innerbox(2) = innerbox(2) + innerbox(0);
      innerbox(3) = innerbox(3) + innerbox(1);
      outerbox(0) = innerbox(0) - std::max (linset(0), tinset(0));
      outerbox(1) = innerbox(1) - std::max (linset(1), tinset(1));
      outerbox(2) = innerbox(2) + std::max (linset(2), tinset(2));
      outerbox(3) = innerbox(3) + std::max (linset(3), tinset(3));
      outerbox(2) = outerbox(2) - outerbox(0);
      outerbox(3) = outerbox(3) - outerbox(1);
      outerposition = outerbox;
      set_units (old_units);
      update_transform ();
    }

    void update_looseinset (void)
    {
      caseless_str old_units = get_units ();
      set_units ("normalized");
      Matrix innerbox = position.get ().matrix_value ();
      innerbox(2) = innerbox(2) + innerbox(0);
      innerbox(3) = innerbox(3) + innerbox(1);
      Matrix outerbox = outerposition.get ().matrix_value ();
      outerbox(2) = outerbox(2) + outerbox(0);
      outerbox(3) = outerbox(3) + outerbox(1);
      Matrix linset = looseinset.get ().matrix_value ();
      Matrix tinset = tightinset.get ().matrix_value ();
      if (activepositionproperty.is ("position"))
        {
          outerbox(0) = innerbox(0) - std::max (linset(0), tinset(0));
          outerbox(1) = innerbox(1) - std::max (linset(1), tinset(1));
          outerbox(2) = innerbox(2) + std::max (linset(2), tinset(2));
          outerbox(3) = innerbox(3) + std::max (linset(3), tinset(3));
          outerbox(2) = outerbox(2) - outerbox(0);
          outerbox(3) = outerbox(3) - outerbox(1);
          outerposition = outerbox;
        }
      else
        {
          innerbox(0) = outerbox(0) + std::max (linset(0), tinset(0));
          innerbox(1) = outerbox(1) + std::max (linset(1), tinset(1));
          innerbox(2) = outerbox(2) - std::max (linset(2), tinset(2));
          innerbox(3) = outerbox(3) - std::max (linset(3), tinset(3));
          innerbox(2) = innerbox(2) - innerbox(0);
          innerbox(3) = innerbox(3) - innerbox(1);
          position = innerbox;
        }
      set_units (old_units);
      update_transform ();
    }

    double calc_tick_sep (double minval, double maxval);
    void calc_ticks_and_lims (array_property& lims, array_property& ticks,
                              array_property& mticks,
                              bool limmode_is_auto, bool is_logscale);
    void calc_ticklabels (const array_property& ticks, any_property& labels,
                          bool is_logscale);
    Matrix get_ticklabel_extents (const Matrix& ticks,
                                  const string_vector& ticklabels,
                                  const Matrix& limits);

    void fix_limits (array_property& lims)
    {
      if (lims.get ().is_empty ())
        return;

      Matrix l = lims.get ().matrix_value ();
      if (l(0) > l(1))
        {
          l(0) = 0;
          l(1) = 1;
          lims = l;
        }
      else if (l(0) == l(1))
        {
          l(0) -= 0.5;
          l(1) += 0.5;
          lims = l;
        }
    }

    Matrix calc_tightbox (const Matrix& init_pos);

  public:
    Matrix get_axis_limits (double xmin, double xmax,
                            double min_pos, double max_neg,
                            bool logscale);

    void update_xlim ()
    {
      if (xtickmode.is ("auto"))
        calc_ticks_and_lims (xlim, xtick, xmtick, xlimmode.is ("auto"),
                             xscale.is ("log"));
      if (xticklabelmode.is ("auto"))
        calc_ticklabels (xtick, xticklabel, xscale.is ("log"));

      fix_limits (xlim);

      update_xscale ();

      update_axes_layout ();
    }

    void update_ylim (void)
    {
      if (ytickmode.is ("auto"))
        calc_ticks_and_lims (ylim, ytick, ymtick, ylimmode.is ("auto"),
                             yscale.is ("log"));
      if (yticklabelmode.is ("auto"))
        calc_ticklabels (ytick, yticklabel, yscale.is ("log"));

      fix_limits (ylim);

      update_yscale ();

      update_axes_layout ();
    }

    void update_zlim (void)
    {
      if (ztickmode.is ("auto"))
        calc_ticks_and_lims (zlim, ztick, zmtick, zlimmode.is ("auto"),
                             zscale.is ("log"));
      if (zticklabelmode.is ("auto"))
        calc_ticklabels (ztick, zticklabel, zscale.is ("log"));

      fix_limits (zlim);

      update_zscale ();

      update_axes_layout ();
    }

  };

private:
  properties xproperties;

public:
  axes (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p), default_properties ()
  {
    xproperties.update_transform ();
  }

  ~axes (void) { }

  void override_defaults (base_graphics_object& obj)
  {
    // Allow parent (figure) to override first (properties knows how
    // to find the parent object).
    xproperties.override_defaults (obj);

    // Now override with our defaults.  If the default_properties
    // list includes the properties for all defaults (line,
    // surface, etc.) then we don't have to know the type of OBJ
    // here, we just call its set function and let it decide which
    // properties from the list to use.
    obj.set_from_list (default_properties);
  }

  void set (const caseless_str& name, const octave_value& value)
  {
    if (name.compare ("default", 7))
      // strip "default", pass rest to function that will
      // parse the remainder and add the element to the
      // default_properties map.
      default_properties.set (name.substr (7), value);
    else
      xproperties.set (name, value);
  }

  void set_defaults (const std::string& mode)
  {
    xproperties.set_defaults (*this, mode);
  }

  octave_value get (const caseless_str& name) const
  {
    octave_value retval;

    // FIXME: finish this.
    if (name.compare ("default", 7))
      retval = get_default (name.substr (7));
    else
      retval = xproperties.get (name);

    return retval;
  }

  octave_value get_default (const caseless_str& name) const;

  octave_value get_defaults (void) const
  {
    return default_properties.as_struct ("default");
  }

  property_list get_defaults_list (void) const
  {
    return default_properties;
  }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  void update_axis_limits (const std::string& axis_type);

  void update_axis_limits (const std::string& axis_type,
                           const graphics_handle& h);

  bool valid_object (void) const { return true; }

  void reset_default_properties (void);

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

protected:
  void initialize (const graphics_object& go);

private:
  property_list default_properties;
};

// ---------------------------------------------------------------------

class OCTINTERP_API line : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  color_property color;
  string_property displayname;
  radio_property erasemode;
  radio_property interpreter;
  radio_property linestyle;
  double_property linewidth;
  radio_property marker;
  color_property markeredgecolor;
  color_property markerfacecolor;
  double_property markersize;
  row_vector_property xdata;
  string_property xdatasource;
  row_vector_property ydata;
  string_property ydatasource;
  row_vector_property zdata;
  string_property zdatasource;
  row_vector_property xlim;
  row_vector_property ylim;
  row_vector_property zlim;
  bool_property xliminclude;
  bool_property yliminclude;
  bool_property zliminclude;

public:

  enum
  {
    ID_COLOR = 4000,
    ID_DISPLAYNAME = 4001,
    ID_ERASEMODE = 4002,
    ID_INTERPRETER = 4003,
    ID_LINESTYLE = 4004,
    ID_LINEWIDTH = 4005,
    ID_MARKER = 4006,
    ID_MARKEREDGECOLOR = 4007,
    ID_MARKERFACECOLOR = 4008,
    ID_MARKERSIZE = 4009,
    ID_XDATA = 4010,
    ID_XDATASOURCE = 4011,
    ID_YDATA = 4012,
    ID_YDATASOURCE = 4013,
    ID_ZDATA = 4014,
    ID_ZDATASOURCE = 4015,
    ID_XLIM = 4016,
    ID_YLIM = 4017,
    ID_ZLIM = 4018,
    ID_XLIMINCLUDE = 4019,
    ID_YLIMINCLUDE = 4020,
    ID_ZLIMINCLUDE = 4021
  };

  bool color_is_rgb (void) const { return color.is_rgb (); }
  bool color_is (const std::string& v) const { return color.is (v); }
  Matrix get_color_rgb (void) const { return (color.is_rgb () ? color.rgb () : Matrix ()); }
  octave_value get_color (void) const { return color.get (); }

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  bool interpreter_is (const std::string& v) const { return interpreter.is (v); }
  std::string get_interpreter (void) const { return interpreter.current_value (); }

  bool linestyle_is (const std::string& v) const { return linestyle.is (v); }
  std::string get_linestyle (void) const { return linestyle.current_value (); }

  double get_linewidth (void) const { return linewidth.double_value (); }

  bool marker_is (const std::string& v) const { return marker.is (v); }
  std::string get_marker (void) const { return marker.current_value (); }

  bool markeredgecolor_is_rgb (void) const { return markeredgecolor.is_rgb (); }
  bool markeredgecolor_is (const std::string& v) const { return markeredgecolor.is (v); }
  Matrix get_markeredgecolor_rgb (void) const { return (markeredgecolor.is_rgb () ? markeredgecolor.rgb () : Matrix ()); }
  octave_value get_markeredgecolor (void) const { return markeredgecolor.get (); }

  bool markerfacecolor_is_rgb (void) const { return markerfacecolor.is_rgb (); }
  bool markerfacecolor_is (const std::string& v) const { return markerfacecolor.is (v); }
  Matrix get_markerfacecolor_rgb (void) const { return (markerfacecolor.is_rgb () ? markerfacecolor.rgb () : Matrix ()); }
  octave_value get_markerfacecolor (void) const { return markerfacecolor.get (); }

  double get_markersize (void) const { return markersize.double_value (); }

  octave_value get_xdata (void) const { return xdata.get (); }

  std::string get_xdatasource (void) const { return xdatasource.string_value (); }

  octave_value get_ydata (void) const { return ydata.get (); }

  std::string get_ydatasource (void) const { return ydatasource.string_value (); }

  octave_value get_zdata (void) const { return zdata.get (); }

  std::string get_zdatasource (void) const { return zdatasource.string_value (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool is_zliminclude (void) const { return zliminclude.is_on (); }
  std::string get_zliminclude (void) const { return zliminclude.current_value (); }


  void set_color (const octave_value& val)
  {
      {
        if (color.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_interpreter (const octave_value& val)
  {
      {
        if (interpreter.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linestyle (const octave_value& val)
  {
      {
        if (linestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linewidth (const octave_value& val)
  {
      {
        if (linewidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_marker (const octave_value& val)
  {
      {
        if (marker.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markeredgecolor (const octave_value& val)
  {
      {
        if (markeredgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markerfacecolor (const octave_value& val)
  {
      {
        if (markerfacecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markersize (const octave_value& val)
  {
      {
        if (markersize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xdata (const octave_value& val)
  {
      {
        if (xdata.set (val, true))
          {
            update_xdata ();
            mark_modified ();
          }
      }
  }

  void set_xdatasource (const octave_value& val)
  {
      {
        if (xdatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ydata (const octave_value& val)
  {
      {
        if (ydata.set (val, true))
          {
            update_ydata ();
            mark_modified ();
          }
      }
  }

  void set_ydatasource (const octave_value& val)
  {
      {
        if (ydatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zdata (const octave_value& val)
  {
      {
        if (zdata.set (val, true))
          {
            update_zdata ();
            mark_modified ();
          }
      }
  }

  void set_zdatasource (const octave_value& val)
  {
      {
        if (zdatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            update_axis_limits ("xlim");
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            update_axis_limits ("ylim");
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, false))
          {
            update_axis_limits ("zlim");
            zlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, false))
          {
            update_axis_limits ("xliminclude");
            xliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, false))
          {
            update_axis_limits ("yliminclude");
            yliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zliminclude (const octave_value& val)
  {
      {
        if (zliminclude.set (val, false))
          {
            update_axis_limits ("zliminclude");
            zliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }


  private:
    Matrix compute_xlim (void) const;
    Matrix compute_ylim (void) const;

    void update_xdata (void) { set_xlim (compute_xlim ()); }

    void update_ydata (void) { set_ylim (compute_ylim ()); }

    void update_zdata (void)
    {
      set_zlim (zdata.get_limits ());
      set_zliminclude (get_zdata ().numel () > 0);
    }
  };

private:
  properties xproperties;

public:
  line (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~line (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API text : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    double get_fontsize_points (double box_pix_height = 0) const;

    void set_position (const octave_value& val)
    {
      octave_value new_val (val);

      if (new_val.numel () == 2)
        {
          dim_vector dv (1, 3);

          new_val = new_val.resize (dv, true);
        }

      if (position.set (new_val, false))
        {
          set_positionmode ("manual");
          update_position ();
          position.run_listeners (POSTSET);
          mark_modified ();
        }
      else
        set_positionmode ("manual");
    }

    // See the genprops.awk script for an explanation of the
    // properties declarations.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  color_property backgroundcolor;
  color_property color;
  string_property displayname;
  color_property edgecolor;
  bool_property editing;
  radio_property erasemode;
  array_property extent;
  radio_property fontangle;
  string_property fontname;
  double_property fontsize;
  radio_property fontunits;
  radio_property fontweight;
  radio_property horizontalalignment;
  radio_property interpreter;
  radio_property linestyle;
  double_property linewidth;
  double_property margin;
  array_property position;
  double_property rotation;
  text_label_property string;
  radio_property units;
  radio_property verticalalignment;
  row_vector_property xlim;
  row_vector_property ylim;
  row_vector_property zlim;
  bool_property xliminclude;
  bool_property yliminclude;
  bool_property zliminclude;
  radio_property positionmode;
  radio_property rotationmode;
  radio_property horizontalalignmentmode;
  radio_property verticalalignmentmode;
  radio_property autopos_tag;
  double_property fontsize_points;

public:

  enum
  {
    ID_BACKGROUNDCOLOR = 5000,
    ID_COLOR = 5001,
    ID_DISPLAYNAME = 5002,
    ID_EDGECOLOR = 5003,
    ID_EDITING = 5004,
    ID_ERASEMODE = 5005,
    ID_EXTENT = 5006,
    ID_FONTANGLE = 5007,
    ID_FONTNAME = 5008,
    ID_FONTSIZE = 5009,
    ID_FONTUNITS = 5010,
    ID_FONTWEIGHT = 5011,
    ID_HORIZONTALALIGNMENT = 5012,
    ID_INTERPRETER = 5013,
    ID_LINESTYLE = 5014,
    ID_LINEWIDTH = 5015,
    ID_MARGIN = 5016,
    ID_POSITION = 5017,
    ID_ROTATION = 5018,
    ID_STRING = 5019,
    ID_UNITS = 5020,
    ID_VERTICALALIGNMENT = 5021,
    ID_XLIM = 5022,
    ID_YLIM = 5023,
    ID_ZLIM = 5024,
    ID_XLIMINCLUDE = 5025,
    ID_YLIMINCLUDE = 5026,
    ID_ZLIMINCLUDE = 5027,
    ID_POSITIONMODE = 5028,
    ID_ROTATIONMODE = 5029,
    ID_HORIZONTALALIGNMENTMODE = 5030,
    ID_VERTICALALIGNMENTMODE = 5031,
    ID_AUTOPOS_TAG = 5032,
    ID_FONTSIZE_POINTS = 5033
  };

  bool backgroundcolor_is_rgb (void) const { return backgroundcolor.is_rgb (); }
  bool backgroundcolor_is (const std::string& v) const { return backgroundcolor.is (v); }
  Matrix get_backgroundcolor_rgb (void) const { return (backgroundcolor.is_rgb () ? backgroundcolor.rgb () : Matrix ()); }
  octave_value get_backgroundcolor (void) const { return backgroundcolor.get (); }

  bool color_is_rgb (void) const { return color.is_rgb (); }
  bool color_is (const std::string& v) const { return color.is (v); }
  Matrix get_color_rgb (void) const { return (color.is_rgb () ? color.rgb () : Matrix ()); }
  octave_value get_color (void) const { return color.get (); }

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool edgecolor_is_rgb (void) const { return edgecolor.is_rgb (); }
  bool edgecolor_is (const std::string& v) const { return edgecolor.is (v); }
  Matrix get_edgecolor_rgb (void) const { return (edgecolor.is_rgb () ? edgecolor.rgb () : Matrix ()); }
  octave_value get_edgecolor (void) const { return edgecolor.get (); }

  bool is_editing (void) const { return editing.is_on (); }
  std::string get_editing (void) const { return editing.current_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  octave_value get_extent (void) const;

  bool fontangle_is (const std::string& v) const { return fontangle.is (v); }
  std::string get_fontangle (void) const { return fontangle.current_value (); }

  std::string get_fontname (void) const { return fontname.string_value (); }

  double get_fontsize (void) const { return fontsize.double_value (); }

  bool fontunits_is (const std::string& v) const { return fontunits.is (v); }
  std::string get_fontunits (void) const { return fontunits.current_value (); }

  bool fontweight_is (const std::string& v) const { return fontweight.is (v); }
  std::string get_fontweight (void) const { return fontweight.current_value (); }

  bool horizontalalignment_is (const std::string& v) const { return horizontalalignment.is (v); }
  std::string get_horizontalalignment (void) const { return horizontalalignment.current_value (); }

  bool interpreter_is (const std::string& v) const { return interpreter.is (v); }
  std::string get_interpreter (void) const { return interpreter.current_value (); }

  bool linestyle_is (const std::string& v) const { return linestyle.is (v); }
  std::string get_linestyle (void) const { return linestyle.current_value (); }

  double get_linewidth (void) const { return linewidth.double_value (); }

  double get_margin (void) const { return margin.double_value (); }

  octave_value get_position (void) const { return position.get (); }

  double get_rotation (void) const { return rotation.double_value (); }

  octave_value get_string (void) const { return string.get (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }

  bool verticalalignment_is (const std::string& v) const { return verticalalignment.is (v); }
  std::string get_verticalalignment (void) const { return verticalalignment.current_value (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool is_zliminclude (void) const { return zliminclude.is_on (); }
  std::string get_zliminclude (void) const { return zliminclude.current_value (); }

  bool positionmode_is (const std::string& v) const { return positionmode.is (v); }
  std::string get_positionmode (void) const { return positionmode.current_value (); }

  bool rotationmode_is (const std::string& v) const { return rotationmode.is (v); }
  std::string get_rotationmode (void) const { return rotationmode.current_value (); }

  bool horizontalalignmentmode_is (const std::string& v) const { return horizontalalignmentmode.is (v); }
  std::string get_horizontalalignmentmode (void) const { return horizontalalignmentmode.current_value (); }

  bool verticalalignmentmode_is (const std::string& v) const { return verticalalignmentmode.is (v); }
  std::string get_verticalalignmentmode (void) const { return verticalalignmentmode.current_value (); }

  bool autopos_tag_is (const std::string& v) const { return autopos_tag.is (v); }
  std::string get_autopos_tag (void) const { return autopos_tag.current_value (); }


  void set_backgroundcolor (const octave_value& val)
  {
      {
        if (backgroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_color (const octave_value& val)
  {
      {
        if (color.set (val, true))
          {
            update_color ();
            mark_modified ();
          }
      }
  }

  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgecolor (const octave_value& val)
  {
      {
        if (edgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_editing (const octave_value& val)
  {
      {
        if (editing.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_extent (const octave_value& val)
  {
      {
        if (extent.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontangle (const octave_value& val)
  {
      {
        if (fontangle.set (val, true))
          {
            update_fontangle ();
            mark_modified ();
          }
      }
  }

  void set_fontname (const octave_value& val)
  {
      {
        if (fontname.set (val, true))
          {
            update_fontname ();
            mark_modified ();
          }
      }
  }

  void set_fontsize (const octave_value& val)
  {
      {
        if (fontsize.set (val, true))
          {
            update_fontsize ();
            mark_modified ();
          }
      }
  }

  void set_fontunits (const octave_value& val);

  void update_fontunits (void);

  void set_fontweight (const octave_value& val)
  {
      {
        if (fontweight.set (val, true))
          {
            update_fontweight ();
            mark_modified ();
          }
      }
  }

  void set_horizontalalignment (const octave_value& val)
  {
      {
        if (horizontalalignment.set (val, false))
          {
            set_horizontalalignmentmode ("manual");
            update_horizontalalignment ();
            horizontalalignment.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_horizontalalignmentmode ("manual");
      }
  }

  void set_interpreter (const octave_value& val)
  {
      {
        if (interpreter.set (val, true))
          {
            update_interpreter ();
            mark_modified ();
          }
      }
  }

  void set_linestyle (const octave_value& val)
  {
      {
        if (linestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linewidth (const octave_value& val)
  {
      {
        if (linewidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_margin (const octave_value& val)
  {
      {
        if (margin.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_rotation (const octave_value& val)
  {
      {
        if (rotation.set (val, false))
          {
            set_rotationmode ("manual");
            update_rotation ();
            rotation.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_rotationmode ("manual");
      }
  }

  void set_string (const octave_value& val)
  {
      {
        if (string.set (val, true))
          {
            update_string ();
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val)
  {
      {
        if (units.set (val, true))
          {
            update_units ();
            mark_modified ();
          }
      }
  }

  void set_verticalalignment (const octave_value& val)
  {
      {
        if (verticalalignment.set (val, false))
          {
            set_verticalalignmentmode ("manual");
            update_verticalalignment ();
            verticalalignment.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_verticalalignmentmode ("manual");
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            update_axis_limits ("xlim");
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            update_axis_limits ("ylim");
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, false))
          {
            update_axis_limits ("zlim");
            zlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, false))
          {
            update_axis_limits ("xliminclude");
            xliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, false))
          {
            update_axis_limits ("yliminclude");
            yliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zliminclude (const octave_value& val)
  {
      {
        if (zliminclude.set (val, false))
          {
            update_axis_limits ("zliminclude");
            zliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_positionmode (const octave_value& val)
  {
      {
        if (positionmode.set (val, true))
          {
            update_positionmode ();
            mark_modified ();
          }
      }
  }

  void set_rotationmode (const octave_value& val)
  {
      {
        if (rotationmode.set (val, true))
          {
            update_rotationmode ();
            mark_modified ();
          }
      }
  }

  void set_horizontalalignmentmode (const octave_value& val)
  {
      {
        if (horizontalalignmentmode.set (val, true))
          {
            update_horizontalalignmentmode ();
            mark_modified ();
          }
      }
  }

  void set_verticalalignmentmode (const octave_value& val)
  {
      {
        if (verticalalignmentmode.set (val, true))
          {
            update_verticalalignmentmode ();
            mark_modified ();
          }
      }
  }

  void set_autopos_tag (const octave_value& val)
  {
      {
        if (autopos_tag.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontsize_points (const octave_value& val)
  {
      {
        if (fontsize_points.set (val, true))
          {
            mark_modified ();
          }
      }
  }


    Matrix get_data_position (void) const;
    Matrix get_extent_matrix (void) const;
    const uint8NDArray& get_pixels (void) const { return pixels; }

    // Text renderer, used for calculation of text size
    octave::text_renderer txt_renderer;

  protected:
    void init (void)
    {
      position.add_constraint (dim_vector (1, 3));
      cached_units = get_units ();
      update_font ();
    }

  private:
    void update_position (void)
    {
      Matrix pos = get_data_position ();
      Matrix lim;

      lim = Matrix (1, 3, pos(0));
      lim(2) = (lim(2) <= 0 ? octave::numeric_limits<double>::Inf () : lim(2));
      set_xlim (lim);

      lim = Matrix (1, 3, pos(1));
      lim(2) = (lim(2) <= 0 ? octave::numeric_limits<double>::Inf () : lim(2));
      set_ylim (lim);

      if (pos.numel () == 3)
        {
          lim = Matrix (1, 3, pos(2));
          lim(2) = (lim(2) <= 0 ? octave::numeric_limits<double>::Inf () : lim(2));
          set_zliminclude ("on");
          set_zlim (lim);
        }
      else
        set_zliminclude ("off");
    }

    void update_text_extent (void);

    void request_autopos (void);
    void update_positionmode (void) { request_autopos (); }
    void update_rotationmode (void) { request_autopos (); }
    void update_horizontalalignmentmode (void) { request_autopos (); }
    void update_verticalalignmentmode (void) { request_autopos (); }

    void update_font (void);
    void update_string (void) { request_autopos (); update_text_extent (); }
    void update_rotation (void) { update_text_extent (); }
    void update_color (void) { update_font (); update_text_extent (); }
    void update_fontname (void) { update_font (); update_text_extent (); }
    void update_fontsize (void) { update_font (); update_text_extent (); }
    void update_fontangle (void) { update_font (); update_text_extent (); }
    void update_fontweight (void) { update_font (); update_text_extent (); }
    void update_interpreter (void) { update_text_extent (); }
    void update_horizontalalignment (void) { update_text_extent (); }
    void update_verticalalignment (void) { update_text_extent (); }

    void update_units (void);
    void update_fontunits (const caseless_str& old_fontunits);

  private:
    std::string cached_units;
    uint8NDArray pixels;
  };

private:
  properties xproperties;

public:
  text (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  {
    xproperties.set_clipping ("off");
  }

  ~text (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API image : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    bool is_aliminclude (void) const
    { return (aliminclude.is_on () && alphadatamapping.is ("scaled")); }
    std::string get_aliminclude (void) const
    { return aliminclude.current_value (); }

    bool is_climinclude (void) const
    { return (climinclude.is_on () && cdatamapping.is ("scaled")); }
    std::string get_climinclude (void) const
    { return climinclude.current_value (); }

    octave_value get_color_data (void) const;

    void initialize_data (void) { update_cdata (); }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  array_property alphadata;
  radio_property alphadatamapping;
  array_property cdata;
  radio_property cdatamapping;
  string_property displayname;
  radio_property erasemode;
  row_vector_property xdata;
  row_vector_property ydata;
  row_vector_property alim;
  row_vector_property clim;
  row_vector_property xlim;
  row_vector_property ylim;
  bool_property aliminclude;
  bool_property climinclude;
  bool_property xliminclude;
  bool_property yliminclude;
  radio_property xdatamode;
  radio_property ydatamode;

public:

  enum
  {
    ID_ALPHADATA = 6000,
    ID_ALPHADATAMAPPING = 6001,
    ID_CDATA = 6002,
    ID_CDATAMAPPING = 6003,
    ID_DISPLAYNAME = 6004,
    ID_ERASEMODE = 6005,
    ID_XDATA = 6006,
    ID_YDATA = 6007,
    ID_ALIM = 6008,
    ID_CLIM = 6009,
    ID_XLIM = 6010,
    ID_YLIM = 6011,
    ID_ALIMINCLUDE = 6012,
    ID_CLIMINCLUDE = 6013,
    ID_XLIMINCLUDE = 6014,
    ID_YLIMINCLUDE = 6015,
    ID_XDATAMODE = 6016,
    ID_YDATAMODE = 6017
  };

  octave_value get_alphadata (void) const { return alphadata.get (); }

  bool alphadatamapping_is (const std::string& v) const { return alphadatamapping.is (v); }
  std::string get_alphadatamapping (void) const { return alphadatamapping.current_value (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  bool cdatamapping_is (const std::string& v) const { return cdatamapping.is (v); }
  std::string get_cdatamapping (void) const { return cdatamapping.current_value (); }

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  octave_value get_xdata (void) const { return xdata.get (); }

  octave_value get_ydata (void) const { return ydata.get (); }

  octave_value get_alim (void) const { return alim.get (); }

  octave_value get_clim (void) const { return clim.get (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool xdatamode_is (const std::string& v) const { return xdatamode.is (v); }
  std::string get_xdatamode (void) const { return xdatamode.current_value (); }

  bool ydatamode_is (const std::string& v) const { return ydatamode.is (v); }
  std::string get_ydatamode (void) const { return ydatamode.current_value (); }


  void set_alphadata (const octave_value& val)
  {
      {
        if (alphadata.set (val, true))
          {
            update_alphadata ();
            mark_modified ();
          }
      }
  }

  void set_alphadatamapping (const octave_value& val)
  {
      {
        if (alphadatamapping.set (val, false))
          {
            update_axis_limits ("alphadatamapping");
            alphadatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            update_cdata ();
            mark_modified ();
          }
      }
  }

  void set_cdatamapping (const octave_value& val)
  {
      {
        if (cdatamapping.set (val, false))
          {
            update_axis_limits ("cdatamapping");
            cdatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xdata (const octave_value& val)
  {
      {
        if (xdata.set (val, false))
          {
            set_xdatamode ("manual");
            update_xdata ();
            xdata.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_xdatamode ("manual");
      }
  }

  void set_ydata (const octave_value& val)
  {
      {
        if (ydata.set (val, false))
          {
            set_ydatamode ("manual");
            update_ydata ();
            ydata.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_ydatamode ("manual");
      }
  }

  void set_alim (const octave_value& val)
  {
      {
        if (alim.set (val, false))
          {
            update_axis_limits ("alim");
            alim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_clim (const octave_value& val)
  {
      {
        if (clim.set (val, false))
          {
            update_axis_limits ("clim");
            clim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            update_axis_limits ("xlim");
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            update_axis_limits ("ylim");
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_aliminclude (const octave_value& val)
  {
      {
        if (aliminclude.set (val, false))
          {
            update_axis_limits ("aliminclude");
            aliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_climinclude (const octave_value& val)
  {
      {
        if (climinclude.set (val, false))
          {
            update_axis_limits ("climinclude");
            climinclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, false))
          {
            update_axis_limits ("xliminclude");
            xliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, false))
          {
            update_axis_limits ("yliminclude");
            yliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xdatamode (const octave_value& val)
  {
      {
        if (xdatamode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ydatamode (const octave_value& val)
  {
      {
        if (ydatamode.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      xdata.add_constraint (2);
      xdata.add_constraint (dim_vector (0, 0));
      ydata.add_constraint (2);
      ydata.add_constraint (dim_vector (0, 0));
      cdata.add_constraint ("double");
      cdata.add_constraint ("single");
      cdata.add_constraint ("logical");
      cdata.add_constraint ("uint8");
      cdata.add_constraint ("uint16");
      cdata.add_constraint ("int16");
      cdata.add_constraint ("real");
      cdata.add_constraint (dim_vector (-1, -1));
      cdata.add_constraint (dim_vector (-1, -1, 3));
      alphadata.add_constraint (dim_vector (-1, -1));
      alphadata.add_constraint ("double");
      alphadata.add_constraint ("uint8");
    }

  private:
    void update_alphadata (void)
    {
      if (alphadatamapping_is ("scaled"))
        set_alim (alphadata.get_limits ());
      else
        alim = alphadata.get_limits ();
    }

    void update_cdata (void)
    {
      if (cdatamapping_is ("scaled"))
        set_clim (cdata.get_limits ());
      else
        clim = cdata.get_limits ();

      if (xdatamode.is ("auto"))
        update_xdata ();

      if (ydatamode.is ("auto"))
        update_ydata ();
    }

    void update_xdata (void)
    {
      if (xdata.get ().is_empty ())
        set_xdatamode ("auto");

      if (xdatamode.is ("auto"))
        {
          set_xdata (get_auto_xdata ());
          set_xdatamode ("auto");
        }

      Matrix limits = xdata.get_limits ();
      float dp = pixel_xsize ();

      limits(0) = limits(0) - dp;
      limits(1) = limits(1) + dp;
      set_xlim (limits);
    }

    void update_ydata (void)
    {
      if (ydata.get ().is_empty ())
        set_ydatamode ("auto");

      if (ydatamode.is ("auto"))
        {
          set_ydata (get_auto_ydata ());
          set_ydatamode ("auto");
        }

      Matrix limits = ydata.get_limits ();
      float dp = pixel_ysize ();

      limits(0) = limits(0) - dp;
      limits(1) = limits(1) + dp;
      set_ylim (limits);
    }

    Matrix get_auto_xdata (void)
    {
      dim_vector dv = get_cdata ().dims ();
      Matrix data;
      if (dv(1) > 0.)
        {
          data = Matrix (1, 2, 1);
          data(1) = dv(1);
        }
      return data;
    }

    Matrix get_auto_ydata (void)
    {
      dim_vector dv = get_cdata ().dims ();
      Matrix data;
      if (dv(0) > 0.)
        {
          data = Matrix (1, 2, 1);
          data(1) = dv(0);
        }
      return data;
    }

    float pixel_size (octave_idx_type dim, const Matrix limits)
    {
      octave_idx_type l = dim - 1;
      float dp;

      if (l > 0 && limits(0) != limits(1))
        dp = (limits(1) - limits(0))/(2*l);
      else
        {
          if (limits(1) == limits(2))
            dp = 0.5;
          else
            dp = (limits(1) - limits(0))/2;
        }
      return dp;
    }

  public:
    float pixel_xsize (void)
    {
      return pixel_size ((get_cdata ().dims ())(1), xdata.get_limits ());
    }

    float pixel_ysize (void)
    {
      return pixel_size ((get_cdata ().dims ())(0), ydata.get_limits ());
    }
  };

private:
  properties xproperties;

public:
  image (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  {
    xproperties.initialize_data ();
  }

  ~image (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API light : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  color_property color;
  array_property position;
  radio_property style;

public:

  enum
  {
    ID_COLOR = 7000,
    ID_POSITION = 7001,
    ID_STYLE = 7002
  };

  bool color_is_rgb (void) const { return color.is_rgb (); }
  bool color_is (const std::string& v) const { return color.is (v); }
  Matrix get_color_rgb (void) const { return (color.is_rgb () ? color.rgb () : Matrix ()); }
  octave_value get_color (void) const { return color.get (); }

  octave_value get_position (void) const { return position.get (); }

  bool style_is (const std::string& v) const { return style.is (v); }
  std::string get_style (void) const { return style.current_value (); }


  void set_color (const octave_value& val)
  {
      {
        if (color.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_style (const octave_value& val)
  {
      {
        if (style.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      position.add_constraint (dim_vector (1, 3));
    }
  };

private:
  properties xproperties;

public:
  light (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~light (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API patch : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    octave_value get_color_data (void) const;

    // Matlab allows incoherent data to be stored into patch properties.
    // The patch should then be ignored by the renderer.
    bool has_bad_data (std::string &msg) const
    {
      msg = bad_data_msg;
      return ! msg.empty ();
    }

    bool is_aliminclude (void) const
    { return (aliminclude.is_on () && alphadatamapping.is ("scaled")); }
    std::string get_aliminclude (void) const
    { return aliminclude.current_value (); }

    bool is_climinclude (void) const
    { return (climinclude.is_on () && cdatamapping.is ("scaled")); }
    std::string get_climinclude (void) const
    { return climinclude.current_value (); }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  radio_property alphadatamapping;
  double_property ambientstrength;
  radio_property backfacelighting;
  array_property cdata;
  radio_property cdatamapping;
  double_property diffusestrength;
  string_property displayname;
  double_radio_property edgealpha;
  color_property edgecolor;
  radio_property edgelighting;
  radio_property erasemode;
  double_radio_property facealpha;
  color_property facecolor;
  radio_property facelighting;
  array_property facenormals;
  radio_property facenormalsmode;
  array_property faces;
  array_property facevertexalphadata;
  array_property facevertexcdata;
  radio_property interpreter;
  radio_property linestyle;
  double_property linewidth;
  radio_property marker;
  color_property markeredgecolor;
  color_property markerfacecolor;
  double_property markersize;
  radio_property normalmode;
  double_property specularcolorreflectance;
  double_property specularexponent;
  double_property specularstrength;
  array_property vertexnormals;
  radio_property vertexnormalsmode;
  array_property vertices;
  array_property xdata;
  array_property ydata;
  array_property zdata;
  row_vector_property alim;
  row_vector_property clim;
  row_vector_property xlim;
  row_vector_property ylim;
  row_vector_property zlim;
  bool_property aliminclude;
  bool_property climinclude;
  bool_property xliminclude;
  bool_property yliminclude;
  bool_property zliminclude;

public:

  enum
  {
    ID_ALPHADATAMAPPING = 8000,
    ID_AMBIENTSTRENGTH = 8001,
    ID_BACKFACELIGHTING = 8002,
    ID_CDATA = 8003,
    ID_CDATAMAPPING = 8004,
    ID_DIFFUSESTRENGTH = 8005,
    ID_DISPLAYNAME = 8006,
    ID_EDGEALPHA = 8007,
    ID_EDGECOLOR = 8008,
    ID_EDGELIGHTING = 8009,
    ID_ERASEMODE = 8010,
    ID_FACEALPHA = 8011,
    ID_FACECOLOR = 8012,
    ID_FACELIGHTING = 8013,
    ID_FACENORMALS = 8014,
    ID_FACENORMALSMODE = 8015,
    ID_FACES = 8016,
    ID_FACEVERTEXALPHADATA = 8017,
    ID_FACEVERTEXCDATA = 8018,
    ID_INTERPRETER = 8019,
    ID_LINESTYLE = 8020,
    ID_LINEWIDTH = 8021,
    ID_MARKER = 8022,
    ID_MARKEREDGECOLOR = 8023,
    ID_MARKERFACECOLOR = 8024,
    ID_MARKERSIZE = 8025,
    ID_NORMALMODE = 8026,
    ID_SPECULARCOLORREFLECTANCE = 8027,
    ID_SPECULAREXPONENT = 8028,
    ID_SPECULARSTRENGTH = 8029,
    ID_VERTEXNORMALS = 8030,
    ID_VERTEXNORMALSMODE = 8031,
    ID_VERTICES = 8032,
    ID_XDATA = 8033,
    ID_YDATA = 8034,
    ID_ZDATA = 8035,
    ID_ALIM = 8036,
    ID_CLIM = 8037,
    ID_XLIM = 8038,
    ID_YLIM = 8039,
    ID_ZLIM = 8040,
    ID_ALIMINCLUDE = 8041,
    ID_CLIMINCLUDE = 8042,
    ID_XLIMINCLUDE = 8043,
    ID_YLIMINCLUDE = 8044,
    ID_ZLIMINCLUDE = 8045
  };

  bool alphadatamapping_is (const std::string& v) const { return alphadatamapping.is (v); }
  std::string get_alphadatamapping (void) const { return alphadatamapping.current_value (); }

  double get_ambientstrength (void) const { return ambientstrength.double_value (); }

  bool backfacelighting_is (const std::string& v) const { return backfacelighting.is (v); }
  std::string get_backfacelighting (void) const { return backfacelighting.current_value (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  bool cdatamapping_is (const std::string& v) const { return cdatamapping.is (v); }
  std::string get_cdatamapping (void) const { return cdatamapping.current_value (); }

  double get_diffusestrength (void) const { return diffusestrength.double_value (); }

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool edgealpha_is_double (void) const { return edgealpha.is_double (); }
  bool edgealpha_is (const std::string& v) const { return edgealpha.is (v); }
  double get_edgealpha_double (void) const { return (edgealpha.is_double () ? edgealpha.double_value () : 0); }
  octave_value get_edgealpha (void) const { return edgealpha.get (); }

  bool edgecolor_is_rgb (void) const { return edgecolor.is_rgb (); }
  bool edgecolor_is (const std::string& v) const { return edgecolor.is (v); }
  Matrix get_edgecolor_rgb (void) const { return (edgecolor.is_rgb () ? edgecolor.rgb () : Matrix ()); }
  octave_value get_edgecolor (void) const { return edgecolor.get (); }

  bool edgelighting_is (const std::string& v) const { return edgelighting.is (v); }
  std::string get_edgelighting (void) const { return edgelighting.current_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  bool facealpha_is_double (void) const { return facealpha.is_double (); }
  bool facealpha_is (const std::string& v) const { return facealpha.is (v); }
  double get_facealpha_double (void) const { return (facealpha.is_double () ? facealpha.double_value () : 0); }
  octave_value get_facealpha (void) const { return facealpha.get (); }

  bool facecolor_is_rgb (void) const { return facecolor.is_rgb (); }
  bool facecolor_is (const std::string& v) const { return facecolor.is (v); }
  Matrix get_facecolor_rgb (void) const { return (facecolor.is_rgb () ? facecolor.rgb () : Matrix ()); }
  octave_value get_facecolor (void) const { return facecolor.get (); }

  bool facelighting_is (const std::string& v) const { return facelighting.is (v); }
  std::string get_facelighting (void) const { return facelighting.current_value (); }

  octave_value get_facenormals (void) const { return facenormals.get (); }

  bool facenormalsmode_is (const std::string& v) const { return facenormalsmode.is (v); }
  std::string get_facenormalsmode (void) const { return facenormalsmode.current_value (); }

  octave_value get_faces (void) const { return faces.get (); }

  octave_value get_facevertexalphadata (void) const { return facevertexalphadata.get (); }

  octave_value get_facevertexcdata (void) const { return facevertexcdata.get (); }

  bool interpreter_is (const std::string& v) const { return interpreter.is (v); }
  std::string get_interpreter (void) const { return interpreter.current_value (); }

  bool linestyle_is (const std::string& v) const { return linestyle.is (v); }
  std::string get_linestyle (void) const { return linestyle.current_value (); }

  double get_linewidth (void) const { return linewidth.double_value (); }

  bool marker_is (const std::string& v) const { return marker.is (v); }
  std::string get_marker (void) const { return marker.current_value (); }

  bool markeredgecolor_is_rgb (void) const { return markeredgecolor.is_rgb (); }
  bool markeredgecolor_is (const std::string& v) const { return markeredgecolor.is (v); }
  Matrix get_markeredgecolor_rgb (void) const { return (markeredgecolor.is_rgb () ? markeredgecolor.rgb () : Matrix ()); }
  octave_value get_markeredgecolor (void) const { return markeredgecolor.get (); }

  bool markerfacecolor_is_rgb (void) const { return markerfacecolor.is_rgb (); }
  bool markerfacecolor_is (const std::string& v) const { return markerfacecolor.is (v); }
  Matrix get_markerfacecolor_rgb (void) const { return (markerfacecolor.is_rgb () ? markerfacecolor.rgb () : Matrix ()); }
  octave_value get_markerfacecolor (void) const { return markerfacecolor.get (); }

  double get_markersize (void) const { return markersize.double_value (); }

  double get_specularcolorreflectance (void) const { return specularcolorreflectance.double_value (); }

  double get_specularexponent (void) const { return specularexponent.double_value (); }

  double get_specularstrength (void) const { return specularstrength.double_value (); }

  octave_value get_vertexnormals (void) const { return vertexnormals.get (); }

  bool vertexnormalsmode_is (const std::string& v) const { return vertexnormalsmode.is (v); }
  std::string get_vertexnormalsmode (void) const { return vertexnormalsmode.current_value (); }

  octave_value get_vertices (void) const { return vertices.get (); }

  octave_value get_xdata (void) const { return xdata.get (); }

  octave_value get_ydata (void) const { return ydata.get (); }

  octave_value get_zdata (void) const { return zdata.get (); }

  octave_value get_alim (void) const { return alim.get (); }

  octave_value get_clim (void) const { return clim.get (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool is_zliminclude (void) const { return zliminclude.is_on (); }
  std::string get_zliminclude (void) const { return zliminclude.current_value (); }


  void set_alphadatamapping (const octave_value& val)
  {
      {
        if (alphadatamapping.set (val, false))
          {
            update_axis_limits ("alphadatamapping");
            alphadatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ambientstrength (const octave_value& val)
  {
      {
        if (ambientstrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_backfacelighting (const octave_value& val)
  {
      {
        if (backfacelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            update_cdata ();
            mark_modified ();
          }
      }
  }

  void set_cdatamapping (const octave_value& val)
  {
      {
        if (cdatamapping.set (val, false))
          {
            update_axis_limits ("cdatamapping");
            cdatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_diffusestrength (const octave_value& val)
  {
      {
        if (diffusestrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgealpha (const octave_value& val)
  {
      {
        if (edgealpha.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgecolor (const octave_value& val)
  {
      {
        if (edgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgelighting (const octave_value& val)
  {
      {
        if (edgelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facealpha (const octave_value& val)
  {
      {
        if (facealpha.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facecolor (const octave_value& val)
  {
      {
        if (facecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facelighting (const octave_value& val)
  {
      {
        if (facelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facenormals (const octave_value& val)
  {
      {
        if (facenormals.set (val, false))
          {
            set_facenormalsmode ("manual");
            facenormals.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_facenormalsmode ("manual");
      }
  }

  void set_facenormalsmode (const octave_value& val)
  {
      {
        if (facenormalsmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_faces (const octave_value& val)
  {
      {
        if (faces.set (val, true))
          {
            update_faces ();
            mark_modified ();
          }
      }
  }

  void set_facevertexalphadata (const octave_value& val)
  {
      {
        if (facevertexalphadata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facevertexcdata (const octave_value& val)
  {
      {
        if (facevertexcdata.set (val, true))
          {
            update_facevertexcdata ();
            mark_modified ();
          }
      }
  }

  void set_interpreter (const octave_value& val)
  {
      {
        if (interpreter.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linestyle (const octave_value& val)
  {
      {
        if (linestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linewidth (const octave_value& val)
  {
      {
        if (linewidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_marker (const octave_value& val)
  {
      {
        if (marker.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markeredgecolor (const octave_value& val)
  {
      {
        if (markeredgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markerfacecolor (const octave_value& val)
  {
      {
        if (markerfacecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markersize (const octave_value& val)
  {
      {
        if (markersize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularcolorreflectance (const octave_value& val)
  {
      {
        if (specularcolorreflectance.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularexponent (const octave_value& val)
  {
      {
        if (specularexponent.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularstrength (const octave_value& val)
  {
      {
        if (specularstrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_vertexnormals (const octave_value& val)
  {
      {
        if (vertexnormals.set (val, false))
          {
            set_vertexnormalsmode ("manual");
            vertexnormals.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_vertexnormalsmode ("manual");
      }
  }

  void set_vertexnormalsmode (const octave_value& val)
  {
      {
        if (vertexnormalsmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_vertices (const octave_value& val)
  {
      {
        if (vertices.set (val, true))
          {
            update_vertices ();
            mark_modified ();
          }
      }
  }

  void set_xdata (const octave_value& val)
  {
      {
        if (xdata.set (val, true))
          {
            update_xdata ();
            mark_modified ();
          }
      }
  }

  void set_ydata (const octave_value& val)
  {
      {
        if (ydata.set (val, true))
          {
            update_ydata ();
            mark_modified ();
          }
      }
  }

  void set_zdata (const octave_value& val)
  {
      {
        if (zdata.set (val, true))
          {
            update_zdata ();
            mark_modified ();
          }
      }
  }

  void set_alim (const octave_value& val)
  {
      {
        if (alim.set (val, false))
          {
            update_axis_limits ("alim");
            alim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_clim (const octave_value& val)
  {
      {
        if (clim.set (val, false))
          {
            update_axis_limits ("clim");
            clim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            update_axis_limits ("xlim");
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            update_axis_limits ("ylim");
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, false))
          {
            update_axis_limits ("zlim");
            zlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_aliminclude (const octave_value& val)
  {
      {
        if (aliminclude.set (val, false))
          {
            update_axis_limits ("aliminclude");
            aliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_climinclude (const octave_value& val)
  {
      {
        if (climinclude.set (val, false))
          {
            update_axis_limits ("climinclude");
            climinclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, false))
          {
            update_axis_limits ("xliminclude");
            xliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, false))
          {
            update_axis_limits ("yliminclude");
            yliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zliminclude (const octave_value& val)
  {
      {
        if (zliminclude.set (val, false))
          {
            update_axis_limits ("zliminclude");
            zliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      xdata.add_constraint (dim_vector (-1, -1));
      ydata.add_constraint (dim_vector (-1, -1));
      zdata.add_constraint (dim_vector (-1, -1));
      faces.add_constraint (dim_vector (-1, -1));
      vertices.add_constraint (dim_vector (-1, 2));
      vertices.add_constraint (dim_vector (-1, 3));
      cdata.add_constraint (dim_vector (-1, -1));
      cdata.add_constraint (dim_vector (-1, -1, 3));
      facevertexcdata.add_constraint (dim_vector (-1, 1));
      facevertexcdata.add_constraint (dim_vector (-1, 3));
      facevertexalphadata.add_constraint (dim_vector (-1, 1));
      facenormals.add_constraint (dim_vector (-1, 3));
      facenormals.add_constraint (dim_vector (0, 0));
      vertexnormals.add_constraint (dim_vector (-1, 3));
      vertexnormals.add_constraint (dim_vector (0, 0));
    }

  private:
    std::string bad_data_msg;

    void update_faces (void) { update_data ();}

    void update_vertices (void)  { update_data ();}

    void update_facevertexcdata (void) { update_data ();}

    void update_fvc (void);

    void update_xdata (void)
    {
      if (get_xdata ().is_empty ())
        {
          // For compatibility with matlab behavior,
          // if x/ydata are set empty, silently empty other *data and
          // faces properties while vertices remain unchanged.
          set_ydata (Matrix ());
          set_zdata (Matrix ());
          set_cdata (Matrix ());
          set_faces (Matrix ());
        }
      else
        update_fvc ();

      set_xlim (xdata.get_limits ());
    }

    void update_ydata (void)
    {
      if (get_ydata ().is_empty ())
        {
          set_xdata (Matrix ());
          set_zdata (Matrix ());
          set_cdata (Matrix ());
          set_faces (Matrix ());
        }
      else
        update_fvc ();

      set_ylim (ydata.get_limits ());
    }

    void update_zdata (void)
    {
      update_fvc ();
      set_zlim (zdata.get_limits ());
    }

    void update_cdata (void)
    {
      update_fvc ();

      if (cdatamapping_is ("scaled"))
        set_clim (cdata.get_limits ());
      else
        clim = cdata.get_limits ();
    }

    void update_data (void);

    void set_normalmode (const octave_value& val)
    {
      warning_with_id ("Octave:deprecated-property",
        "patch: Property 'normalmode' is deprecated and will be removed "
        "from a future version of Octave.  Use 'vertexnormalsmode' instead.");
      set_vertexnormalsmode (val);
    }

    std::string get_normalmode (void) const
    {
      warning_with_id ("Octave:deprecated-property",
        "patch: Property 'normalmode' is deprecated and will be removed "
        "from a future version of Octave.  Use 'vertexnormalsmode' instead.");
      return vertexnormalsmode.current_value ();
    }
  };

private:
  properties xproperties;

public:
  patch (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~patch (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API surface : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    octave_value get_color_data (void) const;

    bool is_aliminclude (void) const
    { return (aliminclude.is_on () && alphadatamapping.is ("scaled")); }
    std::string get_aliminclude (void) const
    { return aliminclude.current_value (); }

    bool is_climinclude (void) const
    { return (climinclude.is_on () && cdatamapping.is ("scaled")); }
    std::string get_climinclude (void) const
    { return climinclude.current_value (); }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  array_property alphadata;
  radio_property alphadatamapping;
  double_property ambientstrength;
  radio_property backfacelighting;
  array_property cdata;
  radio_property cdatamapping;
  string_property cdatasource;
  double_property diffusestrength;
  string_property displayname;
  double_radio_property edgealpha;
  color_property edgecolor;
  radio_property edgelighting;
  radio_property erasemode;
  double_radio_property facealpha;
  color_property facecolor;
  radio_property facelighting;
  array_property facenormals;
  radio_property facenormalsmode;
  radio_property interpreter;
  radio_property linestyle;
  double_property linewidth;
  radio_property marker;
  color_property markeredgecolor;
  color_property markerfacecolor;
  double_property markersize;
  radio_property meshstyle;
  radio_property normalmode;
  double_property specularcolorreflectance;
  double_property specularexponent;
  double_property specularstrength;
  array_property vertexnormals;
  radio_property vertexnormalsmode;
  array_property xdata;
  string_property xdatasource;
  array_property ydata;
  string_property ydatasource;
  array_property zdata;
  string_property zdatasource;
  row_vector_property alim;
  row_vector_property clim;
  row_vector_property xlim;
  row_vector_property ylim;
  row_vector_property zlim;
  bool_property aliminclude;
  bool_property climinclude;
  bool_property xliminclude;
  bool_property yliminclude;
  bool_property zliminclude;

public:

  enum
  {
    ID_ALPHADATA = 9000,
    ID_ALPHADATAMAPPING = 9001,
    ID_AMBIENTSTRENGTH = 9002,
    ID_BACKFACELIGHTING = 9003,
    ID_CDATA = 9004,
    ID_CDATAMAPPING = 9005,
    ID_CDATASOURCE = 9006,
    ID_DIFFUSESTRENGTH = 9007,
    ID_DISPLAYNAME = 9008,
    ID_EDGEALPHA = 9009,
    ID_EDGECOLOR = 9010,
    ID_EDGELIGHTING = 9011,
    ID_ERASEMODE = 9012,
    ID_FACEALPHA = 9013,
    ID_FACECOLOR = 9014,
    ID_FACELIGHTING = 9015,
    ID_FACENORMALS = 9016,
    ID_FACENORMALSMODE = 9017,
    ID_INTERPRETER = 9018,
    ID_LINESTYLE = 9019,
    ID_LINEWIDTH = 9020,
    ID_MARKER = 9021,
    ID_MARKEREDGECOLOR = 9022,
    ID_MARKERFACECOLOR = 9023,
    ID_MARKERSIZE = 9024,
    ID_MESHSTYLE = 9025,
    ID_NORMALMODE = 9026,
    ID_SPECULARCOLORREFLECTANCE = 9027,
    ID_SPECULAREXPONENT = 9028,
    ID_SPECULARSTRENGTH = 9029,
    ID_VERTEXNORMALS = 9030,
    ID_VERTEXNORMALSMODE = 9031,
    ID_XDATA = 9032,
    ID_XDATASOURCE = 9033,
    ID_YDATA = 9034,
    ID_YDATASOURCE = 9035,
    ID_ZDATA = 9036,
    ID_ZDATASOURCE = 9037,
    ID_ALIM = 9038,
    ID_CLIM = 9039,
    ID_XLIM = 9040,
    ID_YLIM = 9041,
    ID_ZLIM = 9042,
    ID_ALIMINCLUDE = 9043,
    ID_CLIMINCLUDE = 9044,
    ID_XLIMINCLUDE = 9045,
    ID_YLIMINCLUDE = 9046,
    ID_ZLIMINCLUDE = 9047
  };

  octave_value get_alphadata (void) const { return alphadata.get (); }

  bool alphadatamapping_is (const std::string& v) const { return alphadatamapping.is (v); }
  std::string get_alphadatamapping (void) const { return alphadatamapping.current_value (); }

  double get_ambientstrength (void) const { return ambientstrength.double_value (); }

  bool backfacelighting_is (const std::string& v) const { return backfacelighting.is (v); }
  std::string get_backfacelighting (void) const { return backfacelighting.current_value (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  bool cdatamapping_is (const std::string& v) const { return cdatamapping.is (v); }
  std::string get_cdatamapping (void) const { return cdatamapping.current_value (); }

  std::string get_cdatasource (void) const { return cdatasource.string_value (); }

  double get_diffusestrength (void) const { return diffusestrength.double_value (); }

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool edgealpha_is_double (void) const { return edgealpha.is_double (); }
  bool edgealpha_is (const std::string& v) const { return edgealpha.is (v); }
  double get_edgealpha_double (void) const { return (edgealpha.is_double () ? edgealpha.double_value () : 0); }
  octave_value get_edgealpha (void) const { return edgealpha.get (); }

  bool edgecolor_is_rgb (void) const { return edgecolor.is_rgb (); }
  bool edgecolor_is (const std::string& v) const { return edgecolor.is (v); }
  Matrix get_edgecolor_rgb (void) const { return (edgecolor.is_rgb () ? edgecolor.rgb () : Matrix ()); }
  octave_value get_edgecolor (void) const { return edgecolor.get (); }

  bool edgelighting_is (const std::string& v) const { return edgelighting.is (v); }
  std::string get_edgelighting (void) const { return edgelighting.current_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  bool facealpha_is_double (void) const { return facealpha.is_double (); }
  bool facealpha_is (const std::string& v) const { return facealpha.is (v); }
  double get_facealpha_double (void) const { return (facealpha.is_double () ? facealpha.double_value () : 0); }
  octave_value get_facealpha (void) const { return facealpha.get (); }

  bool facecolor_is_rgb (void) const { return facecolor.is_rgb (); }
  bool facecolor_is (const std::string& v) const { return facecolor.is (v); }
  Matrix get_facecolor_rgb (void) const { return (facecolor.is_rgb () ? facecolor.rgb () : Matrix ()); }
  octave_value get_facecolor (void) const { return facecolor.get (); }

  bool facelighting_is (const std::string& v) const { return facelighting.is (v); }
  std::string get_facelighting (void) const { return facelighting.current_value (); }

  octave_value get_facenormals (void) const { return facenormals.get (); }

  bool facenormalsmode_is (const std::string& v) const { return facenormalsmode.is (v); }
  std::string get_facenormalsmode (void) const { return facenormalsmode.current_value (); }

  bool interpreter_is (const std::string& v) const { return interpreter.is (v); }
  std::string get_interpreter (void) const { return interpreter.current_value (); }

  bool linestyle_is (const std::string& v) const { return linestyle.is (v); }
  std::string get_linestyle (void) const { return linestyle.current_value (); }

  double get_linewidth (void) const { return linewidth.double_value (); }

  bool marker_is (const std::string& v) const { return marker.is (v); }
  std::string get_marker (void) const { return marker.current_value (); }

  bool markeredgecolor_is_rgb (void) const { return markeredgecolor.is_rgb (); }
  bool markeredgecolor_is (const std::string& v) const { return markeredgecolor.is (v); }
  Matrix get_markeredgecolor_rgb (void) const { return (markeredgecolor.is_rgb () ? markeredgecolor.rgb () : Matrix ()); }
  octave_value get_markeredgecolor (void) const { return markeredgecolor.get (); }

  bool markerfacecolor_is_rgb (void) const { return markerfacecolor.is_rgb (); }
  bool markerfacecolor_is (const std::string& v) const { return markerfacecolor.is (v); }
  Matrix get_markerfacecolor_rgb (void) const { return (markerfacecolor.is_rgb () ? markerfacecolor.rgb () : Matrix ()); }
  octave_value get_markerfacecolor (void) const { return markerfacecolor.get (); }

  double get_markersize (void) const { return markersize.double_value (); }

  bool meshstyle_is (const std::string& v) const { return meshstyle.is (v); }
  std::string get_meshstyle (void) const { return meshstyle.current_value (); }

  double get_specularcolorreflectance (void) const { return specularcolorreflectance.double_value (); }

  double get_specularexponent (void) const { return specularexponent.double_value (); }

  double get_specularstrength (void) const { return specularstrength.double_value (); }

  octave_value get_vertexnormals (void) const { return vertexnormals.get (); }

  bool vertexnormalsmode_is (const std::string& v) const { return vertexnormalsmode.is (v); }
  std::string get_vertexnormalsmode (void) const { return vertexnormalsmode.current_value (); }

  octave_value get_xdata (void) const { return xdata.get (); }

  std::string get_xdatasource (void) const { return xdatasource.string_value (); }

  octave_value get_ydata (void) const { return ydata.get (); }

  std::string get_ydatasource (void) const { return ydatasource.string_value (); }

  octave_value get_zdata (void) const { return zdata.get (); }

  std::string get_zdatasource (void) const { return zdatasource.string_value (); }

  octave_value get_alim (void) const { return alim.get (); }

  octave_value get_clim (void) const { return clim.get (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool is_zliminclude (void) const { return zliminclude.is_on (); }
  std::string get_zliminclude (void) const { return zliminclude.current_value (); }


  void set_alphadata (const octave_value& val)
  {
      {
        if (alphadata.set (val, true))
          {
            update_alphadata ();
            mark_modified ();
          }
      }
  }

  void set_alphadatamapping (const octave_value& val)
  {
      {
        if (alphadatamapping.set (val, false))
          {
            update_axis_limits ("alphadatamapping");
            alphadatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ambientstrength (const octave_value& val)
  {
      {
        if (ambientstrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_backfacelighting (const octave_value& val)
  {
      {
        if (backfacelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            update_cdata ();
            mark_modified ();
          }
      }
  }

  void set_cdatamapping (const octave_value& val)
  {
      {
        if (cdatamapping.set (val, false))
          {
            update_axis_limits ("cdatamapping");
            cdatamapping.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_cdatasource (const octave_value& val)
  {
      {
        if (cdatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_diffusestrength (const octave_value& val)
  {
      {
        if (diffusestrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgealpha (const octave_value& val)
  {
      {
        if (edgealpha.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgecolor (const octave_value& val)
  {
      {
        if (edgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_edgelighting (const octave_value& val)
  {
      {
        if (edgelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facealpha (const octave_value& val)
  {
      {
        if (facealpha.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facecolor (const octave_value& val)
  {
      {
        if (facecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facelighting (const octave_value& val)
  {
      {
        if (facelighting.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_facenormals (const octave_value& val)
  {
      {
        if (facenormals.set (val, false))
          {
            set_facenormalsmode ("manual");
            facenormals.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_facenormalsmode ("manual");
      }
  }

  void set_facenormalsmode (const octave_value& val)
  {
      {
        if (facenormalsmode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_interpreter (const octave_value& val)
  {
      {
        if (interpreter.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linestyle (const octave_value& val)
  {
      {
        if (linestyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_linewidth (const octave_value& val)
  {
      {
        if (linewidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_marker (const octave_value& val)
  {
      {
        if (marker.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markeredgecolor (const octave_value& val)
  {
      {
        if (markeredgecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markerfacecolor (const octave_value& val)
  {
      {
        if (markerfacecolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_markersize (const octave_value& val)
  {
      {
        if (markersize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_meshstyle (const octave_value& val)
  {
      {
        if (meshstyle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularcolorreflectance (const octave_value& val)
  {
      {
        if (specularcolorreflectance.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularexponent (const octave_value& val)
  {
      {
        if (specularexponent.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_specularstrength (const octave_value& val)
  {
      {
        if (specularstrength.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_vertexnormals (const octave_value& val)
  {
      {
        if (vertexnormals.set (val, false))
          {
            set_vertexnormalsmode ("manual");
            vertexnormals.run_listeners (POSTSET);
            mark_modified ();
          }
        else
          set_vertexnormalsmode ("manual");
      }
  }

  void set_vertexnormalsmode (const octave_value& val)
  {
      {
        if (vertexnormalsmode.set (val, true))
          {
            update_vertexnormalsmode ();
            mark_modified ();
          }
      }
  }

  void set_xdata (const octave_value& val)
  {
      {
        if (xdata.set (val, true))
          {
            update_xdata ();
            mark_modified ();
          }
      }
  }

  void set_xdatasource (const octave_value& val)
  {
      {
        if (xdatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ydata (const octave_value& val)
  {
      {
        if (ydata.set (val, true))
          {
            update_ydata ();
            mark_modified ();
          }
      }
  }

  void set_ydatasource (const octave_value& val)
  {
      {
        if (ydatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zdata (const octave_value& val)
  {
      {
        if (zdata.set (val, true))
          {
            update_zdata ();
            mark_modified ();
          }
      }
  }

  void set_zdatasource (const octave_value& val)
  {
      {
        if (zdatasource.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_alim (const octave_value& val)
  {
      {
        if (alim.set (val, false))
          {
            update_axis_limits ("alim");
            alim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_clim (const octave_value& val)
  {
      {
        if (clim.set (val, false))
          {
            update_axis_limits ("clim");
            clim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, false))
          {
            update_axis_limits ("xlim");
            xlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, false))
          {
            update_axis_limits ("ylim");
            ylim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, false))
          {
            update_axis_limits ("zlim");
            zlim.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_aliminclude (const octave_value& val)
  {
      {
        if (aliminclude.set (val, false))
          {
            update_axis_limits ("aliminclude");
            aliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_climinclude (const octave_value& val)
  {
      {
        if (climinclude.set (val, false))
          {
            update_axis_limits ("climinclude");
            climinclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, false))
          {
            update_axis_limits ("xliminclude");
            xliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, false))
          {
            update_axis_limits ("yliminclude");
            yliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }

  void set_zliminclude (const octave_value& val)
  {
      {
        if (zliminclude.set (val, false))
          {
            update_axis_limits ("zliminclude");
            zliminclude.run_listeners (POSTSET);
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      xdata.add_constraint (dim_vector (-1, -1));
      ydata.add_constraint (dim_vector (-1, -1));
      zdata.add_constraint (dim_vector (-1, -1));
      cdata.add_constraint ("double");
      cdata.add_constraint ("single");
      cdata.add_constraint (dim_vector (-1, -1));
      cdata.add_constraint (dim_vector (-1, -1, 3));
      alphadata.add_constraint ("double");
      alphadata.add_constraint ("uint8");
      alphadata.add_constraint (dim_vector (-1, -1));
      facenormals.add_constraint (dim_vector (-1, -1, 3));
      facenormals.add_constraint (dim_vector (0, 0));
      vertexnormals.add_constraint (dim_vector (-1, -1, 3));
      vertexnormals.add_constraint (dim_vector (0, 0));
    }

  private:
    void update_alphadata (void)
    {
      if (alphadatamapping_is ("scaled"))
        set_alim (alphadata.get_limits ());
      else
        alim = alphadata.get_limits ();
    }

    void update_cdata (void)
    {
      if (cdatamapping_is ("scaled"))
        set_clim (cdata.get_limits ());
      else
        clim = cdata.get_limits ();
    }

    void update_xdata (void)
    {
      update_vertex_normals ();
      set_xlim (xdata.get_limits ());
    }

    void update_ydata (void)
    {
      update_vertex_normals ();
      set_ylim (ydata.get_limits ());
    }

    void update_zdata (void)
    {
      update_vertex_normals ();
      set_zlim (zdata.get_limits ());
    }

    void update_vertex_normals (void);

    void update_vertexnormalsmode (void)
    { update_vertex_normals (); }

    void set_normalmode (const octave_value& val)
    {
      warning_with_id ("Octave:deprecated-property",
        "surface: Property 'normalmode' is deprecated and will be removed "
        "from a future version of Octave.  Use 'vertexnormalsmode' instead.");
      set_vertexnormalsmode (val);
    }

    std::string get_normalmode (void) const
    {
      warning_with_id ("Octave:deprecated-property",
        "surface: Property 'normalmode' is deprecated and will be removed "
        "from a future version of Octave.  Use 'vertexnormalsmode' instead.");
      return vertexnormalsmode.current_value ();
    }
  };

private:
  properties xproperties;

public:
  surface (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~surface (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API hggroup : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    void remove_child (const graphics_handle& h)
    {
      base_properties::remove_child (h);
      update_limits ();
    }

    void adopt (const graphics_handle& h)
    {

      base_properties::adopt (h);
      update_limits (h);
    }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  string_property displayname;
  radio_property erasemode;
  row_vector_property alim;
  row_vector_property clim;
  row_vector_property xlim;
  row_vector_property ylim;
  row_vector_property zlim;
  bool_property aliminclude;
  bool_property climinclude;
  bool_property xliminclude;
  bool_property yliminclude;
  bool_property zliminclude;

public:

  enum
  {
    ID_DISPLAYNAME = 10000,
    ID_ERASEMODE = 10001,
    ID_ALIM = 10002,
    ID_CLIM = 10003,
    ID_XLIM = 10004,
    ID_YLIM = 10005,
    ID_ZLIM = 10006,
    ID_ALIMINCLUDE = 10007,
    ID_CLIMINCLUDE = 10008,
    ID_XLIMINCLUDE = 10009,
    ID_YLIMINCLUDE = 10010,
    ID_ZLIMINCLUDE = 10011
  };

  std::string get_displayname (void) const { return displayname.string_value (); }

  bool erasemode_is (const std::string& v) const { return erasemode.is (v); }
  std::string get_erasemode (void) const { return erasemode.current_value (); }

  octave_value get_alim (void) const { return alim.get (); }

  octave_value get_clim (void) const { return clim.get (); }

  octave_value get_xlim (void) const { return xlim.get (); }

  octave_value get_ylim (void) const { return ylim.get (); }

  octave_value get_zlim (void) const { return zlim.get (); }

  bool is_aliminclude (void) const { return aliminclude.is_on (); }
  std::string get_aliminclude (void) const { return aliminclude.current_value (); }

  bool is_climinclude (void) const { return climinclude.is_on (); }
  std::string get_climinclude (void) const { return climinclude.current_value (); }

  bool is_xliminclude (void) const { return xliminclude.is_on (); }
  std::string get_xliminclude (void) const { return xliminclude.current_value (); }

  bool is_yliminclude (void) const { return yliminclude.is_on (); }
  std::string get_yliminclude (void) const { return yliminclude.current_value (); }

  bool is_zliminclude (void) const { return zliminclude.is_on (); }
  std::string get_zliminclude (void) const { return zliminclude.current_value (); }


  void set_displayname (const octave_value& val)
  {
      {
        if (displayname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_erasemode (const octave_value& val)
  {
      {
        if (erasemode.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_alim (const octave_value& val)
  {
      {
        if (alim.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clim (const octave_value& val)
  {
      {
        if (clim.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xlim (const octave_value& val)
  {
      {
        if (xlim.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_ylim (const octave_value& val)
  {
      {
        if (ylim.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zlim (const octave_value& val)
  {
      {
        if (zlim.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_aliminclude (const octave_value& val)
  {
      {
        if (aliminclude.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_climinclude (const octave_value& val)
  {
      {
        if (climinclude.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_xliminclude (const octave_value& val)
  {
      {
        if (xliminclude.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_yliminclude (const octave_value& val)
  {
      {
        if (yliminclude.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_zliminclude (const octave_value& val)
  {
      {
        if (zliminclude.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  private:
    void update_limits (void) const;

    void update_limits (const graphics_handle& h) const;

  protected:
    void init (void)
    { }

  };

private:
  properties xproperties;

public:
  hggroup (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~hggroup (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  void update_axis_limits (const std::string& axis_type);

  void update_axis_limits (const std::string& axis_type,
                           const graphics_handle& h);

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

class OCTINTERP_API uimenu : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    void remove_child (const graphics_handle& h)
    {
      base_properties::remove_child (h);
    }

    void adopt (const graphics_handle& h)
    {
      base_properties::adopt (h);
    }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  string_property accelerator;
  callback_property callback;
  bool_property checked;
  bool_property enable;
  color_property foregroundcolor;
  string_property label;
  double_property position;
  bool_property separator;
  string_property fltk_label;

public:

  enum
  {
    ID___OBJECT__ = 11000,
    ID_ACCELERATOR = 11001,
    ID_CALLBACK = 11002,
    ID_CHECKED = 11003,
    ID_ENABLE = 11004,
    ID_FOREGROUNDCOLOR = 11005,
    ID_LABEL = 11006,
    ID_POSITION = 11007,
    ID_SEPARATOR = 11008,
    ID_FLTK_LABEL = 11009
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  std::string get_accelerator (void) const { return accelerator.string_value (); }

  void execute_callback (const octave_value& data = octave_value ()) const { callback.execute (data); }
  octave_value get_callback (void) const { return callback.get (); }

  bool is_checked (void) const { return checked.is_on (); }
  std::string get_checked (void) const { return checked.current_value (); }

  bool is_enable (void) const { return enable.is_on (); }
  std::string get_enable (void) const { return enable.current_value (); }

  bool foregroundcolor_is_rgb (void) const { return foregroundcolor.is_rgb (); }
  bool foregroundcolor_is (const std::string& v) const { return foregroundcolor.is (v); }
  Matrix get_foregroundcolor_rgb (void) const { return (foregroundcolor.is_rgb () ? foregroundcolor.rgb () : Matrix ()); }
  octave_value get_foregroundcolor (void) const { return foregroundcolor.get (); }

  std::string get_label (void) const { return label.string_value (); }

  double get_position (void) const { return position.double_value (); }

  bool is_separator (void) const { return separator.is_on (); }
  std::string get_separator (void) const { return separator.current_value (); }

  std::string get_fltk_label (void) const { return fltk_label.string_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_accelerator (const octave_value& val)
  {
      {
        if (accelerator.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_callback (const octave_value& val)
  {
      {
        if (callback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_checked (const octave_value& val)
  {
      {
        if (checked.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_enable (const octave_value& val)
  {
      {
        if (enable.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_foregroundcolor (const octave_value& val)
  {
      {
        if (foregroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_label (const octave_value& val)
  {
      {
        if (label.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_separator (const octave_value& val)
  {
      {
        if (separator.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fltk_label (const octave_value& val)
  {
      {
        if (fltk_label.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    { }
  };

private:
  properties xproperties;

public:
  uimenu (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uimenu (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

class OCTINTERP_API uicontextmenu : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:

    void add_dependent_obj (graphics_handle gh)
    { dependent_obj_list.push_back (gh); }

    // FIXME: the list may contain duplicates.
    //        Should we return only unique elements?
    const std::list<graphics_handle> get_dependent_obj_list (void)
    { return dependent_obj_list; }

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  callback_property callback;
  array_property position;

public:

  enum
  {
    ID___OBJECT__ = 12000,
    ID_CALLBACK = 12001,
    ID_POSITION = 12002
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  void execute_callback (const octave_value& data = octave_value ()) const { callback.execute (data); }
  octave_value get_callback (void) const { return callback.get (); }

  octave_value get_position (void) const { return position.get (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_callback (const octave_value& val)
  {
      {
        if (callback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      position.add_constraint (dim_vector (1, 2));
      position.add_constraint (dim_vector (2, 1));
      visible.set (octave_value (false));
    }

  private:
    // List of objects that might depend on this uicontextmenu object
    std::list<graphics_handle> dependent_obj_list;
  };

private:
  properties xproperties;

public:
  uicontextmenu (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uicontextmenu (void);

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

class OCTINTERP_API uicontrol : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;

    double get_fontsize_points (double box_pix_height = 0) const;

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  color_property backgroundcolor;
  callback_property callback;
  array_property cdata;
  bool_property clipping;
  radio_property enable;
  array_property extent;
  radio_property fontangle;
  string_property fontname;
  double_property fontsize;
  radio_property fontunits;
  radio_property fontweight;
  color_property foregroundcolor;
  radio_property horizontalalignment;
  callback_property keypressfcn;
  double_property listboxtop;
  double_property max;
  double_property min;
  array_property position;
  array_property sliderstep;
  string_array_property string;
  radio_property style;
  string_property tooltipstring;
  radio_property units;
  row_vector_property value;
  radio_property verticalalignment;

public:

  enum
  {
    ID___OBJECT__ = 13000,
    ID_BACKGROUNDCOLOR = 13001,
    ID_CALLBACK = 13002,
    ID_CDATA = 13003,
    ID_CLIPPING = 13004,
    ID_ENABLE = 13005,
    ID_EXTENT = 13006,
    ID_FONTANGLE = 13007,
    ID_FONTNAME = 13008,
    ID_FONTSIZE = 13009,
    ID_FONTUNITS = 13010,
    ID_FONTWEIGHT = 13011,
    ID_FOREGROUNDCOLOR = 13012,
    ID_HORIZONTALALIGNMENT = 13013,
    ID_KEYPRESSFCN = 13014,
    ID_LISTBOXTOP = 13015,
    ID_MAX = 13016,
    ID_MIN = 13017,
    ID_POSITION = 13018,
    ID_SLIDERSTEP = 13019,
    ID_STRING = 13020,
    ID_STYLE = 13021,
    ID_TOOLTIPSTRING = 13022,
    ID_UNITS = 13023,
    ID_VALUE = 13024,
    ID_VERTICALALIGNMENT = 13025
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  bool backgroundcolor_is_rgb (void) const { return backgroundcolor.is_rgb (); }
  bool backgroundcolor_is (const std::string& v) const { return backgroundcolor.is (v); }
  Matrix get_backgroundcolor_rgb (void) const { return (backgroundcolor.is_rgb () ? backgroundcolor.rgb () : Matrix ()); }
  octave_value get_backgroundcolor (void) const { return backgroundcolor.get (); }

  void execute_callback (const octave_value& data = octave_value ()) const { callback.execute (data); }
  octave_value get_callback (void) const { return callback.get (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  bool is_clipping (void) const { return clipping.is_on (); }
  std::string get_clipping (void) const { return clipping.current_value (); }

  bool enable_is (const std::string& v) const { return enable.is (v); }
  std::string get_enable (void) const { return enable.current_value (); }

  octave_value get_extent (void) const;

  bool fontangle_is (const std::string& v) const { return fontangle.is (v); }
  std::string get_fontangle (void) const { return fontangle.current_value (); }

  std::string get_fontname (void) const { return fontname.string_value (); }

  double get_fontsize (void) const { return fontsize.double_value (); }

  bool fontunits_is (const std::string& v) const { return fontunits.is (v); }
  std::string get_fontunits (void) const { return fontunits.current_value (); }

  bool fontweight_is (const std::string& v) const { return fontweight.is (v); }
  std::string get_fontweight (void) const { return fontweight.current_value (); }

  bool foregroundcolor_is_rgb (void) const { return foregroundcolor.is_rgb (); }
  bool foregroundcolor_is (const std::string& v) const { return foregroundcolor.is (v); }
  Matrix get_foregroundcolor_rgb (void) const { return (foregroundcolor.is_rgb () ? foregroundcolor.rgb () : Matrix ()); }
  octave_value get_foregroundcolor (void) const { return foregroundcolor.get (); }

  bool horizontalalignment_is (const std::string& v) const { return horizontalalignment.is (v); }
  std::string get_horizontalalignment (void) const { return horizontalalignment.current_value (); }

  void execute_keypressfcn (const octave_value& data = octave_value ()) const { keypressfcn.execute (data); }
  octave_value get_keypressfcn (void) const { return keypressfcn.get (); }

  double get_listboxtop (void) const { return listboxtop.double_value (); }

  double get_max (void) const { return max.double_value (); }

  double get_min (void) const { return min.double_value (); }

  octave_value get_position (void) const { return position.get (); }

  octave_value get_sliderstep (void) const { return sliderstep.get (); }

  std::string get_string_string (void) const { return string.string_value (); }
  string_vector get_string_vector (void) const { return string.string_vector_value (); }
  octave_value get_string (void) const { return string.get (); }

  bool style_is (const std::string& v) const { return style.is (v); }
  std::string get_style (void) const { return style.current_value (); }

  std::string get_tooltipstring (void) const { return tooltipstring.string_value (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }

  octave_value get_value (void) const { return value.get (); }

  bool verticalalignment_is (const std::string& v) const { return verticalalignment.is (v); }
  std::string get_verticalalignment (void) const { return verticalalignment.current_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_backgroundcolor (const octave_value& val)
  {
      {
        if (backgroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_callback (const octave_value& val)
  {
      {
        if (callback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clipping (const octave_value& val)
  {
      {
        if (clipping.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_enable (const octave_value& val)
  {
      {
        if (enable.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_extent (const octave_value& val)
  {
      {
        if (extent.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontangle (const octave_value& val)
  {
      {
        if (fontangle.set (val, true))
          {
            update_fontangle ();
            mark_modified ();
          }
      }
  }

  void set_fontname (const octave_value& val)
  {
      {
        if (fontname.set (val, true))
          {
            update_fontname ();
            mark_modified ();
          }
      }
  }

  void set_fontsize (const octave_value& val)
  {
      {
        if (fontsize.set (val, true))
          {
            update_fontsize ();
            mark_modified ();
          }
      }
  }

  void set_fontunits (const octave_value& val);

  void set_fontweight (const octave_value& val)
  {
      {
        if (fontweight.set (val, true))
          {
            update_fontweight ();
            mark_modified ();
          }
      }
  }

  void set_foregroundcolor (const octave_value& val)
  {
      {
        if (foregroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_horizontalalignment (const octave_value& val)
  {
      {
        if (horizontalalignment.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_keypressfcn (const octave_value& val)
  {
      {
        if (keypressfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_listboxtop (const octave_value& val)
  {
      {
        if (listboxtop.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_max (const octave_value& val)
  {
      {
        if (max.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_min (const octave_value& val)
  {
      {
        if (min.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_sliderstep (const octave_value& val)
  {
      {
        if (sliderstep.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_string (const octave_value& val)
  {
      {
        if (string.set (val, true))
          {
            update_string ();
            mark_modified ();
          }
      }
  }

  void set_style (const octave_value& val);

  void set_tooltipstring (const octave_value& val)
  {
      {
        if (tooltipstring.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val)
  {
      {
        if (units.set (val, true))
          {
            update_units ();
            mark_modified ();
          }
      }
  }

  void set_value (const octave_value& val)
  {
      {
        if (value.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_verticalalignment (const octave_value& val)
  {
      {
        if (verticalalignment.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  private:
    std::string cached_units;

  protected:
    void init (void)
    {
      cdata.add_constraint ("double");
      cdata.add_constraint ("single");
      cdata.add_constraint (dim_vector (-1, -1, 3));
      position.add_constraint (dim_vector (1, 4));
      sliderstep.add_constraint (dim_vector (1, 2));
      cached_units = get_units ();
    }

    void update_text_extent (void);

    void update_string (void) { update_text_extent (); }
    void update_fontname (void) { update_text_extent (); }
    void update_fontsize (void) { update_text_extent (); }
    void update_fontangle (void) { update_text_extent (); }
    void update_fontweight (void) { update_text_extent (); }
    void update_fontunits (const caseless_str& old_units);

    void update_units (void);

  };

private:
  properties xproperties;

public:
  uicontrol (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uicontrol (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API uibuttongroup : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;

    double get_fontsize_points (double box_pix_height = 0) const;

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  color_property backgroundcolor;
  radio_property bordertype;
  double_property borderwidth;
  bool_property clipping;
  radio_property fontangle;
  string_property fontname;
  double_property fontsize;
  radio_property fontunits;
  radio_property fontweight;
  color_property foregroundcolor;
  color_property highlightcolor;
  array_property position;
  callback_property resizefcn;
  handle_property selectedobject;
  callback_property selectionchangedfcn;
  color_property shadowcolor;
  callback_property sizechangedfcn;
  radio_property units;
  string_property title;
  radio_property titleposition;

public:

  enum
  {
    ID___OBJECT__ = 14000,
    ID_BACKGROUNDCOLOR = 14001,
    ID_BORDERTYPE = 14002,
    ID_BORDERWIDTH = 14003,
    ID_CLIPPING = 14004,
    ID_FONTANGLE = 14005,
    ID_FONTNAME = 14006,
    ID_FONTSIZE = 14007,
    ID_FONTUNITS = 14008,
    ID_FONTWEIGHT = 14009,
    ID_FOREGROUNDCOLOR = 14010,
    ID_HIGHLIGHTCOLOR = 14011,
    ID_POSITION = 14012,
    ID_RESIZEFCN = 14013,
    ID_SELECTEDOBJECT = 14014,
    ID_SELECTIONCHANGEDFCN = 14015,
    ID_SHADOWCOLOR = 14016,
    ID_SIZECHANGEDFCN = 14017,
    ID_UNITS = 14018,
    ID_TITLE = 14019,
    ID_TITLEPOSITION = 14020
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  bool backgroundcolor_is_rgb (void) const { return backgroundcolor.is_rgb (); }
  bool backgroundcolor_is (const std::string& v) const { return backgroundcolor.is (v); }
  Matrix get_backgroundcolor_rgb (void) const { return (backgroundcolor.is_rgb () ? backgroundcolor.rgb () : Matrix ()); }
  octave_value get_backgroundcolor (void) const { return backgroundcolor.get (); }

  bool bordertype_is (const std::string& v) const { return bordertype.is (v); }
  std::string get_bordertype (void) const { return bordertype.current_value (); }

  double get_borderwidth (void) const { return borderwidth.double_value (); }

  bool is_clipping (void) const { return clipping.is_on (); }
  std::string get_clipping (void) const { return clipping.current_value (); }

  bool fontangle_is (const std::string& v) const { return fontangle.is (v); }
  std::string get_fontangle (void) const { return fontangle.current_value (); }

  std::string get_fontname (void) const { return fontname.string_value (); }

  double get_fontsize (void) const { return fontsize.double_value (); }

  bool fontunits_is (const std::string& v) const { return fontunits.is (v); }
  std::string get_fontunits (void) const { return fontunits.current_value (); }

  bool fontweight_is (const std::string& v) const { return fontweight.is (v); }
  std::string get_fontweight (void) const { return fontweight.current_value (); }

  bool foregroundcolor_is_rgb (void) const { return foregroundcolor.is_rgb (); }
  bool foregroundcolor_is (const std::string& v) const { return foregroundcolor.is (v); }
  Matrix get_foregroundcolor_rgb (void) const { return (foregroundcolor.is_rgb () ? foregroundcolor.rgb () : Matrix ()); }
  octave_value get_foregroundcolor (void) const { return foregroundcolor.get (); }

  bool highlightcolor_is_rgb (void) const { return highlightcolor.is_rgb (); }
  bool highlightcolor_is (const std::string& v) const { return highlightcolor.is (v); }
  Matrix get_highlightcolor_rgb (void) const { return (highlightcolor.is_rgb () ? highlightcolor.rgb () : Matrix ()); }
  octave_value get_highlightcolor (void) const { return highlightcolor.get (); }

  octave_value get_position (void) const { return position.get (); }

  void execute_resizefcn (const octave_value& data = octave_value ()) const { resizefcn.execute (data); }
  octave_value get_resizefcn (void) const { return resizefcn.get (); }

  graphics_handle get_selectedobject (void) const { return selectedobject.handle_value (); }

  void execute_selectionchangedfcn (const octave_value& data = octave_value ()) const { selectionchangedfcn.execute (data); }
  octave_value get_selectionchangedfcn (void) const { return selectionchangedfcn.get (); }

  bool shadowcolor_is_rgb (void) const { return shadowcolor.is_rgb (); }
  bool shadowcolor_is (const std::string& v) const { return shadowcolor.is (v); }
  Matrix get_shadowcolor_rgb (void) const { return (shadowcolor.is_rgb () ? shadowcolor.rgb () : Matrix ()); }
  octave_value get_shadowcolor (void) const { return shadowcolor.get (); }

  void execute_sizechangedfcn (const octave_value& data = octave_value ()) const { sizechangedfcn.execute (data); }
  octave_value get_sizechangedfcn (void) const { return sizechangedfcn.get (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }

  std::string get_title (void) const { return title.string_value (); }

  bool titleposition_is (const std::string& v) const { return titleposition.is (v); }
  std::string get_titleposition (void) const { return titleposition.current_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_backgroundcolor (const octave_value& val)
  {
      {
        if (backgroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_bordertype (const octave_value& val)
  {
      {
        if (bordertype.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_borderwidth (const octave_value& val)
  {
      {
        if (borderwidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clipping (const octave_value& val)
  {
      {
        if (clipping.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontangle (const octave_value& val)
  {
      {
        if (fontangle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontname (const octave_value& val)
  {
      {
        if (fontname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontsize (const octave_value& val)
  {
      {
        if (fontsize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontunits (const octave_value& val);

  void set_fontweight (const octave_value& val)
  {
      {
        if (fontweight.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_foregroundcolor (const octave_value& val)
  {
      {
        if (foregroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_highlightcolor (const octave_value& val)
  {
      {
        if (highlightcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_resizefcn (const octave_value& val)
  {
      {
        if (resizefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_selectedobject (const octave_value& val);

  void set_selectionchangedfcn (const octave_value& val)
  {
      {
        if (selectionchangedfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_shadowcolor (const octave_value& val)
  {
      {
        if (shadowcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_sizechangedfcn (const octave_value& val)
  {
      {
        if (sizechangedfcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val);

  void set_title (const octave_value& val)
  {
      {
        if (title.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_titleposition (const octave_value& val)
  {
      {
        if (titleposition.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      position.add_constraint (dim_vector (1, 4));
    }

    // void update_text_extent (void);
    // void update_string (void) { update_text_extent (); }
    // void update_fontname (void) { update_text_extent (); }
    // void update_fontsize (void) { update_text_extent (); }
    // void update_fontangle (void) { update_text_extent (); }
    // void update_fontweight (void) { update_text_extent (); }

    void update_units (const caseless_str& old_units);
    void update_fontunits (const caseless_str& old_units);

  };

private:
  properties xproperties;

public:
  uibuttongroup (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uibuttongroup (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

class OCTINTERP_API uipanel : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    Matrix get_boundingbox (bool internal = false,
                            const Matrix& parent_pix_size = Matrix ()) const;

    double get_fontsize_points (double box_pix_height = 0) const;

    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  color_property backgroundcolor;
  radio_property bordertype;
  double_property borderwidth;
  radio_property fontangle;
  string_property fontname;
  double_property fontsize;
  radio_property fontunits;
  radio_property fontweight;
  color_property foregroundcolor;
  color_property highlightcolor;
  array_property position;
  callback_property resizefcn;
  color_property shadowcolor;
  string_property title;
  radio_property titleposition;
  radio_property units;

public:

  enum
  {
    ID___OBJECT__ = 15000,
    ID_BACKGROUNDCOLOR = 15001,
    ID_BORDERTYPE = 15002,
    ID_BORDERWIDTH = 15003,
    ID_FONTANGLE = 15004,
    ID_FONTNAME = 15005,
    ID_FONTSIZE = 15006,
    ID_FONTUNITS = 15007,
    ID_FONTWEIGHT = 15008,
    ID_FOREGROUNDCOLOR = 15009,
    ID_HIGHLIGHTCOLOR = 15010,
    ID_POSITION = 15011,
    ID_RESIZEFCN = 15012,
    ID_SHADOWCOLOR = 15013,
    ID_TITLE = 15014,
    ID_TITLEPOSITION = 15015,
    ID_UNITS = 15016
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  bool backgroundcolor_is_rgb (void) const { return backgroundcolor.is_rgb (); }
  bool backgroundcolor_is (const std::string& v) const { return backgroundcolor.is (v); }
  Matrix get_backgroundcolor_rgb (void) const { return (backgroundcolor.is_rgb () ? backgroundcolor.rgb () : Matrix ()); }
  octave_value get_backgroundcolor (void) const { return backgroundcolor.get (); }

  bool bordertype_is (const std::string& v) const { return bordertype.is (v); }
  std::string get_bordertype (void) const { return bordertype.current_value (); }

  double get_borderwidth (void) const { return borderwidth.double_value (); }

  bool fontangle_is (const std::string& v) const { return fontangle.is (v); }
  std::string get_fontangle (void) const { return fontangle.current_value (); }

  std::string get_fontname (void) const { return fontname.string_value (); }

  double get_fontsize (void) const { return fontsize.double_value (); }

  bool fontunits_is (const std::string& v) const { return fontunits.is (v); }
  std::string get_fontunits (void) const { return fontunits.current_value (); }

  bool fontweight_is (const std::string& v) const { return fontweight.is (v); }
  std::string get_fontweight (void) const { return fontweight.current_value (); }

  bool foregroundcolor_is_rgb (void) const { return foregroundcolor.is_rgb (); }
  bool foregroundcolor_is (const std::string& v) const { return foregroundcolor.is (v); }
  Matrix get_foregroundcolor_rgb (void) const { return (foregroundcolor.is_rgb () ? foregroundcolor.rgb () : Matrix ()); }
  octave_value get_foregroundcolor (void) const { return foregroundcolor.get (); }

  bool highlightcolor_is_rgb (void) const { return highlightcolor.is_rgb (); }
  bool highlightcolor_is (const std::string& v) const { return highlightcolor.is (v); }
  Matrix get_highlightcolor_rgb (void) const { return (highlightcolor.is_rgb () ? highlightcolor.rgb () : Matrix ()); }
  octave_value get_highlightcolor (void) const { return highlightcolor.get (); }

  octave_value get_position (void) const { return position.get (); }

  void execute_resizefcn (const octave_value& data = octave_value ()) const { resizefcn.execute (data); }
  octave_value get_resizefcn (void) const { return resizefcn.get (); }

  bool shadowcolor_is_rgb (void) const { return shadowcolor.is_rgb (); }
  bool shadowcolor_is (const std::string& v) const { return shadowcolor.is (v); }
  Matrix get_shadowcolor_rgb (void) const { return (shadowcolor.is_rgb () ? shadowcolor.rgb () : Matrix ()); }
  octave_value get_shadowcolor (void) const { return shadowcolor.get (); }

  std::string get_title (void) const { return title.string_value (); }

  bool titleposition_is (const std::string& v) const { return titleposition.is (v); }
  std::string get_titleposition (void) const { return titleposition.current_value (); }

  bool units_is (const std::string& v) const { return units.is (v); }
  std::string get_units (void) const { return units.current_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_backgroundcolor (const octave_value& val)
  {
      {
        if (backgroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_bordertype (const octave_value& val)
  {
      {
        if (bordertype.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_borderwidth (const octave_value& val)
  {
      {
        if (borderwidth.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontangle (const octave_value& val)
  {
      {
        if (fontangle.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontname (const octave_value& val)
  {
      {
        if (fontname.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontsize (const octave_value& val)
  {
      {
        if (fontsize.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_fontunits (const octave_value& val);

  void set_fontweight (const octave_value& val)
  {
      {
        if (fontweight.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_foregroundcolor (const octave_value& val)
  {
      {
        if (foregroundcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_highlightcolor (const octave_value& val)
  {
      {
        if (highlightcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_position (const octave_value& val)
  {
      {
        if (position.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_resizefcn (const octave_value& val)
  {
      {
        if (resizefcn.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_shadowcolor (const octave_value& val)
  {
      {
        if (shadowcolor.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_title (const octave_value& val)
  {
      {
        if (title.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_titleposition (const octave_value& val)
  {
      {
        if (titleposition.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_units (const octave_value& val);


  protected:
    void init (void)
    {
      position.add_constraint (dim_vector (1, 4));
    }

    void update_units (const caseless_str& old_units);
    void update_fontunits (const caseless_str& old_units);

  };

private:
  properties xproperties;

public:
  uipanel (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uipanel (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }
};

// ---------------------------------------------------------------------

class OCTINTERP_API uitoolbar : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;

public:

  enum
  {
    ID___OBJECT__ = 16000
  };

  octave_value get___object__ (void) const { return __object__.get (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    { }
  };

private:
  properties xproperties;

public:
  uitoolbar (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p), default_properties ()
  { }

  ~uitoolbar (void) { }

  void override_defaults (base_graphics_object& obj)
  {
    // Allow parent (figure) to override first (properties knows how
    // to find the parent object).
    xproperties.override_defaults (obj);

    // Now override with our defaults.  If the default_properties
    // list includes the properties for all defaults (line,
    // surface, etc.) then we don't have to know the type of OBJ
    // here, we just call its set function and let it decide which
    // properties from the list to use.
    obj.set_from_list (default_properties);
  }

  void set (const caseless_str& name, const octave_value& value)
  {
    if (name.compare ("default", 7))
      // strip "default", pass rest to function that will
      // parse the remainder and add the element to the
      // default_properties map.
      default_properties.set (name.substr (7), value);
    else
      xproperties.set (name, value);
  }

  octave_value get (const caseless_str& name) const
  {
    octave_value retval;

    if (name.compare ("default", 7))
      retval = get_default (name.substr (7));
    else
      retval = xproperties.get (name);

    return retval;
  }

  octave_value get_default (const caseless_str& name) const;

  octave_value get_defaults (void) const
  {
    return default_properties.as_struct ("default");
  }

  property_list get_defaults_list (void) const
  {
    return default_properties;
  }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  void reset_default_properties (void);

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

private:
  property_list default_properties;
};

// ---------------------------------------------------------------------

class OCTINTERP_API uipushtool : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  array_property cdata;
  callback_property clickedcallback;
  bool_property enable;
  bool_property separator;
  string_property tooltipstring;

public:

  enum
  {
    ID___OBJECT__ = 17000,
    ID_CDATA = 17001,
    ID_CLICKEDCALLBACK = 17002,
    ID_ENABLE = 17003,
    ID_SEPARATOR = 17004,
    ID_TOOLTIPSTRING = 17005
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  void execute_clickedcallback (const octave_value& data = octave_value ()) const { clickedcallback.execute (data); }
  octave_value get_clickedcallback (void) const { return clickedcallback.get (); }

  bool is_enable (void) const { return enable.is_on (); }
  std::string get_enable (void) const { return enable.current_value (); }

  bool is_separator (void) const { return separator.is_on (); }
  std::string get_separator (void) const { return separator.current_value (); }

  std::string get_tooltipstring (void) const { return tooltipstring.string_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clickedcallback (const octave_value& val)
  {
      {
        if (clickedcallback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_enable (const octave_value& val)
  {
      {
        if (enable.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_separator (const octave_value& val)
  {
      {
        if (separator.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_tooltipstring (const octave_value& val)
  {
      {
        if (tooltipstring.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      cdata.add_constraint ("double");
      cdata.add_constraint ("single");
      cdata.add_constraint (dim_vector (-1, -1, 3));
    }
  };

private:
  properties xproperties;

public:
  uipushtool (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uipushtool (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

class OCTINTERP_API uitoggletool : public base_graphics_object
{
public:
  class OCTINTERP_API properties : public base_properties
  {
  public:
    // See the genprops.awk script for an explanation of the
    // properties declarations.
    // Programming note: Keep property list sorted if new ones are added.

public:
  properties (const graphics_handle& mh, const graphics_handle& p);

  ~properties (void) { }

  void set (const caseless_str& pname, const octave_value& val);

  octave_value get (bool all = false) const;

  octave_value get (const caseless_str& pname) const;

  octave_value get (const std::string& pname) const
  {
    return get (caseless_str (pname));
  }

  octave_value get (const char *pname) const
  {
    return get (caseless_str (pname));
  }

  property get_property (const caseless_str& pname);

  std::string graphics_object_name (void) const { return go_name; }

  static property_list::pval_map_type factory_defaults (void);

private:
  static std::string go_name;

public:


  static std::set<std::string> core_property_names (void);

  static std::set<std::string> readonly_property_names (void);

  static bool has_core_property (const caseless_str& pname);

  static bool has_readonly_property (const caseless_str& pname);

  std::set<std::string> all_property_names (void) const;

  bool has_property (const caseless_str& pname) const;

private:

  any_property __object__;
  array_property cdata;
  callback_property clickedcallback;
  bool_property enable;
  callback_property offcallback;
  callback_property oncallback;
  bool_property separator;
  bool_property state;
  string_property tooltipstring;

public:

  enum
  {
    ID___OBJECT__ = 18000,
    ID_CDATA = 18001,
    ID_CLICKEDCALLBACK = 18002,
    ID_ENABLE = 18003,
    ID_OFFCALLBACK = 18004,
    ID_ONCALLBACK = 18005,
    ID_SEPARATOR = 18006,
    ID_STATE = 18007,
    ID_TOOLTIPSTRING = 18008
  };

  octave_value get___object__ (void) const { return __object__.get (); }

  octave_value get_cdata (void) const { return cdata.get (); }

  void execute_clickedcallback (const octave_value& data = octave_value ()) const { clickedcallback.execute (data); }
  octave_value get_clickedcallback (void) const { return clickedcallback.get (); }

  bool is_enable (void) const { return enable.is_on (); }
  std::string get_enable (void) const { return enable.current_value (); }

  void execute_offcallback (const octave_value& data = octave_value ()) const { offcallback.execute (data); }
  octave_value get_offcallback (void) const { return offcallback.get (); }

  void execute_oncallback (const octave_value& data = octave_value ()) const { oncallback.execute (data); }
  octave_value get_oncallback (void) const { return oncallback.get (); }

  bool is_separator (void) const { return separator.is_on (); }
  std::string get_separator (void) const { return separator.current_value (); }

  bool is_state (void) const { return state.is_on (); }
  std::string get_state (void) const { return state.current_value (); }

  std::string get_tooltipstring (void) const { return tooltipstring.string_value (); }


  void set___object__ (const octave_value& val)
  {
      {
        if (__object__.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_cdata (const octave_value& val)
  {
      {
        if (cdata.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_clickedcallback (const octave_value& val)
  {
      {
        if (clickedcallback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_enable (const octave_value& val)
  {
      {
        if (enable.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_offcallback (const octave_value& val)
  {
      {
        if (offcallback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_oncallback (const octave_value& val)
  {
      {
        if (oncallback.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_separator (const octave_value& val)
  {
      {
        if (separator.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_state (const octave_value& val)
  {
      {
        if (state.set (val, true))
          {
            mark_modified ();
          }
      }
  }

  void set_tooltipstring (const octave_value& val)
  {
      {
        if (tooltipstring.set (val, true))
          {
            mark_modified ();
          }
      }
  }


  protected:
    void init (void)
    {
      cdata.add_constraint ("double");
      cdata.add_constraint ("single");
      cdata.add_constraint (dim_vector (-1, -1, 3));
    }
  };

private:
  properties xproperties;

public:
  uitoggletool (const graphics_handle& mh, const graphics_handle& p)
    : base_graphics_object (), xproperties (mh, p)
  { }

  ~uitoggletool (void) { }

  base_properties& get_properties (void) { return xproperties; }

  const base_properties& get_properties (void) const { return xproperties; }

  bool valid_object (void) const { return true; }

  bool has_readonly_property (const caseless_str& pname) const
  {
    bool retval = xproperties.has_readonly_property (pname);
    if (! retval)
      retval = base_properties::has_readonly_property (pname);
    return retval;
  }

};

// ---------------------------------------------------------------------

octave_value
get_property_from_handle (double handle, const std::string& property,
                          const std::string& func);
bool
set_property_in_handle (double handle, const std::string& property,
                        const octave_value& arg, const std::string& func);

// ---------------------------------------------------------------------

class graphics_event;

class
base_graphics_event
{
public:
  friend class graphics_event;

  base_graphics_event (void) : count (1) { }

  virtual ~base_graphics_event (void) { }

  virtual void execute (void) = 0;

private:
  octave_refcount<int> count;
};

class
graphics_event
{
public:
  typedef void (*event_fcn) (void*);

  graphics_event (void) : rep (0) { }

  graphics_event (const graphics_event& e) : rep (e.rep)
  {
    rep->count++;
  }

  ~graphics_event (void)
  {
    if (rep && --rep->count == 0)
      delete rep;
  }

  graphics_event& operator = (const graphics_event& e)
  {
    if (rep != e.rep)
      {
        if (rep && --rep->count == 0)
          delete rep;

        rep = e.rep;
        if (rep)
          rep->count++;
      }

    return *this;
  }

  void execute (void)
  { if (rep) rep->execute (); }

  bool ok (void) const
  { return (rep != 0); }

  static graphics_event
  create_callback_event (const graphics_handle& h,
                         const std::string& name,
                         const octave_value& data = Matrix ());

  static graphics_event
  create_callback_event (const graphics_handle& h,
                         const octave_value& cb,
                         const octave_value& data = Matrix ());

  static graphics_event
  create_function_event (event_fcn fcn, void *data = 0);

  static graphics_event
  create_set_event (const graphics_handle& h, const std::string& name,
                    const octave_value& value,
                    bool notify_toolkit = true);
private:
  base_graphics_event *rep;
};

class OCTINTERP_API gh_manager
{
protected:

  gh_manager (void);

public:

  static void create_instance (void);

  static bool instance_ok (void)
  {
    bool retval = true;

    if (! instance)
      create_instance ();

    if (! instance)
      error ("unable to create gh_manager!");

    return retval;
  }

  static void cleanup_instance (void) { delete instance; instance = 0; }

  static graphics_handle get_handle (bool integer_figure_handle)
  {
    return instance_ok ()
           ? instance->do_get_handle (integer_figure_handle)
           : graphics_handle ();
  }

  static void free (const graphics_handle& h)
  {
    if (instance_ok ())
      instance->do_free (h);
  }

  static void renumber_figure (const graphics_handle& old_gh,
                               const graphics_handle& new_gh)
  {
    if (instance_ok ())
      instance->do_renumber_figure (old_gh, new_gh);
  }

  static graphics_handle lookup (double val)
  {
    return instance_ok () ? instance->do_lookup (val) : graphics_handle ();
  }

  static graphics_handle lookup (const octave_value& val)
  {
    return val.is_real_scalar ()
           ? lookup (val.double_value ()) : graphics_handle ();
  }

  static graphics_object get_object (double val)
  {
    return get_object (lookup (val));
  }

  static graphics_object get_object (const graphics_handle& h)
  {
    return instance_ok () ? instance->do_get_object (h) : graphics_object ();
  }

  static graphics_handle
  make_graphics_handle (const std::string& go_name,
                        const graphics_handle& parent,
                        bool integer_figure_handle = false,
                        bool do_createfcn = true,
                        bool do_notify_toolkit = true)
  {
    return instance_ok ()
           ? instance->do_make_graphics_handle (go_name, parent,
               integer_figure_handle,
               do_createfcn, do_notify_toolkit)
           : graphics_handle ();
  }

  static graphics_handle make_figure_handle (double val,
                                             bool do_notify_toolkit = true)
  {
    return instance_ok ()
           ? instance->do_make_figure_handle (val, do_notify_toolkit)
           : graphics_handle ();
  }

  static void push_figure (const graphics_handle& h)
  {
    if (instance_ok ())
      instance->do_push_figure (h);
  }

  static void pop_figure (const graphics_handle& h)
  {
    if (instance_ok ())
      instance->do_pop_figure (h);
  }

  static graphics_handle current_figure (void)
  {
    return instance_ok ()
           ? instance->do_current_figure () : graphics_handle ();
  }

  static Matrix handle_list (bool show_hidden = false)
  {
    return instance_ok ()
           ? instance->do_handle_list (show_hidden) : Matrix ();
  }

  static void lock (void)
  {
    if (instance_ok ())
      instance->do_lock ();
  }

  static bool try_lock (void)
  {
    if (instance_ok ())
      return instance->do_try_lock ();
    else
      return false;
  }

  static void unlock (void)
  {
    if (instance_ok ())
      instance->do_unlock ();
  }

  static Matrix figure_handle_list (bool show_hidden = false)
  {
    return instance_ok ()
           ? instance->do_figure_handle_list (show_hidden) : Matrix ();
  }

  static void execute_listener (const graphics_handle& h,
                                const octave_value& l)
  {
    if (instance_ok ())
      instance->do_execute_listener (h, l);
  }

  static void execute_callback (const graphics_handle& h,
                                const std::string& name,
                                const octave_value& data = Matrix ())
  {
    octave_value cb;

    if (true)
      {
        gh_manager::auto_lock lock;

        graphics_object go = get_object (h);

        if (go.valid_object ())
          cb = go.get (name);
      }

    execute_callback (h, cb, data);
  }

  static void execute_callback (const graphics_handle& h,
                                const octave_value& cb,
                                const octave_value& data = Matrix ())
  {
    if (instance_ok ())
      instance->do_execute_callback (h, cb, data);
  }

  static void post_callback (const graphics_handle& h,
                             const std::string& name,
                             const octave_value& data = Matrix ())
  {
    if (instance_ok ())
      instance->do_post_callback (h, name, data);
  }

  static void post_function (graphics_event::event_fcn fcn, void* data = 0)
  {
    if (instance_ok ())
      instance->do_post_function (fcn, data);
  }

  static void post_set (const graphics_handle& h, const std::string& name,
                        const octave_value& value, bool notify_toolkit = true)
  {
    if (instance_ok ())
      instance->do_post_set (h, name, value, notify_toolkit);
  }

  static int process_events (void)
  {
    return (instance_ok () ?  instance->do_process_events () : 0);
  }

  static int flush_events (void)
  {
    return (instance_ok () ?  instance->do_process_events (true) : 0);
  }

  static void enable_event_processing (bool enable = true)
  {
    if (instance_ok ())
      instance->do_enable_event_processing (enable);
  }

  static bool is_handle_visible (const graphics_handle& h)
  {
    bool retval = false;

    graphics_object go = get_object (h);

    if (go.valid_object ())
      retval = go.is_handle_visible ();

    return retval;
  }

  static void close_all_figures (void)
  {
    if (instance_ok ())
      instance->do_close_all_figures ();
  }

public:
  class auto_lock : public octave_autolock
  {
  public:
    auto_lock (bool wait = true)
      : octave_autolock (instance_ok ()
                         ? instance->graphics_lock
                         : octave_mutex (),
                         wait)
    { }

  private:

    // No copying!
    auto_lock (const auto_lock&);
    auto_lock& operator = (const auto_lock&);
  };

private:

  static gh_manager *instance;

  typedef std::map<graphics_handle, graphics_object>::iterator iterator;
  typedef std::map<graphics_handle, graphics_object>::const_iterator
    const_iterator;

  typedef std::set<graphics_handle>::iterator free_list_iterator;
  typedef std::set<graphics_handle>::const_iterator const_free_list_iterator;

  typedef std::list<graphics_handle>::iterator figure_list_iterator;
  typedef std::list<graphics_handle>::const_iterator const_figure_list_iterator;

  // A map of handles to graphics objects.
  std::map<graphics_handle, graphics_object> handle_map;

  // The available graphics handles.
  std::set<graphics_handle> handle_free_list;

  // The next handle available if handle_free_list is empty.
  double next_handle;

  // The allocated figure handles.  Top of the stack is most recently
  // created.
  std::list<graphics_handle> figure_list;

  // The lock for accessing the graphics sytsem.
  octave_mutex graphics_lock;

  // The list of events queued by graphics toolkits.
  std::list<graphics_event> event_queue;

  // The stack of callback objects.
  std::list<graphics_object> callback_objects;

  // A flag telling whether event processing must be constantly on.
  int event_processing;

  graphics_handle do_get_handle (bool integer_figure_handle);

  void do_free (const graphics_handle& h);

  void do_renumber_figure (const graphics_handle& old_gh,
                           const graphics_handle& new_gh);

  graphics_handle do_lookup (double val)
  {
    iterator p = (octave::math::isnan (val) ? handle_map.end ()
                                            : handle_map.find (val));

    return (p != handle_map.end ()) ? p->first : graphics_handle ();
  }

  graphics_object do_get_object (const graphics_handle& h)
  {
    iterator p = (h.ok () ? handle_map.find (h) : handle_map.end ());

    return (p != handle_map.end ()) ? p->second : graphics_object ();
  }

  graphics_handle do_make_graphics_handle (const std::string& go_name,
                                           const graphics_handle& p,
                                           bool integer_figure_handle,
                                           bool do_createfcn,
                                           bool do_notify_toolkit);

  graphics_handle do_make_figure_handle (double val, bool do_notify_toolkit);

  Matrix do_handle_list (bool show_hidden)
  {
    Matrix retval (1, handle_map.size ());

    octave_idx_type i = 0;
    for (const auto& h_iter : handle_map)
      {
        graphics_handle h = h_iter.first;

        if (show_hidden || is_handle_visible (h))
          retval(i++) = h.value ();
      }

    retval.resize (1, i);

    return retval;
  }

  Matrix do_figure_handle_list (bool show_hidden)
  {
    Matrix retval (1, figure_list.size ());

    octave_idx_type i = 0;
    for (const auto& hfig : figure_list)
      {
        if (show_hidden || is_handle_visible (hfig))
          retval(i++) = hfig.value ();
      }

    retval.resize (1, i);

    return retval;
  }

  void do_push_figure (const graphics_handle& h);

  void do_pop_figure (const graphics_handle& h);

  graphics_handle do_current_figure (void) const
  {
    graphics_handle retval;

    for (const auto& hfig : figure_list)
      {
        if (is_handle_visible (hfig))
          retval = hfig;
      }

    return retval;
  }

  void do_lock (void) { graphics_lock.lock (); }

  bool do_try_lock (void) { return graphics_lock.try_lock (); }

  void do_unlock (void) { graphics_lock.unlock (); }

  void do_execute_listener (const graphics_handle& h, const octave_value& l);

  void do_execute_callback (const graphics_handle& h, const octave_value& cb,
                            const octave_value& data);

  void do_post_callback (const graphics_handle& h, const std::string& name,
                         const octave_value& data);

  void do_post_function (graphics_event::event_fcn fcn, void* fcn_data);

  void do_post_set (const graphics_handle& h, const std::string& name,
                    const octave_value& value, bool notify_toolkit = true);

  int do_process_events (bool force = false);

  void do_close_all_figures (void);

  static void restore_gcbo (void)
  {
    if (instance_ok ())
      instance->do_restore_gcbo ();
  }

  void do_restore_gcbo (void);

  void do_post_event (const graphics_event& e);

  void do_enable_event_processing (bool enable = true);
};

void get_children_limits (double& min_val, double& max_val,
                          double& min_pos, double& max_neg,
                          const Matrix& kids, char limit_type);

OCTINTERP_API int calc_dimensions (const graphics_object& gh);

// This function is NOT equivalent to the scripting language function gcf.
OCTINTERP_API graphics_handle gcf (void);

// This function is NOT equivalent to the scripting language function gca.
OCTINTERP_API graphics_handle gca (void);

OCTINTERP_API void close_all_figures (void);

#endif
