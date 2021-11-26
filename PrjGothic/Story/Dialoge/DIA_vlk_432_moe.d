instance DIA_MOE_EXIT(C_INFO)
{
        npc = vlk_432_moe;
        nr = 999;
        condition = dia_moe_exit_condition;
        information = dia_moe_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_moe_exit_condition()
{
        return TRUE;
};
func void dia_moe_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_MOE_PICKPOCKET(C_INFO)
{
        npc = vlk_432_moe;
        nr = 900;
        condition = dia_moe_pickpocket_condition;
        information = dia_moe_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_moe_pickpocket_condition()
{
        return c_beklauen(25,30);
};
func void dia_moe_pickpocket_info()
{
        Info_ClearChoices(dia_moe_pickpocket);
        Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
        Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};
func void dia_moe_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_moe_pickpocket);
};
func void dia_moe_pickpocket_back()
{
        Info_ClearChoices(dia_moe_pickpocket);
};
instance DIA_MOE_HALLO(C_INFO)
{
        npc = vlk_432_moe;
        nr = 2;
        condition = dia_moe_hallo_condition;
        information = dia_moe_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_moe_hallo_condition()
{
        if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
        {
                return TRUE;
        };
};
func void dia_moe_hallo_info()
{
        B_AI_Output(self,other,"DIA_Moe_Hallo_01_00");    //Эй, я не знаю тебя. Чего тебе здесь нужно? Ты идешь в кабак?
        Info_ClearChoices(dia_moe_hallo);
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_gehen_description,dia_moe_hallo_gehen); // "Нет я не иду в кабак..."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_witz_description,dia_moe_hallo_witz); // "Ох так это портовый трактир ..."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_reizen_description,dia_moe_hallo_reizen); // "Ты имеешь что-то против?"
};
func void dia_moe_hallo_gehen()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");      //Нет, я не иду в кабак...
        B_AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");      //Я так и подумал. Но это не так уж важно - мы можем перейти прямо к делу.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");      //Так как ты здесь новичок, я хочу сделать тебе заманчивое предложение. Ты даешь мне 50 золотых монет и можешь идти дальше.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");      //Это плата за свободный вход в кабак.
        Info_ClearChoices(dia_moe_hallo);
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_miliz_description,dia_moe_hallo_miliz); // "Давай спросим что думает по этому поводу ополчение..."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_vergisses_description,dia_moe_hallo_vergisses); // "Забудь об этом ты не получишь ни цента!"
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_zahlen_description,dia_moe_hallo_zahlen); // "Хорошо я заплачу."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_kneipe_description,dia_moe_hallo_kneipe); // "Но я не хочу идти в кабак!"
};
func void dia_moe_hallo_kneipe()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");     //Но я не хочу идти в кабак!
        B_AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");     //Понимаешь, рано или поздно все заходят в кабак. Так что лучше тебе заплатить прямо сейчас - и больше эта проблема не будет волновать тебя.
};
func void dia_moe_hallo_witz()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");       //Ох, так это портовый трактир. А я то принял его за дворец губернатора.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");       //Эй - держи свои шуточки при себе, кретин, или я заставлю тебя грызть булыжники из мостовой.
        Info_ClearChoices(dia_moe_hallo);
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_pruegel_description,dia_moe_hallo_pruegel); // "Понимаю чтобы пройти дальше мне придется сломать тебе пару ребер ..."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_aerger_description,dia_moe_hallo_aerger); // "Ты пытаешься создать мне проблемы?"
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_ruhig_description,dia_moe_hallo_ruhig); // "Успокойся я просто хотел выпить пива."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_kneipe_description,dia_moe_hallo_kneipe); // "Но я не хочу идти в кабак!"
};
func void dia_moe_hallo_reizen()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");     //Ты имеешь что-то против?
        B_AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");     //Тебе нечего здесь делать, малыш.
        Info_ClearChoices(dia_moe_hallo);
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_pruegel_description,dia_moe_hallo_pruegel); // "Понимаю чтобы пройти дальше мне придется сломать тебе пару ребер ..."
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_aerger_description,dia_moe_hallo_aerger); // "Ты пытаешься создать мне проблемы?"
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_ruhig_description,dia_moe_hallo_ruhig); // "Успокойся я просто хотел выпить пива."
};
func void dia_moe_hallo_miliz()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");      //Давай спросим, что думает по этому поводу ополчение...
        B_AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");      //(смеется) Ополчения здесь нет. А ты знаешь, почему их здесь не бывает?
        B_AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");      //Ты находишься в портовом квартале, малыш. Никто из ополчения не осмелится вступать здесь в драку со мной.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");      //Они только иногда заглядывают в 'Красный Фонарь'. Понимаешь, здесь есть только ты и я. (мерзкая ухмылка)
};
func void dia_moe_hallo_pruegel()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");    //Понимаю, чтобы пройти дальше, мне придется сломать тебе пару ребер.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");    //Можешь попробовать, малыш. Покажи мне, на что ты способен!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_moe_hallo_aerger()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");     //Ты пытаешься создать мне проблемы?
        B_AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");     //Конечно, я мастер создавать проблемы. Так что защищайся, кретин!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_moe_hallo_ruhig()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");      //Успокойся, я просто хотел выпить пива.
        B_AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");      //Хорошо, но это будет стоить тебе 50 монет. Это плата за вход. (ухмыляется)
        Info_ClearChoices(dia_moe_hallo);
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_vergisses_description,dia_moe_hallo_vergisses); // "Забудь об этом ты не получишь ни цента!"
        Info_AddChoice(dia_moe_hallo,dia_moe_hallo_zahlen_description,dia_moe_hallo_zahlen); // "Хорошо я заплачу."
};
func void dia_moe_hallo_zahlen()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");     //Хорошо, я заплачу.
        if(b_giveinvitems(other,self,itmi_gold,50))
        {
                B_AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");     //Отлично. Раз сегодня ты такой щедрый, теперь ты можешь отдать мне все содержимое твоего кошелька.
                Info_ClearChoices(dia_moe_hallo);
                Info_AddChoice(dia_moe_hallo,dia_moe_hallo_vergisses_description,dia_moe_hallo_vergisses); // "Забудь об этом ты не получишь ни цента!"
                Info_AddChoice(dia_moe_hallo,dia_moe_hallo_alles_description,dia_moe_hallo_alles); // "Хорошо это все что у меня есть."
        }
        else if(Npc_HasItems(hero,itmi_gold) > 9)
        {
                B_AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");     //...но у меня нет с собой столько золота.
                B_AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");     //Это не важно. Просто отдай мне все, что у тебя есть.
                Info_ClearChoices(dia_moe_hallo);
                Info_AddChoice(dia_moe_hallo,dia_moe_hallo_vergisses_description,dia_moe_hallo_vergisses); // "Забудь об этом ты не получишь ни цента!"
                Info_AddChoice(dia_moe_hallo,dia_moe_hallo_alles_description,dia_moe_hallo_alles); // "Хорошо это все что у меня есть."
        }
        else
        {
                B_AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");     //...но у меня нет даже и 10 монет.
                B_AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");     //Черт, неужели сегодня мне не повезло?!
                B_AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");     //Хорошо, (вздох) ты можешь идти.
                AI_StopProcessInfos(self);
        };
};
func void dia_moe_hallo_vergisses()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");  //Забудь об этом, ты не получишь ни цента!
        B_AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");  //Тогда я возьму все, что у тебя есть, - а ты будешь лежать распростертым на земле передо мной.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_moe_hallo_alles()
{
        B_AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");      //Хорошо, это все, что у меня есть.
        b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
        B_AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");      //Отлично, этого достаточно. Я сегодня великодушен. (ухмыляется)
        AI_StopProcessInfos(self);
};
instance DIA_MOE_HARBOR(C_INFO)
{
        npc = vlk_432_moe;
        nr = 998;
        condition = dia_moe_harbor_condition;
        information = dia_moe_harbor_info;
        permanent = TRUE;
        description = "Ты знаешь о порте почти все, да?";
};
func int dia_moe_harbor_condition()
{
        return TRUE;
};
func void dia_moe_harbor_info()
{
        B_AI_Output(other,self,"DIA_Moe_Harbor_15_00");   //Ты знаешь о порте почти все, да?
        B_AI_Output(self,other,"DIA_Moe_Harbor_01_01");   //Конечно. А что?
        Info_ClearChoices(dia_moe_harbor);
        Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
        Info_AddChoice(dia_moe_harbor,dia_moe_harbor_ship_description,dia_moe_harbor_ship); // "Как тут с кораблями?"
        Info_AddChoice(dia_moe_harbor,dia_moe_harbor_militia_description,dia_moe_harbor_militia); // "Почему я не вижу здесь никого из ополчения?"
        Info_AddChoice(dia_moe_harbor,dia_moe_harbor_rumors_description,dia_moe_harbor_rumors); // "Какие слухи бродят в последнее время?"
};
func void dia_moe_harbor_back()
{
        Info_ClearChoices(dia_moe_harbor);
};
func void dia_moe_harbor_ship()
{
        B_AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");      //Как тут с кораблями?
        B_AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");      //Единственный корабль, который пришел за последнее время, - это корабль паладинов.
        B_AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");      //Он стоит вон там, за скалами к юго-западу.
};
func void dia_moe_harbor_militia()
{
        B_AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");   //Почему я не вижу здесь никого из ополчения?
        B_AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");   //Они не осмеливаются соваться сюда. У нас здесь свои порядки.
};
func void dia_moe_harbor_rumors()
{
        B_AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");    //Какие слухи бродят в последнее время?
        if(KAPITEL == 1)
        {
                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");    //Мы здесь не любим людей, которые задают слишком много вопросов. Особенно, если они чужаки.
        }
        else if(KAPITEL == 2)
        {
                if(hero.guild == GIL_MIL)
                {
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");    //Ничего, да и что может случиться? Все тихо.
                }
                else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
                {
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");    //(наиграно) Все плохо. Времена настали тяжелые, но мы все еще пытаемся не сбиться с праведного пути.
                        B_AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");    //Хватит издеваться надо мной.
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");    //Как ты мог подумать такое обо мне? Я глубоко оскорблен.
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");    //Становится жарко. Лорд Андрэ пытается сунуть свой нос туда, где ему делать нечего.
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");    //Эти шишки никогда не понимали, как здесь ведутся дела.
                };
        }
        else if(KAPITEL == 3)
        {
                if(MIS_RESCUEBENNET == LOG_SUCCESS)
                {
                        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
                        {
                                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");    //К этому делу мы не имеем никакого отношения.
                                B_AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");    //К какому делу?
                                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");    //К этому убийству паладина там, наверху. Я бы на твоем месте подумал о наемниках вместо того, чтобы попусту проводить время здесь.
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");    //Я знаю, что ты не имеешь к этому никакого отношения, но убийство паладина сильно напугало этих вельмож.
                                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");    //Хочешь дружеский совет? Тебе лучше убираться из города. По крайней мере, на некоторое время.
                        };
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");    //С тех пор, как выяснилось, что наемники не имели отношения к этому паладину, ополчение не осмеливается даже заглядывать сюда.
                        B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");    //Я думаю, они боятся уйти отсюда с расквашенным носом. А по мне, так даже лучше.
                };
        }
        else if(KAPITEL == 4)
        {
                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");    //Здесь абсолютно ничего не происходит.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");    //Наконец-то эти разжиревшие паладины покидают гавань. Давно пора.
        };
};
instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
        npc = vlk_432_moe;
        nr = 2;
        condition = dia_moe_lehmargeldeintreiben_condition;
        information = dia_moe_lehmargeldeintreiben_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_moe_lehmargeldeintreiben_condition()
{
        if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
        {
                return TRUE;
        };
};
func void dia_moe_lehmargeldeintreiben_info()
{
        B_AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");     //Эй, ты! Лемар передает тебе привет.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
