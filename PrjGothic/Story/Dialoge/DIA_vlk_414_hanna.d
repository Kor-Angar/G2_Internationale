instance DIA_HANNA_EXIT(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 999;
        condition = dia_hanna_exit_condition;
        information = dia_hanna_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_hanna_exit_condition()
{
        if(KAPITEL <= 2)
        {
                return TRUE;
        };
};
func void dia_hanna_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_HANNA_HELLO(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 1;
        condition = dia_hanna_hello_condition;
        information = dia_hanna_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_hanna_hello_condition()
{
        return TRUE;
};
func void dia_hanna_hello_info()
{
        B_AI_Output(self,other,"DIA_Hanna_Hello_17_00");  //Ага, клиент - что я могу сделать для тебя?
};
instance DIA_HANNA_ROOM(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 2;
        condition = dia_hanna_room_condition;
        information = dia_hanna_room_info;
        permanent = FALSE;
        description = "Я хочу снять комнату.";
};
func int dia_hanna_room_condition()
{
        return TRUE;
};
func void dia_hanna_room_info()
{
        B_AI_Output(other,self,"DIA_Hanna_Room_15_00");   //Я хочу снять комнату.
        B_AI_Output(self,other,"DIA_Hanna_Room_17_01");   //Ты обратился как раз по адресу.
        if(Npc_KnowsInfo(other,dia_lothar_schlafen))
        {
                B_AI_Output(other,self,"DIA_Hanna_Add_15_03");    //Один из паладинов сказал мне, что я могу провести ночь здесь бесплатно...
        }
        else
        {
                B_AI_Output(other,self,"DIA_Hanna_Add_15_00");    //Сколько стоит комната на ночь?
                B_AI_Output(self,other,"DIA_Hanna_Add_17_01");    //Эта услуга абсолютно бесплатна.
                B_AI_Output(self,other,"DIA_Hanna_Add_17_02");    //Паладины оплачивают ночлег всех путешественников.
                B_AI_Output(other,self,"DIA_Hanna_Add_15_04");    //То есть, я могу остановиться здесь на ночь бесплатно?!
        };
        B_AI_Output(self,other,"DIA_Hanna_Add_17_05");    //Да, да.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_06");    //Просто поднимись вверх по лестнице.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_07");    //Пара коек там еще свободна.
};
instance DIA_HANNA_WHYPAY(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 3;
        condition = dia_hanna_whypay_condition;
        information = dia_hanna_whypay_info;
        permanent = FALSE;
        description = "А почему паладины платят за все?";
};
func int dia_hanna_whypay_condition()
{
        if(Npc_KnowsInfo(other,dia_hanna_room))
        {
                return TRUE;
        };
};
func void dia_hanna_whypay_info()
{
        B_AI_Output(other,self,"DIA_Hanna_Add_15_12");    //А почему паладины платят за все?
        B_AI_Output(self,other,"DIA_Hanna_Add_17_13");    //Я не знаю точно, с чем это связано.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_14");    //С одной стороны, я думаю, они хотят, чтобы нищие не ошивались ночью на улицах. Так безопаснее для всех.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_15");    //Ну, а с другой стороны, они хотят завоевать расположение странствующих торговцев.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_16");    //Сейчас, когда фермеры подняли восстание, нам остается полагаться только на торговцев в вопросах обеспечения города продовольствием.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_17");    //Кроме того, я думаю, они хотят поднять немного моральный дух в городе.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_18");    //Лорд Андрэ даже приказал раздавать бесплатное пиво на площади Правосудия.
};
instance DIA_HANNA_WERHIER(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 4;
        condition = dia_hanna_werhier_condition;
        information = dia_hanna_werhier_info;
        permanent = TRUE;
        description = "Кто здесь живет сейчас?";
};
func int dia_hanna_werhier_condition()
{
        if(Npc_KnowsInfo(other,dia_hanna_room))
        {
                return TRUE;
        };
};
func void dia_hanna_werhier_info()
{
        B_AI_Output(other,self,"DIA_Hanna_Add_15_08");    //Кто здесь живет сейчас?
        B_AI_Output(self,other,"DIA_Hanna_Add_17_09");    //В основном странствующие торговцы с рынка.
        B_AI_Output(other,self,"DIA_Hanna_Add_15_10");    //Ага.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_11");    //Даже не думай, чтобы пошарить в их пожитках! Мне не нужны здесь проблемы!
};
instance DIA_HANNA_CITY(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 5;
        condition = dia_hanna_city_condition;
        information = dia_hanna_city_info;
        permanent = TRUE;
        description = "Несколько вопросов о городе...";
};
func int dia_hanna_city_condition()
{
        return TRUE;
};
func void dia_hanna_city_info()
{
        B_AI_Output(other,self,"DIA_Hanna_City_15_00");   //Несколько вопросов о городе...
        Info_ClearChoices(dia_hanna_city);
        Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
        Info_AddChoice(dia_hanna_city,dia_hanna_city_buy_description,dia_hanna_city_buy); // "Где я могу купить что-нибудь здесь?"
        Info_AddChoice(dia_hanna_city,dia_hanna_city_city_description,dia_hanna_city_city); // "Расскажи мне о городе."
};
func void dia_hanna_city_back()
{
        Info_ClearChoices(dia_hanna_city);
};
func void dia_hanna_city_buy()
{
        B_AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");       //Где я могу купить что-нибудь здесь?
        B_AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");       //Рынок находится прямо перед парадным входом в отель. Я думаю, ты найдешь там все, что тебе нужно.
        B_AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");       //Также есть несколько лавок ремесленников в другой части города. Большинство из них находятся неподалеку от городских ворот.
        B_AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");       //Также в порту ты найдешь торговца рыбой. Его лавка смотрит прямо на гавань.
};
func void dia_hanna_city_city()
{
        B_AI_Output(other,self,"DIA_Hanna_City_City_15_00");      //Расскажи мне о городе.
        B_AI_Output(self,other,"DIA_Hanna_City_City_17_01");      //Хоринис - один из самых богатых городов королевства, даже несмотря на то, что сейчас он совсем не кажется таким.
        B_AI_Output(self,other,"DIA_Hanna_City_City_17_02");      //Но с тех пор, как началась война с орками, всяческая торговля практически умерла. Король реквизировал весь торговый флот для нужд армии.
        B_AI_Output(self,other,"DIA_Hanna_City_City_17_03");      //И теперь в наш порт корабли практически не заходят. Поэтому поставки товаров очень ограничены, и многие горожане очень обеспокоены этим.
        B_AI_Output(self,other,"DIA_Hanna_City_City_17_04");      //Никто не знает, что принесет нам будущее. Нам ничего не остается, кроме как ждать и надеяться на лучшее. Вряд ли в наших силах хоть что-то изменить.
};
instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 999;
        condition = dia_hanna_kap3_exit_condition;
        information = dia_hanna_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_hanna_kap3_exit_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_hanna_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
var int hanna_priceforletter;
instance DIA_HANNA_ANYNEWS(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 31;
        condition = dia_hanna_anynews_condition;
        information = dia_hanna_anynews_info;
        permanent = FALSE;
        description = "Как дела?";
};
func int dia_hanna_anynews_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_hanna_anynews_info()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");        //Как дела?
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");        //Мне почему-то кажется, что тебя не особо-то волнуют проблемы других людей.
        Info_ClearChoices(dia_hanna_anynews);
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_description,dia_hanna_anynews_yes); // "Ты ошибаешься."
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_depends_description,dia_hanna_anynews_depends); // "Ну как сказать..."
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_no_description,dia_hanna_anynews_no); // "Ну в общем да."
};
func void dia_hanna_anynews_no()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");     //Ну, в общем, да.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");     //Ну, значит я права. Сейчас все думают только о себе. Так что тебе нужно?
        MIS_HANNARETRIEVELETTER = LOG_FAILED;
        Info_ClearChoices(dia_hanna_anynews);
};
func void dia_hanna_anynews_depends()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");        //Ну, как сказать, э...
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");        //Это зависит от того, сколько на этом можно заработать, ты хочешь сказать?
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");        //Я не люблю таких, как ты.
        MIS_HANNARETRIEVELETTER = LOG_FAILED;
        Info_ClearChoices(dia_hanna_anynews);
};
func void dia_hanna_anynews_yes()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");    //Ты ошибаешься.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");    //Ох, понимаешь какое дело... Я разбирала недавно у себя всякий хлам и продала пачку старых карт Ибрагиму, картографу в гавани.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");    //Но потом я заметила, что у меня не хватает одного документа.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");    //Я думаю, он мог случайно оказаться в стопке этих карт.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");    //Ты не мог бы вернуть его мне?
        MIS_HANNARETRIEVELETTER = LOG_RUNNING;
        Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
        b_logentry(TOPIC_HANNARETRIEVELETTER,TOPIC_HANNARETRIEVELETTER_description_613); // "У Ханны пропал документ. Похоже он пропал в гавани там где живет картограф Ибрагим."
        Info_ClearChoices(dia_hanna_anynews);
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_footboy_description,dia_hanna_anynews_yes_footboy); // "Я тебе не мальчик на побегушках."
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_reward_description,dia_hanna_anynews_yes_reward); // "А что мне с этого будет?"
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_willsee_description,dia_hanna_anynews_yes_willsee); // "Я попробую."
};
func void dia_hanna_anynews_yes_footboy()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");    //Я тебе не мальчик на побегушках.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");    //Понимаю - проблемы простой женщины слишком ничтожны для тебя. Значит, мне придется заняться этим самой.
        Info_ClearChoices(dia_hanna_anynews);
};
func void dia_hanna_anynews_yes_reward()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");     //Что я за это получу?
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");     //Ага, я знала - ты не лучше, чем весь этот остальной портовый сброд.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");     //Так что ты хочешь получить от бедной женщины?
        Info_ClearChoices(dia_hanna_anynews);
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_reward_ok_description,dia_hanna_anynews_yes_reward_ok); // "Ладно забудь."
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_reward_benice_description,dia_hanna_anynews_yes_reward_benice); // "Ну ты могла бы быть немного поласковее со мной... Как женщина..."
        Info_AddChoice(dia_hanna_anynews,dia_hanna_anynews_yes_reward_gold_description,dia_hanna_anynews_yes_reward_gold); // "Золото."
};
func void dia_hanna_anynews_yes_reward_ok()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");  //Ладно, забудь.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");  //Ну, хоть остатки совести у тебя еще есть. Если ты принесешь мне этот документ, я дам тебе 75 золотых.
        HANNA_PRICEFORLETTER = 75;
        Info_ClearChoices(dia_hanna_anynews);
};
func void dia_hanna_anynews_yes_reward_benice()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");      //Ну, ты могла бы быть немного поласковее со мной... Как женщина...
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");      //Ну, ты хам! Я... убирайся отсюда! Неотесанный мужлан!
        MIS_HANNARETRIEVELETTER = LOG_FAILED;
        AI_StopProcessInfos(self);
};
func void dia_hanna_anynews_yes_reward_gold()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");        //Золото.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");        //Тебе нужен этот презренный металл? Ладно - я оцениваю этот документ в 50 золотых.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");        //Если ты сможешь вернуть мне этот документ, я дам тебе 50 золотых монет.
        HANNA_PRICEFORLETTER = 50;
        Info_ClearChoices(dia_hanna_anynews);
};
func void dia_hanna_anynews_yes_willsee()
{
        B_AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");    //Я попробую.
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");    //Ты такой любезный. Я желаю тебе удачи!
        B_AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");    //Если ты принесешь мне эту бумагу, тебя ждет награда.
        HANNA_PRICEFORLETTER = 200;
        Info_ClearChoices(dia_hanna_anynews);
};
instance DIA_HANNA_THISLETTER(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 31;
        condition = dia_hanna_thisletter_condition;
        information = dia_hanna_thisletter_info;
        permanent = FALSE;
        description = "Ты этот документ имела в виду?";
};
func int dia_hanna_thisletter_condition()
{
        if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
        {
                return TRUE;
        };
};
func void dia_hanna_thisletter_info()
{
        B_AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");     //Ты этот документ имела в виду?
        B_AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");     //Да, именно его. Спасибо.
        b_giveinvitems(other,self,itwr_shatteredgolem_mis,1);
        B_AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");     //Как насчет моей награды?
        B_AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");     //Не так быстро. Вот твои деньги.
        CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
        b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
        MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
        b_giveplayerxp(XP_HANNARETRIEVELETTER);
};
instance DIA_HANNA_PICKPOCKET(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 900;
        condition = dia_hanna_pickpocket_condition;
        information = dia_hanna_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60_FEMALE;
};
func int dia_hanna_pickpocket_condition()
{
        return c_beklauen(45,25);
};
func void dia_hanna_pickpocket_info()
{
        Info_ClearChoices(dia_hanna_pickpocket);
        Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
        Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};
func void dia_hanna_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_hanna_pickpocket);
};
func void dia_hanna_pickpocket_back()
{
        Info_ClearChoices(dia_hanna_pickpocket);
};
instance DIA_HANNA_AUSKELLER(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 11;
        condition = dia_hanna_auskeller_condition;
        information = dia_hanna_auskeller_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_hanna_auskeller_condition()
{
        if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
        {
                return TRUE;
        };
};
func void dia_hanna_auskeller_info()
{
        if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
        {
                B_AI_Output(self,other,"DIA_Hanna_Add_17_27");    //Откуда... ты пришел?
                B_AI_Output(other,self,"DIA_Hanna_Add_15_28");    //Я нашел кое-что интересное в твоем подвале...
                B_AI_Output(self,other,"DIA_Hanna_Add_17_29");    //Что ты делал в моем подвале?!
                B_AI_Output(other,self,"DIA_Hanna_Add_15_30");    //Ты прекрасно знаешь это!
                B_AI_Output(self,other,"DIA_Hanna_Add_17_31");    //(холодно) Я не знаю, чем ты говоришь...
        }
        else
        {
                B_AI_Output(self,other,"DIA_Hanna_Add_17_19");    //(недоверчиво) Посмотри на себя! Ты откуда такой взялся? А?
                B_AI_Output(other,self,"DIA_Hanna_Add_15_20");    //(смущенно) Я...
                B_AI_Output(self,other,"DIA_Hanna_Add_17_21");    //(смеется) Я знаю!
                B_AI_Output(self,other,"DIA_Hanna_Add_17_22");    //(заговорщицки) Не говори мне. Я все знаю.
                B_AI_Output(self,other,"DIA_Hanna_Add_17_23");    //Даже и не думай украсть что-нибудь здесь, понял?
                B_AI_Output(self,other,"DIA_Hanna_Add_17_24");    //Мы не можем себе позволить привлекать внимание к отелю.
        };
        AI_StopProcessInfos(self);
};
instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 1;
        condition = dia_hanna_schuldenbuch_condition;
        information = dia_hanna_schuldenbuch_info;
        permanent = FALSE;
        description = "Посмотри, какая у меня есть книга!";
};
func int dia_hanna_schuldenbuch_condition()
{
        if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
        {
                return TRUE;
        };
};
func void dia_hanna_schuldenbuch_info()
{
        B_AI_Output(other,self,"DIA_Hanna_Add_15_41");    //Посмотри, какая у меня есть книга!
        B_AI_Output(self,other,"DIA_Hanna_Add_17_42");    //Гроссбух Лемара. Как тебе это удалось?
        B_AI_Output(other,self,"DIA_Hanna_Add_15_43");    //Ну...
        B_AI_Output(self,other,"DIA_Hanna_Add_17_44");    //То, что Лемар лишился своего гроссбуха - это хорошо. Но лучше, если он будет у меня...
};
instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
        npc = vlk_414_hanna;
        nr = 1;
        condition = dia_hanna_giveschuldenbuch_condition;
        information = dia_hanna_giveschuldenbuch_info;
        permanent = FALSE;
        description = "Вот - возьми эту книгу.";
};
func int dia_hanna_giveschuldenbuch_condition()
{
        if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
        {
                return TRUE;
        };
};
func void dia_hanna_giveschuldenbuch_info()
{
        B_AI_Output(other,self,"DIA_Hanna_Add_15_45");    //Вот - возьми эту книгу.
        b_giveinvitems(other,self,itwr_schuldenbuch,1);
        B_AI_Output(self,other,"DIA_Hanna_Add_17_46");    //Спасибо.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_47");    //Возьми это в качестве награды.
        b_giveinvitems(self,other,itse_hannasbeutel,1);
        b_giveplayerxp(XP_SCHULDENBUCH);
        B_AI_Output(other,self,"DIA_Hanna_Add_15_49");    //Что это такое ты дала мне?
        B_AI_Output(self,other,"DIA_Hanna_Add_17_48");    //Это ключ от врат, ведущих к богатству.
};
func void hanna_blubb()
{
        B_AI_Output(other,self,"DIA_Hanna_Add_15_37");    //В логове все в порядке?
        B_AI_Output(self,other,"DIA_Hanna_Add_17_39");    //Я давно уже не видела их.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_40");    //Я, пожалуй, схожу туда, когда у меня будет время и проверю, как у них дела.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_38");    //Да. Но тебе лучше не говорить об этом...
        B_AI_Output(other,self,"DIA_Hanna_Add_15_25");    //Ты знала о логове воров?
        B_AI_Output(self,other,"DIA_Hanna_Add_17_26");    //(глупо улыбается) Я не понимаю, о чем ты говоришь...
        B_AI_Output(self,other,"DIA_Hanna_Add_17_32");    //Здесь было ополчение... Кто-то предал наше убежище!
        B_AI_Output(self,other,"DIA_Hanna_Add_17_33");    //Мне они ничего не смогли предъявить, но Кассия и ее люди мертвы!
        B_AI_Output(self,other,"DIA_Hanna_Add_17_34");    //Я уверена, что это ТЫ...
        B_AI_Output(self,other,"DIA_Hanna_Add_17_35");    //Я купила это специально для тебя.
        B_AI_Output(self,other,"DIA_Hanna_Add_17_36");    //Это обошлось мне в кругленькую сумму. Но для тебя ничего не жалко, свинья...
};
