// DO NOT EDIT -- generated by mk-ops.awk
#if ! defined (octave_smx_sm_cm_h)
#define octave_smx_sm_cm_h 1
#include "octave-config.h"
#include "CMatrix.h"
#include "CSparse.h"
#include "dSparse.h"
#include "mx-s-cm.h"
#include "mx-cm-s.h"
#include "mx-m-cm.h"
#include "mx-cm-m.h"
#include "mx-s-cnda.h"
#include "mx-cnda-s.h"
#include "Sparse-op-defs.h"
SPARSE_SMM_BIN_OP_DECLS (ComplexMatrix, SparseComplexMatrix, SparseMatrix, ComplexMatrix, OCTAVE_API)
SPARSE_SMM_CMP_OP_DECLS (SparseMatrix, ComplexMatrix, OCTAVE_API)
SPARSE_SMM_BOOL_OP_DECLS (SparseMatrix, ComplexMatrix, OCTAVE_API)
#endif