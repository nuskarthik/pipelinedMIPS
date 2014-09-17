/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Xilinx/Lab3/jump_mux.vhd";



static void work_a_3814580604_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned char t22;
    char *t23;
    char *t24;
    unsigned char t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned char t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5152);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t15 = (t0 + 5154);
    t18 = 1;
    if (2U == 2U)
        goto LAB16;

LAB17:    t18 = 0;

LAB18:    if (t18 == 1)
        goto LAB13;

LAB14:    t14 = (unsigned char)0;

LAB15:    if (t14 != 0)
        goto LAB11;

LAB12:
LAB37:    t43 = (t0 + 1512U);
    t44 = *((char **)t43);
    t43 = (t0 + 3392);
    t45 = (t43 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memcpy(t48, t44, 32U);
    xsi_driver_first_trans_fast_port(t43);

LAB2:    t49 = (t0 + 3312);
    *((int *)t49) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 3392);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t37 = (t0 + 1672U);
    t38 = *((char **)t37);
    t37 = (t0 + 3392);
    t39 = (t37 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    memcpy(t42, t38, 32U);
    xsi_driver_first_trans_fast_port(t37);
    goto LAB2;

LAB13:    t23 = (t0 + 1032U);
    t24 = *((char **)t23);
    t23 = (t0 + 5156);
    t26 = 1;
    if (6U == 6U)
        goto LAB25;

LAB26:    t26 = 0;

LAB27:    if (t26 == 1)
        goto LAB22;

LAB23:    t30 = (t0 + 1032U);
    t31 = *((char **)t30);
    t30 = (t0 + 5162);
    t33 = 1;
    if (6U == 6U)
        goto LAB31;

LAB32:    t33 = 0;

LAB33:    t22 = t33;

LAB24:    t14 = t22;
    goto LAB15;

LAB16:    t19 = 0;

LAB19:    if (t19 < 2U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t20 = (t16 + t19);
    t21 = (t15 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB17;

LAB21:    t19 = (t19 + 1);
    goto LAB19;

LAB22:    t22 = (unsigned char)1;
    goto LAB24;

LAB25:    t27 = 0;

LAB28:    if (t27 < 6U)
        goto LAB29;
    else
        goto LAB27;

LAB29:    t28 = (t24 + t27);
    t29 = (t23 + t27);
    if (*((unsigned char *)t28) != *((unsigned char *)t29))
        goto LAB26;

LAB30:    t27 = (t27 + 1);
    goto LAB28;

LAB31:    t34 = 0;

LAB34:    if (t34 < 6U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t35 = (t31 + t34);
    t36 = (t30 + t34);
    if (*((unsigned char *)t35) != *((unsigned char *)t36))
        goto LAB32;

LAB36:    t34 = (t34 + 1);
    goto LAB34;

LAB38:    goto LAB2;

}


extern void work_a_3814580604_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3814580604_3212880686_p_0};
	xsi_register_didat("work_a_3814580604_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_3814580604_3212880686.didat");
	xsi_register_executes(pe);
}
