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
static const char *ng0 = "C:/Xilinx/Lab3/branc_add.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0298511953_3212880686_p_0(char *t0)
{
    char t10[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 1192U);
    t12 = *((char **)t11);
    t11 = (t0 + 4596U);
    t13 = (t0 + 1352U);
    t14 = *((char **)t13);
    t13 = (t0 + 4612U);
    t15 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t10, t12, t11, t14, t13);
    t16 = (t10 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB7;

LAB8:    t20 = (t0 + 3072);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t15, 32U);
    xsi_driver_first_trans_fast_port(t20);

LAB2:    t25 = (t0 + 2992);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 3072);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

LAB7:    xsi_size_not_matching(32U, t18, 0);
    goto LAB8;

}


extern void work_a_0298511953_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0298511953_3212880686_p_0};
	xsi_register_didat("work_a_0298511953_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_0298511953_3212880686.didat");
	xsi_register_executes(pe);
}
