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
static const char *ng0 = "C:/Xilinx/Lab3/data_memory.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1632567566_3212880686_p_0(char *t0)
{
    char t20[16];
    char t33[16];
    char t34[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t21;
    char *t22;
    int t23;
    unsigned int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    int t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1632U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4200);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1352U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(32, ng0);
    t4 = (t0 + 1192U);
    t11 = *((char **)t4);
    t12 = (31 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t4 = (t11 + t14);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t17 = (31 - 8);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t15 = (t16 + t19);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 8;
    t22 = (t21 + 4U);
    *((int *)t22) = 0;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t23 = (0 - 8);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t24;
    t25 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t15, t20);
    t26 = (t25 - 0);
    t24 = (t26 * 1);
    t27 = (8U * t24);
    t28 = (0U + t27);
    t22 = (t0 + 4296);
    t29 = (t22 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t4, 8U);
    xsi_driver_first_trans_delta(t22, t28, 8U, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (31 - 15);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 1032U);
    t8 = *((char **)t5);
    t17 = (31 - 8);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t5 = (t8 + t19);
    t11 = (t0 + 10967);
    t21 = ((IEEE_P_2592010699) + 4024);
    t22 = (t33 + 0U);
    t29 = (t22 + 0U);
    *((int *)t29) = 8;
    t29 = (t22 + 4U);
    *((int *)t29) = 2;
    t29 = (t22 + 8U);
    *((int *)t29) = -1;
    t23 = (2 - 8);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t29 = (t22 + 12U);
    *((unsigned int *)t29) = t24;
    t29 = (t34 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 0;
    t30 = (t29 + 4U);
    *((int *)t30) = 1;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t25 = (1 - 0);
    t24 = (t25 * 1);
    t24 = (t24 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t24;
    t16 = xsi_base_array_concat(t16, t20, t21, (char)97, t5, t33, (char)97, t11, t34, (char)101);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t20);
    t35 = (t26 - 0);
    t24 = (t35 * 1);
    t27 = (8U * t24);
    t28 = (0U + t27);
    t30 = (t0 + 4296);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t2, 8U);
    xsi_driver_first_trans_delta(t30, t28, 8U, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (31 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 1032U);
    t8 = *((char **)t5);
    t17 = (31 - 8);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t5 = (t8 + t19);
    t11 = (t0 + 10969);
    t21 = ((IEEE_P_2592010699) + 4024);
    t22 = (t33 + 0U);
    t29 = (t22 + 0U);
    *((int *)t29) = 8;
    t29 = (t22 + 4U);
    *((int *)t29) = 2;
    t29 = (t22 + 8U);
    *((int *)t29) = -1;
    t23 = (2 - 8);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t29 = (t22 + 12U);
    *((unsigned int *)t29) = t24;
    t29 = (t34 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 0;
    t30 = (t29 + 4U);
    *((int *)t30) = 1;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t25 = (1 - 0);
    t24 = (t25 * 1);
    t24 = (t24 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t24;
    t16 = xsi_base_array_concat(t16, t20, t21, (char)97, t5, t33, (char)97, t11, t34, (char)101);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t20);
    t35 = (t26 - 0);
    t24 = (t35 * 1);
    t27 = (8U * t24);
    t28 = (0U + t27);
    t30 = (t0 + 4296);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t2, 8U);
    xsi_driver_first_trans_delta(t30, t28, 8U, 0LL);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t12 = (31 - 31);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t4 + t14);
    t5 = (t0 + 1032U);
    t8 = *((char **)t5);
    t17 = (31 - 8);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t5 = (t8 + t19);
    t11 = (t0 + 10971);
    t21 = ((IEEE_P_2592010699) + 4024);
    t22 = (t33 + 0U);
    t29 = (t22 + 0U);
    *((int *)t29) = 8;
    t29 = (t22 + 4U);
    *((int *)t29) = 2;
    t29 = (t22 + 8U);
    *((int *)t29) = -1;
    t23 = (2 - 8);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t29 = (t22 + 12U);
    *((unsigned int *)t29) = t24;
    t29 = (t34 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 0;
    t30 = (t29 + 4U);
    *((int *)t30) = 1;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t25 = (1 - 0);
    t24 = (t25 * 1);
    t24 = (t24 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t24;
    t16 = xsi_base_array_concat(t16, t20, t21, (char)97, t5, t33, (char)97, t11, t34, (char)101);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t20);
    t35 = (t26 - 0);
    t24 = (t35 * 1);
    t27 = (8U * t24);
    t28 = (0U + t27);
    t30 = (t0 + 4296);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t2, 8U);
    xsi_driver_first_trans_delta(t30, t28, 8U, 0LL);
    goto LAB9;

}

static void work_a_1632567566_3212880686_p_1(char *t0)
{
    char t25[16];
    char t27[16];
    char t32[16];
    char t44[16];
    char t46[16];
    char t59[16];
    char t61[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t26;
    char *t28;
    char *t29;
    int t30;
    unsigned int t31;
    char *t33;
    int t34;
    char *t35;
    char *t36;
    int t37;
    int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t45;
    char *t47;
    char *t48;
    int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    int t53;
    int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    char *t60;
    char *t62;
    char *t63;
    int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned char t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB2:    t73 = (t0 + 4216);
    *((int *)t73) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 6572U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t1);
    t8 = (t7 + 3);
    t9 = (t8 - 0);
    t10 = (t9 * 1);
    xsi_vhdl_check_range_of_index(0, 511, 1, t8);
    t11 = (8U * t10);
    t12 = (0 + t11);
    t13 = (t5 + t12);
    t14 = (t0 + 1992U);
    t15 = *((char **)t14);
    t14 = (t0 + 1032U);
    t16 = *((char **)t14);
    t14 = (t0 + 6572U);
    t17 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t16, t14);
    t18 = (t17 + 2);
    t19 = (t18 - 0);
    t20 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 511, 1, t18);
    t21 = (8U * t20);
    t22 = (0 + t21);
    t23 = (t15 + t22);
    t26 = ((IEEE_P_2592010699) + 4024);
    t28 = (t27 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 7;
    t29 = (t28 + 4U);
    *((int *)t29) = 0;
    t29 = (t28 + 8U);
    *((int *)t29) = -1;
    t30 = (0 - 7);
    t31 = (t30 * -1);
    t31 = (t31 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t31;
    t29 = (t32 + 0U);
    t33 = (t29 + 0U);
    *((int *)t33) = 7;
    t33 = (t29 + 4U);
    *((int *)t33) = 0;
    t33 = (t29 + 8U);
    *((int *)t33) = -1;
    t34 = (0 - 7);
    t31 = (t34 * -1);
    t31 = (t31 + 1);
    t33 = (t29 + 12U);
    *((unsigned int *)t33) = t31;
    t24 = xsi_base_array_concat(t24, t25, t26, (char)97, t13, t27, (char)97, t23, t32, (char)101);
    t33 = (t0 + 1992U);
    t35 = *((char **)t33);
    t33 = (t0 + 1032U);
    t36 = *((char **)t33);
    t33 = (t0 + 6572U);
    t37 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t36, t33);
    t38 = (t37 + 1);
    t39 = (t38 - 0);
    t31 = (t39 * 1);
    xsi_vhdl_check_range_of_index(0, 511, 1, t38);
    t40 = (8U * t31);
    t41 = (0 + t40);
    t42 = (t35 + t41);
    t45 = ((IEEE_P_2592010699) + 4024);
    t47 = (t46 + 0U);
    t48 = (t47 + 0U);
    *((int *)t48) = 7;
    t48 = (t47 + 4U);
    *((int *)t48) = 0;
    t48 = (t47 + 8U);
    *((int *)t48) = -1;
    t49 = (0 - 7);
    t50 = (t49 * -1);
    t50 = (t50 + 1);
    t48 = (t47 + 12U);
    *((unsigned int *)t48) = t50;
    t43 = xsi_base_array_concat(t43, t44, t45, (char)97, t24, t25, (char)97, t42, t46, (char)101);
    t48 = (t0 + 1992U);
    t51 = *((char **)t48);
    t48 = (t0 + 1032U);
    t52 = *((char **)t48);
    t48 = (t0 + 6572U);
    t53 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t52, t48);
    t54 = (t53 - 0);
    t50 = (t54 * 1);
    xsi_vhdl_check_range_of_index(0, 511, 1, t53);
    t55 = (8U * t50);
    t56 = (0 + t55);
    t57 = (t51 + t56);
    t60 = ((IEEE_P_2592010699) + 4024);
    t62 = (t61 + 0U);
    t63 = (t62 + 0U);
    *((int *)t63) = 7;
    t63 = (t62 + 4U);
    *((int *)t63) = 0;
    t63 = (t62 + 8U);
    *((int *)t63) = -1;
    t64 = (0 - 7);
    t65 = (t64 * -1);
    t65 = (t65 + 1);
    t63 = (t62 + 12U);
    *((unsigned int *)t63) = t65;
    t58 = xsi_base_array_concat(t58, t59, t60, (char)97, t43, t44, (char)97, t57, t61, (char)101);
    t65 = (8U + 8U);
    t66 = (t65 + 8U);
    t67 = (t66 + 8U);
    t68 = (32U != t67);
    if (t68 == 1)
        goto LAB5;

LAB6:    t63 = (t0 + 4360);
    t69 = (t63 + 56U);
    t70 = *((char **)t69);
    t71 = (t70 + 56U);
    t72 = *((char **)t71);
    memcpy(t72, t58, 32U);
    xsi_driver_first_trans_fast_port(t63);
    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t67, 0);
    goto LAB6;

}


extern void work_a_1632567566_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1632567566_3212880686_p_0,(void *)work_a_1632567566_3212880686_p_1};
	xsi_register_didat("work_a_1632567566_3212880686", "isim/test_processor_isim_beh.exe.sim/work/a_1632567566_3212880686.didat");
	xsi_register_executes(pe);
}
