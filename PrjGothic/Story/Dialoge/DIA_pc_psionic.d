instance DIA_LESTER_EXIT(C_INFO)
{
        npc = pc_psionic;
        nr = 999;
        condition = dia_lester_exit_condition;
        information = dia_lester_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lester_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_lester_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_HELLO(C_INFO)
{
        npc = pc_psionic;
        nr = 1;
        condition = dia_lester_hello_condition;
        information = dia_lester_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_lester_hello_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_lester_hello_info()
{
        if(c_bodystatecontains(self,BS_SIT))
        {
                AI_Standup(self);
                b_turntonpc(self,other);
        };
        B_AI_Output(self,other,"DIA_Lester_Hello_13_00"); //Это ТЫ? - Точно! Ох, как я рад видеть тебя!
        Info_ClearChoices(dia_lester_hello);
        Info_AddChoice(dia_lester_hello,dia_lester_hello_youknowme_description,dia_lester_hello_youknowme); // "Я что знаю тебя?"
        Info_AddChoice(dia_lester_hello,dia_lester_hello_lester_description,dia_lester_hello_lester); // "Лестер! Как ты оказался здесь?"
};
func void dia_lester_hello_lester()
{
        Info_ClearChoices(dia_lester_hello);
        B_AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");  //Лестер! Как ты оказался здесь?
        B_AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");  //Это был безумный побег. После того, как барьер рухнул, я бродил там некоторое время в полном смятении.
        B_AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");  //Потом я потратил несколько дней, пробираясь через все эти леса, пока, наконец, не оказался в этой долине.
        B_AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");  //Диего, Милтен и Горн все еще в Долине Рудников. По крайней мере, я так думаю.
};
func void dia_lester_hello_youknowme()
{
        Info_ClearChoices(dia_lester_hello);
        B_AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");       //Я что, знаю тебя?
        B_AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");       //Эй? У тебя все дома? Я рисковал своей шеей, чтобы ты мог заполучить этот чертов камень.
        B_AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");       //За тобой должок... Ну, уж это-то ты должен помнить.
        B_AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");       //А ты помнишь Диего, Милтена и Горна?
        Info_AddChoice(dia_lester_hello,dia_lester_hello_whofourfriends_description,dia_lester_hello_whofourfriends); // "Диего Милтен и КТО?"
        Info_AddChoice(dia_lester_hello,dia_lester_hello_knowfourfriends_description,dia_lester_hello_knowfourfriends); // "Конечно. Как они?"
};
func void dia_lester_hello_knowfourfriends()
{
        Info_ClearChoices(dia_lester_hello);
        B_AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00"); //Конечно. Как они?
        B_AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01"); //Насколько я знаю, они выжили при разрушении барьера.
        B_AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02"); //Но я понятия не имею, где они сейчас - эта троица, вероятно, все еще ошивается в Долине Рудников.
        B_AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03"); //Если ты наткнешься на них, дай мне знать.
};
func void dia_lester_hello_whofourfriends()
{
        Info_ClearChoices(dia_lester_hello);
        B_AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");  //Диего, Милтен и КТО?
        B_AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");  //Только не говори мне, что ты ничего этого не помнишь. Фокусирующие камни - тролль - огромная куча руды, принадлежащая магам воды?
        B_AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");  //Я не знаю...
        B_AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");  //Память к тебе еще вернется. Мне тоже понадобилось некоторое время, чтобы привести свою голову в порядок.
};
instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
        npc = pc_psionic;
        nr = 1;
        condition = dia_lester_whathappened_condition;
        information = dia_lester_whathappened_info;
        permanent = FALSE;
        description = "Что произошло?";
};
func int dia_lester_whathappened_condition()
{
        if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lester_whathappened_info()
{
        B_AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");  //Что произошло?
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");  //После того, как Спящий был повержен, все Братство как будто сошло с ума.
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");  //Без своего хозяина они стали напоминать пустые оболочки.
        B_AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");  //А ты? Что насчет тебя?
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");  //Со мной тоже не все было ладно. У меня были кошмары, и даже галлюцинации. Но когда в моей голове более-менее прояснилось, я побежал оттуда.
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");  //Как-то мне показалось, что я видел, как огромная черная тень налетела на группу беглецов и сожгла их в пепел, накрыв гигантским облаком огня.
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");  //Тогда я даже подумал, что это прилетел дракон, чтобы убить меня.
        B_AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");  //Ты видел что-нибудь еще?
        B_AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");  //Нет - я вскочил и побежал!
};
instance DIA_LESTER_MINECOLONY(C_INFO)
{
        npc = pc_psionic;
        nr = 2;
        condition = dia_lester_minecolony_condition;
        information = dia_lester_minecolony_info;
        permanent = FALSE;
        description = "Сколько ты уже скрываешься в этой долине?";
};
func int dia_lester_minecolony_condition()
{
        if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lester_minecolony_info()
{
        B_AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");        //Сколько ты уже скрываешься в этой долине?
        B_AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");        //Точно не знаю. Может, неделю. Но есть еще кое-что:
        B_AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");        //Когда я пришел сюда вечером, я взглянул на эту гору - там стояло всего несколько деревьев.
        B_AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");        //А когда я посмотрел туда же на следующее утро, там уже стояла эта башня. Я готов поклясться, что раньше ее там не было. И с тех пор я не покидал эту долину.
        B_AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");        //Ты имеешь в виду башню Ксардаса? Я знал, что он на многое способен, но создать башню вот так запросто...
        B_AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");        //Ксардас, некромант? Он живет в этой башне? Мне это не нравится...
        B_AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");        //Не волнуйся, это он спас меня из храма Спящего. Он на нашей стороне.
};
instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
        npc = pc_psionic;
        nr = 4;
        condition = dia_lester_send_xardas_condition;
        information = dia_lester_send_xardas_info;
        permanent = FALSE;
        description = "Ты должен рассказать Ксардасу об этой тени. Это может быть важно.";
};
func int dia_lester_send_xardas_condition()
{
        if(Npc_KnowsInfo(other,dia_lester_whathappened) && Npc_KnowsInfo(other,dia_lester_minecolony) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lester_send_xardas_info()
{
        B_AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");   //Ты должен рассказать Ксардасу об этой тени. Это может быть важно.
        B_AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");   //Ты не думаешь, что мне показалось? Ты хочешь сказать, что это действительно был...
        B_AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");   //... дракон. Да.
        B_AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");   //Ты опять лезешь в самое пекло. Я прав?
        B_AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");   //Не сказал бы, что в самое... пока...
        B_AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");   //(вздыхает) Хорошо, если это так важно, то я зайду к нему - но не сейчас.
        B_AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");   //Сейчас я собираюсь отдохнуть. Я все еще измотан после этого бегства из колонии.
        B_AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");   //Мне кажется, у тебя большие планы. Увидимся позже у Ксардаса.
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_PERM(C_INFO)
{
        npc = pc_psionic;
        nr = 99;
        condition = dia_lester_perm_condition;
        information = dia_lester_perm_info;
        permanent = TRUE;
        description = "Что ты знаешь об этой местности?";
};
func int dia_lester_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
        {
                return TRUE;
        };
};
func void dia_lester_perm_info()
{
        B_AI_Output(other,self,"DIA_Lester_Perm_15_00");  //Что ты знаешь об этой местности?
        B_AI_Output(self,other,"DIA_Lester_Perm_13_01");  //Если ты пойдешь по этой тропинке, то попадешь на ферму. А еще чуть дальше начинается город.
        B_AI_Output(self,other,"DIA_Lester_Perm_13_02");  //Но будь осторожен, по дороге тебе могут встретиться не только волки и крысы, но также гоблины и бандиты!
};
instance DIA_LESTER_SLEEP(C_INFO)
{
        npc = pc_psionic;
        nr = 99;
        condition = dia_lester_sleep_condition;
        information = dia_lester_sleep_info;
        permanent = TRUE;
        description = "Ты все еще чувствуешь себя измотанным?";
};
func int dia_lester_sleep_condition()
{
        if((KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
        {
                return TRUE;
        };
};
func void dia_lester_sleep_info()
{
        B_AI_Output(other,self,"DIA_Lester_Sleep_15_00"); //Ты все еще чувствуешь себя измотанным?
        B_AI_Output(self,other,"DIA_Lester_Sleep_13_01"); //Еще как. (зевает) Я рассказал Ксардасу все. А теперь я посплю немного. Денек...
        B_AI_Output(self,other,"DIA_Lester_Sleep_13_02"); //...другой... или даже больше.
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_KAP3_EXIT(C_INFO)
{
        npc = pc_psionic;
        nr = 999;
        condition = dia_lester_kap3_exit_condition;
        information = dia_lester_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lester_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_lester_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_BACKINTOWN(C_INFO)
{
        npc = pc_psionic;
        nr = 2;
        condition = dia_lester_backintown_condition;
        information = dia_lester_backintown_info;
        important = TRUE;
};
func int dia_lester_backintown_condition()
{
        if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (KAPITEL == 3))
        {
                return TRUE;
        };
};
func void dia_lester_backintown_info()
{
        B_AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");    //Эй, ты вернулся, наконец! Ты должен немедленно увидеться с Ксардасом. Возникли проблемы.
        B_AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");    //В это я готов поверить.
        B_AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");    //После того, как ты ушел, здесь начался ад кромешный.
        B_AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");    //Поговори с Ксардасом, он ждет тебя!
        B_AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");    //Передал мне эту руну для тебя. Она поможет тебе добраться до него побыстрее. Увидимся там.
        CreateInvItems(self,itru_teleportxardas,1);
        b_giveinvitems(self,other,itru_teleportxardas,1);
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"XARDAS");
};
instance DIA_LESTER_PERM3(C_INFO)
{
        npc = pc_psionic;
        nr = 900;
        condition = dia_lester_perm3_condition;
        information = dia_lester_perm3_info;
        permanent = TRUE;
        description = "Ты не очень-то хорошо выглядишь.";
};
func int dia_lester_perm3_condition()
{
        if((KAPITEL >= 3) && (LESTER_ISONBOARD != LOG_SUCCESS))
        {
                return TRUE;
        };
};
var int dia_lester_perm3_onetime;
func void dia_lester_perm3_info()
{
        B_AI_Output(other,self,"DIA_Lester_PERM3_15_00"); //Ты не очень-то хорошо выглядишь.
        if(hero.guild == GIL_KDF)
        {
                if(DIA_LESTER_PERM3_ONETIME == FALSE)
                {
                        B_AI_Output(self,other,"DIA_Lester_PERM3_13_01"); //Я и чувствую себя не очень хорошо. Я совершенно обессилен, и еще эти постоянные головные боли...
                        B_AI_Output(self,other,"DIA_Lester_PERM3_13_02"); //Каждый раз, когда один из этих парней в черных рясах появляется здесь, они только усиливаются.
                        if(SC_KNOWSMADPSI == TRUE)
                        {
                                B_AI_Output(other,self,"DIA_Lester_PERM3_15_03"); //И я могу сказать тебе почему.
                                B_AI_Output(self,other,"DIA_Lester_PERM3_13_04"); //Да? Боюсь, я не хочу этого знать.
                                B_AI_Output(other,self,"DIA_Lester_PERM3_15_05"); //Люди в черных рясах - или Ищущие, как мы, маги, называем их - были последователями сильного архидемона. Тебе это ни о чем не говорит?
                                B_AI_Output(self,other,"DIA_Lester_PERM3_13_06"); //Ммм. Нет. Если только ты не хочешь сказать мне, что...
                                B_AI_Output(other,self,"DIA_Lester_PERM3_15_07"); //Да, именно. Ищущие были последователями Спящего. Безумцы из секты отступников из Болотного Лагеря.
                                B_AI_Output(other,self,"DIA_Lester_PERM3_15_08"); //Это твои люди, Лестер. Бывшее Братство Спящего. Теперь они просто бездушные приспешники зла.
                                B_AI_Output(self,other,"DIA_Lester_PERM3_13_09"); //У меня были подозрения, но я надеялся, что это не так. Ты хочешь сказать, он вернулся? Спящий опять здесь?
                                B_AI_Output(other,self,"DIA_Lester_PERM3_15_10"); //Хороший вопрос. Я знаю наверняка, только что я должен остановить Ищущих до того, как они станут слишком сильны.
                                B_AI_Output(self,other,"DIA_Lester_PERM3_13_11"); //Мне это не нравится, но я думаю, ты прав. Мне очень жаль, но с моей головой творится такое...
                                b_logentry(TOPIC_DEMENTOREN,TOPIC_DEMENTOREN_description_420); // "Мои подозрения подтвердились. Даже у Лестера нет сомнений что Ищущие - это последователи Спящих из старого лагеря в болотах."
                                b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
                                DIA_LESTER_PERM3_ONETIME = TRUE;
                        };
                };
        }
        else if(LESTER_ISONBOARD == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Lester_PERM3_13_12"); //Головные боли все еще мучают меня, но я надеюсь, эта проблема скоро будет решена.
                B_AI_Output(self,other,"DIA_Lester_PERM3_13_13"); //Так или иначе.
        }
        else if(hero.guild == GIL_DJG)
        {
                B_AI_Output(self,other,"DIA_Lester_PERM3_13_14"); //Мои головные боли стали просто невыносимыми. А теперь еще эти люди-ящеры постоянно нападают на меня. Я задаю себе вопрос - откуда они все взялись.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lester_PERM3_13_15"); //Эти головные боли все не прекращаются. Грядет что-то ужасное.
        };
        B_AI_Output(self,other,"DIA_Lester_PERM3_13_16"); //(вздыхает) Я думаю, мне лучше отдохнуть.
};
instance DIA_LESTER_KAP4_EXIT(C_INFO)
{
        npc = pc_psionic;
        nr = 999;
        condition = dia_lester_kap4_exit_condition;
        information = dia_lester_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lester_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_lester_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_KAP5_EXIT(C_INFO)
{
        npc = pc_psionic;
        nr = 999;
        condition = dia_lester_kap5_exit_condition;
        information = dia_lester_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lester_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_lester_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LESTER_XARDASWEG(C_INFO)
{
        npc = pc_psionic;
        nr = 2;
        condition = dia_lester_xardasweg_condition;
        information = dia_lester_xardasweg_info;
        description = "Где Ксардас?";
};
func int dia_lester_xardasweg_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_lester_xardasweg_info()
{
        B_AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");     //Где Ксардас?
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");     //Он ушел, а его башню заняли эти демонические создания.
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");     //Я думаю, он просто не хочет, чтобы кто-нибудь шарил в башне в его отсутствие.
        B_AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");     //Куда он отправился?
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");     //Он не сказал. Он только попросил меня передать тебе это письмо.
        CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
        b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");     //Я прочел его. Извини. Мне просто было любопытно.
        B_AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");     //И?
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");     //Не знаю, я ничего не понял. Но мне ясно одно: Ксардаса мы теперь увидим нескоро.
        B_AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");     //Я думаю, здесь стало слишком жарко для него, и он направился в горы.
        b_logentry(TOPIC_BUCHHALLENVONIRDORATH,TOPIC_BUCHHALLENVONIRDORATH_description_421); // "Ксардас исчез. Лестер передал мне письмо оставленное Ксардасом для меня."
};
instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
        npc = pc_psionic;
        nr = 2;
        condition = dia_lester_knowwhereenemy_condition;
        information = dia_lester_knowwhereenemy_info;
        permanent = TRUE;
        description = "Я узнал, где скрывается враг.";
};
func int dia_lester_knowwhereenemy_condition()
{
        if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LESTER_ISONBOARD == FALSE))
        {
                return TRUE;
        };
};
func void dia_lester_knowwhereenemy_info()
{
        B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");        //Я узнал, где скрывается враг.
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");        //Не спрашивай меня, почему я так думаю, но мне кажется, я должен отправиться с тобой.
        B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");        //Что ты хочешь этим сказать?
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");        //Я не могу объяснить этого, но я знаю, что смогу получить ответ, только если отправлюсь с тобой.
        if(CREWMEMBER_COUNT >= MAX_CREW)
        {
                B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");        //Извини, но корабль уже полон.
                B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");        //Может так и нужно. Может, моя судьба ничего не значит по сравнению с событиями, что ждут нас впереди.
                B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");        //Ты знаешь, что тебе нужно делать. Сражайся со злом - а обо мне не волнуйся.
                B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");        //Моя судьба не важна.
        }
        else
        {
                Info_ClearChoices(dia_lester_knowwhereenemy);
                Info_AddChoice(dia_lester_knowwhereenemy,dia_lester_knowwhereenemy_no_description,dia_lester_knowwhereenemy_no); // "Я не могу взять тебя с собой."
                Info_AddChoice(dia_lester_knowwhereenemy,dia_lester_knowwhereenemy_yes_description,dia_lester_knowwhereenemy_yes); // "Тогда пойдем со мной и получишь ответы на свои вопросы!"
        };
};
func void dia_lester_knowwhereenemy_yes()
{
        B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");    //Тогда пойдем со мной, и получишь ответы на свои вопросы!
        B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");    //Встретимся в гавани. Я приду туда, когда буду готов.
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");    //Поторопись. Времени у нас мало.
        b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
        self.flags = NPC_FLAG_IMMORTAL;
        LESTER_ISONBOARD = LOG_SUCCESS;
        CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
        if(MIS_READYFORCHAPTER6 == TRUE)
        {
                Npc_ExchangeRoutine(self,"SHIP");
        }
        else
        {
                Npc_ExchangeRoutine(self,"WAITFORSHIP");
        };
        Info_ClearChoices(dia_lester_knowwhereenemy);
};
func void dia_lester_knowwhereenemy_no()
{
        B_AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");     //Я не могу взять тебя с собой.
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");     //Понимаю. Я, вероятно, действительно мало чем смогу помочь тебе.
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");     //Не важно, кого ты возьмешь с собой - главное, чтобы ты доверял им.
        B_AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");     //И береги себя.
        LESTER_ISONBOARD = LOG_OBSOLETE;
        Info_ClearChoices(dia_lester_knowwhereenemy);
};
instance DIA_LESTER_LEAVEMYSHIP(C_INFO)
{
        npc = pc_psionic;
        nr = 4;
        condition = dia_lester_leavemyship_condition;
        information = dia_lester_leavemyship_info;
        permanent = TRUE;
        description = "У меня все же нет места для тебя.";
};
func int dia_lester_leavemyship_condition()
{
        if((LESTER_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
        {
                return TRUE;
        };
};
func void dia_lester_leavemyship_info()
{
        B_AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");   //У меня все же нет места для тебя.
        B_AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");   //Понимаю. Я, вероятно, сделал бы то же самое на твоем месте.
        B_AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");   //Но если я понадоблюсь тебе, я буду рад помочь. Ты знаешь, где найти меня.
        LESTER_ISONBOARD = LOG_OBSOLETE;
        CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
        Npc_ExchangeRoutine(self,"ShipOff");
};
instance DIA_LESTER_STILLNEEDYOU(C_INFO)
{
        npc = pc_psionic;
        nr = 4;
        condition = dia_lester_stillneedyou_condition;
        information = dia_lester_stillneedyou_info;
        permanent = TRUE;
        description = "Мне нужен друг, всегда готовый помочь.";
};
func int dia_lester_stillneedyou_condition()
{
        if(((LESTER_ISONBOARD == LOG_OBSOLETE) || (LESTER_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
        {
                return TRUE;
        };
};
func void dia_lester_stillneedyou_info()
{
        B_AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");  //Мне нужен друг, всегда готовый помочь.
        if(LESTER_ISONBOARD == LOG_OBSOLETE)
        {
                B_AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");  //Я знал это! Мы будем сражаться рука об руку. Как в старые времена!
                B_AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");  //Берегись, Зло! Мы свернем тебе шею!
                self.flags = NPC_FLAG_IMMORTAL;
                LESTER_ISONBOARD = LOG_SUCCESS;
                CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
                if(MIS_READYFORCHAPTER6 == TRUE)
                {
                        Npc_ExchangeRoutine(self,"SHIP");
                }
                else
                {
                        Npc_ExchangeRoutine(self,"WAITFORSHIP");
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");  //Я думаю, будет лучше, если я все же останусь здесь. Удачи.
                AI_StopProcessInfos(self);
        };
};
instance DIA_LESTER_KAP6_EXIT(C_INFO)
{
        npc = pc_psionic;
        nr = 999;
        condition = dia_lester_kap6_exit_condition;
        information = dia_lester_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lester_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_lester_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_PC_PSIONIC_PICKPOCKET(C_INFO)
{
        npc = pc_psionic;
        nr = 900;
        condition = dia_pc_psionic_pickpocket_condition;
        information = dia_pc_psionic_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_pc_psionic_pickpocket_condition()
{
        return c_beklauen(76,20);
};
func void dia_pc_psionic_pickpocket_info()
{
        Info_ClearChoices(dia_pc_psionic_pickpocket);
        Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_BACK,dia_pc_psionic_pickpocket_back);
        Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_PICKPOCKET,dia_pc_psionic_pickpocket_doit);
};
func void dia_pc_psionic_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_pc_psionic_pickpocket);
};
func void dia_pc_psionic_pickpocket_back()
{
        Info_ClearChoices(dia_pc_psionic_pickpocket);
};
