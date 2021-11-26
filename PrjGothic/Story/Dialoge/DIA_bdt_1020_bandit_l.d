instance DIA_BDT_1020_WEGELAGERER_EXIT(C_INFO)
{
        npc = bdt_1020_bandit_l;
        nr = 999;
        condition = dia_wegelagerer_exit_condition;
        information = dia_wegelagerer_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_wegelagerer_exit_condition()
{
        return TRUE;
};
func void dia_wegelagerer_exit_info()
{
        AI_StopProcessInfos(self);
};
const string BDT_1020_WEGELAGERER_CHECKPOINT = "NW_TROLLAREA_PATH_46";
instance DIA_BDT_1020_WEGELAGERER_FIRSTWARN(C_INFO)
{
        npc = bdt_1020_bandit_l;
        nr = 1;
        condition = dia_bdt_1020_wegelagerer_firstwarn_condition;
        information = dia_bdt_1020_wegelagerer_firstwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_bdt_1020_wegelagerer_firstwarn_condition()
{
        if((other.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
        {
                return TRUE;
        };
};
func void dia_bdt_1020_wegelagerer_firstwarn_info()
{
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");       //Эй, ты, стоять!
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");       //Что тебе нужно?
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");       //Если не хочешь получить по морде, тебе лучше переложить несколько монет из своего кошелька в мой - и быстро!
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
        Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_howmuch_description,dia_bdt_1020_wegelagerer_firstwarn_howmuch); // "Сколько ты хочешь?"
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_joke_description,dia_bdt_1020_wegelagerer_firstwarn_joke); // "Ты шутишь."
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_pissoff_description,dia_bdt_1020_wegelagerer_pissoff); // "Убирайся с дороги!"
        if(MIS_SCHNITZELJAGD == LOG_RUNNING)
        {
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_agon_description,dia_bdt_1020_wegelagerer_agon); // "Скажи ты не видел послушника?"
        };
};
func void dia_bdt_1020_wegelagerer_agon()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");    //Скажи, ты не видел послушника?
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");    //(удивленно) Э-э... что? Хммм... (думает) Может быть.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");    //Дай мне 20 золотых, и я скажу тебе!
        WEGELAGERER_SURPRISE = TRUE;
        if(Npc_HasItems(other,itmi_gold) >= 20)
        {
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_givemoney_description,dia_bdt_1020_wegelagerer_firstwarn_givemoney); // "Хорошо вот деньги."
        };
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_nomoney_description,dia_bdt_1020_wegelagerer_firstwarn_nomoney); // "Извини у меня нет денег."
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_never_description,dia_bdt_1020_wegelagerer_firstwarn_never); // "Прочь с моей дороги!"
};
func void dia_bdt_1020_wegelagerer_firstwarn_howmuch()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");       //Сколько ты хочешь?
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");       //(ухмыляется) 20 золотых, и мы можем стать друзьями.
        Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
        if(Npc_HasItems(other,itmi_gold) >= 20)
        {
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_givemoney_description,dia_bdt_1020_wegelagerer_firstwarn_givemoney); // "Хорошо вот деньги."
        };
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_nomoney_description,dia_bdt_1020_wegelagerer_firstwarn_nomoney); // "Извини у меня нет денег."
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_never_description,dia_bdt_1020_wegelagerer_firstwarn_never); // "Прочь с моей дороги!"
};
func void dia_bdt_1020_wegelagerer_firstwarn_joke()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");  //Ты шутишь.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");  //Я похож на шутника?
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");  //Если я не увижу 20 золотых до того, как ты сделаешь шаг вперед...
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");  //Я прикончу тебя. Так что давай сюда денежки.
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
        Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
        if(Npc_HasItems(other,itmi_gold) >= 20)
        {
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_givemoney_description,dia_bdt_1020_wegelagerer_firstwarn_givemoney); // "Хорошо вот деньги."
        };
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_nomoney_description,dia_bdt_1020_wegelagerer_firstwarn_nomoney); // "Извини у меня нет денег."
        Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_never_description,dia_bdt_1020_wegelagerer_firstwarn_never); // "Прочь с моей дороги!"
};
func void dia_bdt_1020_wegelagerer_pissoff()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //Убирайся с дороги!
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //Ох, какие громкие слова от такого худосочного юноши.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //Пришло время подрезать твой язык.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_bdt_1020_wegelagerer_firstwarn_givemoney()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");     //Хорошо, вот деньги.
        if(WEGELAGERER_SURPRISE == FALSE)
        {
                B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");     //(насмешливо) Скажу тебе, 20 золотых - это не такая уж большая плата за жизнь. Ты можешь проходить.
        };
        if(WEGELAGERER_SURPRISE == TRUE)
        {
                B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");     //Хорошо, этот послушник прошел здесь около часа назад.
                B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");     //По-моему, он немного торопился, все время оглядывался... А теперь проваливай.
        };
        b_giveinvitems(other,self,itmi_gold,20);
        self.aivar[AIV_PASSGATE] = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_bdt_1020_wegelagerer_firstwarn_nomoney()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");       //Извини, у меня нет денег.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");       //Да уж, воистину тяжелые времена настали.
        if(Npc_HasEquippedMeleeWeapon(other))
        {
                B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");       //Тогда давай поступим так - отдай мне свое оружие. И я пропущу тебя.
                Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_noweapon_description,dia_bdt_1020_wegelagerer_firstwarn_noweapon); // "Забудь об этом."
                Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,dia_bdt_1020_wegelagerer_firstwarn_giveweapon_description,dia_bdt_1020_wegelagerer_firstwarn_giveweapon); // "Вот возьми мое оружие."
        }
        else
        {
                B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");       //Скажу тебе так: возвращайся, когда у тебя будут деньги. Нет денег - нет моста.
                self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
                AI_StopProcessInfos(self);
        };
};
func void dia_bdt_1020_wegelagerer_firstwarn_never()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //Прочь с моей дороги!
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //То есть, ты по-хорошему не хочешь?
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_bdt_1020_wegelagerer_firstwarn_noweapon()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");      //Забудь об этом.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");      //Ладно, по-плохому, так по-плохому.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_bdt_1020_wegelagerer_firstwarn_giveweapon()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");    //Вот, возьми мое оружие.
        AI_DrawWeapon(other);
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");    //Отойди от этого оружия. Ну подожди!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};
instance DIA_BDT_1020_WEGELAGERER_SECONDWARN(C_INFO)
{
        npc = bdt_1020_bandit_l;
        nr = 2;
        condition = dia_bdt_1020_wegelagerer_secondwarn_condition;
        information = dia_bdt_1020_wegelagerer_secondwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_bdt_1020_wegelagerer_secondwarn_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_bdt_1020_wegelagerer_secondwarn_info()
{
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");      //Ты действительно хочешь испытать судьбу? Как знаешь.
        Info_ClearChoices(dia_bdt_1020_wegelagerer_secondwarn);
        if(Npc_HasItems(other,itmi_gold) >= 20)
        {
                Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,dia_bdt_1020_wegelagerer_secondwarn_givemoney_description,dia_bdt_1020_wegelagerer_secondwarn_givemoney); // "Вот твои деньги."
        };
        Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,dia_bdt_1020_wegelagerer_secondwarn_nomoney_description,dia_bdt_1020_wegelagerer_secondwarn_nomoney); // "Я не дам тебе ни цента."
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
};
func void dia_bdt_1020_wegelagerer_secondwarn_givemoney()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");    //Вот твои деньги.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");    //Ах, как мы заговорили.
        b_giveinvitems(other,self,itmi_gold,20);
        self.aivar[AIV_PASSGATE] = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_bdt_1020_wegelagerer_secondwarn_nomoney()
{
        B_AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");      //Я не дам тебе ни цента.
        B_AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");      //Тогда я сам их возьму.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_BDT_1020_WEGELAGERER_ATTACK(C_INFO)
{
        npc = bdt_1020_bandit_l;
        nr = 3;
        condition = dia_bdt_1020_wegelagerer_attack_condition;
        information = dia_bdt_1020_wegelagerer_attack_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_bdt_1020_wegelagerer_attack_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_bdt_1020_wegelagerer_attack_info()
{
        other.aivar[AIV_LASTDISTTOWP] = 0;
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
