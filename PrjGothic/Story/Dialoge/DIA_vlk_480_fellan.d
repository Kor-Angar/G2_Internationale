instance DIA_FELLAN_EXIT(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 999;
        condition = dia_fellan_exit_condition;
        information = dia_fellan_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_fellan_exit_condition()
{
        return TRUE;
};
func void dia_fellan_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_FELLAN_PICKPOCKET(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 900;
        condition = dia_fellan_pickpocket_condition;
        information = dia_fellan_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_fellan_pickpocket_condition()
{
        return c_beklauen(40,40);
};
func void dia_fellan_pickpocket_info()
{
        Info_ClearChoices(dia_fellan_pickpocket);
        Info_AddChoice(dia_fellan_pickpocket,DIALOG_BACK,dia_fellan_pickpocket_back);
        Info_AddChoice(dia_fellan_pickpocket,DIALOG_PICKPOCKET,dia_fellan_pickpocket_doit);
};
func void dia_fellan_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_fellan_pickpocket);
};
func void dia_fellan_pickpocket_back()
{
        Info_ClearChoices(dia_fellan_pickpocket);
};
instance DIA_FELLAN_NEWS(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 1;
        condition = dia_fellan_news_condition;
        information = dia_fellan_news_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_fellan_news_condition()
{
        if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE))
        {
                return TRUE;
        };
};
func void dia_fellan_news_info()
{
        if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
        {
                B_AI_Output(self,other,"DIA_Fellan_News_06_00");  //Ох, ты побил меня. Какой героический поступок!
                if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
                {
                        B_AI_Output(other,self,"DIA_Fellan_News_15_01");  //Ты прекратишь стучать молотком, или мне задать тебе трепку еще раз?
                        B_AI_Output(self,other,"DIA_Fellan_News_06_02");  //Нет, не надо бить меня больше. Я перестану. Но здесь все обрушится, и в этом будешь виноват ты!
                        FELLANGESCHLAGEN = TRUE;
                        Npc_ExchangeRoutine(self,"OHNEHAMMER");
                        AI_StopProcessInfos(self);
                };
        };
        if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
        {
                B_AI_Output(self,other,"DIA_Fellan_News_06_03");  //В чем дело? Хочешь еще получить по морде?
        };
        if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
        {
                B_AI_Output(self,other,"DIA_Fellan_News_06_04");  //Что ты за псих? То сражаешься, то убегаешь, то болтаешь - что тебе вообще нужно?
        };
        self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};
instance DIA_FELLAN_HALLO(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 2;
        condition = dia_fellan_hallo_condition;
        information = dia_fellan_hallo_info;
        permanent = FALSE;
        description = "Зачем ты колотишь молотком?";
};
func int dia_fellan_hallo_condition()
{
        if(FELLANGESCHLAGEN == FALSE)
        {
                return TRUE;
        };
};
func void dia_fellan_hallo_info()
{
        B_AI_Output(other,self,"DIA_Fellan_HALLO_15_00"); //Зачем ты колотишь молотком?
        B_AI_Output(self,other,"DIA_Fellan_HALLO_06_01"); //Вот уже несколько дней я отчаянно пытаюсь устранить протечки в моем доме.
        B_AI_Output(self,other,"DIA_Fellan_HALLO_06_02"); //Балки крошатся с тех пор, как прошли эти последние дожди. Скоро все это упадет мне на голову!
        AI_StopProcessInfos(self);
};
instance DIA_FELLAN_STOP(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 3;
        condition = dia_fellan_stop_condition;
        information = dia_fellan_stop_info;
        permanent = FALSE;
        description = "Ты не мог бы перестать молотить?";
};
func int dia_fellan_stop_condition()
{
        if(MIS_ATTACKFELLAN == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_fellan_stop_info()
{
        B_AI_Output(other,self,"DIA_Fellan_Stop_15_00");  //Ты не мог бы перестать молотить?
        B_AI_Output(self,other,"DIA_Fellan_Stop_06_01");  //Нет, я должен закончить работу.
        Info_ClearChoices(dia_fellan_stop);
        Info_AddChoice(dia_fellan_stop,dia_fellan_stop_bones_description,dia_fellan_stop_bones); // "Прекрати стучать молотком или я переломаю тебе все кости."
        Info_AddChoice(dia_fellan_stop,dia_fellan_stop_gold_description,dia_fellan_stop_gold); // "Я дам тебе 10 монет чтобы ты перестал колотить."
        Info_AddChoice(dia_fellan_stop,dia_fellan_stop_just_description,dia_fellan_stop_just); // "Просто перестань молотить. Хорошо?"
};
func void dia_fellan_stop_bones()
{
        B_AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");    //Прекрати стучать молотком, или я переломаю тебе все кости.
        B_AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");    //Забудь об этом, или мне придется образумить тебя хорошим ударом молотка по голове.
        AI_StopProcessInfos(self);
};
func void dia_fellan_stop_gold()
{
        B_AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");     //Я дам тебе 10 монет, чтобы ты перестал колотить.
        B_AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");     //Эй... Это очень великодушно с твоей стороны. Но что касается твоего золота, ты можешь...
        B_AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");     //...ну, ты знаешь, куда его засунуть.
};
func void dia_fellan_stop_just()
{
        B_AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");     //Просто перестань молотить. Хорошо?
        B_AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");     //Не приставай кол мне, ладно?
};
instance DIA_FELLAN_KLAR(C_INFO)
{
        npc = vlk_480_fellan;
        nr = 5;
        condition = dia_fellan_klar_condition;
        information = dia_fellan_klar_info;
        permanent = TRUE;
        description = "Эээй, с тобой все в порядке?";
};
func int dia_fellan_klar_condition()
{
        if(Npc_KnowsInfo(other,dia_fellan_hallo))
        {
                return TRUE;
        };
};
func void dia_fellan_klar_info()
{
        B_AI_Output(other,self,"DIA_Fellan_klar_15_00");  //Эээй, с тобой все в порядке?
        if(FELLANGESCHLAGEN == FALSE)
        {
                B_AI_Output(self,other,"DIA_Fellan_klar_06_01");  //Будет в порядке, если я смогу закончить ремонт вовремя.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Fellan_klar_06_02");  //Состояние крыши ухудшается прямо на глазах. В следующий дождь, вода в доме поднимется до пояса. И в этом будешь виноват ты!
        };
        AI_StopProcessInfos(self);
};
