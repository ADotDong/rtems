dnl
dnl  $Id$
dnl 

dnl check for i386 gas supporting 16 bit mode
dnl     - binutils 2.9.1.0.7 and higher

AC_DEFUN(RTEMS_I386_GAS_CODE16,
  if test "${target_cpu}" = "i386"; then
    AC_CACHE_CHECK([for 16 bit mode assembler support],
      rtems_cv_prog_gas_code16,
      [cat > conftest.s << EOF
         .code16
         data32
         addr32
         lgdt
         0
EOF
      if AC_TRY_COMMAND($AS_FOR_TARGET -o conftest.o conftest.s); then
        rtems_cv_prog_gas_code16=yes
      else
        rtems_cv_prog_gas_code16=no
      fi])
    RTEMS_GAS_CODE16="$rtems_cv_prog_gas_code16"
  fi
)

