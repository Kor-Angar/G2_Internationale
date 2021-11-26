instance DIA_RUMBOLD_EXIT(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 999;
        condition = dia_rumbold_exit_condition;
        information = dia_rumbold_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_rumbold_exit_condition()
{
        return TRUE;
};
func void dia_rumbold_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RUMBOLD_PREPERM(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 1;
        condition = dia_rumbold_preperm_condition;
        information = dia_rumbold_preperm_info;
        permanent = TRUE;
        description = "Что ты делаешь здесь?";
};
func int dia_rumbold_preperm_condition()
{
        if(!Npc_KnowsInfo(other,dia_bengar_milizklatschen))
        {
                return TRUE;
        };
};
func void dia_rumbold_preperm_info()
{
        B_AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");      //Что вы делаете здесь?
        B_AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");      //Проваливай! Понял?
        AI_StopProcessInfos(self);
};
instance DIA_RUMBOLD_HALLO(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 1;
        condition = dia_rumbold_hallo_condition;
        information = dia_rumbold_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_rumbold_hallo_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_milizklatschen))
        {
                return TRUE;
        };
};
func void dia_rumbold_hallo_info()
{
        B_AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");        //Посмотрите на него! Еще один клоун! Что ты здесь делаешь, а?
        if(other.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");        //Кто ты, черт тебя побери?
        }
        else
        {
                B_AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");        //Еще один из этих грязных наемников!
        };
        Info_ClearChoices(dia_rumbold_hallo);
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_schwanzeinziehen_description,dia_rumbold_hallo_schwanzeinziehen); // "Я никто."
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_verschwindet_description,dia_rumbold_hallo_verschwindet); // "Я хочу чтобы вы исчезли отсюда."
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_attack_description,dia_rumbold_hallo_attack); // "Я твой худший кошмар."
};
func void dia_rumbold_hallo_attack()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00"); //Я твой худший кошмар.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01"); //Считай, что ты уже труп!
        Info_ClearChoices(dia_rumbold_hallo);
        Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};
func void dia_rumbold_hallo_verschwindet()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");   //Я хочу, чтобы вы исчезли отсюда.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");   //Так-так. То есть, ты хочешь, чтобы мы исчезли?
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");   //(угрожающе) А что будет, если мы этого не сделаем, эй?
        Info_ClearChoices(dia_rumbold_hallo);
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_geld_description,dia_rumbold_hallo_geld); // "А что если я заплачу вам чтобы вы убрались отсюда?"
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_aufsmaul_description,dia_rumbold_hallo_aufsmaul); // "В таком случае вы больше никогда не сможете беспокоить этих фермеров."
};
func void dia_rumbold_hallo_aufsmaul()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");       //В таком случае, вы больше никогда не сможете беспокоить этих фермеров.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");       //Ты откусил больше, чем можешь проглотить, кретин!
        Info_ClearChoices(dia_rumbold_hallo);
        Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};
func void dia_rumbold_hallo_geld()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");   //А что если я заплачу вам, чтобы вы убрались отсюда?
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");   //Ты хочешь заплатить за Бенгара? Это другое дело.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");   //Дай подумать. Учитывая все, что он нам задолжал, это будет 65 золотых монет.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");   //Либо плати, либо убирайся с дороги.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");   //Ох. А ты что, казначей Бенгара?
        Info_ClearChoices(dia_rumbold_hallo);
        Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_geld_toomuch_description,dia_rumbold_hallo_geld_toomuch); // "Ты с ума сошел? Это слишком много."
        if(Npc_HasItems(other,itmi_gold) >= 65)
        {
                Info_AddChoice(dia_rumbold_hallo,dia_rumbold_hallo_geld_ok_description,dia_rumbold_hallo_geld_ok); // "Вот деньги. А теперь проваливайте."
        };
};
func void dia_rumbold_hallo_geld_ok()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");        //Вот деньги. А теперь проваливайте.
        b_giveinvitems(other,self,itmi_gold,65);
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");        //Меня не волнует, кто платит за Бенгара. Удачи. (себе под нос) Кретин!
        AI_StopProcessInfos(self);
        RUMBOLD_BEZAHLT = TRUE;
        Npc_ExchangeRoutine(self,"Start");
        if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
        {
                Npc_ExchangeRoutine(rick,"Start");
                AI_ContinueRoutine(rick);
        };
        if(Hlp_IsValidNpc(bengar) && !Npc_IsDead(bengar))
        {
                Npc_ExchangeRoutine(bengar,"Start");
                AI_ContinueRoutine(bengar);
        };
};
func void dia_rumbold_hallo_geld_toomuch()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");   //Ты с ума сошел? Это слишком много.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");   //Тогда прочь с дороги!
        AI_StopProcessInfos(self);
};
func void dia_rumbold_hallo_schwanzeinziehen()
{
        B_AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");       //Я никто.
        B_AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");       //Тогда убирайся с моей дороги!
        AI_StopProcessInfos(self);
};
func void dia_rumbold_hallo_endattack()
{
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_KILL,1);
        if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
        {
                b_attack(rick,other,AR_KILL,1);
        };
};
instance DIA_RUMBOLD_FIGHTNOW(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 1;
        condition = dia_rumbold_fightnow_condition;
        information = dia_rumbold_fightnow_info;
        permanent = TRUE;
        description = "Оставьте этого фермера в покое!";
};
func int dia_rumbold_fightnow_condition()
{
        if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == FALSE))
        {
                return TRUE;
        };
};
func void dia_rumbold_fightnow_info()
{
        B_AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");     //Оставьте этого фермера в покое!
        B_AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");     //Ты что, оглох, сынок?
        Info_ClearChoices(dia_rumbold_fightnow);
        Info_AddChoice(dia_rumbold_fightnow,DIALOG_ENDE,dia_rumbold_fightnow_endattack);
};
func void dia_rumbold_fightnow_endattack()
{
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_KILL,1);
        if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
        {
                b_attack(rick,other,AR_KILL,1);
        };
};
instance DIA_RUMBOLD_STILLTHERE(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 1;
        condition = dia_rumbold_stillthere_condition;
        information = dia_rumbold_stillthere_info;
        permanent = TRUE;
        description = "Вы еще здесь?!";
};
func int dia_rumbold_stillthere_condition()
{
        if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == TRUE))
        {
                return TRUE;
        };
};
func void dia_rumbold_stillthere_info()
{
        B_AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");   //Вы еще здесь?!
        B_AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");   //Сейчас ты у меня попляшешь!
        Info_ClearChoices(dia_rumbold_stillthere);
        Info_AddChoice(dia_rumbold_stillthere,DIALOG_ENDE,dia_rumbold_stillthere_endattack);
};
func void dia_rumbold_stillthere_endattack()
{
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_KILL,1);
        if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
        {
                b_attack(rick,other,AR_KILL,1);
        };
};
instance DIA_RUMBOLD_PICKPOCKET(C_INFO)
{
        npc = mil_335_rumbold;
        nr = 900;
        condition = dia_rumbold_pickpocket_condition;
        information = dia_rumbold_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_rumbold_pickpocket_condition()
{
        return c_beklauen(24,45);
};
func void dia_rumbold_pickpocket_info()
{
        Info_ClearChoices(dia_rumbold_pickpocket);
        Info_AddChoice(dia_rumbold_pickpocket,DIALOG_BACK,dia_rumbold_pickpocket_back);
        Info_AddChoice(dia_rumbold_pickpocket,DIALOG_PICKPOCKET,dia_rumbold_pickpocket_doit);
};
func void dia_rumbold_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_rumbold_pickpocket);
};
func void dia_rumbold_pickpocket_back()
{
        Info_ClearChoices(dia_rumbold_pickpocket);
};
