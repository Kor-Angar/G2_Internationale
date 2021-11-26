instance DIA_WASILI_EXIT(C_INFO)
{
        npc = bau_907_wasili;
        nr = 999;
        condition = dia_wasili_exit_condition;
        information = dia_wasili_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_wasili_exit_condition()
{
        return TRUE;
};
func void dia_wasili_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_WASILI_HALLO(C_INFO)
{
        npc = bau_907_wasili;
        nr = 1;
        condition = dia_wasili_hallo_condition;
        information = dia_wasili_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_wasili_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_wasili_hallo_info()
{
        B_AI_Output(self,other,"DIA_Wasili_HALLO_01_00"); //Даже не думай прикоснуться здесь хоть к чему-нибудь. Ты обязательно перевернешь что-нибудь вверх ногами, понятно?
};
instance DIA_WASILI_JOB(C_INFO)
{
        npc = bau_907_wasili;
        nr = 1;
        condition = dia_wasili_job_condition;
        information = dia_wasili_job_info;
        permanent = FALSE;
        description = "Чем ты занимаешься?";
};
func int dia_wasili_job_condition()
{
        return TRUE;
};
func void dia_wasili_job_info()
{
        B_AI_Output(other,self,"DIA_Wasili_Job_15_00");   //Чем ты занимаешься?
        B_AI_Output(self,other,"DIA_Wasili_Job_01_01");   //Онар хочет, чтобы я проводил дни напролет, присматривая за его добром.
        B_AI_Output(self,other,"DIA_Wasili_Job_01_02");   //Он боится, что что-нибудь пропадет. На его месте я бы тоже боялся.
        B_AI_Output(self,other,"DIA_Wasili_Job_01_03");   //Большинство из нанятых им наемников - бывшие заключенные из колонии.
        B_AI_Output(self,other,"DIA_Wasili_Job_01_04");   //Они готовы стащить все, что не прибито гвоздями. Глазом не успеешь моргнуть.
};
instance DIA_WASILI_SAMMLER(C_INFO)
{
        npc = bau_907_wasili;
        nr = 4;
        condition = dia_wasili_sammler_condition;
        information = dia_wasili_sammler_info;
        permanent = FALSE;
        description = "Как я погляжу, здесь целая груда мусора.";
};
func int dia_wasili_sammler_condition()
{
        return TRUE;
};
func void dia_wasili_sammler_info()
{
        B_AI_Output(other,self,"DIA_Wasili_Sammler_15_00");       //Как я погляжу, здесь целая груда мусора.
        B_AI_Output(self,other,"DIA_Wasili_Sammler_01_01");       //Это точно, и большая его часть очень ценная. Онар коллекционирует ценные предметы.
        B_AI_Output(self,other,"DIA_Wasili_Sammler_01_02");       //Простой человек, вроде меня, едва ли может позволить себе такое богатство. Мне больше нравятся другие вещи.
        B_AI_Output(other,self,"DIA_Wasili_Sammler_15_03");       //И что, например?
        B_AI_Output(self,other,"DIA_Wasili_Sammler_01_04");       //Я собираю старые монеты.
        MIS_WASILI_BRINGOLDCOIN = LOG_RUNNING;
};
instance DIA_WASILI_FIRSTOLDCOIN(C_INFO)
{
        npc = bau_907_wasili;
        nr = 5;
        condition = dia_wasili_firstoldcoin_condition;
        information = dia_wasili_firstoldcoin_info;
        permanent = TRUE;
        description = "У меня есть старинная монетка.";
};
var int wasili_bringoldcoin_nomore;
func int dia_wasili_firstoldcoin_condition()
{
        if((MIS_WASILI_BRINGOLDCOIN == LOG_RUNNING) && (WASILISOLDCOINOFFER == 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
        {
                return TRUE;
        };
};
var int wasilisoldcoinoffer;
var int firstoldcoin_angebotenxp_onetime;
var int dia_wasili_firstoldcoin_mehr_onetime;
func void dia_wasili_firstoldcoin_info()
{
        B_AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");  //У меня есть старинная монетка.
        if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");  //Ммм. Покажи мне.
        };
        b_giveinvitems(other,self,itmi_oldcoin,1);
        if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");  //Ох, да. На рынке такую не продашь за приличную цену.
        };
        if(DIA_WASILI_FIRSTOLDCOIN_MEHR_ONETIME == FALSE)
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");  //Я заплачу тебе за нее одну золотую монету. Больше она не стоит.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");  //Ты знаешь, что я готов заплатить за нее, пес. Одну золотую монету. И ни центом больше.
        };
        Info_ClearChoices(dia_wasili_firstoldcoin);
        Info_AddChoice(dia_wasili_firstoldcoin,dia_wasili_firstoldcoin_nein_description,dia_wasili_firstoldcoin_nein); // "Нет я лучше оставлю ее себе."
        Info_AddChoice(dia_wasili_firstoldcoin,dia_wasili_firstoldcoin_mehr_description,dia_wasili_firstoldcoin_mehr); // "Этого недостаточно. Как насчет двух?"
        Info_AddChoice(dia_wasili_firstoldcoin,dia_wasili_firstoldcoin_ok_description,dia_wasili_firstoldcoin_ok); // "Договорились."
        if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
        {
                b_giveplayerxp(XP_BRINGOLDCOIN);
                FIRSTOLDCOIN_ANGEBOTENXP_ONETIME = TRUE;
        };
};
func void dia_wasili_firstoldcoin_ok()
{
        B_AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");       //Договорились.
        B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");       //Хорошо.
        if(WASILISOLDCOINOFFER == 2)
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");       //Вот 2 золотые монеты.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");       //Если найдешь еще монетки, ты знаешь, где меня найти.
                WASILISOLDCOINOFFER = 1;
        };
        CreateInvItems(self,itmi_gold,WASILISOLDCOINOFFER);
        b_giveinvitems(self,other,itmi_gold,WASILISOLDCOINOFFER);
        Info_ClearChoices(dia_wasili_firstoldcoin);
};
func void dia_wasili_firstoldcoin_mehr()
{
        B_AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");     //Этого недостаточно. Как насчет двух?
        if(dia_wasili_firstoldcoin_mehr_onetime == FALSE)
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");     //Не пойдет! Я не еще не выжил из ума! Проваливай.
                dia_wasili_firstoldcoin_mehr_onetime = TRUE;
                b_giveinvitems(self,other,itmi_oldcoin,1);
                AI_StopProcessInfos(self);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");     //Аххх. Черт. Хорошо. 2 золотые монеты за каждую старинную монетку, что ты принесешь мне, - это мое последнее предложение.
                WASILISOLDCOINOFFER = 2;
                Info_AddChoice(dia_wasili_firstoldcoin,dia_wasili_firstoldcoin_zumteufel_description,dia_wasili_firstoldcoin_zumteufel); // "В таком случае 3 было бы неплохо."
        };
};
func void dia_wasili_firstoldcoin_nein()
{
        B_AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");     //Нет, я лучше оставлю ее себе.
        B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");     //Она для тебя бесполезна. Ты еще вернешься.
        b_giveinvitems(self,other,itmi_oldcoin,1);
        WASILISOLDCOINOFFER = 0;
        Info_ClearChoices(dia_wasili_firstoldcoin);
};
func void dia_wasili_firstoldcoin_zumteufel()
{
        B_AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");        //В таком случае, 3 было бы неплохо.
        B_AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");        //Катись к черту, ублюдок.
        AI_StopProcessInfos(self);
        WASILI_BRINGOLDCOIN_NOMORE = TRUE;
        WASILISOLDCOINOFFER = 0;
};
instance DIA_WASILI_BRINGOLDCOIN(C_INFO)
{
        npc = bau_907_wasili;
        nr = 5;
        condition = dia_wasili_bringoldcoin_condition;
        information = dia_wasili_bringoldcoin_info;
        permanent = TRUE;
        description = "Нужны еще старинные монетки?";
};
func int dia_wasili_bringoldcoin_condition()
{
        if((WASILISOLDCOINOFFER > 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
        {
                return TRUE;
        };
};
var int oldcoincounter;
func void dia_wasili_bringoldcoin_info()
{
        var int oldcoincount;
        var int xp_bringoldcoins;
        var int oldcoingeld;
        B_AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");  //Нужны еще старинные монетки?
        B_AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");  //Конечно. У тебя есть еще?
        oldcoincount = Npc_HasItems(other,itmi_oldcoin);
        if(oldcoincount == 1)
        {
                B_AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");  //Одна.
                b_giveplayerxp(XP_BRINGOLDCOIN);
                b_giveinvitems(other,self,itmi_oldcoin,1);
                OLDCOINCOUNTER = OLDCOINCOUNTER + 1;
        }
        else
        {
                B_AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");  //Несколько.
                b_giveinvitems(other,self,itmi_oldcoin,oldcoincount);
                xp_bringoldcoins = oldcoincount * XP_BRINGOLDCOIN;
                OLDCOINCOUNTER = OLDCOINCOUNTER + oldcoincount;
                b_giveplayerxp(xp_bringoldcoins);
        };
        B_AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");  //Спасибо. Вот твои деньги. Приноси мне все, что найдешь.
        oldcoingeld = oldcoincount * WASILISOLDCOINOFFER;
        CreateInvItems(self,itmi_gold,oldcoingeld);
        b_giveinvitems(self,other,itmi_gold,oldcoingeld);
};
instance DIA_WASILI_PERM(C_INFO)
{
        npc = bau_907_wasili;
        nr = 900;
        condition = dia_wasili_perm_condition;
        information = dia_wasili_perm_info;
        permanent = TRUE;
        description = "Никто не пытался ничего украсть?";
};
func int dia_wasili_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_wasili_job))
        {
                return TRUE;
        };
};
func void dia_wasili_perm_info()
{
        B_AI_Output(other,self,"DIA_Wasili_PERM_15_00");  //Никто не пытался ничего украсть?
        if(KAPITEL <= 2)
        {
                if(PETZCOUNTER_FARM_THEFT > 0)
                {
                        B_AI_Output(self,other,"DIA_Wasili_PERM_01_01");  //Ты имеешь в виду: кроме тебя?
                };
                B_AI_Output(self,other,"DIA_Wasili_PERM_01_02");  //Были такие! Но я их всех поймал!
        };
        if(KAPITEL == 3)
        {
                B_AI_Output(self,other,"DIA_Wasili_PERM_01_03");  //Несколько дней назад, один из наемников пробрался в дом.
                B_AI_Output(self,other,"DIA_Wasili_PERM_01_04");  //Он был одет в черную рясу с капюшоном, так что я не разглядел его.
                B_AI_Output(self,other,"DIA_Wasili_PERM_01_05");  //Но я видел, как он удирал.
        };
        if(KAPITEL == 4)
        {
                B_AI_Output(self,other,"DIA_Wasili_perm_01_06");  //Нет. Последнее время нет.
        };
        if(KAPITEL >= 5)
        {
                B_AI_Output(self,other,"DIA_Wasili_perm_01_07");  //Наемники, похоже, готовятся покинуть лагерь.
                B_AI_Output(self,other,"DIA_Wasili_perm_01_08");  //Я не удивлюсь, если Ли и его парни покинут остров уже сегодня ночью.
        };
};
instance DIA_WASILI_PICKPOCKET(C_INFO)
{
        npc = bau_907_wasili;
        nr = 900;
        condition = dia_wasili_pickpocket_condition;
        information = dia_wasili_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_wasili_pickpocket_condition()
{
        return c_beklauen(55,90);
};
func void dia_wasili_pickpocket_info()
{
        Info_ClearChoices(dia_wasili_pickpocket);
        Info_AddChoice(dia_wasili_pickpocket,DIALOG_BACK,dia_wasili_pickpocket_back);
        Info_AddChoice(dia_wasili_pickpocket,DIALOG_PICKPOCKET,dia_wasili_pickpocket_doit);
};
func void dia_wasili_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_wasili_pickpocket);
};
func void dia_wasili_pickpocket_back()
{
        Info_ClearChoices(dia_wasili_pickpocket);
};
