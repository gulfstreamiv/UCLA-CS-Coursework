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
static const char *ng0 = "C:/Users/Bolun/Desktop/lab2/Converter2.v";
static int ng1[] = {11, 0};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static int ng4[] = {10, 0};
static int ng5[] = {2, 0};
static int ng6[] = {9, 0};
static int ng7[] = {3, 0};
static int ng8[] = {8, 0};
static int ng9[] = {4, 0};
static int ng10[] = {7, 0};
static int ng11[] = {5, 0};
static int ng12[] = {6, 0};
static int ng13[] = {12, 0};
static unsigned int ng14[] = {15U, 0U};
static unsigned int ng15[] = {7U, 0U};
static unsigned int ng16[] = {8U, 0U};
static unsigned int ng17[] = {2047U, 0U};
static unsigned int ng18[] = {0U, 0U};
static unsigned int ng19[] = {2048U, 0U};
static unsigned int ng20[] = {1U, 0U};



static void Always_35_0(char *t0)
{
    char t6[8];
    char t11[8];
    char t33[8];
    char t53[8];
    char t76[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1008U);
    t7 = (t4 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t5, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB9;

LAB6:    if (t23 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t11) = 1;

LAB9:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(42, ng0);

LAB16:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 12);

LAB12:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (t14 >> 11);
    t16 = (t15 & 1);
    *((unsigned int *)t6) = t16;
    t17 = *((unsigned int *)t4);
    t18 = (t17 >> 11);
    t19 = (t18 & 1);
    *((unsigned int *)t2) = t19;
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 1);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB20;

LAB17:    if (t23 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t11) = 1;

LAB20:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB21;

LAB22:
LAB23:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 2088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t2, 32, t5, 32);
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 3);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    t7 = (t0 + 2088);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t5, 32, t9, 32);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_rshift(t11, 12, t4, 12, t6, 32);
    t10 = (t0 + 1768);
    xsi_vlogvar_assign_value(t10, t11, 0, 0, 4);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 2088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t2, 32, t5, 32);
    t7 = ((char*)((ng9)));
    memset(t11, 0, 8);
    xsi_vlog_signed_minus(t11, 32, t6, 32, t7, 32);
    t8 = ((char*)((ng2)));
    memset(t33, 0, 8);
    xsi_vlog_signed_minus(t33, 32, t11, 32, t8, 32);
    t9 = (t0 + 2248);
    xsi_vlogvar_assign_value(t9, t33, 0, 0, 32);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_greatereq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t14 = *((unsigned int *)t7);
    t15 = (~(t14));
    t16 = *((unsigned int *)t6);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB81;

LAB82:
LAB83:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng17)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t2);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB114;

LAB111:    if (t23 != 0)
        goto LAB113;

LAB112:    *((unsigned int *)t6) = 1;

LAB114:    t8 = (t6 + 4);
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB115;

LAB116:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng19)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t2);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB122;

LAB119:    if (t23 != 0)
        goto LAB121;

LAB120:    *((unsigned int *)t6) = 1;

LAB122:    t8 = (t6 + 4);
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB123;

LAB124:
LAB125:
LAB117:    goto LAB2;

LAB8:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(37, ng0);

LAB13:    xsi_set_current_line(38, ng0);
    t34 = (t0 + 1048U);
    t35 = *((char **)t34);
    memset(t33, 0, 8);
    t34 = (t33 + 4);
    t36 = (t35 + 4);
    t37 = *((unsigned int *)t35);
    t38 = (~(t37));
    *((unsigned int *)t33) = t38;
    *((unsigned int *)t34) = 0;
    if (*((unsigned int *)t36) != 0)
        goto LAB15;

LAB14:    t43 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t43 & 4095U);
    t44 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t44 & 4095U);
    t45 = (t0 + 2408);
    xsi_vlogvar_assign_value(t45, t33, 0, 0, 12);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t4, 12, t5, 32);
    t7 = (t0 + 2408);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 12);
    goto LAB12;

LAB15:    t39 = *((unsigned int *)t33);
    t40 = *((unsigned int *)t36);
    *((unsigned int *)t33) = (t39 | t40);
    t41 = *((unsigned int *)t34);
    t42 = *((unsigned int *)t36);
    *((unsigned int *)t34) = (t41 | t42);
    goto LAB14;

LAB19:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB20;

LAB21:    xsi_set_current_line(50, ng0);

LAB24:    xsi_set_current_line(50, ng0);
    t34 = ((char*)((ng2)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB28;

LAB25:    if (t23 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t11) = 1;

LAB28:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB29;

LAB30:
LAB31:    goto LAB23;

LAB27:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB28;

LAB29:    xsi_set_current_line(52, ng0);

LAB32:    xsi_set_current_line(52, ng0);
    t34 = ((char*)((ng5)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng6)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB36;

LAB33:    if (t23 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t11) = 1;

LAB36:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB31;

LAB35:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB36;

LAB37:    xsi_set_current_line(54, ng0);

LAB40:    xsi_set_current_line(54, ng0);
    t34 = ((char*)((ng7)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng8)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB44;

LAB41:    if (t23 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t11) = 1;

LAB44:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB45;

LAB46:
LAB47:    goto LAB39;

LAB43:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB44;

LAB45:    xsi_set_current_line(56, ng0);

LAB48:    xsi_set_current_line(56, ng0);
    t34 = ((char*)((ng9)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng10)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB52;

LAB49:    if (t23 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t11) = 1;

LAB52:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB53;

LAB54:
LAB55:    goto LAB47;

LAB51:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(58, ng0);

LAB56:    xsi_set_current_line(58, ng0);
    t34 = ((char*)((ng11)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng12)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB60;

LAB57:    if (t23 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t11) = 1;

LAB60:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB61;

LAB62:
LAB63:    goto LAB55;

LAB59:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB60;

LAB61:    xsi_set_current_line(60, ng0);

LAB64:    xsi_set_current_line(60, ng0);
    t34 = ((char*)((ng12)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng11)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB68;

LAB65:    if (t23 != 0)
        goto LAB67;

LAB66:    *((unsigned int *)t11) = 1;

LAB68:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB69;

LAB70:
LAB71:    goto LAB63;

LAB67:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB68;

LAB69:    xsi_set_current_line(62, ng0);

LAB72:    xsi_set_current_line(62, ng0);
    t34 = ((char*)((ng10)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng9)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t4, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB76;

LAB73:    if (t23 != 0)
        goto LAB75;

LAB74:    *((unsigned int *)t11) = 1;

LAB76:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB77;

LAB78:
LAB79:    goto LAB71;

LAB75:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB76;

LAB77:    xsi_set_current_line(64, ng0);

LAB80:    xsi_set_current_line(64, ng0);
    t34 = ((char*)((ng8)));
    t35 = (t0 + 2088);
    xsi_vlogvar_assign_value(t35, t34, 0, 0, 32);
    goto LAB79;

LAB81:    xsi_set_current_line(87, ng0);

LAB84:    xsi_set_current_line(88, ng0);
    t8 = (t0 + 2408);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t12 = (t0 + 2408);
    t13 = (t12 + 72U);
    t26 = *((char **)t13);
    t27 = (t0 + 2248);
    t34 = (t27 + 56U);
    t35 = *((char **)t34);
    xsi_vlog_generic_get_index_select_value(t11, 32, t10, t26, 2, t35, 32, 1);
    t36 = ((char*)((ng2)));
    memset(t33, 0, 8);
    t45 = (t11 + 4);
    t46 = (t36 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t36);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t45);
    t23 = *((unsigned int *)t46);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t28 = *((unsigned int *)t45);
    t29 = *((unsigned int *)t46);
    t30 = (t28 | t29);
    t31 = (~(t30));
    t32 = (t25 & t31);
    if (t32 != 0)
        goto LAB88;

LAB85:    if (t30 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t33) = 1;

LAB88:    t48 = (t33 + 4);
    t37 = *((unsigned int *)t48);
    t38 = (~(t37));
    t39 = *((unsigned int *)t33);
    t40 = (t39 & t38);
    t41 = (t40 != 0);
    if (t41 > 0)
        goto LAB89;

LAB90:
LAB91:    goto LAB83;

LAB87:    t47 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB88;

LAB89:    xsi_set_current_line(89, ng0);

LAB92:    xsi_set_current_line(90, ng0);
    t49 = (t0 + 1768);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    t52 = ((char*)((ng14)));
    memset(t53, 0, 8);
    t54 = (t51 + 4);
    t55 = (t52 + 4);
    t42 = *((unsigned int *)t51);
    t43 = *((unsigned int *)t52);
    t44 = (t42 ^ t43);
    t56 = *((unsigned int *)t54);
    t57 = *((unsigned int *)t55);
    t58 = (t56 ^ t57);
    t59 = (t44 | t58);
    t60 = *((unsigned int *)t54);
    t61 = *((unsigned int *)t55);
    t62 = (t60 | t61);
    t63 = (~(t62));
    t64 = (t59 & t63);
    if (t64 != 0)
        goto LAB96;

LAB93:    if (t62 != 0)
        goto LAB95;

LAB94:    *((unsigned int *)t53) = 1;

LAB96:    t66 = (t53 + 4);
    t67 = *((unsigned int *)t66);
    t68 = (~(t67));
    t69 = *((unsigned int *)t53);
    t70 = (t69 & t68);
    t71 = (t70 != 0);
    if (t71 > 0)
        goto LAB97;

LAB98:    xsi_set_current_line(97, ng0);

LAB110:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (t14 >> 0);
    *((unsigned int *)t6) = t15;
    t16 = *((unsigned int *)t7);
    t17 = (t16 >> 0);
    *((unsigned int *)t5) = t17;
    t18 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t18 & 15U);
    t19 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t19 & 15U);
    t8 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t6, 32, t8, 32);
    t9 = (t0 + 1768);
    xsi_vlogvar_assign_value(t9, t11, 0, 0, 4);

LAB99:    goto LAB91;

LAB95:    t65 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t65) = 1;
    goto LAB96;

LAB97:    xsi_set_current_line(91, ng0);

LAB100:    xsi_set_current_line(92, ng0);
    t72 = (t0 + 1608);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    t75 = ((char*)((ng15)));
    memset(t76, 0, 8);
    t77 = (t74 + 4);
    t78 = (t75 + 4);
    t79 = *((unsigned int *)t74);
    t80 = *((unsigned int *)t75);
    t81 = (t79 ^ t80);
    t82 = *((unsigned int *)t77);
    t83 = *((unsigned int *)t78);
    t84 = (t82 ^ t83);
    t85 = (t81 | t84);
    t86 = *((unsigned int *)t77);
    t87 = *((unsigned int *)t78);
    t88 = (t86 | t87);
    t89 = (~(t88));
    t90 = (t85 & t89);
    if (t90 != 0)
        goto LAB104;

LAB101:    if (t88 != 0)
        goto LAB103;

LAB102:    *((unsigned int *)t76) = 1;

LAB104:    t92 = (t76 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t76);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB105;

LAB106:    xsi_set_current_line(93, ng0);

LAB109:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (t14 >> 0);
    *((unsigned int *)t6) = t15;
    t16 = *((unsigned int *)t7);
    t17 = (t16 >> 0);
    *((unsigned int *)t5) = t17;
    t18 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t18 & 7U);
    t19 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t19 & 7U);
    t8 = ((char*)((ng2)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t6, 32, t8, 32);
    t9 = (t0 + 1608);
    xsi_vlogvar_assign_value(t9, t11, 0, 0, 3);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB107:    goto LAB99;

LAB103:    t91 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB104;

LAB105:    xsi_set_current_line(92, ng0);

LAB108:    goto LAB107;

LAB113:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB114;

LAB115:    xsi_set_current_line(104, ng0);

LAB118:    xsi_set_current_line(105, ng0);
    t9 = ((char*)((ng15)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 3);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB117;

LAB121:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB122;

LAB123:    xsi_set_current_line(110, ng0);

LAB126:    xsi_set_current_line(111, ng0);
    t9 = ((char*)((ng15)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 3);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB125;

}


extern void work_m_00000000000870925505_1078292453_init()
{
	static char *pe[] = {(void *)Always_35_0};
	xsi_register_didat("work_m_00000000000870925505_1078292453", "isim/test_bench_isim_beh.exe.sim/work/m_00000000000870925505_1078292453.didat");
	xsi_register_executes(pe);
}
