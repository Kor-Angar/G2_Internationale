instance DIA_SAGITTA_EXIT(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 999;
        condition = dia_sagitta_exit_condition;
        information = dia_sagitta_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sagitta_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_sagitta_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SAGITTA_HALLO(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 4;
        condition = dia_sagitta_hallo_condition;
        information = dia_sagitta_hallo_info;
        description = "Ты здесь совсем одна?";
};
func int dia_sagitta_hallo_condition()
{
        return TRUE;
};
func void dia_sagitta_hallo_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");        //Ты здесь совсем одна?
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");        //Говори, что тебе нужно от меня, и уходи. Я занята.
        Info_ClearChoices(dia_sagitta_hallo);
        Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
        Info_AddChoice(dia_sagitta_hallo,dia_sagitta_hallo_heil_description,dia_sagitta_hallo_heil); // "Ты можешь вылечить меня?"
        Info_AddChoice(dia_sagitta_hallo,dia_sagitta_hallo_was_description,dia_sagitta_hallo_was); // "Что ты делаешь здесь?"
        Info_AddChoice(dia_sagitta_hallo,dia_sagitta_hallo_wer_description,dia_sagitta_hallo_wer); // "Кто ты?"
};
func void dia_sagitta_hallo_wer()
{
        B_AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");    //Кто ты?
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");    //Ты что, никогда не слышал обо мне?
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");    //Меня называют ведьмой-целительницей. А еще шаманкой.
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");    //Но когда им плохо, все они неожиданно вспоминают старую добрую Сагитту и ее целебные травы.
};
func void dia_sagitta_hallo_was()
{
        B_AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");    //Что ты делаешь здесь?
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");    //Я живу здесь, сколько себя помню, и занимаюсь травами.
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");    //Лес - мой друг. Он дает мне то, что мне нужно.
};
func void dia_sagitta_hallo_heil()
{
        B_AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");   //Ты можешь вылечить меня?
        B_AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");   //Ты за этим пришел, да? Дай мне знать, если с тобой будет что-то не в порядке.
        Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
        b_logentry(TOPIC_SOLDIERTRADER,TOPIC_SOLDIERTRADER_description_89); // "У Саггиты живущей за фермой Секоба можно купить различные товары."
};
func void dia_sagitta_hallo_ende()
{
        Info_ClearChoices(dia_sagitta_hallo);
};
instance DIA_SAGITTA_TEACHALCHEMYREQUEST(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 6;
        condition = dia_sagitta_teachalchemyrequest_condition;
        information = dia_sagitta_teachalchemyrequest_info;
        permanent = TRUE;
        description = "Ты можешь научить меня готовить зелья?";
};
func int dia_sagitta_teachalchemyrequest_condition()
{
        if(Npc_KnowsInfo(other,dia_sagitta_hallo) && (MIS_SAGITTA_HERB == FALSE))
        {
                return TRUE;
        };
};
var int dia_sagitta_teachalchemyrequest_onetime;
func void dia_sagitta_teachalchemyrequest_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");  //Ты можешь научить меня готовить зелья?
        if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
        {
                B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");  //Как интересно. Меня нечасто о таком просят.
                B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");  //Так ты хочешь быть моим учеником? Тогда тебе сначала нужно доказать, что твои намерения серьезны.
                B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");  //Я сейчас работаю над очень редким зельем, которое готовится из весьма специфических трав и растений.
                B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");  //Если бы ты принес мне один ингредиент - очень редкое растение, которого у меня нет - я обучу тебя.
                DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");  //Я уже сказала тебе: да, после того, как ты принесешь мне этот редкий ингредиент, что я просила.
        };
        Info_ClearChoices(dia_sagitta_teachalchemyrequest);
        Info_AddChoice(dia_sagitta_teachalchemyrequest,dia_sagitta_teachalchemyrequest_nein_description,dia_sagitta_teachalchemyrequest_nein); // "Извини но мне это не интересно."
        Info_AddChoice(dia_sagitta_teachalchemyrequest,dia_sagitta_teachalchemyrequest_wo_description,dia_sagitta_teachalchemyrequest_wo); // "Где можно найти этот ингредиент?"
        Info_AddChoice(dia_sagitta_teachalchemyrequest,dia_sagitta_teachalchemyrequest_was_description,dia_sagitta_teachalchemyrequest_was); // "Что это за ингредиент?"
};
func void dia_sagitta_teachalchemyrequest_was()
{
        B_AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");      //Что это за ингредиент?
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");      //Это очень редкое растение - трава, называемая солнечное алоэ. Ты узнаешь его по сильному миндальному аромату.
};
func void dia_sagitta_teachalchemyrequest_wo()
{
        B_AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");       //Где можно найти этот ингредиент?
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");       //Трава, необходимая мне, произрастает только в местах, где есть все питательные вещества, необходимые для ее роста.
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");       //Обычно она встречается на экскрементах черного тролля.
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");       //Вот почему мне так сложно достать эту траву, понимаешь?
        Info_AddChoice(dia_sagitta_teachalchemyrequest,dia_sagitta_teachalchemyrequest_wo_ja_description,dia_sagitta_teachalchemyrequest_wo_ja); // "Посмотрим может мне удастся найти ее где-нибудь."
};
func void dia_sagitta_teachalchemyrequest_wo_ja()
{
        B_AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");    //Посмотрим, может, мне удастся найти ее где-нибудь.
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");    //Удачи тебе в твоих поисках.
        Info_ClearChoices(dia_sagitta_teachalchemyrequest);
        MIS_SAGITTA_HERB = LOG_RUNNING;
        Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
        b_logentry(TOPIC_SAGITTAHERB,TOPIC_SAGITTAHERB_description_90); // "Саггите нужно очень странное растение. Это солнечное алоэ оно растет только на экскрементах черного тролля."
};
func void dia_sagitta_teachalchemyrequest_nein()
{
        B_AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");     //Извини, но мне это не интересно.
        B_AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");     //Тогда хватит тратить мое время на всякую чепуху.
        Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};
instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 3;
        condition = dia_sagitta_sagitta_herb_condition;
        information = dia_sagitta_sagitta_herb_info;
        description = "Я нашел солнечное алоэ.";
};
func int dia_sagitta_sagitta_herb_condition()
{
        if(Npc_HasItems(other,itpl_sagitta_herb_mis) && (MIS_SAGITTA_HERB == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_sagitta_herb_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00"); //Я нашел солнечное алоэ.
        B_AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01"); //Спасибо. Теперь ты можешь спрашивать меня обо всем, что хочешь узнать о приготовлении зелий.
        b_giveinvitems(other,self,itpl_sagitta_herb_mis,1);
        SAGITTA_TEACHALCHEMY = TRUE;
        MIS_SAGITTA_HERB = LOG_SUCCESS;
        b_giveplayerxp(XP_SAGITTA_SONNENALOE);
};
instance DIA_SAGITTA_TEACH(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 2;
        condition = dia_sagitta_teach_condition;
        information = dia_sagitta_teach_info;
        permanent = TRUE;
        description = "Какие зелья можешь ты научить меня варить?";
};
var int dia_sagitta_teach_permanent;
func int dia_sagitta_teach_condition()
{
        if((DIA_SAGITTA_TEACH_PERMANENT == FALSE) && (SAGITTA_TEACHALCHEMY == TRUE) && Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_teach_info()
{
        var int talente;
        talente = 0;
        B_AI_Output(other,self,"DIA_Sagitta_Teach_15_00");        //Какие зелья можешь ты научить меня варить?
        if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE))
        {
                Info_ClearChoices(dia_sagitta_teach);
                Info_AddChoice(dia_sagitta_teach,DIALOG_BACK,dia_sagitta_teach_back);
        };
        if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Лечебная эссенция",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_health_01);
                talente = talente + 1;
        };
        if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Лечебный экстракт",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_health_02);
                talente = talente + 1;
        };
        if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Эссенция маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_mana_01);
                talente = talente + 1;
        };
        if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Экстракт маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_mana_02);
                talente = talente + 1;
        };
        if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Эликсир маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_mana_03);
                talente = talente + 1;
        };
        if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Эликсир духа",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_perm_mana);
                talente = talente + 1;
        };
        if((PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)))
        {
                Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Эликсир ловкости",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_sagitta_teach_perm_dex);
                talente = talente + 1;
        };
        if(talente > 0)
        {
                if(ALCHEMY_EXPLAIN != TRUE)
                {
                        B_AI_Output(self,other,"DIA_Sagitta_Teach_17_01");        //Прежде чем приступить к обучению тебя алхимии, я сначала расскажу, что необходимо иметь для приготовления зелий.
                        B_AI_Output(self,other,"DIA_Sagitta_Teach_17_02");        //Все зелья готовятся на алхимическом столе. Тебе также понадобится пустая мензурка, в которой будет храниться приготовленное зелье.
                        B_AI_Output(self,other,"DIA_Sagitta_Teach_17_03");        //Тебе нужно смешать необходимые ингредиенты и все - зелье готово.
                        B_AI_Output(self,other,"DIA_Sagitta_Teach_17_04");        //Ну а дополнительные подробности ты всегда можешь узнать у меня, если захочешь.
                        ALCHEMY_EXPLAIN = TRUE;
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Sagitta_Teach_17_05");        //Так какое зелье тебя интересует?
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sagitta_Teach_17_06");        //Ты уже знаешь все, чему я могла научить тебя.
                DIA_SAGITTA_TEACH_PERMANENT = TRUE;
        };
};
func void dia_sagitta_teach_back()
{
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_health_01()
{
        b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_health_02()
{
        b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_mana_01()
{
        b_teachplayertalentalchemy(self,other,POTION_MANA_01);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_mana_02()
{
        b_teachplayertalentalchemy(self,other,POTION_MANA_02);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_mana_03()
{
        b_teachplayertalentalchemy(self,other,POTION_MANA_03);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_perm_mana()
{
        b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
        Info_ClearChoices(dia_sagitta_teach);
};
func void dia_sagitta_teach_perm_dex()
{
        b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
        Info_ClearChoices(dia_sagitta_teach);
};
instance DIA_SAGITTA_HEAL(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 99;
        condition = dia_sagitta_heal_condition;
        information = dia_sagitta_heal_info;
        permanent = TRUE;
        description = "Вылечи меня.";
};
func int dia_sagitta_heal_condition()
{
        if(Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_heal_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_HEAL_15_00"); //Вылечи меня.
        if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEAL_17_01"); //Давай посмотрим, что там у тебя. Ммм. Моя мазь в момент заживит все твои раны.
                hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
                PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEAL_17_02"); //В настоящий момент тебе не нужно лечение.
        };
};
instance DIA_SAGITTA_TRADE(C_INFO)
{
        npc = bau_980_sagitta;
        condition = dia_sagitta_trade_condition;
        information = dia_sagitta_trade_info;
        permanent = TRUE;
        trade = TRUE;
        description = "Какие товары ты предлагаешь?";
};
func int dia_sagitta_trade_condition()
{
        if(Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_trade_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");        //Какие товары ты можешь предложить мне?
        b_givetradeinv(self);
        B_AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");        //Выбирай.
};
instance DIA_SAGITTA_KAP3_EXIT(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 999;
        condition = dia_sagitta_kap3_exit_condition;
        information = dia_sagitta_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sagitta_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_sagitta_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SAGITTA_OBSESSION(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 30;
        condition = dia_sagitta_obsession_condition;
        information = dia_sagitta_obsession_info;
        description = "Я ощущаю внутреннюю тревогу.";
};
func int dia_sagitta_obsession_condition()
{
        if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1) && Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_obsession_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");    //Я ощущаю какую-то сильную внутреннюю тревогу. Мне нужна помощь.
        B_AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");    //Я вижу, сна тебе не достаточно, чтобы восстановиться. Ты попал под воздействие черного взгляда Ищущих.
        B_AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");    //Иди к Пирокару, высшему магу монастыря. Моих скромных знаний здесь недостаточно.
};
instance DIA_SAGITTA_THEKLA(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 3;
        condition = dia_sagitta_thekla_condition;
        information = dia_sagitta_thekla_info;
        description = "Текла послала меня к тебе за травами.";
};
func int dia_sagitta_thekla_condition()
{
        if((MIS_THEKLA_PAKET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_thekla_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");       //Текла послала меня к тебе за травами.
        B_AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");       //Ах, да. Вообще-то я ожидала ее еще несколько дней назад.
        B_AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");       //Вот, держи пакет. И поосторожнее с ним!
        b_giveplayerxp(XP_AMBIENTKAP3);
        CreateInvItems(self,itmi_theklaspaket,1);
        b_giveinvitems(self,other,itmi_theklaspaket,1);
};
instance DIA_SAGITTA_KAP4_EXIT(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 999;
        condition = dia_sagitta_kap4_exit_condition;
        information = dia_sagitta_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sagitta_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_sagitta_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SAGITTA_HEALRANDOLPH(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 30;
        condition = dia_sagitta_healrandolph_condition;
        information = dia_sagitta_healrandolph_info;
        permanent = TRUE;
        description = "У Рендольфа похмельный синдром.";
};
var int dia_sagitta_healrandolph_gotone;
var int dia_sagitta_healrandolph_knowsprice;
func int dia_sagitta_healrandolph_condition()
{
        if((MIS_HEALRANDOLPH == LOG_RUNNING) && (Npc_HasItems(other,itpo_healrandolph_mis) == 0) && Npc_KnowsInfo(other,dia_sagitta_hallo))
        {
                return TRUE;
        };
};
func void dia_sagitta_healrandolph_info()
{
        B_AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00"); //У Рендольфа похмельный синдром.
        if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01"); //И когда этот парень образумится?!
                DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
        };
        if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02"); //Я уже давала ему лекарство. Не связывался бы ты с ним.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03"); //Я дам тебе лекарство для него. Оно поставит его на ноги за пару дней.
        };
        B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04"); //Но это обойдется тебе в 300 золотых.
        if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
        {
                B_AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05"); //Что?
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06"); //Единственное, что ты можешь получить здесь бесплатно - это смерть, малыш.
        };
        Info_ClearChoices(dia_sagitta_healrandolph);
        Info_AddChoice(dia_sagitta_healrandolph,dia_sagitta_healrandolph_no_description,dia_sagitta_healrandolph_no); // "Нет. Столько золота за такую ерунду?!"
        Info_AddChoice(dia_sagitta_healrandolph,dia_sagitta_healrandolph_geld_description,dia_sagitta_healrandolph_geld); // "Вот твои деньги."
};
func void dia_sagitta_healrandolph_geld()
{
        B_AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");    //Вот твои деньги.
        if(b_giveinvitems(other,self,itmi_gold,300))
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");    //Очень хорошо. Ты всегда можешь потребовать от него компенсировать тебе расходы.
                CreateInvItems(self,itpo_healrandolph_mis,1);
                b_giveinvitems(self,other,itpo_healrandolph_mis,1);
                DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
                b_logentry(TOPIC_HEALRANDOLPH,TOPIC_HEALRANDOLPH_description_91); // "Сагитта дала мне лекарство для Рендольфа."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");    //Пока у тебя не будет всей суммы, я даже разговаривать об этом не буду.
        };
        Info_ClearChoices(dia_sagitta_healrandolph);
};
func void dia_sagitta_healrandolph_no()
{
        B_AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");      //Нет. Столько золота за такую ерунду?!
        B_AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");      //(смеется) Он не дал тебе денег? Это на него похоже!
        Info_ClearChoices(dia_sagitta_healrandolph);
};
instance DIA_SAGITTA_KAP5_EXIT(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 999;
        condition = dia_sagitta_kap5_exit_condition;
        information = dia_sagitta_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sagitta_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_sagitta_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SAGITTA_KAP6_EXIT(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 999;
        condition = dia_sagitta_kap6_exit_condition;
        information = dia_sagitta_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sagitta_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_sagitta_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SAGITTA_PICKPOCKET(C_INFO)
{
        npc = bau_980_sagitta;
        nr = 900;
        condition = dia_sagitta_pickpocket_condition;
        information = dia_sagitta_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_120_FEMALE;
};
func int dia_sagitta_pickpocket_condition()
{
        return c_beklauen(103,360);
};
func void dia_sagitta_pickpocket_info()
{
        Info_ClearChoices(dia_sagitta_pickpocket);
        Info_AddChoice(dia_sagitta_pickpocket,DIALOG_BACK,dia_sagitta_pickpocket_back);
        Info_AddChoice(dia_sagitta_pickpocket,DIALOG_PICKPOCKET,dia_sagitta_pickpocket_doit);
};
func void dia_sagitta_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_sagitta_pickpocket);
};
func void dia_sagitta_pickpocket_back()
{
        Info_ClearChoices(dia_sagitta_pickpocket);
};
