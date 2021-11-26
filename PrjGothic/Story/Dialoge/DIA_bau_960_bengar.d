instance DIA_BENGAR_EXIT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 999;
        condition = dia_bengar_exit_condition;
        information = dia_bengar_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bengar_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_bengar_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_HALLO(C_INFO)
{
        npc = bau_960_bengar;
        nr = 3;
        condition = dia_bengar_hallo_condition;
        information = dia_bengar_hallo_info;
        description = "Ты здешний фермер?";
};
func int dia_bengar_hallo_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_bengar_hallo_info()
{
        B_AI_Output(other,self,"DIA_Bengar_HALLO_15_00"); //Ты здешний фермер?
        B_AI_Output(self,other,"DIA_Bengar_HALLO_10_01"); //Можно сказать и так, хотя на самом деле, я простой арендатор.
        B_AI_Output(self,other,"DIA_Bengar_HALLO_10_02"); //Вся земля здесь принадлежит одному крупному землевладельцу.
};
instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
        npc = bau_960_bengar;
        nr = 5;
        condition = dia_bengar_wovonlebtihr_condition;
        information = dia_bengar_wovonlebtihr_info;
        description = "Как ты зарабатываешь на жизнь?";
};
func int dia_bengar_wovonlebtihr_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_bengar_wovonlebtihr_info()
{
        B_AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");  //Как ты зарабатываешь на жизнь?
        B_AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");  //В основном охотой и рубкой леса. Ну и, конечно же, мы также выращиваем овец и работаем в поле.
        B_AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");  //Онар навязал мне всех этих работников и мне приходится чем-то занимать их. Всего несколько из них хорошие охотники, понимаешь?
};
instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
        npc = bau_960_bengar;
        nr = 6;
        condition = dia_bengar_tageloehner_condition;
        information = dia_bengar_tageloehner_info;
        description = "Ты нанимаешь поденных рабочих?";
};
func int dia_bengar_tageloehner_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_bengar_tageloehner_info()
{
        B_AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");   //Ты нанимаешь поденных рабочих?
        B_AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");   //Онар увольняет работников, которые не нужны на его ферме.
        B_AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");   //Затем он посылает их ко мне. Я кормлю их, а они работают на меня.
};
instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
        npc = bau_960_bengar;
        nr = 8;
        condition = dia_bengar_rebellieren_condition;
        information = dia_bengar_rebellieren_info;
        description = "Что ты думаешь об Онаре?";
};
func int dia_bengar_rebellieren_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_hallo))
        {
                return TRUE;
        };
};
func void dia_bengar_rebellieren_info()
{
        B_AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");   //Что ты думаешь об Онаре?
        B_AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");   //Это жадный ублюдок. Из-за него нас всех повесят.
        B_AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");   //Однажды придут паладины из города и заставят нас, мелких фермеров, расплачиваться за все, что он наделал.
        B_AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");   //Но у меня нет выбора. Ополчение приходит сюда только чтобы собирать налоги, а не затем, чтобы защищать мою ферму.
        B_AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");   //Если я буду проявлять лояльность к городу, я останусь совсем один.
        B_AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");   //А так, Онар хотя бы иногда присылает наемников посмотреть, как мы тут живем.
};
instance DIA_BENGAR_PALADINE(C_INFO)
{
        npc = bau_960_bengar;
        nr = 9;
        condition = dia_bengar_paladine_condition;
        information = dia_bengar_paladine_info;
        description = "А что ты имеешь против королевских войск?";
};
func int dia_bengar_paladine_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
        {
                return TRUE;
        };
};
func void dia_bengar_paladine_info()
{
        B_AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");      //А что ты имеешь против королевских войск?
        B_AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");      //Это очевидно. С тех пор, как паладины прибыли в город, не видно никаких улучшений. Скорее наоборот.
        B_AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");      //Теперь это чертово ополчение стало появляться у нас даже чаще. Они воруют все, что только могут, а паладины ничего не делают с этим.
        B_AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");      //Единственные паладины, что я вообще когда-либо видел, это вон те два стражника у Прохода.
        B_AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");      //Они не пошевелятся, даже если ополчение вырежет нас всех.
};
instance DIA_BENGAR_PASS(C_INFO)
{
        npc = bau_960_bengar;
        nr = 10;
        condition = dia_bengar_pass_condition;
        information = dia_bengar_pass_info;
        description = "У Прохода?";
};
func int dia_bengar_pass_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_paladine))
        {
                return TRUE;
        };
};
func void dia_bengar_pass_info()
{
        B_AI_Output(other,self,"DIA_Bengar_PASS_15_00");  //У Прохода?
        B_AI_Output(self,other,"DIA_Bengar_PASS_10_01");  //Да. Проход в старую Долину Рудников находится у водопада в другом конце этого плоскогорья.
        if(!Npc_IsDead(malak) && (KAPITEL < 3))
        {
                B_AI_Output(self,other,"DIA_Bengar_PASS_10_02");  //Спроси Малака о нем. Он там бывает пару раз в неделю.
        };
};
instance DIA_BENGAR_MILIZ(C_INFO)
{
        npc = bau_960_bengar;
        nr = 11;
        condition = dia_bengar_miliz_condition;
        information = dia_bengar_miliz_info;
        permanent = FALSE;
        description = "Я должен решить твою проблему с ополчением.";
};
func int dia_bengar_miliz_condition()
{
        if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
        {
                return TRUE;
        };
};
func void dia_bengar_miliz_info()
{
        B_AI_Output(other,self,"DIA_Bengar_MILIZ_15_00"); //Я должен решить твою проблему с ополчением.
        if(other.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_01"); //Что?! Я сказал Онару, чтобы он прислал своих НАЕМНИКОВ.
                B_AI_Output(other,self,"DIA_Bengar_MILIZ_15_02"); //Это мой шанс проявить себя.
                B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_03"); //Ужас! Да ты знаешь, что ополчение сделает со мной, если у тебя ничего не получится?
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_04"); //Я уж думал, что никто не придет.
                B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_05"); //Я сказал об этом Онару еще пару дней назад. И за что я плачу свою ренту?!
        };
        B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_06"); //Эти ублюдки заявляются сюда каждую неделю и собирают налоги в пользу города.
        B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_07"); //Ты как раз вовремя пришел.
        B_AI_Output(self,other,"DIA_Bengar_MILIZ_10_08"); //Они могут появиться в любую минуту.
};
instance DIA_BENGAR_SELBER(C_INFO)
{
        npc = bau_960_bengar;
        nr = 11;
        condition = dia_bengar_selber_condition;
        information = dia_bengar_selber_info;
        permanent = FALSE;
        description = "Почему вы не можете справиться с ополчением сами?";
};
func int dia_bengar_selber_condition()
{
        if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
        {
                return TRUE;
        };
};
func void dia_bengar_selber_info()
{
        B_AI_Output(other,self,"DIA_Bengar_Selber_15_00");        //Вас тут так много. Почему вы не можете справиться с ополчением сами?
        B_AI_Output(self,other,"DIA_Bengar_Selber_10_01");        //Да, нас много. Но мы не сможем противостоять хорошо обученным бойцам ополчения.
};
instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
        npc = bau_960_bengar;
        nr = 12;
        condition = dia_bengar_milizklatschen_condition;
        information = dia_bengar_milizklatschen_info;
        permanent = FALSE;
        description = "Ну и где твое ополчение, я готов разобраться с ними!";
};
func int dia_bengar_milizklatschen_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
        {
                return TRUE;
        };
};
func void dia_bengar_milizklatschen_info()
{
        B_AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");        //Ну и где твое ополчение, я готов разобраться с ними!
        B_AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");        //Вон, они уже идут. Видишь, я же говорил тебе.
        if(other.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");        //Только не подведи!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");        //Удачи тебе! Покажи им, где раки зимуют.
        };
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"MilComing");
        if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
        {
                Npc_ExchangeRoutine(rick,"MilComing");
                AI_ContinueRoutine(rick);
        };
        if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
        {
                Npc_ExchangeRoutine(rumbold,"MilComing");
                AI_ContinueRoutine(rumbold);
        };
};
var int bengar_milsuccess;
instance DIA_BENGAR_MILIZWEG(C_INFO)
{
        npc = bau_960_bengar;
        nr = 12;
        condition = dia_bengar_milizweg_condition;
        information = dia_bengar_milizweg_info;
        permanent = TRUE;
        description = "Твои проблемы с ополчением уже в прошлом.";
};
func int dia_bengar_milizweg_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
        {
                if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
                {
                        return TRUE;
                };
        };
};
func void dia_bengar_milizweg_info()
{
        B_AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");      //Твои проблемы с ополчением уже в прошлом.
        if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");      //Ты с ума сошел? Да ты знаешь, что они сделают со мной, когда ты уйдешь?
                B_AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");      //Они все еще стоят вон там. Скажи им, чтобы они исчезли СОВСЕМ!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");      //Неплохо. Может, хотя бы этот месяц я буду не в убытке. Спасибо.
                if(RUMBOLD_BEZAHLT == TRUE)
                {
                        B_AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");      //Ты даже готов был заплатить за меня. Это очень благородно с твоей стороны.
                        b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
                }
                else
                {
                        b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
                };
                BENGAR_MILSUCCESS = TRUE;
        };
};
instance DIA_BENGAR_BALTHASAR(C_INFO)
{
        npc = bau_960_bengar;
        nr = 13;
        condition = dia_bengar_balthasar_condition;
        information = dia_bengar_balthasar_info;
        description = "Пастуху Бальтазару запрещено появляться на твоих пастбищах?";
};
func int dia_bengar_balthasar_condition()
{
        if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
        {
                return TRUE;
        };
};
func void dia_bengar_balthasar_info()
{
        B_AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");     //Пастуху Бальтазару запрещено появляться на твоих пастбищах?
        B_AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");     //Ох, да. Это долгая история. Я сказал ему, что Секоб должен платить деньги, если хочет пасти своих овец на моих пастбищах.
        B_AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");     //По правде говоря, это всего лишь отговорка. Я просто на дух не переношу Бальтазара.
        b_logentry(TOPIC_BALTHASARSSCHAFE,TOPIC_BALTHASARSSCHAFE_description_75); // "Чтобы убедить Бенгара позволить Бальтазару вернуться на его пастбища я должен оказать ему услугу. Я уверен что такая возможность обязательно подвернется."
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
        npc = bau_960_bengar;
        nr = 14;
        condition = dia_bengar_balthasardarfaufweide_condition;
        information = dia_bengar_balthasardarfaufweide_info;
        description = "Ополчение ушло, и Бальтазар может опять использовать твои пастбища.";
};
func int dia_bengar_balthasardarfaufweide_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
        {
                return TRUE;
        };
};
func void dia_bengar_balthasardarfaufweide_info()
{
        B_AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Ополчение ушло, и Бальтазар может опять использовать твои пастбища.
        B_AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Почему?
        B_AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(угрожающе) Потому что я так сказал.
        B_AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Ммм. Хорошо, как скажешь.
        B_AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //только пусть он пасет своих овец где-нибудь за полем.
        MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_BENGAR_PERMKAP1(C_INFO)
{
        npc = bau_960_bengar;
        nr = 15;
        condition = dia_bengar_permkap1_condition;
        information = dia_bengar_permkap1_info;
        permanent = TRUE;
        description = "Береги себя.";
};
func int dia_bengar_permkap1_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_bengar_permkap1_info()
{
        B_AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");      //Береги себя.
        B_AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");      //Ты тоже.
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 999;
        condition = dia_bengar_kap3_exit_condition;
        information = dia_bengar_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bengar_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_bengar_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_ALLEIN(C_INFO)
{
        npc = bau_960_bengar;
        nr = 30;
        condition = dia_bengar_allein_condition;
        information = dia_bengar_allein_info;
        description = "Как дела?";
};
func int dia_bengar_allein_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_bengar_allein_info()
{
        B_AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");        //Как дела?
        if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
        {
                B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");        //Малак ушел от меня и забрал с собой всех, кто работал на меня. Он сказал, что направляется в горы.
                B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");        //Он больше не мог находиться здесь.
                MIS_GETMALAKBACK = LOG_RUNNING;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");        //Времена настали суровые. Я даже не знаю, сколько я так смогу продержаться.
        };
        B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");        //Новые орды монстров каждый день приходят через Проход. Скоро они всех нас сожрут.
        B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");        //Если бы только меня защищали хотя бы несколько наемников...
        B_AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");        //"Один из них даже был готов работать на меня. Но он передумал, впрочем. Мне кажется, его звали ""Вольф""."
        MIS_BENGARSHELPINGSLD = LOG_RUNNING;
        Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
        b_logentry(TOPIC_BENGARALLEIN,TOPIC_BENGARALLEIN_description_76); // "Бенгар остался один на своей ферме. Малак ушел и увел с собой всех остальных. Бенгар думает что они направились в горы."
        b_logentry(TOPIC_BENGARALLEIN,TOPIC_BENGARALLEIN_description_77); // "Теперь его ферма абсолютно беззащитна. Ему нужна помощь. Он говорит что-то о наемнике которого зовут Вольф. Может быть я знаю этого парня?!"
};
instance DIA_BENGAR_MALAKTOT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 32;
        condition = dia_bengar_malaktot_condition;
        information = dia_bengar_malaktot_info;
        description = "Малак мертв.";
};
func int dia_bengar_malaktot_condition()
{
        if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
        {
                return TRUE;
        };
};
func void dia_bengar_malaktot_info()
{
        B_AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");      //Малак мертв.
        B_AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");      //Теперь все станет еще хуже.
};
instance DIA_BENGAR_SLDDA(C_INFO)
{
        npc = bau_960_bengar;
        nr = 32;
        condition = dia_bengar_sldda_condition;
        information = dia_bengar_sldda_info;
        description = "Я нашел тебе наемника, как ты и хотел.";
};
func int dia_bengar_sldda_condition()
{
        if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
        {
                return TRUE;
        };
};
func void dia_bengar_sldda_info()
{
        B_AI_Output(other,self,"DIA_Bengar_SLDDA_15_00"); //Я нашел тебе наемника, как ты и хотел.
        B_AI_Output(self,other,"DIA_Bengar_SLDDA_10_01"); //У моей фермы еще никогда не было таких защитников. Надеюсь, он сможет помочь нам.
        B_AI_Output(self,other,"DIA_Bengar_SLDDA_10_02"); //Вот, возьми. Я думаю, это тебе пригодится.
        CreateInvItems(self,itmi_gold,400);
        b_giveinvitems(self,other,itmi_gold,400);
        b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};
instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
        npc = bau_960_bengar;
        nr = 35;
        condition = dia_bengar_malakwiederda_condition;
        information = dia_bengar_malakwiederda_info;
        description = "Малак вернулся.";
};
func int dia_bengar_malakwiederda_condition()
{
        if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
        {
                return TRUE;
        };
};
func void dia_bengar_malakwiederda_info()
{
        B_AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00"); //Малак вернулся.
        B_AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01"); //Очень хорошо. А я уж боялся, что больше никогда не увижу его.
        b_giveplayerxp(XP_GETMALAKBACK);
};
instance DIA_BENGAR_PERM(C_INFO)
{
        npc = bau_960_bengar;
        nr = 80;
        condition = dia_bengar_perm_condition;
        information = dia_bengar_perm_info;
        permanent = TRUE;
        description = "Все будет хорошо.";
};
func int dia_bengar_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
        {
                return TRUE;
        };
};
func void dia_bengar_perm_info()
{
        B_AI_Output(other,self,"DIA_Bengar_PERM_15_00");  //Все будет в порядке.
        if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
        {
                B_AI_Output(self,other,"DIA_Bengar_PERM_10_01");  //Малак опять здесь, но ситуация почти не изменилась.
                B_AI_Output(self,other,"DIA_Bengar_PERM_10_02");  //Если только не произойдет чудо, всем нам скоро настанет конец.
        }
        else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
        {
                B_AI_Output(self,other,"DIA_Bengar_PERM_10_03");  //Вольф странный парень, но я надеюсь, он все же сможет помочь нам.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bengar_PERM_10_04");  //Без Малака этой ферме скоро придет конец. Если ничего не переменится в ближайшее время, боюсь, мне придется бросить ее.
                if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
                {
                        B_AI_Output(self,other,"DIA_Bengar_PERM_10_05");  //Надеюсь, он скоро вернется.
                };
        };
        AI_StopProcessInfos(self);
        if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
        {
                b_startotherroutine(sld_815_soeldner,"Start");
                b_startotherroutine(sld_817_soeldner,"Start");
        };
};
instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 999;
        condition = dia_bengar_kap4_exit_condition;
        information = dia_bengar_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bengar_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_bengar_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 999;
        condition = dia_bengar_kap5_exit_condition;
        information = dia_bengar_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bengar_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_bengar_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
        npc = bau_960_bengar;
        nr = 999;
        condition = dia_bengar_kap6_exit_condition;
        information = dia_bengar_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bengar_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_bengar_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
        npc = bau_960_bengar;
        nr = 900;
        condition = dia_bengar_pickpocket_condition;
        information = dia_bengar_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_bengar_pickpocket_condition()
{
        return c_beklauen(28,50);
};
func void dia_bengar_pickpocket_info()
{
        Info_ClearChoices(dia_bengar_pickpocket);
        Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
        Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};
func void dia_bengar_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_bengar_pickpocket);
};
func void dia_bengar_pickpocket_back()
{
        Info_ClearChoices(dia_bengar_pickpocket);
};
