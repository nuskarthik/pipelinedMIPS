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
static const char *ng0 = "C:/Xilinx/Lab3/add.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_2580317397_3212880686_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char t5[16];
    char t10[16];
    char t19[16];
    char t21[16];
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned char t18;
    char *t20;
    char *t22;
    char *t23;
    int t24;
    unsigned int t25;
    char *t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(23, ng0);

LAB3:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 5636U);
    t3 = xsi_base_array_concat(t3, t5, t6, (char)99, (unsigned char)2, (char)97, t4, t7, (char)101);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t11 = ((IEEE_P_2592010699) + 4024);
    t12 = (t0 + 5652U);
    t8 = xsi_base_array_concat(t8, t10, t11, (char)99, (unsigned char)2, (char)97, t9, t12, (char)101);
    t13 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t2, t3, t5, t8, t10);
    t14 = (t0 + 5806);
    t16 = (t0 + 1032U);
    t17 = *((char **)t16);
    t18 = *((unsigned char *)t17);
    t20 = ((IEEE_P_1242562249) + 3000);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 31;
    t23 = (t22 + 8U);
    *((int *)t23) = 1;
    t24 = (31 - 0);
    t25 = (t24 * 1);
    t25 = (t25 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t25;
    t16 = xsi_base_array_concat(t16, t19, t20, (char)97, t14, t21, (char)99, t18, (char)101);
    t23 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t1, t13, t2, t16, t19);
    t26 = (t1 + 12U);
    t25 = *((unsigned int *)t26);
    t27 = (1U * t25);
    t28 = (33U != t27);
    if (t28 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 3920);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t23, 33U);
    xsi_driver_first_trans_fast(t29);

LAB2:    t34 = (t0 + 3808);
    *((int *)t34) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(33U, t27, 0);
    goto LAB6;

}

static void work_a_2580317397_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(25, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (32 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3984);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 3824);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2580317397_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(26, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = (32 - 32);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 4048);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3840);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2580317397_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2580317397_3212880686_p_0,(void *)work_a_2580317397_3212880686_p_1,(void *)work_a_2580317397_3212880686_p_2};
	xsi_register_didat("work_a_2580317397_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_2580317397_3212880686.didat");
	xsi_register_executes(pe);
}
