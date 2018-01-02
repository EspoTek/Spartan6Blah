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
static const char *ng0 = "C:/Users/Esposch/Documents/Xilinx/blinking_led/LED_Blink.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0126718283_3212880686_p_0(char *t0)
{
    char t7[16];
    char t13[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned char t12;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 5336U);
    t4 = (t0 + 5414);
    t6 = (t7 + 0U);
    t8 = (t6 + 0U);
    *((int *)t8) = 0;
    t8 = (t6 + 4U);
    *((int *)t8) = 25;
    t8 = (t6 + 8U);
    *((int *)t8) = 1;
    t10 = (25 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t8 = (t6 + 12U);
    *((unsigned int *)t8) = t11;
    t2 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t3, t1, t4, t7);
    if (t2 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 3400);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB11:    t1 = (t0 + 3240);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 5336U);
    t5 = (t0 + 5388);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 25;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t10 = (25 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t12 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t4, t3, t5, t7);
    if (t12 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(54, ng0);
    t1 = xsi_get_transient_memory(26U);
    memset(t1, 0, 26U);
    t3 = t1;
    memset(t3, (unsigned char)2, 26U);
    t4 = (t0 + 3336);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 26U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(52, ng0);
    t9 = (t0 + 1352U);
    t14 = *((char **)t9);
    t9 = (t0 + 5336U);
    t15 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t13, t14, t9, 1);
    t16 = (t13 + 12U);
    t11 = *((unsigned int *)t16);
    t17 = (1U * t11);
    t18 = (26U != t17);
    if (t18 == 1)
        goto LAB8;

LAB9:    t19 = (t0 + 3336);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 26U);
    xsi_driver_first_trans_fast(t19);
    goto LAB6;

LAB8:    xsi_size_not_matching(26U, t17, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(59, ng0);
    t8 = (t0 + 3400);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast(t8);
    goto LAB11;

}

static void work_a_0126718283_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(67, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3464);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3256);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0126718283_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0126718283_3212880686_p_0,(void *)work_a_0126718283_3212880686_p_1};
	xsi_register_didat("work_a_0126718283_3212880686", "isim/testbench_isim_beh.exe.sim/work/a_0126718283_3212880686.didat");
	xsi_register_executes(pe);
}
