instance DIA_CORAGON_EXIT(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 999;
        condition = dia_coragon_exit_condition;
        information = dia_coragon_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_coragon_exit_condition()
{
        return TRUE;
};
func void dia_coragon_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 900;
        condition = dia_coragon_pickpocket_condition;
        information = dia_coragon_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_coragon_pickpocket_condition()
{
        return c_beklauen(40,45);
};
func void dia_coragon_pickpocket_info()
{
        Info_ClearChoices(dia_coragon_pickpocket);
        Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
        Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};
func void dia_coragon_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_coragon_pickpocket);
};
func void dia_coragon_pickpocket_back()
{
        Info_ClearChoices(dia_coragon_pickpocket);
};
instance DIA_CORAGON_HALLO(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 2;
        condition = dia_coragon_hallo_condition;
        information = dia_coragon_hallo_info;
        permanent = FALSE;
        description = "Могу я выпить здесь?";
};
func int dia_coragon_hallo_condition()
{
        return TRUE;
};
func void dia_coragon_hallo_info()
{
        B_AI_Output(other,self,"DIA_Coragon_HALLO_15_00");        //Могу я выпить здесь?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_00");  //Если у тебя есть золото, ты даже можешь поесть здесь, если хочешь, конечно.
        Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
        b_logentry(TOPIC_CITYTRADER,TOPIC_CITYTRADER_description_636); // "Я могу покупать еду и питье у трактирщика Корагона."
};
instance DIA_CORAGON_TRADE(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 2;
        condition = dia_coragon_trade_condition;
        information = dia_coragon_trade_info;
        permanent = TRUE;
        description = "Покажи мне свои товары.";
        trade = TRUE;
};
func int dia_coragon_trade_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_hallo))
        {
                return TRUE;
        };
};
func void dia_coragon_trade_info()
{
        b_givetradeinv(self);
        B_AI_Output(other,self,"DIA_Coragon_Trade_15_00");        //Покажи мне свои товары.
};
instance DIA_CORAGON_WHATSUP(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 3;
        condition = dia_coragon_whatsup_condition;
        information = dia_coragon_whatsup_info;
        permanent = FALSE;
        description = "Как идут дела?";
};
func int dia_coragon_whatsup_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_hallo))
        {
                return TRUE;
        };
};
func void dia_coragon_whatsup_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");      //Как идут дела?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_01");  //Аах, не напоминай мне. Лорд Андрэ раздает бесплатное пиво на площади казней.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_02");  //Теперь почти никто не заходит сюда, за исключением богачей из верхнего квартала.
        B_AI_Output(other,self,"DIA_Coragon_Add_15_03");  //А что с ними не так?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_04");  //(смеется) Некоторые из этих толстосумов очень действуют на нервы.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_05");  //Возьмем этого Валентино, например, я его на дух не выношу.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_06");  //Но я не могу выбирать клиентов. Мне дорог каждый цент, что я зарабатываю.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_07");  //А то немногое, что мне удалось скопить, было украдено вместе с моим серебром.
};
instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 4;
        condition = dia_coragon_bestohlen_condition;
        information = dia_coragon_bestohlen_info;
        permanent = FALSE;
        description = "Тебя ограбили?";
};
func int dia_coragon_bestohlen_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_whatsup))
        {
                return TRUE;
        };
};
func void dia_coragon_bestohlen_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_08");  //Тебя ограбили?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_09");  //Ну, это было уже довольно давно. Той ночью было довольно много народа, и я часто разносил пиво по столам.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_10");  //Я отлучался из-за прилавка совсем ненадолго, но этого оказалось вполне достаточно для этих ублюдков.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_11");  //Я обратился за помощью к ополчению, но они, конечно же, ничего не нашли. Они предпочитают толкаться у бочки с бесплатным пивом.
        MIS_CORAGON_SILBER = LOG_RUNNING;
};
var int coragon_bier;
func void b_coragon_bier()
{
        CORAGON_BIER = CORAGON_BIER + 1;
        B_AI_Output(self,other,"DIA_Coragon_Add_05_14");  //Вот - возьми это в качестве награды.
        b_giveinvitems(self,other,itfo_coragonsbeer,1);
        if(CORAGON_BIER < 2)
        {
                B_AI_Output(self,other,"DIA_Coragon_Add_05_21");  //Очень хорошее пиво. Это мой последний бочонок.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Coragon_Add_05_22");  //Самая последняя капля!
        };
};
instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 5;
        condition = dia_coragon_bringsilber_condition;
        information = dia_coragon_bringsilber_info;
        permanent = FALSE;
        description = "Я принес твое серебро.";
};
func int dia_coragon_bringsilber_condition()
{
        if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
        {
                return TRUE;
        };
};
func void dia_coragon_bringsilber_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_12");  //Я принес твое серебро.
        b_giveinvitems(other,self,itmi_coragonssilber,8);
        B_AI_Output(self,other,"DIA_Coragon_Add_05_13");  //Да ну?!
        b_giveplayerxp(XP_CORAGONSSILBER);
        b_coragon_bier();
        MIS_CORAGON_SILBER = LOG_SUCCESS;
};
instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 6;
        condition = dia_coragon_schuldenbuch_condition;
        information = dia_coragon_schuldenbuch_info;
        permanent = FALSE;
        description = "Посмотри, что у меня есть...";
};
func int dia_coragon_schuldenbuch_condition()
{
        if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
        {
                return TRUE;
        };
};
func void dia_coragon_schuldenbuch_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_15");  //Посмотри, что у меня есть...
        B_AI_Output(self,other,"DIA_Coragon_Add_05_16");  //Мммм? (удивленно) Это же гроссбух Лемара!
        B_AI_Output(self,other,"DIA_Coragon_Add_05_17");  //Что ты собираешься делать с ним?
};
instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 7;
        condition = dia_coragon_givebook_condition;
        information = dia_coragon_givebook_info;
        permanent = FALSE;
        description = "Вот твоя книга.";
};
func int dia_coragon_givebook_condition()
{
        if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
        {
                return TRUE;
        };
};
func void dia_coragon_givebook_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_18");  //Вот твоя книга.
        b_giveinvitems(other,self,itwr_schuldenbuch,1);
        B_AI_Output(self,other,"DIA_Coragon_Add_05_19");  //Спасибо! Ты спас мою задницу. Лемар может быть очень мерзким, если захочет.
        b_giveplayerxp(XP_SCHULDENBUCH);
        b_coragon_bier();
};
instance DIA_CORAGON_TOOV(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 9;
        condition = dia_coragon_toov_condition;
        information = dia_coragon_toov_info;
        permanent = FALSE;
        description = "Как мне попасть в верхний квартал?";
};
func int dia_coragon_toov_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
        {
                return TRUE;
        };
};
func void dia_coragon_toov_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_23");  //Как мне попасть в верхний квартал?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_24");  //Ты должен быть гражданином города. Иди, найди себе работу.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_25");  //Лучше всего у мастеров в нижней части города. Это сделает тебя гражданином.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_26");  //Ну, а если этого будет недостаточно, поговори с лордом Андрэ в казармах.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_27");  //Может быть, он примет тебя в городскую стражу. Они тоже имеют доступ в верхний квартал.
};
instance DIA_CORAGON_VALENTINO(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 8;
        condition = dia_coragon_valentino_condition;
        information = dia_coragon_valentino_info;
        permanent = FALSE;
        description = "А что там насчет Валентино?";
};
func int dia_coragon_valentino_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_whatsup))
        {
                return TRUE;
        };
};
func void dia_coragon_valentino_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_28");  //А что там насчет Валентино?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_29");  //Он ужасно богат, и ему не нужно работать. И он бахвалится этим перед всеми.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_30");  //Хочешь ты его слушать или нет.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_31");  //Он много пьет и всегда остается почти до закрытия. А затем, рано утром, бредет к себе, в верхний квартал.
        B_AI_Output(self,other,"DIA_Coragon_Add_05_32");  //И так изо дня в день.
};
instance DIA_CORAGON_NEWS(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 1;
        condition = dia_coragon_news_condition;
        information = dia_coragon_news_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_coragon_news_condition()
{
        if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
        {
                if(REGIS_RING == TRUE)
                {
                        return TRUE;
                };
        };
};
func void dia_coragon_news_info()
{
        B_AI_Output(self,other,"DIA_Coragon_Add_05_33");  //Валентино не смог заплатить за выпивку прошлой ночью.
        if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
        {
                B_AI_Output(self,other,"DIA_Coragon_Add_05_34");  //Он бормотал что-то о том, что его ограбили и что он заплатит мне позже... Чушь какая!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Coragon_Add_05_35");  //А за пять минут до этого он бахвалился, что у него денег куры не клюют.
                B_AI_Output(self,other,"DIA_Coragon_Add_05_36");  //Затем он сунул руку у карман и сделал удивленное лицо. Он сказал, что у него украли кошелек...
        };
        B_AI_Output(other,self,"DIA_Coragon_Add_15_37");  //И? Что ты сделал?
        B_AI_Output(self,other,"DIA_Coragon_Add_05_38");  //Ну, я задал ему хорошую трепку, что же еще?
};
instance DIA_CORAGON_RING(C_INFO)
{
        npc = vlk_420_coragon;
        nr = 10;
        condition = dia_coragon_ring_condition;
        information = dia_coragon_ring_info;
        permanent = FALSE;
        description = "Вот - возьми это кольцо.";
};
func int dia_coragon_ring_condition()
{
        if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_prot_edge_01_valentino) > 0))
        {
                return TRUE;
        };
};
func void dia_coragon_ring_info()
{
        B_AI_Output(other,self,"DIA_Coragon_Add_15_39");  //Вот - возьми это кольцо.
        b_giveinvitems(other,self,itri_prot_edge_01_valentino,1);
        B_AI_Output(self,other,"DIA_Coragon_Add_05_40");  //Что? Я не понимаю...
        B_AI_Output(other,self,"DIA_Coragon_Add_15_41");  //Оно принадлежало Валентино.
        B_AI_Output(other,self,"DIA_Coragon_Add_15_42");  //Ты можешь передать его следующему, кто отдубасит его...
        b_giveplayerxp(300);
        AI_StopProcessInfos(self);
};
