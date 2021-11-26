instance DIA_HOKURN_EXIT(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 999;
        condition = dia_hokurn_exit_condition;
        information = dia_hokurn_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_hokurn_exit_condition()
{
        return TRUE;
};
func void dia_hokurn_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_HOKURN_HELLO(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 4;
        condition = dia_hokurn_hello_condition;
        information = dia_hokurn_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_hokurn_hello_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_hokurn_hello_info()
{
        B_AI_Output(self,other,"DIA_Hokurn_Hello_01_00"); //У тебя не найдется чего-нибудь выпить?
        B_AI_Output(other,self,"DIA_Hokurn_Hello_15_01"); //Полагаю, вода тебе не подойдет.
        B_AI_Output(self,other,"DIA_Hokurn_Hello_01_02"); //Нет, черт побери!!! Мне нужно что-нибудь алкогольное, чтобы я, наконец, мог избавиться от этой проклятой головной боли.
        B_AI_Output(self,other,"DIA_Hokurn_Hello_01_03"); //Когда мне долго не удается промочить горло, мой череп раскалывается и мне кажется, что он вот-вот взорвется.
        Info_ClearChoices(dia_hokurn_hello);
        Info_AddChoice(dia_hokurn_hello,dia_hokurn_hello_no_description,dia_hokurn_hello_no); // "Я попробую что-нибудь сделать."
        if((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1))
        {
                Info_AddChoice(dia_hokurn_hello,dia_hokurn_hello_yes_description,dia_hokurn_hello_yes); // "Вот возьми это."
        };
};
func void dia_hokurn_hello_no()
{
        B_AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");      //Я ничем не могу помочь тебе.
        B_AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");      //Тогда проваливай!
        Info_ClearChoices(dia_hokurn_hello);
        Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
        Info_AddChoice(dia_hokurn_hello,dia_hokurn_hello_ask1_description,dia_hokurn_hello_ask1); // "Еще одно..."
};
func void dia_hokurn_hello_ask1()
{
        B_AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");    //Еще одно...
        B_AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");    //(ревет) Ты что, не понял меня? УБИРАЙСЯ!!!
        Info_ClearChoices(dia_hokurn_hello);
        Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
        Info_AddChoice(dia_hokurn_hello,dia_hokurn_hello_ask2_description,dia_hokurn_hello_ask2); // "Это важно."
};
func void dia_hokurn_hello_ask2()
{
        B_AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");    //Это важно.
        B_AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");    //(ревет) Ты сам напросился.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_hokurn_hello_end()
{
        AI_StopProcessInfos(self);
};
func void b_hokurn_sauf()
{
        B_AI_Output(self,other,"B_Hokurn_Sauf_01_00");    //(рыгает) Ох, какое блаженство!
        B_AI_Output(self,other,"B_Hokurn_Sauf_01_01");    //Теперь я опять могу размышлять здраво. Что я могу сделать для тебя?
};
func void dia_hokurn_hello_yes()
{
        B_AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");     //Вот, возьми это.
        if(Npc_HasItems(other,itfo_booze) >= 1)
        {
                b_giveinvitems(other,self,itfo_booze,1);
                b_useitem(self,itfo_booze);
        }
        else if(Npc_HasItems(other,itfo_wine) >= 1)
        {
                b_giveinvitems(other,self,itfo_wine,1);
                b_useitem(self,itfo_wine);
        }
        else if(Npc_HasItems(other,itfo_beer) >= 1)
        {
                b_giveinvitems(other,self,itfo_beer,1);
                b_useitem(self,itfo_beer);
        };
        HOKURNLASTDRINK = Wld_GetDay();
        HOKURNGETSDRINK = TRUE;
        b_hokurn_sauf();
        Info_ClearChoices(dia_hokurn_hello);
};
instance DIA_HOKURN_DRINK(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_drink_condition;
        information = dia_hokurn_drink_info;
        permanent = TRUE;
        description = "Я принес тебе выпивку.";
};
func int dia_hokurn_drink_condition()
{
        if((HOKURNGETSDRINK == FALSE) && ((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1)))
        {
                return TRUE;
        };
};
func void dia_hokurn_drink_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_Drink_15_00"); //Я принес тебе выпивку.
        B_AI_Output(self,other,"DIA_Hokurn_Drink_01_01"); //(жадно) Давай сюда!!!
        if(Npc_HasItems(other,itfo_booze) >= 1)
        {
                b_giveinvitems(other,self,itfo_booze,1);
                b_useitem(self,itfo_booze);
        }
        else if(Npc_HasItems(other,itfo_wine) >= 1)
        {
                b_giveinvitems(other,self,itfo_wine,1);
                b_useitem(self,itfo_wine);
        }
        else if(Npc_HasItems(other,itfo_beer) >= 1)
        {
                b_giveinvitems(other,self,itfo_beer,1);
                b_useitem(self,itfo_beer);
        };
        HOKURNLASTDRINK = Wld_GetDay();
        HOKURNGETSDRINK = TRUE;
        b_hokurn_sauf();
};
instance DIA_HOKURN_QUESTION(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_question_condition;
        information = dia_hokurn_question_info;
        permanent = TRUE;
        description = "Мне нужна кое-какая информация.";
};
func int dia_hokurn_question_condition()
{
        if(HOKURNGETSDRINK == FALSE)
        {
                return TRUE;
        };
};
func void dia_hokurn_question_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_Question_15_00");      //Мне нужна кое-какая информация.
        B_AI_Output(self,other,"DIA_Hokurn_Question_01_01");      //(раздраженно) Я думал, ты меня понял. Я говорю только с друзьями.
        B_AI_Output(self,other,"DIA_Hokurn_Question_01_02");      //А друзья всегда делятся со мной выпивкой. Понял? Теперь проваливай!
};
instance DIA_HOKURN_LEARN(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 6;
        condition = dia_hokurn_learn_condition;
        information = dia_hokurn_learn_info;
        permanent = FALSE;
        description = "Я ищу человека, который мог бы научить меня чему-нибудь.";
};
func int dia_hokurn_learn_condition()
{
        if(HOKURNGETSDRINK == TRUE)
        {
                return TRUE;
        };
};
func void dia_hokurn_learn_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_Learn_15_00"); //Я ищу человека, который мог бы научить меня чему-нибудь.
        B_AI_Output(self,other,"DIA_Hokurn_Learn_01_01"); //Я мог бы обучить тебя некоторым вещам. Я лучший боец на многие мили вокруг.
        B_AI_Output(self,other,"DIA_Hokurn_Learn_01_02"); //Так как мы друзья, я сделаю тебе скидку. Это будет стоить 300 золотых монет.
        Info_ClearChoices(dia_hokurn_learn);
        Info_AddChoice(dia_hokurn_learn,dia_hokurn_learn_tooexpensive_description,dia_hokurn_learn_tooexpensive); // "Это слишком дорого для меня."
        if(Npc_HasItems(other,itmi_gold) >= 300)
        {
                Info_AddChoice(dia_hokurn_learn,dia_hokurn_learn_ok_description,dia_hokurn_learn_ok); // "Хорошо вот деньги."
        };
};
func void dia_hokurn_learn_tooexpensive()
{
        B_AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");    //Это для меня слишком дорого.
        B_AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");    //Слишком дорого? Это меньше, чем любой другой запросил бы на моем месте.
        B_AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");    //Ну, сам подумай.
        Info_ClearChoices(dia_hokurn_learn);
};
func void dia_hokurn_learn_ok()
{
        B_AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");      //Хорошо, вот деньги.
        b_giveinvitems(other,self,itmi_gold,300);
        HOKURN_TEACHPLAYER = TRUE;
        Info_ClearChoices(dia_hokurn_learn);
};
instance DIA_HOKURN_PAYTEACHER(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 6;
        condition = dia_hokurn_payteacher_condition;
        information = dia_hokurn_payteacher_info;
        permanent = TRUE;
        description = "Вот твои деньги. Я хочу, чтобы ты обучил меня.";
};
func int dia_hokurn_payteacher_condition()
{
        if(Npc_KnowsInfo(other,dia_hokurn_learn) && (Npc_HasItems(other,itmi_gold) >= 300) && (HOKURN_TEACHPLAYER == FALSE))
        {
                return TRUE;
        };
};
func void dia_hokurn_payteacher_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");    //Вот твои деньги. Я хочу, чтобы ты обучил меня.
        B_AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");    //Ты не пожалеешь!
        b_giveinvitems(other,self,itmi_gold,300);
        HOKURN_TEACHPLAYER = TRUE;
};
instance DIA_HOKURN_DRINKANDLEARN(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 7;
        condition = dia_hokurn_drinkandlearn_condition;
        information = dia_hokurn_drinkandlearn_info;
        permanent = TRUE;
        description = "Вот, держи выпивку.";
};
func int dia_hokurn_drinkandlearn_condition()
{
        if((HOKURNGETSDRINK == TRUE) && ((Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1) || (Npc_HasItems(other,itfo_beer) >= 1)))
        {
                return TRUE;
        };
};
func void dia_hokurn_drinkandlearn_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00"); //Вот, держи выпивку.
        if(Npc_HasItems(other,itfo_booze) >= 1)
        {
                b_giveinvitems(other,self,itfo_booze,1);
                b_useitem(self,itfo_booze);
        }
        else if(Npc_HasItems(other,itfo_wine) >= 1)
        {
                b_giveinvitems(other,self,itfo_wine,1);
                b_useitem(self,itfo_wine);
        }
        else if(Npc_HasItems(other,itfo_beer) >= 1)
        {
                b_giveinvitems(other,self,itfo_beer,1);
                b_useitem(self,itfo_beer);
        };
        HOKURNLASTDRINK = Wld_GetDay();
        B_AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01"); //Мне стало гораздо лучше. Я теперь готов ко всему.
};
instance DIA_HOKURN_TEACH(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 7;
        condition = dia_hokurn_teach_condition;
        information = dia_hokurn_teach_info;
        permanent = TRUE;
        description = "Начнем обучение.";
};
func int dia_hokurn_teach_condition()
{
        if(HOKURN_TEACHPLAYER == TRUE)
        {
                return TRUE;
        };
};
func void dia_hokurn_teach_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_Teach_15_00"); //Давай начнем обучение.
        if(HOKURNLASTDRINK < Wld_GetDay())
        {
                B_AI_Output(self,other,"DIA_Hokurn_Teach_01_01"); //Сначала принеси мне что-нибудь выпить!
        }
        else
        {
                if(hero.guild == GIL_PAL)
                {
                        B_AI_Output(self,other,"DIA_Hokurn_Teach_01_02"); //А потом мы посмотрим, что можно выжать из твоих ржавых паладинских костей, ха?
                }
                else if(hero.guild == GIL_KDF)
                {
                        B_AI_Output(self,other,"DIA_Hokurn_Teach_01_03"); //Что ты понимаешь. Даже маги не чуждаются оружия ближнего боя.
                };
                Info_ClearChoices(dia_hokurn_teach);
                Info_AddChoice(dia_hokurn_teach,DIALOG_BACK,dia_hokurn_teach_back);
                Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hokurn_teach_2h_1);
                Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hokurn_teach_2h_5);
                Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_hokurn_teach_1h_1);
                Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_hokurn_teach_1h_5);
        };
};
func void dia_hokurn_teach_back()
{
        Info_ClearChoices(dia_hokurn_teach);
};
func void b_hokurn_teachedenough()
{
        B_AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");   //Тебе больше не нужен учитель в этом виде боевого искусства.
};
func void dia_hokurn_teach_2h_1()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
        if(other.hitchance[NPC_TALENT_2H] >= 100)
        {
                b_hokurn_teachedenough();
        };
        Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hokurn_teach_2h_1);
};
func void dia_hokurn_teach_2h_5()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
        if(other.hitchance[NPC_TALENT_2H] >= 100)
        {
                b_hokurn_teachedenough();
        };
        Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hokurn_teach_2h_5);
};
func void dia_hokurn_teach_1h_1()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
        if(other.hitchance[NPC_TALENT_1H] >= 100)
        {
                b_hokurn_teachedenough();
        };
        Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_hokurn_teach_1h_1);
};
func void dia_hokurn_teach_1h_5()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
        if(other.hitchance[NPC_TALENT_1H] >= 100)
        {
                b_hokurn_teachedenough();
        };
        Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_hokurn_teach_1h_5);
};
instance DIA_HOKURN_STAYHERE(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_stayhere_condition;
        information = dia_hokurn_stayhere_info;
        permanent = FALSE;
        description = "А что ты вообще здесь делаешь, кстати?";
};
func int dia_hokurn_stayhere_condition()
{
        if(HOKURNGETSDRINK == TRUE)
        {
                return TRUE;
        };
};
func void dia_hokurn_stayhere_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");      //Кстати, а что ты вообще здесь делаешь?
        B_AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");      //Если честно, понятия не имею, что мы делаем здесь и когда все начнется.
        B_AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");      //И пока у меня есть выпивка, меня это совершенно не волнует.
};
instance DIA_HOKURN_WHEREDRAGON(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_wheredragon_condition;
        information = dia_hokurn_wheredragon_info;
        permanent = TRUE;
        description = "Ты знаешь, где находятся драконы?";
};
func int dia_hokurn_wheredragon_condition()
{
        if((HOKURNGETSDRINK == TRUE) && (HOKURNTELLSDRAGON == FALSE) && Npc_KnowsInfo(other,dia_hokurn_stayhere))
        {
                return TRUE;
        };
};
func void dia_hokurn_wheredragon_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");   //Ты знаешь, где находятся драконы?
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");   //А что я получу за то, что скажу это тебе?
        Info_ClearChoices(dia_hokurn_wheredragon);
        Info_AddChoice(dia_hokurn_wheredragon,dia_hokurn_wheredragon_findmyself_description,dia_hokurn_wheredragon_findmyself); // "Ничего я сам их найду."
        Info_AddChoice(dia_hokurn_wheredragon,dia_hokurn_wheredragon_gold_description,dia_hokurn_wheredragon_gold); // "Я был бы не прочь заплатить тебе за эту информацию."
        if(Npc_HasItems(other,itfo_booze) >= 1)
        {
                Info_AddChoice(dia_hokurn_wheredragon,dia_hokurn_wheredragon_booze_description,dia_hokurn_wheredragon_booze); // "У меня есть еще одна бутылочка джина!"
        };
};
func void dia_hokurn_wheredragon_findmyself()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");        //Ничего, я сам их найду.
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");        //Тебе лучше быть поосторожнее. Впереди тебя ждет много кровопролитных боев.
        Info_ClearChoices(dia_hokurn_wheredragon);
};
func void dia_hokurn_wheredragon_gold()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");      //Я был бы не прочь заплатить тебе за эту информацию.
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");      //Заплатить мне? Хмм. Хорошо, я продам тебе эту информацию за 200 золотых монет.
        Info_ClearChoices(dia_hokurn_wheredragon);
        Info_AddChoice(dia_hokurn_wheredragon,dia_hokurn_wheredragon_toomuch_description,dia_hokurn_wheredragon_toomuch); // "Это слишком много!"
        if(Npc_HasItems(other,itmi_gold) >= 200)
        {
                Info_AddChoice(dia_hokurn_wheredragon,dia_hokurn_wheredragon_ok_description,dia_hokurn_wheredragon_ok); // "Договорились. Вот твои деньги!"
        };
};
func void dia_hokurn_wheredragon_toomuch()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");   //Это слишком много!
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");   //Тогда забудь об этом.
        Info_ClearChoices(dia_hokurn_wheredragon);
};
func void dia_hokurn_wheredragon_ok()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");        //Договорились. Вот твои деньги!
        b_giveinvitems(other,self,itmi_gold,200);
        HOKURNTELLSDRAGON = TRUE;
        Info_ClearChoices(dia_hokurn_wheredragon);
};
func void dia_hokurn_wheredragon_booze()
{
        B_AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");     //У меня есть еще одна бутылочка джина!
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");     //За хорошее вино я готов сразиться со всеми драконами мира.
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");     //Договорились. Давай мне эту бутылку!
        b_giveinvitems(other,self,itfo_booze,1);
        B_AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");     //Я припасу ее на черный день.
        HOKURNTELLSDRAGON = TRUE;
        Info_ClearChoices(dia_hokurn_wheredragon);
};
instance DIA_HOKURN_DRAGON(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_dragon_condition;
        information = dia_hokurn_dragon_info;
        permanent = TRUE;
        description = "Хорошо, теперь скажи, где все эти драконы?";
};
func int dia_hokurn_dragon_condition()
{
        if(HOKURNTELLSDRAGON == TRUE)
        {
                return TRUE;
        };
};
func void dia_hokurn_dragon_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");        //Хорошо, теперь скажи, где все эти драконы?
        B_AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");        //Ну, если честно, я не могу сказать тебе ничего определенного, но я слышал, что всего должно быть четыре дракона.
        B_AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");        //Прошлой ночью над самой высокой горой мы видели багровое свечение.
        B_AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");        //Готов поклясться свой матерью, что если ты ищешь драконов, одного из них ты найдешь там.
};
instance DIA_HOKURN_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 5;
        condition = dia_hokurn_alldragonsdead_condition;
        information = dia_hokurn_alldragonsdead_info;
        permanent = TRUE;
        description = "Я убил всех драконов.";
};
func int dia_hokurn_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_hokurn_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");        //Я убил всех драконов.
        B_AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");        //Иди, рассказывай сказки кому-нибудь другому.
};
instance DIA_HOKURN_PICKPOCKET(C_INFO)
{
        npc = djg_712_hokurn;
        nr = 900;
        condition = dia_hokurn_pickpocket_condition;
        information = dia_hokurn_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_hokurn_pickpocket_condition()
{
        return c_beklauen(69,210);
};
func void dia_hokurn_pickpocket_info()
{
        Info_ClearChoices(dia_hokurn_pickpocket);
        Info_AddChoice(dia_hokurn_pickpocket,DIALOG_BACK,dia_hokurn_pickpocket_back);
        Info_AddChoice(dia_hokurn_pickpocket,DIALOG_PICKPOCKET,dia_hokurn_pickpocket_doit);
};
func void dia_hokurn_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_hokurn_pickpocket);
};
func void dia_hokurn_pickpocket_back()
{
        Info_ClearChoices(dia_hokurn_pickpocket);
};
