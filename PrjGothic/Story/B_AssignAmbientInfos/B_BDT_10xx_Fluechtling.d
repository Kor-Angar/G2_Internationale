func void b_dia_bdt_10xx_fluechtling_stimme7()
{
        B_AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00"); //Забудь об этом, я не вернусь назад в тюрьму.
};
func void b_dia_bdt_10xx_fluechtling_stimme6()
{
        B_AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00"); //Ты же пришел не затем, чтобы вернуть нас назад в тюрьму, правда?
};
instance DIA_BDT_1031_FLUECHTLING_EXIT(C_INFO)
{
        npc = bdt_1031_fluechtling;
        nr = 999;
        condition = dia_bdt_1031_fluechtling_exit_condition;
        information = dia_bdt_1031_fluechtling_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1031_fluechtling_exit_condition()
{
        return TRUE;
};
func void dia_bdt_1031_fluechtling_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1031_FLUECHTLING_TIP1(C_INFO)
{
        npc = bdt_1031_fluechtling;
        nr = 2;
        condition = dia_bdt_1031_fluechtling_tip1_condition;
        information = dia_bdt_1031_fluechtling_tip1_info;
        important = TRUE;
};
func int dia_bdt_1031_fluechtling_tip1_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1031_fluechtling_tip1_info()
{
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");  //Тебе лучше держаться от меня подальше, если не хочешь попасть в тюрьму.
        b_giveplayerxp(XP_AMBIENTKAP3);
        if(SCFOUNDMORGAHARD == FALSE)
        {
                Info_ClearChoices(dia_bdt_1031_fluechtling_tip1);
                Info_AddChoice(dia_bdt_1031_fluechtling_tip1,dia_bdt_1031_fluechtling_tip1_frei_description,dia_bdt_1031_fluechtling_tip1_frei); // "Я не собираюсь убивать тебя."
                Info_AddChoice(dia_bdt_1031_fluechtling_tip1,dia_bdt_1031_fluechtling_tip1_knast_description,dia_bdt_1031_fluechtling_tip1_knast); // "Я пришел арестовать тебя."
                Info_AddChoice(dia_bdt_1031_fluechtling_tip1,dia_bdt_1031_fluechtling_tip1_morgahard_description,dia_bdt_1031_fluechtling_tip1_morgahard); // "Где Моргахард ваш главарь?"
        };
};
func void dia_bdt_1031_fluechtling_tip1_morgahard()
{
        B_AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");        //Где Моргахард, ваш главарь?
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");        //Мы разделились, чтобы нас не поймали слишком быстро. Понятия не имею, где сейчас остальные.
        Info_AddChoice(dia_bdt_1031_fluechtling_tip1,dia_bdt_1031_fluechtling_tip1_morgahard_drohen_description,dia_bdt_1031_fluechtling_tip1_morgahard_drohen); // "Жаль. Тогда пожалуй мне придется доставить тебя к судье."
};
func void dia_bdt_1031_fluechtling_tip1_morgahard_drohen()
{
        B_AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00"); //Жаль. Тогда, пожалуй, мне придется доставить тебя к судье.
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01"); //Хорошо, хорошо. Я думаю, некоторые из нас направились в таверну. Но ты не слышал этого от меня, хорошо?
        AI_StopProcessInfos(self);
};
func void dia_bdt_1031_fluechtling_tip1_knast()
{
        B_AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");    //Я пришел арестовать тебя.
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");    //Только через мой труп.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};
func void dia_bdt_1031_fluechtling_tip1_frei()
{
        B_AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");     //Я не собираюсь убивать тебя.
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");     //Если тебя послал судья, скажи ему, чтобы он отстал от нас.
        Info_AddChoice(dia_bdt_1031_fluechtling_tip1,dia_bdt_1031_fluechtling_tip1_frei_verbrechen_description,dia_bdt_1031_fluechtling_tip1_frei_verbrechen); // "Так в каком преступлении ты обвиняешься?"
};
func void dia_bdt_1031_fluechtling_tip1_frei_verbrechen()
{
        B_AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");  //Так в каком преступлении ты обвиняешься?
        B_AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");  //Это не твое дело.
};
instance DIA_BDT_1031_FLUECHTLING_PERM(C_INFO)
{
        npc = bdt_1031_fluechtling;
        nr = 3;
        condition = dia_bdt_1031_fluechtling_perm_condition;
        information = dia_bdt_1031_fluechtling_perm_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_bdt_1031_fluechtling_perm_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1031_fluechtling_perm_info()
{
        b_dia_bdt_10xx_fluechtling_stimme7();
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1032_FLUECHTLING_EXIT(C_INFO)
{
        npc = bdt_1032_fluechtling;
        nr = 999;
        condition = dia_bdt_1032_fluechtling_exit_condition;
        information = dia_bdt_1032_fluechtling_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1032_fluechtling_exit_condition()
{
        return TRUE;
};
func void dia_bdt_1032_fluechtling_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1032_FLUECHTLING_PERM(C_INFO)
{
        npc = bdt_1032_fluechtling;
        nr = 2;
        condition = dia_bdt_1032_fluechtling_perm_condition;
        information = dia_bdt_1032_fluechtling_perm_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_bdt_1032_fluechtling_perm_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1032_fluechtling_perm_info()
{
        b_dia_bdt_10xx_fluechtling_stimme6();
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1033_FLUECHTLING_EXIT(C_INFO)
{
        npc = bdt_1033_fluechtling;
        nr = 999;
        condition = dia_bdt_1033_fluechtling_exit_condition;
        information = dia_bdt_1033_fluechtling_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1033_fluechtling_exit_condition()
{
        return TRUE;
};
func void dia_bdt_1033_fluechtling_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1033_FLUECHTLING_TIP2(C_INFO)
{
        npc = bdt_1033_fluechtling;
        nr = 2;
        condition = dia_bdt_1033_fluechtling_tip2_condition;
        information = dia_bdt_1033_fluechtling_tip2_info;
        important = TRUE;
};
func int dia_bdt_1033_fluechtling_tip2_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1033_fluechtling_tip2_info()
{
        B_AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");  //(испуганно) Что тебе нужно от меня?
        b_giveplayerxp(XP_AMBIENTKAP3);
        if(SCFOUNDMORGAHARD == FALSE)
        {
                Info_ClearChoices(dia_bdt_1033_fluechtling_tip2);
                Info_AddChoice(dia_bdt_1033_fluechtling_tip2,dia_bdt_1033_fluechtling_tip2_frei_description,dia_bdt_1033_fluechtling_tip2_frei); // "Расслабься. Я просто хочу поговорить."
                Info_AddChoice(dia_bdt_1033_fluechtling_tip2,dia_bdt_1033_fluechtling_tip2_knast_description,dia_bdt_1033_fluechtling_tip2_knast); // "Меня послал судья чтобы я вернул тебя назад."
                Info_AddChoice(dia_bdt_1033_fluechtling_tip2,dia_bdt_1033_fluechtling_tip2_morgahard_description,dia_bdt_1033_fluechtling_tip2_morgahard); // "Где Моргахард ваш главарь?"
        };
};
func void dia_bdt_1033_fluechtling_tip2_morgahard()
{
        B_AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");        //Где Моргахард, ваш главарь?
        B_AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");        //(испуганно) Мне не нужны проблемы. Иди к лендлорду. Он хотел спрятаться среди наемников. А меня оставь в покое.
        AI_StopProcessInfos(self);
};
func void dia_bdt_1033_fluechtling_tip2_knast()
{
        B_AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");    //Меня послал судья, чтобы я вернул тебя назад.
        B_AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");    //(вопит) НЕЕТ!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};
func void dia_bdt_1033_fluechtling_tip2_frei()
{
        B_AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");     //Расслабься. Я просто хочу поговорить.
        B_AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");     //Но я не хочу говорить с тобой. Проваливай!
        Info_AddChoice(dia_bdt_1033_fluechtling_tip2,dia_bdt_1033_fluechtling_tip2_frei_verbrechen_description,dia_bdt_1033_fluechtling_tip2_frei_verbrechen); // "Ты ведь до смерти испуган разве нет?"
};
func void dia_bdt_1033_fluechtling_tip2_frei_verbrechen()
{
        B_AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");  //Ты ведь напуган до смерти, нет?
        B_AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");  //Тебе легко говорить. Тебя не ждет виселица, если тебя поймают.
};
instance DIA_BDT_1033_FLUECHTLING_PERM(C_INFO)
{
        npc = bdt_1033_fluechtling;
        nr = 3;
        condition = dia_bdt_1033_fluechtling_perm_condition;
        information = dia_bdt_1033_fluechtling_perm_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_bdt_1033_fluechtling_perm_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1033_fluechtling_perm_info()
{
        b_dia_bdt_10xx_fluechtling_stimme7();
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1034_FLUECHTLING_EXIT(C_INFO)
{
        npc = bdt_1034_fluechtling;
        nr = 999;
        condition = dia_bdt_1034_fluechtling_exit_condition;
        information = dia_bdt_1034_fluechtling_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1034_fluechtling_exit_condition()
{
        return TRUE;
};
func void dia_bdt_1034_fluechtling_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1034_FLUECHTLING_PERM(C_INFO)
{
        npc = bdt_1034_fluechtling;
        nr = 2;
        condition = dia_bdt_1034_fluechtling_perm_condition;
        information = dia_bdt_1034_fluechtling_perm_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_bdt_1034_fluechtling_perm_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1034_fluechtling_perm_info()
{
        b_dia_bdt_10xx_fluechtling_stimme6();
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1035_FLUECHTLING_EXIT(C_INFO)
{
        npc = bdt_1035_fluechtling;
        nr = 999;
        condition = dia_bdt_1035_fluechtling_exit_condition;
        information = dia_bdt_1035_fluechtling_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1035_fluechtling_exit_condition()
{
        return TRUE;
};
func void dia_bdt_1035_fluechtling_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1035_FLUECHTLING_PERM(C_INFO)
{
        npc = bdt_1035_fluechtling;
        nr = 2;
        condition = dia_bdt_1035_fluechtling_perm_condition;
        information = dia_bdt_1035_fluechtling_perm_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_bdt_1035_fluechtling_perm_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_bdt_1035_fluechtling_perm_info()
{
        b_dia_bdt_10xx_fluechtling_stimme7();
        AI_StopProcessInfos(self);
};
