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
static const char *ng0 = "C:/Xilinx/Lab3/link_mux.vhd";



static void work_a_2666824337_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned char t25;
    char *t26;
    char *t27;
    unsigned char t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned char t36;
    unsigned int t37;
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
    char *t50;

LAB0:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t4 = (t0 + 4625);
    t7 = 1;
    if (2U == 2U)
        goto LAB14;

LAB15:    t7 = 0;

LAB16:    if (t7 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t18 = (t0 + 1192U);
    t19 = *((char **)t18);
    t18 = (t0 + 4632);
    t21 = 1;
    if (2U == 2U)
        goto LAB26;

LAB27:    t21 = 0;

LAB28:    t2 = t21;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 1192U);
    t27 = *((char **)t26);
    t26 = (t0 + 4634);
    t29 = 1;
    if (2U == 2U)
        goto LAB35;

LAB36:    t29 = 0;

LAB37:    if (t29 == 1)
        goto LAB32;

LAB33:    t25 = (unsigned char)0;

LAB34:    t1 = t25;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB47:    t45 = (t0 + 3072);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    t48 = (t47 + 56U);
    t49 = *((char **)t48);
    *((unsigned char *)t49) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t45);

LAB2:    t50 = (t0 + 2992);
    *((int *)t50) = 1;

LAB1:    return;
LAB3:    t40 = (t0 + 3072);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    *((unsigned char *)t44) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t40);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t11 = (t0 + 1352U);
    t12 = *((char **)t11);
    t11 = (t0 + 4627);
    t14 = 1;
    if (5U == 5U)
        goto LAB20;

LAB21:    t14 = 0;

LAB22:    t3 = t14;
    goto LAB13;

LAB14:    t8 = 0;

LAB17:    if (t8 < 2U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t9 = (t5 + t8);
    t10 = (t4 + t8);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB15;

LAB19:    t8 = (t8 + 1);
    goto LAB17;

LAB20:    t15 = 0;

LAB23:    if (t15 < 5U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t16 = (t12 + t15);
    t17 = (t11 + t15);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB21;

LAB25:    t15 = (t15 + 1);
    goto LAB23;

LAB26:    t22 = 0;

LAB29:    if (t22 < 2U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t23 = (t19 + t22);
    t24 = (t18 + t22);
    if (*((unsigned char *)t23) != *((unsigned char *)t24))
        goto LAB27;

LAB31:    t22 = (t22 + 1);
    goto LAB29;

LAB32:    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t33 = (t0 + 4636);
    t36 = 1;
    if (6U == 6U)
        goto LAB41;

LAB42:    t36 = 0;

LAB43:    t25 = t36;
    goto LAB34;

LAB35:    t30 = 0;

LAB38:    if (t30 < 2U)
        goto LAB39;
    else
        goto LAB37;

LAB39:    t31 = (t27 + t30);
    t32 = (t26 + t30);
    if (*((unsigned char *)t31) != *((unsigned char *)t32))
        goto LAB36;

LAB40:    t30 = (t30 + 1);
    goto LAB38;

LAB41:    t37 = 0;

LAB44:    if (t37 < 6U)
        goto LAB45;
    else
        goto LAB43;

LAB45:    t38 = (t34 + t37);
    t39 = (t33 + t37);
    if (*((unsigned char *)t38) != *((unsigned char *)t39))
        goto LAB42;

LAB46:    t37 = (t37 + 1);
    goto LAB44;

LAB48:    goto LAB2;

}


extern void work_a_2666824337_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2666824337_3212880686_p_0};
	xsi_register_didat("work_a_2666824337_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_2666824337_3212880686.didat");
	xsi_register_executes(pe);
}
