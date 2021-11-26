var int fh_skintexture;
var string fh_headmesh;
var int fh_headmesh_default_hilfsvariable;
var int sex;
func void change_fh_visual()
{
        var string printtext;
        if(FH_HEADMESH_DEFAULT_HILFSVARIABLE == 0)
        {
                FH_HEADMESH = "Hum_Head_Bald";
                FH_HEADMESH_DEFAULT_HILFSVARIABLE = 1;
        };
        if(FH_SKINTEXTURE < 0)
        {
                FH_SKINTEXTURE = 0;
                PrintScreen("Нет лиц с отрицательным номером!",-1,-1,"FONT_OLD_10_WHITE.TGA",4);
        };
        b_setnpcvisual(self,SEX,FH_HEADMESH,FH_SKINTEXTURE,BODYTEX_N,NO_ARMOR);
        PrintScreen("Текстура кожи:",-1,10,"FONT_OLD_10_WHITE.TGA",4);
        printtext = IntToString(FH_SKINTEXTURE);
        PrintScreen(printtext,-1,12,"FONT_OLD_10_WHITE.TGA",4);
        PrintScreen("Меш головы:",-1,20,"FONT_OLD_10_WHITE.TGA",4);
        PrintScreen(FH_HEADMESH,-1,22,"FONT_OLD_10_WHITE.TGA",4);
};
instance DIA_FH_EXIT(C_INFO)
{
        npc = fh;
        nr = 999;
        condition = dia_fh_exit_condition;
        information = dia_fh_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_fh_exit_condition()
{
        return TRUE;
};
func void dia_fh_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_FH_NEXTFACE(C_INFO)
{
        npc = fh;
        nr = 3;
        condition = dia_fh_nextface_condition;
        information = dia_fh_nextface_info;
        permanent = TRUE;
        description = "Следующее лицо";
};
func int dia_fh_nextface_condition()
{
        return TRUE;
};
func void dia_fh_nextface_info()
{
        FH_SKINTEXTURE = FH_SKINTEXTURE + 1;
        change_fh_visual();
};
instance DIA_FH_NEXTFACE10(C_INFO)
{
        npc = fh;
        nr = 5;
        condition = dia_fh_nextface10_condition;
        information = dia_fh_nextface10_info;
        permanent = TRUE;
        description = "10 лиц вперед";
};
func int dia_fh_nextface10_condition()
{
        return TRUE;
};
func void dia_fh_nextface10_info()
{
        FH_SKINTEXTURE = FH_SKINTEXTURE + 10;
        change_fh_visual();
};
instance DIA_FH_PREVIOUSFACE(C_INFO)
{
        npc = fh;
        nr = 4;
        condition = dia_fh_previousface_condition;
        information = dia_fh_previousface_info;
        permanent = TRUE;
        description = "Предыдущее лицо";
};
func int dia_fh_previousface_condition()
{
        return TRUE;
};
func void dia_fh_previousface_info()
{
        FH_SKINTEXTURE = FH_SKINTEXTURE - 1;
        change_fh_visual();
};
instance DIA_FH_PREVIOUSFACE10(C_INFO)
{
        npc = fh;
        nr = 6;
        condition = dia_fh_previousface10_condition;
        information = dia_fh_previousface10_info;
        permanent = TRUE;
        description = "10 лиц назад ";
};
func int dia_fh_previousface10_condition()
{
        return TRUE;
};
func void dia_fh_previousface10_info()
{
        FH_SKINTEXTURE = FH_SKINTEXTURE - 10;
        change_fh_visual();
};
instance DIA_FH_RESETFACE(C_INFO)
{
        npc = fh;
        nr = 7;
        condition = dia_fh_resetface_condition;
        information = dia_fh_resetface_info;
        permanent = TRUE;
        description = "Сброс";
};
func int dia_fh_resetface_condition()
{
        return TRUE;
};
func void dia_fh_resetface_info()
{
        FH_SKINTEXTURE = 0;
        change_fh_visual();
};
instance DIA_FH_WOMANFACE(C_INFO)
{
        npc = fh;
        nr = 8;
        condition = dia_fh_womanface_condition;
        information = dia_fh_womanface_info;
        permanent = TRUE;
        description = "Перейти к женским лицам";
};
func int dia_fh_womanface_condition()
{
        return TRUE;
};
func void dia_fh_womanface_info()
{
        FH_SKINTEXTURE = 137;
        change_fh_visual();
};
instance DIA_FH_REPEAT(C_INFO)
{
        npc = fh;
        nr = 1;
        condition = dia_fh_repeat_condition;
        information = dia_fh_repeat_info;
        permanent = TRUE;
        description = "Повторить";
};
func int dia_fh_repeat_condition()
{
        return TRUE;
};
func void dia_fh_repeat_info()
{
        change_fh_visual();
};
instance DIA_FH_SEX(C_INFO)
{
        npc = fh;
        nr = 9;
        condition = dia_fh_sex_condition;
        information = dia_fh_sex_info;
        permanent = TRUE;
        description = "Пол";
};
func int dia_fh_sex_condition()
{
        return TRUE;
};
func void dia_fh_sex_info()
{
        if(SEX == MALE)
        {
                SEX = FEMALE;
        }
        else
        {
                SEX = MALE;
        };
        change_fh_visual();
};
instance DIA_FH_CHOOSE_HEADMESH(C_INFO)
{
        npc = fh;
        nr = 2;
        condition = dia_fh_choose_headmesh_condition;
        information = dia_fh_choose_headmesh_info;
        permanent = TRUE;
        description = "Выбор формы головы";
};
func int dia_fh_choose_headmesh_condition()
{
        return TRUE;
};
func void dia_fh_choose_headmesh_info()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        Info_AddChoice(dia_fh_choose_headmesh,DIALOG_BACK,dia_fh_choose_headmesh_7);
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_6_description,dia_fh_choose_headmesh_6); // "Hum_Head_Psionic"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_5_description,dia_fh_choose_headmesh_5); // "Hum_Head_Thief"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_4_description,dia_fh_choose_headmesh_4); // "Hum_Head_Bald"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_3_description,dia_fh_choose_headmesh_3); // "Hum_Head_Pony"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_2_description,dia_fh_choose_headmesh_2); // "Hum_Head_Fighter"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_1_description,dia_fh_choose_headmesh_1); // "Hum_Head_FatBald"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_17_description,dia_fh_choose_headmesh_17); // "Hum_Head_BabeHair"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_16_description,dia_fh_choose_headmesh_16); // "Hum_Head_Babe8"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_15_description,dia_fh_choose_headmesh_15); // "Hum_Head_Babe7"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_14_description,dia_fh_choose_headmesh_14); // "Hum_Head_Babe6"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_13_description,dia_fh_choose_headmesh_13); // "Hum_Head_Babe5"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_12_description,dia_fh_choose_headmesh_12); // "Hum_Head_Babe4"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_11_description,dia_fh_choose_headmesh_11); // "Hum_Head_Babe3"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_10_description,dia_fh_choose_headmesh_10); // "Hum_Head_Babe2"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_9_description,dia_fh_choose_headmesh_9); // "Hum_Head_Babe1"
        Info_AddChoice(dia_fh_choose_headmesh,dia_fh_choose_headmesh_8_description,dia_fh_choose_headmesh_8); // "Hum_Head_Babe"
};
func void dia_fh_choose_headmesh_8()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_9()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe1";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_10()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe2";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_11()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe3";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_12()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe4";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_13()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe5";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_14()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe6";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_15()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe7";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_16()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Babe8";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_17()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_BabeHair";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_1()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_FatBald";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_2()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Fighter";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_3()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Pony";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_4()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Bald";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_5()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Thief";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_6()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
        FH_HEADMESH = "Hum_Head_Psionic";
        change_fh_visual();
};
func void dia_fh_choose_headmesh_7()
{
        Info_ClearChoices(dia_fh_choose_headmesh);
};
