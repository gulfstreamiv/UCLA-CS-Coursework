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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/152/Desktop/temp2333/clock.v";
static int ng1[] = {0, 0};
static int ng2[] = {100000000, 0};
static int ng3[] = {2, 0};
static int ng4[] = {1, 0};
static int ng5[] = {5000000, 0};
static int ng6[] = {10000000, 0};
static int ng7[] = {20000000, 0};
static int ng8[] = {200000, 0};



static void Initial_38_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(38, ng0);

LAB2:    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2088);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2248);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(42, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2568);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(43, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1448);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(45, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(46, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_50_1(char *t0)
{
    char t9[8];
    char t10[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 4800);
    *((int *)t2) = 1;
    t3 = (t0 + 3768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 2088);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    t8 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_signed_divide(t9, 32, t7, 32, t8, 32);
    memset(t10, 0, 8);
    xsi_vlog_signed_equal(t10, 32, t6, 32, t9, 32);
    t11 = (t10 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(57, ng0);

LAB16:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t4, 32, t5, 32);
    t6 = (t9 + 4);
    t12 = *((unsigned int *)t6);
    t13 = (~(t12));
    t14 = *((unsigned int *)t9);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(62, ng0);

LAB27:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);

LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(53, ng0);

LAB9:    xsi_set_current_line(54, ng0);
    t18 = (t0 + 1448);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t17, 0, 8);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t21) == 0)
        goto LAB10;

LAB12:    t27 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t27) = 1;

LAB13:    t28 = (t17 + 4);
    t29 = (t20 + 4);
    t30 = *((unsigned int *)t20);
    t31 = (~(t30));
    *((unsigned int *)t17) = t31;
    *((unsigned int *)t28) = 0;
    if (*((unsigned int *)t29) != 0)
        goto LAB15;

LAB14:    t36 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t36 & 1U);
    t37 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t37 & 1U);
    t38 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t38, t17, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t17) = 1;
    goto LAB13;

LAB15:    t32 = *((unsigned int *)t17);
    t33 = *((unsigned int *)t29);
    *((unsigned int *)t17) = (t32 | t33);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    *((unsigned int *)t28) = (t34 | t35);
    goto LAB14;

LAB17:    xsi_set_current_line(58, ng0);

LAB20:    xsi_set_current_line(59, ng0);
    t7 = (t0 + 1448);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memset(t10, 0, 8);
    t18 = (t11 + 4);
    t22 = *((unsigned int *)t18);
    t23 = (~(t22));
    t24 = *((unsigned int *)t11);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t18) == 0)
        goto LAB21;

LAB23:    t19 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t19) = 1;

LAB24:    t20 = (t10 + 4);
    t21 = (t11 + 4);
    t30 = *((unsigned int *)t11);
    t31 = (~(t30));
    *((unsigned int *)t10) = t31;
    *((unsigned int *)t20) = 0;
    if (*((unsigned int *)t21) != 0)
        goto LAB26;

LAB25:    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & 1U);
    t37 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t37 & 1U);
    t27 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t27, t10, 0, 0, 1, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB19;

LAB21:    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB26:    t32 = *((unsigned int *)t10);
    t33 = *((unsigned int *)t21);
    *((unsigned int *)t10) = (t32 | t33);
    t34 = *((unsigned int *)t20);
    t35 = *((unsigned int *)t21);
    *((unsigned int *)t20) = (t34 | t35);
    goto LAB25;

}

static void Always_70_2(char *t0)
{
    char t8[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;

LAB0:    t1 = (t0 + 3984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 4816);
    *((int *)t2) = 1;
    t3 = (t0 + 4016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(71, ng0);

LAB5:    xsi_set_current_line(73, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng5)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t6, 32, t7, 32);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(77, ng0);

LAB16:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t8, 0, 8);
    xsi_vlog_signed_equal(t8, 32, t4, 32, t5, 32);
    t6 = (t8 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(82, ng0);

LAB27:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    xsi_vlog_signed_add(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 32, 0LL);

LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(73, ng0);

LAB9:    xsi_set_current_line(74, ng0);
    t16 = (t0 + 1608);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t15, 0, 8);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t19) == 0)
        goto LAB10;

LAB12:    t25 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t25) = 1;

LAB13:    t26 = (t15 + 4);
    t27 = (t18 + 4);
    t28 = *((unsigned int *)t18);
    t29 = (~(t28));
    *((unsigned int *)t15) = t29;
    *((unsigned int *)t26) = 0;
    if (*((unsigned int *)t27) != 0)
        goto LAB15;

LAB14:    t34 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t34 & 1U);
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t35 & 1U);
    t36 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t36, t15, 0, 0, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    xsi_vlog_signed_add(t8, 32, t4, 32, t5, 32);
    t6 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 32, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t15) = 1;
    goto LAB13;

LAB15:    t30 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t27);
    *((unsigned int *)t15) = (t30 | t31);
    t32 = *((unsigned int *)t26);
    t33 = *((unsigned int *)t27);
    *((unsigned int *)t26) = (t32 | t33);
    goto LAB14;

LAB17:    xsi_set_current_line(78, ng0);

LAB20:    xsi_set_current_line(79, ng0);
    t7 = (t0 + 1608);
    t9 = (t7 + 56U);
    t16 = *((char **)t9);
    memset(t15, 0, 8);
    t17 = (t16 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t16);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t17) == 0)
        goto LAB21;

LAB23:    t18 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t18) = 1;

LAB24:    t19 = (t15 + 4);
    t25 = (t16 + 4);
    t28 = *((unsigned int *)t16);
    t29 = (~(t28));
    *((unsigned int *)t15) = t29;
    *((unsigned int *)t19) = 0;
    if (*((unsigned int *)t25) != 0)
        goto LAB26;

LAB25:    t34 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t34 & 1U);
    t35 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t35 & 1U);
    t26 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t26, t15, 0, 0, 1, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB19;

LAB21:    *((unsigned int *)t15) = 1;
    goto LAB24;

LAB26:    t30 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t25);
    *((unsigned int *)t15) = (t30 | t31);
    t32 = *((unsigned int *)t19);
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t19) = (t32 | t33);
    goto LAB25;

}

static void Always_90_3(char *t0)
{
    char t9[8];
    char t10[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 4832);
    *((int *)t2) = 1;
    t3 = (t0 + 4264);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);

LAB5:    xsi_set_current_line(93, ng0);
    t4 = (t0 + 2408);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng7)));
    t8 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_signed_divide(t9, 32, t7, 32, t8, 32);
    memset(t10, 0, 8);
    xsi_vlog_signed_equal(t10, 32, t6, 32, t9, 32);
    t11 = (t10 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(97, ng0);

LAB16:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t4, 32, t5, 32);
    t6 = (t9 + 4);
    t12 = *((unsigned int *)t6);
    t13 = (~(t12));
    t14 = *((unsigned int *)t9);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(102, ng0);

LAB27:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);

LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(93, ng0);

LAB9:    xsi_set_current_line(94, ng0);
    t18 = (t0 + 1768);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t17, 0, 8);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t21) == 0)
        goto LAB10;

LAB12:    t27 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t27) = 1;

LAB13:    t28 = (t17 + 4);
    t29 = (t20 + 4);
    t30 = *((unsigned int *)t20);
    t31 = (~(t30));
    *((unsigned int *)t17) = t31;
    *((unsigned int *)t28) = 0;
    if (*((unsigned int *)t29) != 0)
        goto LAB15;

LAB14:    t36 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t36 & 1U);
    t37 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t37 & 1U);
    t38 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t38, t17, 0, 0, 1, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t17) = 1;
    goto LAB13;

LAB15:    t32 = *((unsigned int *)t17);
    t33 = *((unsigned int *)t29);
    *((unsigned int *)t17) = (t32 | t33);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    *((unsigned int *)t28) = (t34 | t35);
    goto LAB14;

LAB17:    xsi_set_current_line(98, ng0);

LAB20:    xsi_set_current_line(99, ng0);
    t7 = (t0 + 1768);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memset(t10, 0, 8);
    t18 = (t11 + 4);
    t22 = *((unsigned int *)t18);
    t23 = (~(t22));
    t24 = *((unsigned int *)t11);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t18) == 0)
        goto LAB21;

LAB23:    t19 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t19) = 1;

LAB24:    t20 = (t10 + 4);
    t21 = (t11 + 4);
    t30 = *((unsigned int *)t11);
    t31 = (~(t30));
    *((unsigned int *)t10) = t31;
    *((unsigned int *)t20) = 0;
    if (*((unsigned int *)t21) != 0)
        goto LAB26;

LAB25:    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & 1U);
    t37 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t37 & 1U);
    t27 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t27, t10, 0, 0, 1, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB19;

LAB21:    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB26:    t32 = *((unsigned int *)t10);
    t33 = *((unsigned int *)t21);
    *((unsigned int *)t10) = (t32 | t33);
    t34 = *((unsigned int *)t20);
    t35 = *((unsigned int *)t21);
    *((unsigned int *)t20) = (t34 | t35);
    goto LAB25;

}

static void Always_110_4(char *t0)
{
    char t9[8];
    char t10[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 4480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4848);
    *((int *)t2) = 1;
    t3 = (t0 + 4512);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(111, ng0);

LAB5:    xsi_set_current_line(113, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng8)));
    t8 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_signed_divide(t9, 32, t7, 32, t8, 32);
    memset(t10, 0, 8);
    xsi_vlog_signed_equal(t10, 32, t6, 32, t9, 32);
    t11 = (t10 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(117, ng0);

LAB16:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t9, 0, 8);
    xsi_vlog_signed_equal(t9, 32, t4, 32, t5, 32);
    t6 = (t9 + 4);
    t12 = *((unsigned int *)t6);
    t13 = (~(t12));
    t14 = *((unsigned int *)t9);
    t15 = (t14 & t13);
    t16 = (t15 != 0);
    if (t16 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(122, ng0);

LAB27:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);

LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(113, ng0);

LAB9:    xsi_set_current_line(114, ng0);
    t18 = (t0 + 1928);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memset(t17, 0, 8);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t21) == 0)
        goto LAB10;

LAB12:    t27 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t27) = 1;

LAB13:    t28 = (t17 + 4);
    t29 = (t20 + 4);
    t30 = *((unsigned int *)t20);
    t31 = (~(t30));
    *((unsigned int *)t17) = t31;
    *((unsigned int *)t28) = 0;
    if (*((unsigned int *)t29) != 0)
        goto LAB15;

LAB14:    t36 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t36 & 1U);
    t37 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t37 & 1U);
    t38 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t38, t17, 0, 0, 1, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t9, 0, 8);
    xsi_vlog_signed_add(t9, 32, t4, 32, t5, 32);
    t6 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t6, t9, 0, 0, 32, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t17) = 1;
    goto LAB13;

LAB15:    t32 = *((unsigned int *)t17);
    t33 = *((unsigned int *)t29);
    *((unsigned int *)t17) = (t32 | t33);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    *((unsigned int *)t28) = (t34 | t35);
    goto LAB14;

LAB17:    xsi_set_current_line(118, ng0);

LAB20:    xsi_set_current_line(119, ng0);
    t7 = (t0 + 1928);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memset(t10, 0, 8);
    t18 = (t11 + 4);
    t22 = *((unsigned int *)t18);
    t23 = (~(t22));
    t24 = *((unsigned int *)t11);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB24;

LAB22:    if (*((unsigned int *)t18) == 0)
        goto LAB21;

LAB23:    t19 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t19) = 1;

LAB24:    t20 = (t10 + 4);
    t21 = (t11 + 4);
    t30 = *((unsigned int *)t11);
    t31 = (~(t30));
    *((unsigned int *)t10) = t31;
    *((unsigned int *)t20) = 0;
    if (*((unsigned int *)t21) != 0)
        goto LAB26;

LAB25:    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & 1U);
    t37 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t37 & 1U);
    t27 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t27, t10, 0, 0, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB19;

LAB21:    *((unsigned int *)t10) = 1;
    goto LAB24;

LAB26:    t32 = *((unsigned int *)t10);
    t33 = *((unsigned int *)t21);
    *((unsigned int *)t10) = (t32 | t33);
    t34 = *((unsigned int *)t20);
    t35 = *((unsigned int *)t21);
    *((unsigned int *)t20) = (t34 | t35);
    goto LAB25;

}


extern void work_m_00000000000180358585_2964965119_init()
{
	static char *pe[] = {(void *)Initial_38_0,(void *)Always_50_1,(void *)Always_70_2,(void *)Always_90_3,(void *)Always_110_4};
	xsi_register_didat("work_m_00000000000180358585_2964965119", "isim/ll_isim_beh.exe.sim/work/m_00000000000180358585_2964965119.didat");
	xsi_register_executes(pe);
}
