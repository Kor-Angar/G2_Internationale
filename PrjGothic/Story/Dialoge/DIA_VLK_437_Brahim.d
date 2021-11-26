var int brahim_showedmaps;
func void b_brahimnewmaps()
{
        if(BRAHIM_SHOWEDMAPS == TRUE)
        {
                B_AI_Output(self,other,"B_BrahimNewMaps_07_00");  //Заходи попозже. Я уверен, что смогу приготовить что-нибудь интересное для тебя.
        };
};
instance DIA_BRAHIM_EXIT(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 999;
        condition = dia_brahim_exit_condition;
        information = dia_brahim_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_brahim_exit_condition()
{
        if(KAPITEL <= 2)
        {
                return TRUE;
        };
};
func void dia_brahim_exit_info()
{
        b_brahimnewmaps();
        AI_StopProcessInfos(self);
};
instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 900;
        condition = dia_brahim_pickpocket_condition;
        information = dia_brahim_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_20;
};
func int dia_brahim_pickpocket_condition()
{
        return c_beklauen(15,15);
};
func void dia_brahim_pickpocket_info()
{
        Info_ClearChoices(dia_brahim_pickpocket);
        Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
        Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};
func void dia_brahim_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_brahim_pickpocket);
};
func void dia_brahim_pickpocket_back()
{
        Info_ClearChoices(dia_brahim_pickpocket);
};
instance DIA_BRAHIM_GREET(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 2;
        condition = dia_brahim_greet_condition;
        information = dia_brahim_greet_info;
        permanent = FALSE;
        description = "Что ты делаешь здесь?";
};
func int dia_brahim_greet_condition()
{
        return TRUE;
};
func void dia_brahim_greet_info()
{
        B_AI_Output(other,self,"DIA_Brahim_GREET_15_00"); //Что ты делаешь здесь?
        B_AI_Output(self,other,"DIA_Brahim_GREET_07_01"); //Меня зовут Ибрагим. Я рисую карты и продаю их.
        B_AI_Output(self,other,"DIA_Brahim_GREET_07_02"); //Так как ты недавно здесь, возможно, тебе пригодится карта города.
        B_AI_Output(self,other,"DIA_Brahim_GREET_07_03"); //Это очень недорого и очень полезно, пока ты здесь не освоишься.
        Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
        b_logentry(TOPIC_CITYTRADER,TOPIC_CITYTRADER_description_662); // "Ибрагим рисует карты и продает их в гавани."
};
instance DIA_BRAHIM_BUY(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 9;
        condition = dia_brahim_buy_condition;
        information = dia_brahim_buy_info;
        permanent = TRUE;
        trade = TRUE;
        description = "Покажи мне твои карты.";
};
func int dia_brahim_buy_condition()
{
        if(Npc_KnowsInfo(hero,dia_brahim_greet))
        {
                return TRUE;
        };
};
func void dia_brahim_buy_info()
{
        b_givetradeinv(self);
        B_AI_Output(other,self,"DIA_Brahim_BUY_15_00");   //Покажи мне твои карты.
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Brahim_BUY_07_01");   //Ты не найдешь лучше даже в монастыре.
        };
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Brahim_BUY_07_02");   //Хорошая карта - это очень важно, особенно для людей, прибывших с материка, мистер Паладин.
        };
        BRAHIM_SHOWEDMAPS = TRUE;
};
instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 999;
        condition = dia_brahim_kap3_exit_condition;
        information = dia_brahim_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_brahim_kap3_exit_condition()
{
        if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
        {
                return TRUE;
        };
};
func void dia_brahim_kap3_exit_info()
{
        if(KAPITEL <= 4)
        {
                b_brahimnewmaps();
        };
        AI_StopProcessInfos(self);
};
instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
        npc = vlk_437_brahim;
        nr = 999;
        condition = dia_brahim_kap3_first_exit_condition;
        information = dia_brahim_kap3_first_exit_info;
        permanent = FALSE;
        description = DIALOG_ENDE;
};
func int dia_brahim_kap3_first_exit_condition()
{
        if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
        {
                return TRUE;
        };
};
func void dia_brahim_kap3_first_exit_info()
{
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");       //Я знал, что этот клочок бумаги заинтересует тебя.
        B_AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");       //Какой клочок?
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");       //Ну, та старая карта, что ты только что купил.
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");       //Я знаю таких людей, как ты. Вы используете каждый шанс, чтобы найти сокровища.
        Info_ClearChoices(dia_brahim_kap3_first_exit);
        Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
        Info_AddChoice(dia_brahim_kap3_first_exit,dia_brahim_kap3_first_exit_wheregetit_description,dia_brahim_kap3_first_exit_wheregetit); // "Где ты взял эту карту?"
        Info_AddChoice(dia_brahim_kap3_first_exit,dia_brahim_kap3_first_exit_content_description,dia_brahim_kap3_first_exit_content); // "Что это за карта?"
        Info_AddChoice(dia_brahim_kap3_first_exit,dia_brahim_kap3_first_exit_keepit_description,dia_brahim_kap3_first_exit_keepit); // "Почему ты не оставил ее себе?"
};
func void dia_brahim_kap3_first_exit_back()
{
        Info_ClearChoices(dia_brahim_kap3_first_exit);
};
func void dia_brahim_kap3_first_exit_wheregetit()
{
        B_AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");    //Где ты взял эту карту?
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");    //Ох, я нашел ее в стопке старых карт, что я купил недавно.
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");    //Продавец, должно быть, проглядел ее.
};
func void dia_brahim_kap3_first_exit_content()
{
        B_AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");       //Что это за карта?
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");       //Похоже, это карта сокровищ или что-то вроде.
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");       //Но, похоже, ты из тех, кто способен выяснить это самостоятельно.
};
func void dia_brahim_kap3_first_exit_keepit()
{
        B_AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");        //Почему ты не оставил ее себе?
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");        //Я старый человек, и времена, когда я сам искал сокровища, давно прошли.
        B_AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");        //Пусть этим занимаются те, кто помоложе.
};
