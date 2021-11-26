instance DIA_ORIC_EXIT(C_INFO)
{
        npc = pal_251_oric;
        nr = 999;
        condition = dia_oric_exit_condition;
        information = dia_oric_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_oric_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_oric_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORIC_HALLO(C_INFO)
{
        npc = pal_251_oric;
        nr = 4;
        condition = dia_oric_hallo_condition;
        information = dia_oric_hallo_info;
        permanent = FALSE;
        description = "Каковы твои обязанности?";
};
func int dia_oric_hallo_condition()
{
        return TRUE;
};
func void dia_oric_hallo_info()
{
        B_AI_Output(other,self,"DIA_Oric_HALLO_15_00");   //Каковы твои обязанности?
        B_AI_Output(self,other,"DIA_Oric_HALLO_11_01");   //Я офицер-стратег короля, и в настоящее время подчиняюсь достопочтенному командующему Гаронду.
        B_AI_Output(self,other,"DIA_Oric_HALLO_11_02");   //Мы последние паладины, оставшиеся здесь, в замке. Все остальные ушли либо пали на поле боя.
        B_AI_Output(self,other,"DIA_Oric_HALLO_11_03");   //Это наш долг, чтобы эта экспедиция завершилась успешно. И мы добьемся этого. Клянусь Инносом - мы добьемся этого.
};
instance DIA_ORIC_BRUDER(C_INFO)
{
        npc = pal_251_oric;
        nr = 4;
        condition = dia_oric_bruder_condition;
        information = dia_oric_bruder_info;
        permanent = FALSE;
        description = "У меня есть известие для тебя.";
};
func int dia_oric_bruder_condition()
{
        if(Npc_KnowsInfo(other,dia_jergan_burg) && Npc_KnowsInfo(other,dia_oric_hallo))
        {
                return TRUE;
        };
};
func void dia_oric_bruder_info()
{
        B_AI_Output(other,self,"DIA_Oric_Bruder_15_00");  //У меня есть известие для тебя.
        B_AI_Output(self,other,"DIA_Oric_Bruder_11_01");  //Что за известие?
        B_AI_Output(other,self,"DIA_Oric_Bruder_15_02");  //Твой брат мертв. Он погиб у Прохода.
        B_AI_Output(self,other,"DIA_Oric_Bruder_11_03");  //(бормочет)... мой брат...
        B_AI_Output(self,other,"DIA_Oric_Bruder_11_04");  //Иннос подвергает меня суровым испытаниям. Но он погиб как его слуга...
        B_AI_Output(self,other,"DIA_Oric_Bruder_11_05");  //Эта новость - стрела, пронзившая мое сердце. Я буду искать новые силы в молитвах.
        ORICBRUDER = TRUE;
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_ORIC_SCOUTMINE(C_INFO)
{
        npc = pal_251_oric;
        nr = 1;
        condition = dia_oric_scoutmine_condition;
        information = dia_oric_scoutmine_info;
        permanent = FALSE;
        description = "Я отправляюсь к шахтам.";
};
func int dia_oric_scoutmine_condition()
{
        if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL < 3) && Npc_KnowsInfo(other,dia_oric_hallo) && ((FAJETH_ORE == FALSE) || (MARCOS_ORE == FALSE) || (SILVESTRO_ORE == FALSE)))
        {
                return TRUE;
        };
};
func void dia_oric_scoutmine_info()
{
        B_AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");       //Я отправляюсь к шахтам.
        B_AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");       //Будь осторожен. Это нелегкая задача. Прежде всего, найди паладинов. Они возглавляют эти три группы.
        B_AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");       //Если тебе нужно больше информации, поговори с Парсивалем.
};
instance DIA_ORIC_PERM(C_INFO)
{
        npc = pal_251_oric;
        nr = 99;
        condition = dia_oric_perm_condition;
        information = dia_oric_perm_info;
        permanent = TRUE;
        description = "Как ситуация?";
};
func int dia_oric_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_oric_hallo) && (KAPITEL <= 3))
        {
                return TRUE;
        };
};
func void dia_oric_perm_info()
{
        B_AI_Output(other,self,"DIA_Oric_Perm_15_00");    //Как обстановка?
        if(MIS_SCOUTMINE == LOG_RUNNING)
        {
                B_AI_Output(self,other,"DIA_Oric_Perm_11_01");    //Ты должен найти старателей и выяснить, сколько у них руды. А там будет видно, как и когда мы сможем покинуть эту долину.
        }
        else if(MIS_SCOUTMINE == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Oric_Perm_11_02");    //Ситуация накалилась до предела. Но мы не отступим. Иннос всегда с нами. Он выведет нас из этой долины.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Oric_Perm_11_03");    //Твое появление здесь вселяет в нас надежду.
                B_AI_Output(self,other,"DIA_Oric_Perm_11_04");    //Ты нужен нам. Иди, поговори с Гарондом - он все объяснит тебе.
        };
};
instance DIA_ORIC_KAP3_EXIT(C_INFO)
{
        npc = pal_251_oric;
        nr = 999;
        condition = dia_oric_kap3_exit_condition;
        information = dia_oric_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_oric_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_oric_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORIC_KAP4_EXIT(C_INFO)
{
        npc = pal_251_oric;
        nr = 999;
        condition = dia_oric_kap4_exit_condition;
        information = dia_oric_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_oric_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_oric_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORIC_IAMBACK(C_INFO)
{
        npc = pal_251_oric;
        nr = 4;
        condition = dia_oric_iamback_condition;
        information = dia_oric_iamback_info;
        description = "Я уже вернулся.";
};
func int dia_oric_iamback_condition()
{
        if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_hallo))
        {
                return TRUE;
        };
};
func void dia_oric_iamback_info()
{
        B_AI_Output(other,self,"DIA_Oric_IAmBack_15_00"); //Я уже вернулся.
        B_AI_Output(self,other,"DIA_Oric_IAmBack_11_01"); //Я уже не надеялся, что мы еще когда-нибудь увидим тебя после того, что произошло, когда ты был здесь несколько дней назад.
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Oric_IAmBack_11_02"); //Я приветствую тебя от имени нашего ордена.
        }
        else if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Oric_IAmBack_11_03"); //Я виду, ты стал магом. Мое почтение.
        };
        B_AI_Output(self,other,"DIA_Oric_IAmBack_11_04"); //Возможно, твое появление - добрый знак.
};
instance DIA_ORIC_CANHELP(C_INFO)
{
        npc = pal_251_oric;
        nr = 4;
        condition = dia_oric_canhelp_condition;
        information = dia_oric_canhelp_info;
        description = "Могу я чем-нибудь помочь?";
};
func int dia_oric_canhelp_condition()
{
        if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_KILLHOSHPAK == FALSE))
        {
                return TRUE;
        };
};
func void dia_oric_canhelp_info()
{
        B_AI_Output(other,self,"DIA_Oric_CanHelp_15_00"); //Могу я чем-нибудь помочь?
        B_AI_Output(self,other,"DIA_Oric_CanHelp_11_01"); //В настоящий момент, похоже, мы сделали все, что было возможно.
        B_AI_Output(self,other,"DIA_Oric_CanHelp_11_02"); //Впрочем, есть кое-что. Кое-что очень важное, что ты мог бы сделать для нас за пределами этих стен.
        B_AI_Output(self,other,"DIA_Oric_CanHelp_11_03"); //Мы планируем отрубить змею голову.
        Info_ClearChoices(dia_oric_canhelp);
        Info_AddChoice(dia_oric_canhelp,dia_oric_canhelp_notyourman_description,dia_oric_canhelp_notyourman); // "Я думаю тебе лучше поискать кого-нибудь еще."
        Info_AddChoice(dia_oric_canhelp,dia_oric_canhelp_whatyoumean_description,dia_oric_canhelp_whatyoumean); // "Что ты хочешь сказать этим?"
};
func void dia_oric_canhelp_notyourman()
{
        B_AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");      //Я думаю, тебе лучше поискать кого-нибудь еще.
        B_AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");      //Я не могу выделить ни одного человека - ты наша единственная надежда.
};
func void dia_oric_canhelp_whatyoumean()
{
        B_AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");     //Что ты хочешь сказать этим?
        B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");     //Мы знаем одного из их предводителей. Его зовут Хош-Пак.
        B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");     //Он один из самых влиятельных шаманов орков.
        B_AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");     //А какова в этом моя роль?
        B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");     //Убей его.
        if(!Npc_IsDead(hosh_pak))
        {
                B_AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");     //Ты шутишь!?
        };
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");     //Ты единственный, кого мы можем выделить для этого дела. Все остальные рыцари нужны здесь.
        }
        else if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");     //Мне нелегко просить тебя об этом, мастер. Но ты как нельзя лучше подходишь для этого задания.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");     //Ты ведь хочешь помочь нам, разве нет? Ну, тогда...
        };
        B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");     //Палатка Хош-Пака находится за осадным кругом, на утесе к югу отсюда.
        B_AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");     //Ее даже видно из этих окон.
        Info_ClearChoices(dia_oric_canhelp);
        ORIKTOLDMISSIONCHAPTER4 = TRUE;
};
instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
        npc = pal_251_oric;
        nr = 6;
        condition = dia_oric_needstuff_condition;
        information = dia_oric_needstuff_info;
        description = "Мне нужно снаряжение.";
};
func int dia_oric_needstuff_condition()
{
        if(ORIKTOLDMISSIONCHAPTER4 == TRUE)
        {
                return TRUE;
        };
};
func void dia_oric_needstuff_info()
{
        B_AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");       //Мне нужно снаряжение.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");       //У нас мало что осталось, чем мы могли бы поделиться с тобой.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");       //Ну, я могу предложить тебе вот это.
        Info_ClearChoices(dia_oric_needstuff);
        Info_AddChoice(dia_oric_needstuff,dia_oric_needstuff_dexterity_description,dia_oric_needstuff_dexterity); // "выбрать эликсир ловкости"
        Info_AddChoice(dia_oric_needstuff,dia_oric_needstuff_strength_description,dia_oric_needstuff_strength); // "выбрать эликсир силы"
        Info_AddChoice(dia_oric_needstuff,dia_oric_needstuff_mana_description,dia_oric_needstuff_mana); // "выбрать 3 эликсира маны"
        Info_AddChoice(dia_oric_needstuff,dia_oric_needstuff_health_description,dia_oric_needstuff_health); // "выбрать 3 лечебных эликсира"
};
func void dia_oric_needstuff_health()
{
        B_AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");        //Я возьму эти лечебные зелья.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");        //Хороший выбор. Надеюсь, они помогут тебе.
        CreateInvItems(self,itpo_health_03,3);
        b_giveinvitems(self,other,itpo_health_03,3);
        Info_ClearChoices(dia_oric_needstuff);
};
func void dia_oric_needstuff_mana()
{
        B_AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");  //Я возьму эти зелья маны.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");  //Надеюсь, они помогут тебе. Да хранит тебя Иннос.
        CreateInvItems(self,itpo_mana_03,3);
        b_giveinvitems(self,other,itpo_mana_03,3);
        Info_ClearChoices(dia_oric_needstuff);
};
func void dia_oric_needstuff_strength()
{
        B_AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");      //Я возьму эликсир силы.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");      //Вот, он наверняка пригодится тебе. Я желаю тебе удачи.
        CreateInvItems(self,itpo_perm_str,1);
        b_giveinvitems(self,other,itpo_perm_str,1);
        Info_ClearChoices(dia_oric_needstuff);
};
func void dia_oric_needstuff_dexterity()
{
        B_AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");     //Я возьму эликсир ловкости.
        B_AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");     //Пусть всегда твои стрелы летят точно в цель. Вот, держи.
        CreateInvItems(self,itpo_perm_dex,1);
        b_giveinvitems(self,other,itpo_perm_dex,1);
        Info_ClearChoices(dia_oric_needstuff);
};
instance DIA_ORIC_NOMURDER(C_INFO)
{
        npc = pal_251_oric;
        nr = 7;
        condition = dia_oric_nomurder_condition;
        information = dia_oric_nomurder_info;
        description = "Я не буду убивать Хош-Пака таким подлым образом.";
};
func int dia_oric_nomurder_condition()
{
        if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE) && !Npc_IsDead(hosh_pak))
        {
                return TRUE;
        };
};
func void dia_oric_nomurder_info()
{
        B_AI_Output(other,self,"DIA_Oric_NoMurder_15_00");        //Я не буду убивать Хош-Пака таким подлым образом.
        B_AI_Output(self,other,"DIA_Oric_NoMurder_11_01");        //Ты хотя бы представляешь себе, насколько тяжело наше положение?
        B_AI_Output(self,other,"DIA_Oric_NoMurder_11_02");        //Нас осаждают превосходящие силы орков. Наши запасы уже на исходе.
        B_AI_Output(self,other,"DIA_Oric_NoMurder_11_03");        //Если мы не сможем доставить эту руду на корабль, орки превратят в руины все наше королевство.
        B_AI_Output(self,other,"DIA_Oric_NoMurder_11_04");        //Все, ради чего мы живем, пойдет прахом.
};
instance DIA_ORIC_WILLHELP(C_INFO)
{
        npc = pal_251_oric;
        nr = 5;
        condition = dia_oric_willhelp_condition;
        information = dia_oric_willhelp_info;
        permanent = FALSE;
        description = "Хорошо. Я убью Хош-Пака.";
};
func int dia_oric_willhelp_condition()
{
        if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE) && !Npc_IsDead(hosh_pak))
        {
                return TRUE;
        };
};
func void dia_oric_willhelp_info()
{
        B_AI_Output(other,self,"DIA_Oric_WillHelp_15_00");        //Хорошо. Я убью Хош-Пака.
        B_AI_Output(self,other,"DIA_Oric_WillHelp_11_01");        //Я рад слышать это.
        B_AI_Output(self,other,"DIA_Oric_WillHelp_11_02");        //Палатка Хош-Пака находится на небольшом утесе. Ты, должно быть, уже видел его раньше.
        B_AI_Output(self,other,"DIA_Oric_WillHelp_11_03");        //Этот утес стоит неподалеку от дороги, ведущей к нашей шахте. В тени огромной горы.
        Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
        b_logentry(TOPIC_KILLHOSHPAK,TOPIC_KILLHOSHPAK_description_353); // "Орик хочет чтобы я убил шамана орков Хош-Пака. Его палатка находится на небольшом утесе недалеко от задней части замка."
        MIS_KILLHOSHPAK = LOG_RUNNING;
};
instance DIA_ORIC_HOSHDEAD(C_INFO)
{
        npc = pal_251_oric;
        nr = 8;
        condition = dia_oric_hoshdead_condition;
        information = dia_oric_hoshdead_info;
        permanent = FALSE;
        description = "Хош-Пак мертв!";
};
func int dia_oric_hoshdead_condition()
{
        if(Npc_IsDead(hosh_pak))
        {
                if(MIS_KILLHOSHPAK == LOG_RUNNING)
                {
                        return TRUE;
                };
                if(ORIKTOLDMISSIONCHAPTER4 == TRUE)
                {
                        return TRUE;
                };
        };
};
func void dia_oric_hoshdead_info()
{
        B_AI_Output(other,self,"DIA_Oric_HoshDead_15_00");        //Хош-Пак мертв!
        B_AI_Output(self,other,"DIA_Oric_HoshDead_11_01");        //Отлично, это обязательно посеет хаос в рядах орков. Может быть, у нас все еще есть какие-то шансы.
        B_AI_Output(self,other,"DIA_Oric_HoshDead_11_02");        //Я думаю, это позволит нам получить передышку, по крайней мере, на неделю.
        MIS_KILLHOSHPAK = LOG_SUCCESS;
        b_giveplayerxp(XP_KILLHOSH_PAK);
};
instance DIA_ORIC_ANYNEWS(C_INFO)
{
        npc = pal_251_oric;
        nr = 9;
        condition = dia_oric_anynews_condition;
        information = dia_oric_anynews_info;
        permanent = TRUE;
        description = "Есть новости?";
};
func int dia_oric_anynews_condition()
{
        if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback))
        {
                return TRUE;
        };
};
func void dia_oric_anynews_info()
{
        B_AI_Output(other,self,"DIA_Oric_AnyNews_15_00"); //Есть новости?
        if(MIS_OCGATEOPEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Oric_AnyNews_11_01"); //Ты имеешь в виду, кроме того, что орки вторглись в замок?
        }
        else if(Npc_KnowsInfo(other,dia_garond_alldragondead))
        {
                B_AI_Output(self,other,"DIA_Oric_AnyNews_11_02"); //Да. Ты наш герой. Уничтожить всех драконов разом - это воистину героический подвиг. Я потрясен!
        }
        else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Oric_AnyNews_11_03"); //Орки, похоже, выбиты из колеи смертью Хош-Пака.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Oric_AnyNews_11_04"); //Орков становится все больше и больше. Мне это не нравится.
        };
};
instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
        npc = pal_251_oric;
        nr = 3;
        condition = dia_oric_dragonplettbericht_condition;
        information = dia_oric_dragonplettbericht_info;
        permanent = TRUE;
        description = "Мне нужна информация о драконах.";
};
func int dia_oric_dragonplettbericht_condition()
{
        if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_ALLDRAGONSDEAD == FALSE))
        {
                return TRUE;
        };
};
var int oric_swampdragoninfo_onetime;
var int oric_rockdragoninfo_onetime;
var int oric_firedragoninfo_onetime;
var int oric_icedragoninfo_onetime;
var int oric_dragoncounter;
var int oric_firstquestion;
func void dia_oric_dragonplettbericht_info()
{
        B_AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");      //Мне нужна информация о драконах.
        if(MIS_KILLEDDRAGONS == 1)
        {
                B_AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");      //Я уже убил одного из них. Ты можешь сказать мне, где нужно искать других?
        }
        else if(MIS_KILLEDDRAGONS != 0)
        {
                B_AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");      //У меня есть чувство, что я пока нашел не всех драконов. Может, я что-то упустил?
        };
        if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
        {
                if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
                {
                        B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");      //Несколько дней назад к западу от нашего замка появилось большое болото. Это довольно подозрительно, так тебе не кажется?
                        b_logentry(TOPIC_DRACHENJAGD,TOPIC_DRACHENJAGD_description_354); // "Орик дал мне повод к размышлению: За последние несколько дней к западу от замка образовалось большое болото. Он считает это очень подозрительным."
                        ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
                }
                else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
                {
                        B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");      //На юге находится крепость в скалах, далеко за вулканом.
                        B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");      //Наши разведчики докладывают, что эта крепость хорошо охраняется. Может быть, один из них скрывается там.
                        b_logentry(TOPIC_DRACHENJAGD,TOPIC_DRACHENJAGD_description_355); // "Разведчики паладинов сообщили Орику что крепость в скалах за вулканом на юге хорошо охраняется. Орик подозревает что дракон находится там."
                        ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
                }
                else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
                {
                        B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");      //После прошлого нападения драконов, один из них, по слухам, полетел в направлении вулкана на юге. Тебе стоит поискать его там.
                        b_logentry(TOPIC_DRACHENJAGD,TOPIC_DRACHENJAGD_description_356); // "По-видимому последнего дракона нападавшего на замок в Долине рудников видели неподалеку от вулкана."
                        ORIC_FIREDRAGONINFO_ONETIME = TRUE;
                }
                else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
                {
                        B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");      //На западе находится обширная ледяная долина. Я не удивлюсь, если один из драконов скрывается там.
                        b_logentry(TOPIC_DRACHENJAGD,TOPIC_DRACHENJAGD_description_357); // "Согласно информации полученной от Орика заснеженный район на западе может быть логовом дракона."
                        ORIC_ICEDRAGONINFO_ONETIME = TRUE;
                };
                ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
                ORIC_FIRSTQUESTION = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");      //В настоящий момент мне нечего сказать тебе.
        };
};
instance DIA_ORIC_KAP5_EXIT(C_INFO)
{
        npc = pal_251_oric;
        nr = 999;
        condition = dia_oric_kap5_exit_condition;
        information = dia_oric_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_oric_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_oric_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORIC_KAP6_EXIT(C_INFO)
{
        npc = pal_251_oric;
        nr = 999;
        condition = dia_oric_kap6_exit_condition;
        information = dia_oric_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_oric_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_oric_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORIC_PICKPOCKET(C_INFO)
{
        npc = pal_251_oric;
        nr = 900;
        condition = dia_oric_pickpocket_condition;
        information = dia_oric_pickpocket_info;
        permanent = TRUE;
        description = "(украсть его свиток будет чертовски трудно)";
};
func int dia_oric_pickpocket_condition()
{
        if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - THEFTDIFF)))
        {
                return TRUE;
        };
};
func void dia_oric_pickpocket_info()
{
        Info_ClearChoices(dia_oric_pickpocket);
        Info_AddChoice(dia_oric_pickpocket,DIALOG_BACK,dia_oric_pickpocket_back);
        Info_AddChoice(dia_oric_pickpocket,DIALOG_PICKPOCKET,dia_oric_pickpocket_doit);
};
func void dia_oric_pickpocket_doit()
{
        if(other.attribute[ATR_DEXTERITY] >= 85)
        {
                b_giveinvitems(self,other,itsc_palrepelevil,1);
                b_givethiefxp();
                Info_ClearChoices(dia_oric_pickpocket);
        }
        else
        {
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_THEFT,1);
        };
};
func void dia_oric_pickpocket_back()
{
        Info_ClearChoices(dia_oric_pickpocket);
};
