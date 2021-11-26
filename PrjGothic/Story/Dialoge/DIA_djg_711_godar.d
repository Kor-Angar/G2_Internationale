instance DIA_GODAR_EXIT(C_INFO)
{
        npc = djg_711_godar;
        nr = 999;
        condition = dia_godar_exit_condition;
        information = dia_godar_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_godar_exit_condition()
{
        return TRUE;
};
func void dia_godar_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GODAR_HELLO(C_INFO)
{
        npc = djg_711_godar;
        nr = 4;
        condition = dia_godar_hello_condition;
        information = dia_godar_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_godar_hello_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_godar_hello_info()
{
        B_AI_Output(self,other,"DIA_Godar_Hello_13_00");  //Э-э? Что?
};
instance DIA_GODAR_COMEFROM(C_INFO)
{
        npc = djg_711_godar;
        nr = 4;
        condition = dia_godar_comefrom_condition;
        information = dia_godar_comefrom_info;
        permanent = FALSE;
        description = "Откуда ты?";
};
func int dia_godar_comefrom_condition()
{
        return TRUE;
};
func void dia_godar_comefrom_info()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");       //Откуда вы?
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");       //Мы пришли... э-э, из города.
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_description,dia_godar_comefrom_bandits); // "Вы бандиты!"
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_description,dia_godar_comefrom_notcity); // "Я что-то не видел тебя в городе."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_understand_description,dia_godar_comefrom_understand); // "Понятно. Вы из города."
};
func void dia_godar_comefrom_bandits()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");       //Вы бандиты!
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");       //Поосторожнее! Твой язык не доведет тебя до добра!
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_keepcalm_description,dia_godar_comefrom_bandits_keepcalm); // "Расслабься. Я не буду сдавать вас."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_nofear_description,dia_godar_comefrom_bandits_nofear); // "Тебе не напугать меня."
};
func void dia_godar_comefrom_bandits_keepcalm()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");      //Расслабься. Я не буду сдавать вас.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");      //Надеюсь. Это для твоей же пользы. А то не сносить тебе головы!
        Info_ClearChoices(dia_godar_comefrom);
};
func void dia_godar_comefrom_bandits_nofear()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");        //Тебе не напугать меня.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");        //Ну, это мы еще посмотрим.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_godar_comefrom_notcity()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");       //Я что-то не видел тебя в городе.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");       //Не выношу людей, которые суют нос не в свое дело. Понял?
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_cutthroat_description,dia_godar_comefrom_notcity_cutthroat); // "Нет."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_forget_description,dia_godar_comefrom_notcity_forget); // "Понял. Вы пришли из города."
};
func void dia_godar_comefrom_notcity_forget()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");        //Понял. Вы пришли из города.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");        //Именно.
        Info_ClearChoices(dia_godar_comefrom);
};
func void dia_godar_comefrom_notcity_cutthroat()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");     //Нет.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");     //Тогда мне придется объяснить это в деталях...
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_godar_comefrom_understand()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");    //Понятно. Вы из города.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");    //Видишь! Ты все понимаешь!
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");    //Вот, глотни!
        CreateInvItems(self,itfo_beer,1);
        b_giveinvitems(self,other,itfo_beer,1);
        b_useitem(other,itfo_beer);
        Info_ClearChoices(dia_godar_comefrom);
};
instance DIA_GODAR_PLAN(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_plan_condition;
        information = dia_godar_plan_info;
        permanent = FALSE;
        description = "Что ты делаешь здесь?";
};
func int dia_godar_plan_condition()
{
        return TRUE;
};
func void dia_godar_plan_info()
{
        B_AI_Output(other,self,"DIA_Godar_Plan_15_00");   //Что вы делаете здесь?
        B_AI_Output(self,other,"DIA_Godar_Plan_13_01");   //Мы услышали об охоте на драконов. Ну... Мы собрали свои пожитки и пришли сюда.
        B_AI_Output(self,other,"DIA_Godar_Plan_13_02");   //Но, говоря откровенно, мне плевать на драконов. Мне нужно золото.
        B_AI_Output(self,other,"DIA_Godar_Plan_13_03");   //У драконов ведь есть золото, правда?
        B_AI_Output(other,self,"DIA_Godar_Plan_15_04");   //Конечно.
};
instance DIA_GODAR_DRAGONLORE(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_dragonlore_condition;
        information = dia_godar_dragonlore_info;
        permanent = FALSE;
        description = "Что ты знаешь о драконах?";
};
func int dia_godar_dragonlore_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_plan))
        {
                return TRUE;
        };
};
func void dia_godar_dragonlore_info()
{
        B_AI_Output(other,self,"DIA_Godar_DragonLore_15_00");     //Что ты знаешь о драконах?
        B_AI_Output(self,other,"DIA_Godar_DragonLore_13_01");     //Я знаю о них только из детских сказок.
        B_AI_Output(self,other,"DIA_Godar_DragonLore_13_02");     //Понимаешь, девственницы, золото, огненное дыхание и все такое.
};
instance DIA_GODAR_DESTINATION(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_destination_condition;
        information = dia_godar_destination_info;
        permanent = FALSE;
        description = "А куда вы собираетесь идти отсюда?";
};
func int dia_godar_destination_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_plan))
        {
                return TRUE;
        };
};
func void dia_godar_destination_info()
{
        B_AI_Output(other,self,"DIA_Godar_Destination_15_00");    //А куда вы собираетесь идти отсюда?
        B_AI_Output(self,other,"DIA_Godar_Destination_13_01");    //Понятия не имею. Мы все еще думаем над этим.
        if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
        {
                B_AI_Output(other,self,"DIA_Godar_Destination_15_02");    //Вы могли бы пойти в замок.
                B_AI_Output(self,other,"DIA_Godar_Destination_13_03");    //Меня туда силком не затащишь. Нет уж. Только не к паладинам.
                B_AI_Output(self,other,"DIA_Godar_Destination_13_04");    //Я не хочу обратно в тюрьму. Я уже был там, и мне этого хватило.
        };
};
instance DIA_GODAR_ORKS(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_orks_condition;
        information = dia_godar_orks_info;
        permanent = FALSE;
        description = "Что насчет орков?";
};
func int dia_godar_orks_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_destination))
        {
                return TRUE;
        };
};
func void dia_godar_orks_info()
{
        B_AI_Output(other,self,"DIA_Godar_Orks_15_00");   //Что насчет орков?
        B_AI_Output(self,other,"DIA_Godar_Orks_13_01");   //Ими окружен весь замок.
        B_AI_Output(self,other,"DIA_Godar_Orks_13_02");   //Пытаться пробраться туда - чистое безумие. Если ты хочешь сразиться с орками, то сразу можешь считать себя трупом.
        B_AI_Output(self,other,"DIA_Godar_Orks_13_03");   //Никому не пробиться туда.
        B_AI_Output(other,self,"DIA_Godar_Orks_15_04");   //Ах, действительно.
};
instance DIA_GODAR_PRISON(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_prison_condition;
        information = dia_godar_prison_info;
        permanent = FALSE;
        description = "За что ты сидел?";
};
func int dia_godar_prison_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
        {
                return TRUE;
        };
};
func void dia_godar_prison_info()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_15_00"); //За что ты сидел?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Godar_Prison_13_01"); //Так я тебе и сказал! Ха!
                B_AI_Output(self,other,"DIA_Godar_Prison_13_02"); //Вы, маги, заодно с паладинами. Нет, дружок. Забудь об этом.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Prison_13_03"); //Эти свиньи поймали меня за браконьерство. За двух жалких зайцев!
                B_AI_Output(self,other,"DIA_Godar_Prison_13_04"); //Мне дали 10 лет за это!
                B_AI_Output(other,self,"DIA_Godar_Prison_15_05"); //Это все?
                B_AI_Output(self,other,"DIA_Godar_Prison_13_06"); //Ну... Конечно же, я защищался...
                B_AI_Output(other,self,"DIA_Godar_Prison_15_07"); //И?
                B_AI_Output(self,other,"DIA_Godar_Prison_13_08"); //Я тут не причем. Этот парень сам поскользнулся и сломал себе шею. Честно!
                Info_ClearChoices(dia_godar_prison);
                Info_AddChoice(dia_godar_prison,dia_godar_prison_court_description,dia_godar_prison_court); // "Знакомые слова."
                Info_AddChoice(dia_godar_prison,dia_godar_prison_pissoff_description,dia_godar_prison_pissoff); // "Тебе не следовало попадаться."
        };
};
func void dia_godar_prison_court()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");   //Знакомая история.
        B_AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");   //Ты понимаешь меня? Эти спесивые богачи понятия не имеют, как нам тяжело.
        B_AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");   //Ну, по крайней мере, их это не волнует.
        Info_ClearChoices(dia_godar_prison);
        GODARLIKESYOU = TRUE;
};
func void dia_godar_prison_pissoff()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00"); //Тебе не следовало попадаться.
        B_AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01"); //(сердито) Ручаюсь, ты никогда не был в тюрьме, так ведь?
        B_AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02"); //Сейчас я покажу тебе, что может стать с человеком в тюрьме!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_GODAR_HUNTING(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_hunting_condition;
        information = dia_godar_hunting_info;
        permanent = FALSE;
        description = "Ты можешь научить меня охотиться?";
};
func int dia_godar_hunting_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
        {
                return TRUE;
        };
};
func void dia_godar_hunting_info()
{
        B_AI_Output(other,self,"DIA_Godar_Hunting_15_00");        //Ты можешь научить меня охотиться?
        if(GODARLIKESYOU == FALSE)
        {
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_01");        //Ты шутишь? Ни за что!
                AI_StopProcessInfos(self);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_03");        //Животные - это не только мясо. Ты также можешь продавать их шкуры или когти. Это неплохие деньги.
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_04");        //Дождаться не могу, когда мы доберемся до этого дракона!
                GODAR_TEACHANIMALTROPHY = TRUE;
        };
};
instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_dragonstuff_condition;
        information = dia_godar_dragonstuff_info;
        permanent = TRUE;
        description = "Расскажи мне, как потрошить дракона.";
};
var int godar_teachdragonstuff;
func int dia_godar_dragonstuff_condition()
{
        if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
        {
                return TRUE;
        };
};
func void dia_godar_dragonstuff_info()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");    //Расскажи мне, как потрошить дракона.
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");    //Чтобы ты прибрал все золотишко себе, ха?
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");    //Ладно, хорошо, но то обойдется тебе в 1000 золотых.
        Info_ClearChoices(dia_godar_dragonstuff);
        Info_AddChoice(dia_godar_dragonstuff,dia_godar_dragonstuff_nein_description,dia_godar_dragonstuff_nein); // "Мне это не очень интересно."
        Info_AddChoice(dia_godar_dragonstuff,dia_godar_dragonstuff_fair_description,dia_godar_dragonstuff_fair); // "Это честно."
};
func void dia_godar_dragonstuff_fair()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");       //Это честно.
        if(b_giveinvitems(other,self,itmi_gold,1000))
        {
                GODAR_TEACHDRAGONSTUFF = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");       //Без денег не очень. Сначала раздобудь золото.
        };
        Info_ClearChoices(dia_godar_dragonstuff);
};
func void dia_godar_dragonstuff_nein()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");       //Мне это не очень интересно.
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");       //Как знаешь.
        Info_ClearChoices(dia_godar_dragonstuff);
};
instance DIA_GODAR_TEACH(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_teach_condition;
        information = dia_godar_teach_info;
        permanent = TRUE;
        description = "Научи меня охотиться.";
};
func int dia_godar_teach_condition()
{
        if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
        {
                return TRUE;
        };
};
func void dia_godar_teach_info()
{
        B_AI_Output(other,self,"DIA_Godar_Teach_15_00");  //Научи меня охотиться.
        if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
        {
                Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
                if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("Красться",b_getlearncosttalent(other,NPC_TALENT_SNEAK)),dia_godar_teach_thief_sneak);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("Удаление зубов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_teeth);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("Жало кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfsting);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("Крылья кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfwing);
                };
                if(GODAR_TEACHDRAGONSTUFF == TRUE)
                {
                        if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
                        {
                                Info_AddChoice(dia_godar_teach,b_buildlearnstring("Удаление чешуи драконов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonscale);
                        };
                        if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
                        {
                                Info_AddChoice(dia_godar_teach,b_buildlearnstring("Сбор крови дракона",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonblood);
                        };
                };
        }
        else
        {
                b_say(self,other,"$NOLEARNYOUREBETTER");
        };
};
func void dia_godar_teach_back()
{
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_teeth()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");     //Зубы лучше всего отделять при помощи хорошего ножа.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_bfsting()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");   //Чтобы изъять жало кровавой мухи, нужно сначала выдавить его из ее тела.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_bfwing()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");    //Крылья кровавых мух очень нежные. Нужно быть очень аккуратным, когда отрезаешь их.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_thief_sneak()
{
        if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");     //Чтобы неслышно красться, лучше всего использовать мягкую обувь. Жесткая подошва издает слишком много шума.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_dragonscale()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");       //Чтобы оторвать чешую дракона, нужно иметь много сил. Но ты справишься.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_dragonblood()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");       //Найди мягкое место на животе дракона. Там легче всего сцедить его кровь.
        };
        Info_ClearChoices(dia_godar_teach);
};
instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_alldragonsdead_condition;
        information = dia_godar_alldragonsdead_info;
        permanent = FALSE;
        description = "Я убил всех драконов.";
};
func int dia_godar_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_godar_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00"); //Я убил всех драконов.
        B_AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01"); //Ну и ладно. Здесь, в долине, мы все равно найдем, чем поживиться.
};
instance DIA_GODAR_PICKPOCKET(C_INFO)
{
        npc = djg_711_godar;
        nr = 900;
        condition = dia_godar_pickpocket_condition;
        information = dia_godar_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_20;
};
func int dia_godar_pickpocket_condition()
{
        return c_beklauen(16,160);
};
func void dia_godar_pickpocket_info()
{
        Info_ClearChoices(dia_godar_pickpocket);
        Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
        Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};
func void dia_godar_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_godar_pickpocket);
};
func void dia_godar_pickpocket_back()
{
        Info_ClearChoices(dia_godar_pickpocket);
};
