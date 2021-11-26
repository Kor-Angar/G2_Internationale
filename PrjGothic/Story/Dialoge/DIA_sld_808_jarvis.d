instance DIA_JARVIS_EXIT(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 999;
        condition = dia_jarvis_exit_condition;
        information = dia_jarvis_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jarvis_exit_condition()
{
        return TRUE;
};
func void dia_jarvis_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JARVIS_HELLO(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 1;
        condition = dia_jarvis_hello_condition;
        information = dia_jarvis_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_jarvis_hello_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_jarvis_hello_info()
{
        B_AI_Output(self,other,"DIA_Jarvis_Hello_04_00"); //Эй! Я тебя откуда-то знаю?
        B_AI_Output(other,self,"DIA_Jarvis_Hello_15_01"); //Может быть. Я тоже был в колонии.
        B_AI_Output(self,other,"DIA_Jarvis_Hello_04_02"); //Точно... что тебе нужно?
};
instance DIA_JARVIS_DIELAGE(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 2;
        condition = dia_jarvis_dielage_condition;
        information = dia_jarvis_dielage_info;
        permanent = FALSE;
        description = "Как ситуация?";
};
func int dia_jarvis_dielage_condition()
{
        return TRUE;
};
func void dia_jarvis_dielage_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");       //Как ситуация?
        B_AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");       //Назревают большие проблемы. Наемники раскалываются на две фракции.
        B_AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");       //Сильвио и его люди сомневаются, что Ли выбрал правильный путь.
};
instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 3;
        condition = dia_jarvis_twofronts_condition;
        information = dia_jarvis_twofronts_info;
        permanent = FALSE;
        description = "А как случилось, что появились две фракции?";
};
func int dia_jarvis_twofronts_condition()
{
        if(Npc_KnowsInfo(other,dia_jarvis_dielage))
        {
                return TRUE;
        };
};
func void dia_jarvis_twofronts_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");     //А как случилось, что появились две фракции?
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");     //Большинство из нас пришло из колонии вместе с Ли.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");     //Но некоторые наемники присоединились к нам позже.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");     //Они не из колонии, они были южнее и сражались с орками.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");     //Они как-то прослышали, что Ли нужны люди. Их лидером был Сильвио.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");     //Он согласился, что командовать будет Ли, но теперь он пытается подбить наемников против Ли и его плана.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");     //Большинство из людей Ли не принимает эту проблему всерьез. Но я хорошо знаю таких парней, как Сильвио.
        B_AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");     //Он способен дойти до экстремизма, чтобы реализовать свои идеи.
};
instance DIA_JARVIS_LEESPLAN(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 4;
        condition = dia_jarvis_leesplan_condition;
        information = dia_jarvis_leesplan_info;
        permanent = FALSE;
        description = "Ты знаешь, что собирается делать Ли?";
};
func int dia_jarvis_leesplan_condition()
{
        if(Npc_KnowsInfo(other,dia_jarvis_dielage))
        {
                return TRUE;
        };
};
func void dia_jarvis_leesplan_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");      //Ты знаешь, что собирается делать Ли?
        if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
        {
                B_AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");      //Ли хочет, чтобы мы выжидали и морили голодом паладинов в городе.
        };
        B_AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");      //Он планирует вытащить нас всех с этого острова. Иннос свидетель, я не имею ничего против того, чтобы убраться отсюда.
        B_AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");      //Я не знаю, как Ли собирается провернуть это, но я доверяю ему. Он всегда был хорошим вожаком.
};
instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 5;
        condition = dia_jarvis_sylviosplan_condition;
        information = dia_jarvis_sylviosplan_info;
        permanent = FALSE;
        description = "Ты знаешь, что планирует Сильвио?";
};
func int dia_jarvis_sylviosplan_condition()
{
        if(Npc_KnowsInfo(other,dia_jarvis_dielage))
        {
                return TRUE;
        };
};
func void dia_jarvis_sylviosplan_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");   //Ты знаешь, что планирует Сильвио?
        B_AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");   //Сильвио выяснил, что часть паладинов направилась в бывшую колонию.
        B_AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");   //Он говорит, что оставшиеся паладины не осмелятся атаковать нас здесь и хочет воспользоваться этой ситуацией.
        B_AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");   //Грабить мелкие фермы, устраивать засады на патрули ополчения у города, потрошить путешественников, ну и все такое.
        B_AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");   //Но Ли полагает, что это худшее из того, что можно придумать в этой ситуации.
};
instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 6;
        condition = dia_jarvis_wannajoin_condition;
        information = dia_jarvis_wannajoin_info;
        permanent = FALSE;
        description = "Я хочу стать наемником!";
};
func int dia_jarvis_wannajoin_condition()
{
        if(other.guild == GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_jarvis_wannajoin_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");     //Я хочу стать наемником!
        B_AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");     //Я не уверен, что это хорошая идея...
        B_AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");     //В чем проблема?
        B_AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");     //Ну, я должен голосовать либо за тебя, либо против.
        B_AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");     //А учитывая ситуацию, я проголосую за тебя, только если буду уверен, что ты на стороне Ли!
};
instance DIA_JARVIS_MISSIONKO(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 7;
        condition = dia_jarvis_missionko_condition;
        information = dia_jarvis_missionko_info;
        permanent = FALSE;
        description = "И что я должен сделать?";
};
func int dia_jarvis_missionko_condition()
{
        if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
        {
                return TRUE;
        };
};
func void dia_jarvis_missionko_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");     //И что я должен сделать?
        B_AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");     //Это просто. Отдубась нескольких парней Сильвио! Так обе стороны сразу поймут, с кем ты.
        B_AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");     //А если ты будешь придерживаться правил дуэли, ты даже сможешь завоевать уважение остальных.
        MIS_JARVIS_SLDKO = LOG_RUNNING;
        self.aivar[AIV_IGNORE_MURDER] = TRUE;
        Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
        b_logentry(TOPIC_JARVISSLDKO,TOPIC_JARVISSLDKO_description_481); // "Джарвис хочет чтобы я вырубил парочку парней Сильвио тогда он отдаст свой голос за меня."
};
instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 8;
        condition = dia_jarvis_duellregeln_condition;
        information = dia_jarvis_duellregeln_info;
        permanent = FALSE;
        description = "Что за правила дуэлей?";
};
func int dia_jarvis_duellregeln_condition()
{
        if(MIS_JARVIS_SLDKO == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_jarvis_duellregeln_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");   //Что за правила дуэлей?
        B_AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");   //Поговори с Торлофом, он все объяснит, если тебе это интересно.
        B_AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");   //Я хочу, чтобы между нами не было недопонимания: меня не волнует, будешь ты придерживаться этих правил или нет. Если только тебе удастся извалять этих парней в грязи!
        b_logentry(TOPIC_JARVISSLDKO,TOPIC_JARVISSLDKO_description_482); // "И мне даже не нужно придерживаться этих дурацких правил дуэли..."
};
instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 8;
        condition = dia_jarvis_sylviosmen_condition;
        information = dia_jarvis_sylviosmen_info;
        permanent = FALSE;
        description = "Кто из наемников люди Сильвио?";
};
func int dia_jarvis_sylviosmen_condition()
{
        if(MIS_JARVIS_SLDKO == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_jarvis_sylviosmen_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");    //Кто из наемников люди Сильвио?
        B_AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");    //Их шестеро. Прежде всего, сам Сильвио и его правая рука Булко.
        B_AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");    //Также есть Род, Сентенза, Фестер и Рауль.
        B_AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");    //Остальные занимают либо нейтральную позицию, либо на стороне Ли.
        b_logentry(TOPIC_JARVISSLDKO,TOPIC_JARVISSLDKO_description_483); // "Люди Сильвио - это сам Сильвио его правая рука Булко Род Сентенза Фестер и Рауль."
};
instance DIA_JARVIS_HOWMANY(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 8;
        condition = dia_jarvis_howmany_condition;
        information = dia_jarvis_howmany_info;
        permanent = FALSE;
        description = "Сколько людей Сильвио я должен победить?";
};
func int dia_jarvis_howmany_condition()
{
        if(MIS_JARVIS_SLDKO == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_jarvis_howmany_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");       //Сколько людей Сильвио я должен победить?
        B_AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");       //Если ты вырубишь троих из них, ты докажешь, на чьей ты стороне.
        B_AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");       //Кого ты выберешь - это твое дело.
        B_AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");       //Дам одну подсказку: Не стоит пытаться проявить мужество. Не выступай против самого Сильвио - он сделает из тебя котлету.
        b_logentry(TOPIC_JARVISSLDKO,TOPIC_JARVISSLDKO_description_484); // "Вполне достаточно если я вырублю троих людей Сильвио. Впрочем с самим Сильвио мне лучше пока не связываться."
};
instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 8;
        condition = dia_jarvis_howmanyleft_condition;
        information = dia_jarvis_howmanyleft_info;
        permanent = TRUE;
        description = "Сколько людей Сильвио мне еще нужно уложить?";
};
func int dia_jarvis_howmanyleft_condition()
{
        if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
        {
                return TRUE;
        };
};
func void dia_jarvis_howmanyleft_info()
{
        var int victories;
        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");   //Сколько людей Сильвио мне еще нужно уложить?
        victories = 0;
        if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");   //Я отдубасил Булко.
                B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");   //Я слышал. Неплохо.
                victories = victories + 1;
        };
        if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");   //Род теперь ходит сильно потрепанным.
                victories = victories + 1;
        };
        if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                if(Npc_KnowsInfo(other,dia_sentenza_hello))
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");   //Сентенза пытался вытрясти из меня золото - не самая лучшая идея.
                }
                else
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");   //Я вырубил Сентензу.
                };
                victories = victories + 1;
        };
        if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");   //Фестер пытался провести меня - это была его ошибка.
                }
                else
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");   //Фестер получил по заслугам.
                };
                victories = victories + 1;
        };
        if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                if(victories == 0)
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");   //Что касается Рауля...
                }
                else
                {
                        B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");   //Я пошел поговорить с Раулем...
                };
                B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");   //И?
                B_AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");   //Оказалось, что ему крайне необходима взбучка.
                victories = victories + 1;
        };
        if(victories < 3)
        {
                if(victories == 0)
                {
                        B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");   //Ты пока не вырубил ни одного из людей Сильвио.
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");   //Хорошо, продолжай в том же духе.
                };
                B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");   //Я хочу, чтобы ты вырубил как минимум троих из них.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");   //Этого достаточно, вполне достаточно.
                if(victories == 6)
                {
                        B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");   //Ты им всем начистил физиономию, Да?
                };
                B_AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");   //Я поражен - если Ли спросит мое мнение, я проголосую за тебя без колебаний.
                MIS_JARVIS_SLDKO = LOG_SUCCESS;
                self.aivar[AIV_IGNORE_MURDER] = FALSE;
                b_giveplayerxp(XP_AMBIENT * victories);
                b_logentry(TOPIC_SLDRESPEKT,TOPIC_SLDRESPEKT_description_485); // "Джарвис проголосует за меня если я решу присоединиться к наемникам."
        };
};
var int jarvis_guildcomment;
var int jarvis_sylviocomment;
instance DIA_JARVIS_PERM(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 8;
        condition = dia_jarvis_perm_condition;
        information = dia_jarvis_perm_info;
        permanent = FALSE;
        description = "Есть новости?";
};
func int dia_jarvis_perm_condition()
{
        if(other.guild != GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_jarvis_perm_info()
{
        B_AI_Output(other,self,"DIA_Jarvis_PERM_15_00");  //Есть новости?
        if(KAPITEL <= 3)
        {
                if(JARVIS_GUILDCOMMENT == FALSE)
                {
                        if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
                        {
                                B_AI_Output(self,other,"DIA_Jarvis_PERM_04_01");  //Теперь ты один из нас. Это хорошо.
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Jarvis_PERM_04_02");  //Ты сделал неверный выбор, ты мог бы стать одним из нас.
                        };
                        JARVIS_GUILDCOMMENT = TRUE;
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Jarvis_PERM_04_03");  //Последнее время, люди Сильвио ходят какие-то подавленные. (грязный смешок)
                };
        };
        if(KAPITEL >= 4)
        {
                if(JARVIS_SYLVIOCOMMENT == FALSE)
                {
                        B_AI_Output(self,other,"DIA_Jarvis_PERM_04_04");  //Сильвио наконец-то свалил. После того, как он услышал о драконах, он со своими парнями отправился в колонию.
                        B_AI_Output(self,other,"DIA_Jarvis_PERM_04_05");  //Он, вероятно, думает, что там будет лучше.
                        JARVIS_SYLVIOCOMMENT = TRUE;
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Jarvis_PERM_04_06");  //Нет, пока все спокойно. Мне очень интересно, чем все это кончится.
                };
        };
};
instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
        npc = sld_808_jarvis;
        nr = 900;
        condition = dia_jarvis_pickpocket_condition;
        information = dia_jarvis_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_jarvis_pickpocket_condition()
{
        return c_beklauen(41,55);
};
func void dia_jarvis_pickpocket_info()
{
        Info_ClearChoices(dia_jarvis_pickpocket);
        Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
        Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};
func void dia_jarvis_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_jarvis_pickpocket);
};
func void dia_jarvis_pickpocket_back()
{
        Info_ClearChoices(dia_jarvis_pickpocket);
};
