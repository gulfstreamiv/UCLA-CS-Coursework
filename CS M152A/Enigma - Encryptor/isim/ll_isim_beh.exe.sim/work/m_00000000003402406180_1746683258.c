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
static const char *ng0 = "C:/Users/152/Desktop/temp2333/model_uart.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {0, 0};
static int ng4[] = {10, 0};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {84U, 0U};
static int ng7[] = {8, 0};
static const char *ng8 = "%d %s Received byte %02x (%s)";
static int ng9[] = {1095914544, 0, 85, 0};



static int sp_tskRxData(char *t1, char *t2)
{
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1256);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(58, ng0);

LAB5:    xsi_set_current_line(59, ng0);
    t5 = (t2 + 88U);
    t6 = *((char **)t5);
    t7 = (t6 + 0U);
    xsi_wp_set_status(t7, 1);
    *((char **)t3) = &&LAB6;

LAB1:    return t0;
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;
    goto LAB1;

LAB6:    xsi_set_current_line(60, ng0);
    t4 = (t1 + 2880);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t1 + 3200);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 8);
    goto LAB4;

}

static int sp_tskTxData(char *t1, char *t2)
{
    char t5[8];
    char t7[8];
    int t0;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1688);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(68, ng0);

LAB5:    xsi_set_current_line(69, ng0);
    t6 = ((char*)((ng1)));
    t8 = (t1 + 3360);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memset(t7, 0, 8);
    t11 = (t7 + 4);
    t12 = (t10 + 4);
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 0);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 0);
    *((unsigned int *)t11) = t16;
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t17 & 255U);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 & 255U);
    t19 = ((char*)((ng2)));
    xsi_vlogtype_concat(t5, 10, 10, 3U, t19, 1, t7, 8, t6, 1);
    t20 = (t1 + 3520);
    xsi_vlogvar_assign_value(t20, t5, 0, 0, 10);
    xsi_set_current_line(70, ng0);
    xsi_set_current_line(70, ng0);
    t4 = ((char*)((ng3)));
    t6 = (t1 + 3680);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 32);

LAB6:    t4 = (t1 + 3680);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = ((char*)((ng4)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t8, 32, t9, 32);
    t10 = (t5 + 4);
    t13 = *((unsigned int *)t10);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(76, ng0);
    t4 = (t1 + 6872);
    xsi_trigger(t4, -1, -1);

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    xsi_set_current_line(71, ng0);

LAB9:    xsi_set_current_line(72, ng0);
    t11 = (t1 + 3520);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t20 = (t1 + 3520);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = (t1 + 3680);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_get_index_select_value(t7, 1, t19, t22, 2, t25, 32, 1);
    t26 = (t1 + 2720);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    xsi_process_wait(t6, 1000000LL);
    *((char **)t3) = &&LAB10;
    t0 = 1;
    goto LAB1;

LAB10:    xsi_set_current_line(74, ng0);
    t4 = (t1 + 6704);
    xsi_trigger(t4, -1, -1);
    xsi_set_current_line(70, ng0);
    t4 = (t1 + 3680);
    t6 = (t4 + 56U);
    t8 = *((char **)t6);
    t9 = ((char*)((ng5)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t8, 32, t9, 32);
    t10 = (t1 + 3680);
    xsi_vlogvar_assign_value(t10, t5, 0, 0, 32);
    goto LAB6;

}

static void Initial_25_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 4600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);

LAB4:    xsi_set_current_line(27, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2720);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(28, ng0);
    t2 = (t0 + 4408);
    xsi_process_wait(t2, 10000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(29, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3040);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB8:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB10:    if (t26 != 0)
        goto LAB11;

LAB6:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB7:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB14:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB16:    if (t26 != 0)
        goto LAB17;

LAB12:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB13:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(32, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB20:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB22:    if (t26 != 0)
        goto LAB23;

LAB18:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB19:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB26:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB28:    if (t26 != 0)
        goto LAB29;

LAB24:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB25:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB32:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB34:    if (t26 != 0)
        goto LAB35;

LAB30:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB31:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB38:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB40:    if (t26 != 0)
        goto LAB41;

LAB36:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB37:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB44:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB46:    if (t26 != 0)
        goto LAB47;

LAB42:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB43:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB50:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB52:    if (t26 != 0)
        goto LAB53;

LAB48:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB49:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB56:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB58:    if (t26 != 0)
        goto LAB59;

LAB54:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB55:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 3040);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 255U);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = (t0 + 4408);
    t15 = (t0 + 1688);
    t16 = xsi_create_subprogram_invocation(t14, 0, t0, t15, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t15, t16);
    t17 = (t0 + 3360);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 8);

LAB62:    t18 = (t0 + 4504);
    t19 = *((char **)t18);
    t20 = (t19 + 80U);
    t21 = *((char **)t20);
    t22 = (t21 + 272U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    t25 = *((char **)t24);
    t26 = ((int  (*)(char *, char *))t25)(t0, t19);

LAB64:    if (t26 != 0)
        goto LAB65;

LAB60:    t19 = (t0 + 1688);
    xsi_vlog_subprogram_popinvocation(t19);

LAB61:    t27 = (t0 + 4504);
    t28 = *((char **)t27);
    t27 = (t0 + 1688);
    t29 = (t0 + 4408);
    t30 = 0;
    xsi_delete_subprogram_invocation(t27, t28, t0, t29, t30);
    goto LAB1;

LAB9:;
LAB11:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB8;
    goto LAB1;

LAB15:;
LAB17:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB14;
    goto LAB1;

LAB21:;
LAB23:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB20;
    goto LAB1;

LAB27:;
LAB29:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB26;
    goto LAB1;

LAB33:;
LAB35:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB32;
    goto LAB1;

LAB39:;
LAB41:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB38;
    goto LAB1;

LAB45:;
LAB47:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB44;
    goto LAB1;

LAB51:;
LAB53:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB50;
    goto LAB1;

LAB57:;
LAB59:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB56;
    goto LAB1;

LAB63:;
LAB65:    t18 = (t0 + 4600U);
    *((char **)t18) = &&LAB62;
    goto LAB1;

}

static void Always_42_1(char *t0)
{
    char t12[8];
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    int t9;
    char *t10;
    char *t11;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 5168);
    *((int *)t2) = 1;
    t3 = (t0 + 4880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2880);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 4656);
    xsi_process_wait(t2, 500000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t2);
    t9 = (t8 & t7);
    t4 = (t0 + 7608);
    *((int *)t4) = t9;

LAB7:    t5 = (t0 + 7608);
    if (*((int *)t5) > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 6536);
    xsi_trigger(t2, -1, -1);
    xsi_set_current_line(53, ng0);
    *((int *)t12) = xsi_vlog_stime(1000.0000000000000, 1000.0000000000000);
    t2 = (t12 + 4);
    *((int *)t2) = 0;
    t3 = ((char*)((ng9)));
    t4 = (t0 + 2880);
    t5 = (t4 + 56U);
    t10 = *((char **)t5);
    t11 = (t0 + 2880);
    t17 = (t11 + 56U);
    t18 = *((char **)t17);
    xsi_vlogfile_write(1, 0, 0, ng8, 5, t0, (char)118, t12, 32, (char)118, t3, 40, (char)118, t10, 8, (char)118, t18, 8);
    goto LAB2;

LAB8:    xsi_set_current_line(47, ng0);

LAB10:    xsi_set_current_line(48, ng0);
    t10 = (t0 + 4656);
    xsi_process_wait(t10, 1000000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(48, ng0);
    t11 = (t0 + 6368);
    xsi_trigger(t11, -1, -1);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t10 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t10);
    t14 = (t8 >> 1);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 & 127U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 127U);
    t11 = (t0 + 2320U);
    t17 = *((char **)t11);
    xsi_vlogtype_concat(t12, 8, 8, 2U, t17, 1, t13, 7);
    t11 = (t0 + 2880);
    xsi_vlogvar_assign_value(t11, t12, 0, 0, 8);
    t2 = (t0 + 7608);
    t9 = *((int *)t2);
    *((int *)t2) = (t9 - 1);
    goto LAB7;

}


extern void work_m_00000000003402406180_1746683258_init()
{
	static char *pe[] = {(void *)Initial_25_0,(void *)Always_42_1};
	static char *se[] = {(void *)sp_tskRxData,(void *)sp_tskTxData};
	xsi_register_didat("work_m_00000000003402406180_1746683258", "isim/ll_isim_beh.exe.sim/work/m_00000000003402406180_1746683258.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
