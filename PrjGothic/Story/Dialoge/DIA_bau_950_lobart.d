instance DIA_LOBART_EXIT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 999;
        condition = dia_lobart_exit_condition;
        information = dia_lobart_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lobart_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_lobart_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_stolencloths_condition;
        information = dia_lobart_stolencloths_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_lobart_stolencloths_condition()
{
        if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_lobart_stolencloths_info()
{
        var C_ITEM heroarmor;
        heroarmor = Npc_GetEquippedArmor(other);
        if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
        {
                B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");  //Я не могу поверить своим глазам! Этот ублюдок расхаживает в МОЕЙ одежде!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");  //Эй, ты!
                B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");  //Когда ты тут был последний раз, из моего сундука пропали вещи!
        };
        if(Npc_KnowsInfo(other,dia_lobart_worknow))
        {
                B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");  //Ты мог бы поработать здесь вместо того, чтобы шарить в моем доме, ленивый бездельник!
        };
        B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");  //Отдай немедленно мою одежду!
        Info_ClearChoices(dia_lobart_stolencloths);
        Info_AddChoice(dia_lobart_stolencloths,dia_lobart_stolencloths_forgetit_description,dia_lobart_stolencloths_forgetit); // "Забудь об этом!"
        if(Npc_HasItems(other,itar_bau_l) > 0)
        {
                Info_AddChoice(dia_lobart_stolencloths,dia_lobart_stolencloths_hereyougo_description,dia_lobart_stolencloths_hereyougo); // "Ладно можешь забрать ее назад."
        }
        else
        {
                Info_AddChoice(dia_lobart_stolencloths,dia_lobart_stolencloths_donthaveit_description,dia_lobart_stolencloths_donthaveit); // "У меня ее нет."
        };
};
func void dia_lobart_stolencloths_hereyougo()
{
        B_AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");        //Ладно, можешь забрать ее назад.
        B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");        //Если она тебе нужна, ты можешь ЗАПЛАТИТЬ за нее!
        B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");        //(отрывисто) А теперь иди работай!
        b_giveinvitems(other,self,itar_bau_l,1);
        Info_ClearChoices(dia_lobart_stolencloths);
};
func void dia_lobart_stolencloths_donthaveit()
{
        B_AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");       //У меня ее нет.
        B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");       //Ты уже продал ее, да? (зло) Я проучу тебя, парень!
        LOBART_KLEIDUNG_GESTOHLEN = TRUE;
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_THEFT,1);
};
func void dia_lobart_stolencloths_forgetit()
{
        B_AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //Забудь об этом!
        B_AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //(зло) Я проучу тебя, парень!
        LOBART_KLEIDUNG_GESTOHLEN = TRUE;
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_THEFT,1);
};
instance DIA_LOBART_HALLO(C_INFO)
{
        npc = bau_950_lobart;
        nr = 2;
        condition = dia_lobart_hallo_condition;
        information = dia_lobart_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_lobart_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_lobart_hallo_info()
{
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_Hallo_05_00"); //Что ты тут ошиваешься на моей ферме?
                B_AI_Output(self,other,"DIA_Lobart_Hallo_05_01"); //Ты на чьей стороне? На стороне восставших фермеров или на стороне короля?
                Info_ClearChoices(dia_lobart_hallo);
                Info_AddChoice(dia_lobart_hallo,dia_lobart_hallo_what_description,dia_lobart_hallo_what); // "Я не понимаю..."
                Info_AddChoice(dia_lobart_hallo,dia_lobart_hallo_fortheking_description,dia_lobart_hallo_fortheking); // "Я за короля!"
                Info_AddChoice(dia_lobart_hallo,dia_lobart_hallo_forthepeasants_description,dia_lobart_hallo_forthepeasants); // "Я с крестьянами!"
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_Hallo_05_02"); //Чем могу быть полезен?
        };
};
func void dia_lobart_hallo_forthepeasants()
{
        B_AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");  //Я с крестьянами!
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");  //Ха! Этот чертов смутьян Онар сведет нас всех в могилу!
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");  //Как ты думаешь, как долго еще здесь будут паладины?
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");  //После того, что сделал Онар, весь город гудит, как улей.
        LOBART_AGAINSTKING = TRUE;
        Info_ClearChoices(dia_lobart_hallo);
};
func void dia_lobart_hallo_fortheking()
{
        B_AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");      //Я за короля!
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");      //(презрительно) 'За короля!' Также говорили и городские стражники, когда забрали половину моих овец.
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");      //Но где же, спрашивается, эти ублюдки, когда нужно защищать нас от бандитов? А где они попрячутся, когда сюда вторгнутся орки?
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");      //Я скажу тебе: в городе, за толстыми городскими стенами.
        B_AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");      //Так что оставь меня в покое, вместе со своим королем.
        LOBART_AGAINSTKING = FALSE;
        Info_ClearChoices(dia_lobart_hallo);
};
func void dia_lobart_hallo_what()
{
        B_AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");    //Я не понимаю...
        B_AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");    //Что?! Не пытайся меня провести, мальчик! Я хочу знать, на чьей ты стороне! Так на чьей же?!
};
instance DIA_LOBART_KLEIDUNG(C_INFO)
{
        npc = bau_950_lobart;
        nr = 2;
        condition = dia_lobart_kleidung_condition;
        information = dia_lobart_kleidung_info;
        permanent = FALSE;
        description = "Мне нужна приличная одежда!";
};
func int dia_lobart_kleidung_condition()
{
        if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_lobart_kleidung_info()
{
        B_AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");      //Мне нужна приличная одежда!
        B_AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");      //Я могу дать тебе приличную крестьянскую рабочую одежду.
        B_AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");      //Ты можешь заплатить за нее?
        Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
        b_logentry(TOPIC_KLEIDUNG,TOPIC_KLEIDUNG_description_51); // "Фермер Лобарт готов продать мне рабочую одежду."
        if(!Npc_KnowsInfo(other,dia_lobart_worknow))
        {
                B_AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");      //Ты мог бы отработать часть ее стоимости... если ты один из тех, кто ИЩЕТ работу.
                b_logentry(TOPIC_KLEIDUNG,TOPIC_KLEIDUNG_description_52); // "Лобарт может снизить цену за одежду если я поработаю на его ферме. Чем больше я сделаю тем дешевле обойдется мне одежда."
        };
};
instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
        npc = bau_950_lobart;
        nr = 2;
        condition = dia_lobart_buyclothes_condition;
        information = dia_lobart_buyclothes_info;
        permanent = TRUE;
        description = "Сколько стоит эта рабочая одежда?";
};
func int dia_lobart_buyclothes_condition()
{
        if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
        {
                return TRUE;
        };
};
func void dia_lobart_buyclothes_info()
{
        WERT_LOBARTSRUESTUNG = 80;
        B_AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");    //Сколько стоит эта рабочая одежда?
        B_AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");    //Так. Посморим...
        if(LOBART_AGAINSTKING == TRUE)
        {
                WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
        };
        if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");    //Ты работал для меня на поле.
                WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
        };
        if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");    //Ты помог моей жене.
                WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
        };
        if(MIS_VINO_WEIN == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");    //Вино говорит, что ты очень помог ему. А это кое-что да значит - обычно он не очень-то ладит с поденными работниками.
                WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
        };
        if(MIS_MALETH_BANDITS == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");    //Малет говорит, что ты прогнал бандитов. Эти ублюдки доставляли нам много проблем. Спасибо, что избавил нас от них!
                WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
        };
        b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
        if(WERT_LOBARTSRUESTUNG == 30)
        {
                B_AI_Output(self,other,"DIA_Lobart_GOLD_05_06");  //И дешевле я ее не отдам.
                b_logentry(TOPIC_KLEIDUNG,TOPIC_KLEIDUNG_description_53); // "Но он не продаст ее мне меньше чем за 30 золотых монет."
        };
        Info_ClearChoices(dia_lobart_buyclothes);
        Info_AddChoice(dia_lobart_buyclothes,dia_lobart_buyclothes_notyet_description,dia_lobart_buyclothes_notyet); // "Это все еще слишком дорого для меня."
        Info_AddChoice(dia_lobart_buyclothes,dia_lobart_buyclothes_buy_description,dia_lobart_buyclothes_buy); // "Давай тогда сюда эту рабочую одежду Защита: оружие - 15 стрелы - 15"
};
func void dia_lobart_buyclothes_buy()
{
        B_AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");        //Давай тогда сюда эту рабочую одежду.
        if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
        {
                if(Npc_HasItems(self,itar_bau_l) > 0)
                {
                        B_AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");        //Хорошо, мой мальчик. Превыше всего я ценю честность. Вот, держи!
                        b_giveinvitems(self,other,itar_bau_l,1);
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");        //В моем доме есть сундук, где ты найдешь постиранные вещи.
                        B_AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");        //Но даже не думай взять что-нибудь там без разрешения!
                };
                LOBART_KLEIDUNG_VERKAUFT = TRUE;
                Wld_AssignRoomToGuild("farm03",GIL_NONE);
                b_checklog();
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");        //У тебя недостаточно золота!
        };
        Info_ClearChoices(dia_lobart_buyclothes);
};
func void dia_lobart_buyclothes_notyet()
{
        B_AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");     //Это все еще слишком дорого для меня.
        B_AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");     //Как знаешь...
        Info_ClearChoices(dia_lobart_buyclothes);
};
instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_aufstandinfo_condition;
        information = dia_lobart_aufstandinfo_info;
        permanent = FALSE;
        description = "Как идут здесь дела?";
};
func int dia_lobart_aufstandinfo_condition()
{
        if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_aufstandinfo_info()
{
        B_AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");  //Как идут здесь дела?
        B_AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");  //Ты не знаешь как здесь дела? Мальчик, ты вообще откуда свалился? Мы на пороге гражданской войны!
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");  //До последнего времени фермеры считали долю, отдаваемую городу, вполне справедливой.
                B_AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");  //Но с тех пор, как в Хоринис пришли паладины, городская стража наведывается к нам все чаще и чаще - они так скоро заберут все, что у нас есть.
                B_AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");  //Если так будет продолжаться и дальше, у нас ничего не останется для самих себя.
        };
        B_AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");  //Некоторые фермеры стали бунтовать! Онар был первым из них!
};
instance DIA_LOBART_ONARSTORY(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_onarstory_condition;
        information = dia_lobart_onarstory_info;
        permanent = FALSE;
        description = "Расскажи мне подробнее об этом Онаре...";
};
func int dia_lobart_onarstory_condition()
{
        if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_onarstory_info()
{
        B_AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");     //Расскажи мне подробнее об этом Онаре...
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");     //Ты ведь наемник, разве нет? Что такого я могу рассказать тебе о твоем боссе, что ты не знаешь?
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");     //Онар - самый крупный фермер в этой местности. Он порвал отношения с городом.
                B_AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");     //Говорят, он нанял наемников, чтобы те не пускали на его земли городскую стражу!
                B_AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");     //Не могу винить его за это.
                B_AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");     //Как бы то ни было, больше ни один королевский солдат не осмеливается ступить на его землю.
        };
};
instance DIA_LOBART_SLDINFO(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_sldinfo_condition;
        information = dia_lobart_sldinfo_info;
        permanent = FALSE;
        description = "А кто эти наемники, которых нанял Онар?";
};
func int dia_lobart_sldinfo_condition()
{
        if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_sldinfo_info()
{
        B_AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");       //А кто эти наемники, которых нанял Онар?
        B_AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");       //Я мало что знаю об этих парнях. Предположительно, большинство из них - бывшие каторжники из колонии.
        B_AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");       //(презрительно) И чего, спрашивается, от них можно ожидать...
};
instance DIA_LOBART_WHICHSIDE(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_whichside_condition;
        information = dia_lobart_whichside_info;
        permanent = FALSE;
        description = "А что насчет тебя? Ты-то на чьей стороне? Крестьян или короля?";
};
func int dia_lobart_whichside_condition()
{
        if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_whichside_info()
{
        B_AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");     //А что насчет тебя? Ты-то на чьей стороне? Крестьян или короля?
        B_AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");     //Я слишком близок к городу, чтобы у меня была возможность выбирать.
        B_AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");     //Но я даже рад этому. Я бы все равно не знал, что решить.
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");     //Король пьет нашу кровь, а Онар направляет своих наемников против всех, кто не хочет присоединиться к нему.
                B_AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");     //Вот почему большинство фермеров все еще не определились, но рано или поздно им ПРИДЕТСЯ выбрать одну сторону или другую.
        };
};
instance DIA_LOBART_WORKNOW(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_worknow_condition;
        information = dia_lobart_worknow_info;
        permanent = FALSE;
        description = "Я ищу работу.";
};
func int dia_lobart_worknow_condition()
{
        if((Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths)) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_worknow_info()
{
        B_AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");       //Я ищу работу.
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");       //Мне не нужен еще один постоянный работник. Но я могу предложить тебе поденную работу.
        };
        B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");       //Я хочу сказать, ты можешь помочь на поле. Также здесь еще наверняка найдется кое-какая работенка для тебя.
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");       //Я могу заплатить тебе золотом. Или дать тебе приличную одежду.
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");       //Эта одежда стоит довольно дорого. Я не могу отдать тебе ее просто так, но я могу продать тебе ее дешевле, если ты поработаешь на меня.
                Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
                Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
                b_logentry(TOPIC_KLEIDUNG,TOPIC_KLEIDUNG_description_54); // "Фермер Лобарт готов продать мне рабочую одежду. Он может снизить цену за одежду если я поработаю на его ферме. Чем больше я сделаю тем дешевле обойдется мне одежда."
                if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
                {
                        B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");       //Судя по тому, как ты выглядишь, я бы сказал: бери одежду.
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");       //Но у тебя уже есть одежда, так что ты, вероятно, захочешь золото.
                };
        };
        B_AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");       //Работа следующая - небольшое поле репы за амбаром нужно собрать.
        Info_ClearChoices(dia_lobart_worknow);
        Info_AddChoice(dia_lobart_worknow,dia_lobart_worknow_wannafoolme_description,dia_lobart_worknow_wannafoolme); // "Я должен дергать репу? Ты должно быть шутишь!"
        Info_AddChoice(dia_lobart_worknow,dia_lobart_worknow_ok_description,dia_lobart_worknow_ok); // "Хорошо..."
};
func void dia_lobart_worknow_ok()
{
        B_AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");    //Хорошо...
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");    //Тогда поторопись, пока я не передумал.
        };
        Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
        b_logentry(TOPIC_RUEBEN,TOPIC_RUEBEN_description_55); // "Фермер Лобарт хочет чтобы я собрал репу на поле. За это он продаст мне одежду по значительно сниженной цене."
        MIS_LOBART_RUEBEN = LOG_RUNNING;
        Info_ClearChoices(dia_lobart_worknow);
};
func void dia_lobart_worknow_wannafoolme()
{
        B_AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");   //Я должен дергать репу? Ты, должно быть, шутишь!
        B_AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");   //Настоящая мужская работа не для 'утонченного джентльмена', да?
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");   //Топай на поле или убирайся с моей фермы!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");   //Сейчас у меня нет другой работы для тебя.
        };
        Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
        b_logentry(TOPIC_RUEBEN,TOPIC_RUEBEN_description_56); // "Фермер Лобарт хочет чтобы я собрал репу на поле. За это он заплатит мне золотом или продаст мне одежду по значительно сниженной цене."
        MIS_LOBART_RUEBEN = LOG_RUNNING;
        Info_ClearChoices(dia_lobart_worknow);
};
instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_ruebenrunning_condition;
        information = dia_lobart_ruebenrunning_info;
        permanent = TRUE;
        description = "Вот твоя репа!";
};
func int dia_lobart_ruebenrunning_condition()
{
        if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_ruebenrunning_info()
{
        B_AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00"); //Вот твоя репа!
        if(Npc_HasItems(other,itpl_beet) >= 20)
        {
                if(hero.guild == GIL_NONE)
                {
                        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01"); //Да, похоже, ты не такой уж бездельник, как кажешься.
                };
                if(Npc_IsDead(hilda) == FALSE)
                {
                        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02"); //Отнеси ее моей жене в дом и скажи ей, чтобы она приготовила ее.
                        MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
                        Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
                        Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
                        b_logentry(TOPIC_RUEBENBRINGEN,TOPIC_RUEBENBRINGEN_description_57); // "Я должен отнести собранную репу жене Лобарта находящейся в доме."
                };
                MIS_LOBART_RUEBEN = LOG_SUCCESS;
                b_giveplayerxp(XP_LOBARTHOLRUEBEN);
                B_AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03"); //Что насчет моей платы?
                B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04"); //Я могу дать тебе 5 золотых монет.
                if(hero.guild == GIL_NONE)
                {
                        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05"); //...или продать тебе одежду дешевле. Что ты выбираешь?
                };
                Info_ClearChoices(dia_lobart_ruebenrunning);
                if(hero.guild == GIL_NONE)
                {
                        Info_AddChoice(dia_lobart_ruebenrunning,dia_lobart_ruebenrunning_billiger_description,dia_lobart_ruebenrunning_billiger); // "Лучше продай одежду дешевле!"
                };
                Info_AddChoice(dia_lobart_ruebenrunning,dia_lobart_ruebenrunning_gold_description,dia_lobart_ruebenrunning_gold); // "Дай мне 5 золотых монет!"
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06"); //Но ты не собрал и двадцати!
                if(hero.guild == GIL_NONE)
                {
                        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07"); //Ты что, съел остальное?! Надеюсь, мой мальчик, что все же нет, иначе тебе придется забыть о своем жаловании!
                        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08"); //Возвращайся на поле и принеси больше! Работай или я покажу тебе, где раки зимуют!
                };
                AI_StopProcessInfos(self);
        };
};
func void dia_lobart_ruebenrunning_gold()
{
        B_AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");    //Дай мне 5 золотых монет!
        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");    //Держи.
        b_giveinvitems(self,other,itmi_gold,5);
        if(hero.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");    //Только не пропей их все разом.
        };
        Info_ClearChoices(dia_lobart_ruebenrunning);
};
func void dia_lobart_ruebenrunning_billiger()
{
        B_AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");        //Лучше продай одежду дешевле!
        B_AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");        //Хорошо! Я отдам тебе ее на 10 золотых дешевле.
        Info_ClearChoices(dia_lobart_ruebenrunning);
};
instance DIA_LOBART_MOREWORK(C_INFO)
{
        npc = bau_950_lobart;
        nr = 1;
        condition = dia_lobart_morework_condition;
        information = dia_lobart_morework_info;
        permanent = TRUE;
        description = "У тебя есть еще какая-нибудь работа для меня?";
};
func int dia_lobart_morework_condition()
{
        if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_lobart_morework_info()
{
        B_AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");      //У тебя есть еще какая-нибудь работа для меня?
        if(MIS_LOBART_RUEBEN == LOG_RUNNING)
        {
                B_AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");      //Сначала собери репу с поля. А там,посмотрим.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");      //Нет, но ты можешь спросить у моей жены или парней на поле. Возможно, им нужна помощь.
        };
};
instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
        npc = bau_950_lobart;
        condition = dia_lobart_andrehelplobart_condition;
        information = dia_lobart_andrehelplobart_info;
        description = "Меня направил к тебе Андрэ.";
};
func int dia_lobart_andrehelplobart_condition()
{
        if(MIS_ANDREHELPLOBART == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_lobart_andrehelplobart_info()
{
        B_AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");       //Меня направил к тебе Андрэ. Я могу чем-нибудь помочь тебе?
        B_AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");       //Да, конечно. Меня уже тошнит от этих проклятых полевых хищников.
        B_AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");       //Прикончи их всех. Меня не волнует, как!
        b_logentry(TOPIC_FELDRAEUBER,TOPIC_FELDRAEUBER_description_58); // "Поля Лобарта наводнены полевыми хищниками. Он хочет чтобы я прогнал их."
        MIS_LOBARTKILLBUGS = LOG_RUNNING;
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_BUGDEAD(C_INFO)
{
        npc = bau_950_lobart;
        condition = dia_lobart_bugdead_condition;
        information = dia_lobart_bugdead_info;
        permanent = TRUE;
        description = "Я разделался с этими тварями!";
};
var int dia_lobart_bugdead_noperm;
func int dia_lobart_bugdead_condition()
{
        if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
        {
                return TRUE;
        };
};
func void dia_lobart_bugdead_info()
{
        if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
        {
                B_AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");       //Я разделался с этими тварями!
                B_AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");       //Отлично. Ты не такой уж плохой ликвидатор. Я порекомендую тебя соседям. Вот, держи заработанное.
                b_startotherroutine(vino,"Start");
                b_startotherroutine(lobartsbauer1,"Start");
                b_startotherroutine(lobartsbauer2,"Start");
                CreateInvItems(self,itmi_gold,20);
                b_giveinvitems(self,other,itmi_gold,20);
                MIS_LOBARTKILLBUGS = LOG_SUCCESS;
                MIS_ANDREHELPLOBART = LOG_SUCCESS;
                Log_AddEntry(TOPIC_FELDRAEUBER,"Поля Лобарта очищены от полевых хищников. Я уничтожил их всех.");
                DIA_LOBART_BUGDEAD_NOPERM = TRUE;
        }
        else
        {
                B_AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");       //Я думаю, я разделался со всеми тварями!
                B_AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");       //Не пытайся надуть меня. Я все еще вижу их. Либо ты убьешь этих тварей, либо можешь забыть о деньгах.
                AI_StopProcessInfos(self);
        };
};
instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 999;
        condition = dia_lobart_kap3_exit_condition;
        information = dia_lobart_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lobart_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_lobart_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_DMT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 30;
        condition = dia_lobart_dmt_condition;
        information = dia_lobart_dmt_info;
        description = "Как твоя ферма?";
};
func int dia_lobart_dmt_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_lobart_dmt_info()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_15_00");   //Как твоя ферма?
        B_AI_Output(self,other,"DIA_Lobart_DMT_05_01");   //Это все невыносимо.
        B_AI_Output(self,other,"DIA_Lobart_DMT_05_02");   //Неожиданно появились эти парни в черных рясах и расположились на дороге и на моей ферме.
        Info_ClearChoices(dia_lobart_dmt);
        Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
        if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
        {
                B_AI_Output(self,other,"DIA_Lobart_DMT_05_03");   //Они долго беседовали о чем-то с Вино, а затем скрылись вместе с ним.
                if(NPCOBSESSEDBYDMT_VINO == FALSE)
                {
                        Info_AddChoice(dia_lobart_dmt,dia_lobart_dmt_vinowohin_description,dia_lobart_dmt_vinowohin); // "Куда они потащили Вино?"
                };
                Info_AddChoice(dia_lobart_dmt,dia_lobart_dmt_vinowas_description,dia_lobart_dmt_vinowas); // "Какие у них дела с Вино?"
        };
        if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
        {
                B_AI_Output(self,other,"DIA_Lobart_DMT_05_04");   //Вскоре после этого моя жена опять тяжело заболела. Она почти не встает с постели. С ней часто бывает такое.
        };
        B_AI_Output(self,other,"DIA_Lobart_DMT_05_05");   //Все пошло наперекосяк!
        if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE))
        {
                Info_AddChoice(dia_lobart_dmt,dia_lobart_dmt_frauheilen_description,dia_lobart_dmt_frauheilen); // "Почему ты не отведешь жену к лекарю?"
        };
        Info_AddChoice(dia_lobart_dmt,dia_lobart_dmt_hof_description,dia_lobart_dmt_hof); // "Почему ты ничего не сделаешь с этими людьми в черном?"
        Info_AddChoice(dia_lobart_dmt,dia_lobart_dmt_spoketothem_description,dia_lobart_dmt_spoketothem); // "Ты говорил с людьми в черном?"
};
func void dia_lobart_dmt_frauheilen()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");        //Почему ты не отведешь жену к лекарю?
        B_AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");        //Мы должны бы сходить в город к Ватрасу, но я с места не сойду, пока на моей ферме царит такой хаос.
        Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
        b_logentry(TOPIC_HEALHILDA,TOPIC_HEALHILDA_description_59); // "Жена Лобарта Хильда больна но у Ватраса есть лекарство которое может вылечить ее."
        MIS_HEALHILDA = LOG_RUNNING;
};
func void dia_lobart_dmt_back()
{
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Start");
};
func void dia_lobart_dmt_spoketothem()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");       //Ты говорил с людьми в черном?
        B_AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");       //Конечно. Но они не хотят ничего слушать.
        B_AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");       //Я думаю, они кого-то ищут.
};
func void dia_lobart_dmt_hof()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");       //Почему ты ничего не сделаешь с этими людьми в черном?
        B_AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");       //Я бы очень хотел. Но я видел, как они заживо сожгли одного горожанина. Нет уж, спасибо.
        B_AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");       //Не хочется что-то рисковать жизнью!
};
func void dia_lobart_dmt_vinowas()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");   //Какие у них дела с Вино?
        B_AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");   //Они не сказали. Они просто увели его с собой.
};
func void dia_lobart_dmt_vinowohin()
{
        B_AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00"); //Куда они потащили Вино?
        B_AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01"); //Они пошли вверх, на этот холм.
};
instance DIA_LOBART_VINOTOT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 32;
        condition = dia_lobart_vinotot_condition;
        information = dia_lobart_vinotot_info;
        description = "Вино не вернется.";
};
func int dia_lobart_vinotot_condition()
{
        if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
        {
                return TRUE;
        };
};
func void dia_lobart_vinotot_info()
{
        B_AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");       //Вино не вернется.
        if(Npc_IsDead(vino))
        {
                B_AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");       //Он мертв.
        }
        else
        {
                B_AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");       //Они свели его с ума.
        };
        B_AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");       //О, Иннос. Надеюсь, весь этот кошмар скоро закончится.
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_LOBART_PERM(C_INFO)
{
        npc = bau_950_lobart;
        nr = 80;
        condition = dia_lobart_perm_condition;
        information = dia_lobart_perm_info;
        permanent = TRUE;
        description = "Береги свою ферму!";
};
func int dia_lobart_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
        {
                return TRUE;
        };
};
func void dia_lobart_perm_info()
{
        B_AI_Output(other,self,"DIA_Lobart_PERM_15_00");  //Береги свою ферму!
        B_AI_Output(self,other,"DIA_Lobart_PERM_05_01");  //Я попытаюсь.
};
instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 999;
        condition = dia_lobart_kap4_exit_condition;
        information = dia_lobart_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lobart_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_lobart_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
        npc = bau_950_lobart;
        nr = 41;
        condition = dia_lobart_orkproblem_condition;
        information = dia_lobart_orkproblem_info;
        description = "У тебя проблемы с орками.";
};
func int dia_lobart_orkproblem_condition()
{
        if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
        {
                return TRUE;
        };
};
func void dia_lobart_orkproblem_info()
{
        B_AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");    //У тебя проблемы с орками.
        B_AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");    //(зло) Черт. Ну когда-нибудь все это кончится?!
        B_AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");    //Если так будет продолжаться, моя ферма не будет стоить и 3-х золотых монет.
        Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
        b_logentry(TOPIC_LOBARTSORKPROBLEM,TOPIC_LOBARTSORKPROBLEM_description_60); // "На ферме Лобарта поселились орки. Он хочет чтобы я избавил его от них."
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_ORKSWEG(C_INFO)
{
        npc = bau_950_lobart;
        nr = 42;
        condition = dia_lobart_orksweg_condition;
        information = dia_lobart_orksweg_info;
        description = "Я избавил твои земли от орков.";
};
func int dia_lobart_orksweg_condition()
{
        if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
        {
                return TRUE;
        };
};
func void dia_lobart_orksweg_info()
{
        B_AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");       //Я избавил твои земли от орков.
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");       //Никому не позволю говорить, что паладины ничего не делают для нас, простых фермеров.
        };
        B_AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");       //Слава Инносу. Я не могу дать тебе за это много, но я надеюсь, ты оценишь мой жест благодарности.
        b_startotherroutine(vino,"Start");
        b_startotherroutine(lobartsbauer1,"Start");
        b_startotherroutine(lobartsbauer2,"Start");
        TOPIC_END_LOBARTSORKPROBLEM = TRUE;
        b_giveplayerxp(XP_KILLEDLOBARTORKS);
        CreateInvItems(self,itmi_gold,150);
        b_giveinvitems(self,other,itmi_gold,150);
};
instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 999;
        condition = dia_lobart_kap5_exit_condition;
        information = dia_lobart_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lobart_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_lobart_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
        npc = bau_950_lobart;
        nr = 999;
        condition = dia_lobart_kap6_exit_condition;
        information = dia_lobart_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_lobart_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_lobart_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LOBART_PICKPOCKET(C_INFO)
{
        npc = bau_950_lobart;
        nr = 900;
        condition = dia_lobart_pickpocket_condition;
        information = dia_lobart_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_lobart_pickpocket_condition()
{
        return c_beklauen(65,80);
};
func void dia_lobart_pickpocket_info()
{
        Info_ClearChoices(dia_lobart_pickpocket);
        Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
        Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};
func void dia_lobart_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_lobart_pickpocket);
};
func void dia_lobart_pickpocket_back()
{
        Info_ClearChoices(dia_lobart_pickpocket);
};
