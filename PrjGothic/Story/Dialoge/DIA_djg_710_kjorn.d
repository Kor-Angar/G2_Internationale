instance DIA_KJORN_EXIT(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 999;
        condition = dia_kjorn_exit_condition;
        information = dia_kjorn_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_kjorn_exit_condition()
{
        return TRUE;
};
func void dia_kjorn_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_KJORN_HELLO(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 4;
        condition = dia_kjorn_hello_condition;
        information = dia_kjorn_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_kjorn_hello_condition()
{
        if(Npc_GetDistToNpc(self,hero) < 300)
        {
                return TRUE;
        };
};
func void dia_kjorn_hello_info()
{
        B_AI_Output(self,other,"DIA_Kjorn_Hello_06_00");  //Эй, иди сюда!
        B_AI_Output(other,self,"DIA_Kjorn_Hello_15_01");  //Чего тебе?
        B_AI_Output(self,other,"DIA_Kjorn_Hello_06_02");  //Эта долина - опасное место, и без правильного снаряжения ты сразу можешь считать себя трупом.
        B_AI_Output(other,self,"DIA_Kjorn_Hello_15_03");  //Я полагаю, что у ТЕБЯ как раз правильное снаряжение.
        B_AI_Output(self,other,"DIA_Kjorn_Hello_06_04");  //Угадал. И я даже могу продать его тебе.
};
instance DIA_KJORN_TRADE(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 4;
        condition = dia_kjorn_trade_condition;
        information = dia_kjorn_trade_info;
        trade = TRUE;
        permanent = TRUE;
        description = "Что ты можешь предложить мне?";
};
func int dia_kjorn_trade_condition()
{
        return TRUE;
};
func void dia_kjorn_trade_info()
{
        b_givetradeinv(self);
        B_AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");  //Что ты можешь предложить мне?
};
instance DIA_KJORN_SELLINFOS(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 5;
        condition = dia_kjorn_sellinfos_condition;
        information = dia_kjorn_sellinfos_info;
        permanent = FALSE;
        description = "А информацией ты не торгуешь?";
};
func int dia_kjorn_sellinfos_condition()
{
        return TRUE;
};
func void dia_kjorn_sellinfos_info()
{
        B_AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");      //А информацией ты не торгуешь?
        B_AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");      //Может быть. Если цена подходящая, я расскажу тебе все, что я знаю.
        B_AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");      //Сколько ты берешь?
        B_AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");      //Хмм... трудно сказать. Но, думаю, 50 золотых за каждую информацию, что ты получишь, будет нормально.
};
instance DIA_KJORN_BUYINFOS(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 5;
        condition = dia_kjorn_buyinfos_condition;
        information = dia_kjorn_buyinfos_info;
        permanent = TRUE;
        description = "Мне нужна кое-какая информация.";
};
func int dia_kjorn_buyinfos_condition()
{
        if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
        {
                return TRUE;
        };
};
func void dia_kjorn_buyinfos_info()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");       //Мне нужна информация.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");       //50 золотых!
        Info_ClearChoices(dia_kjorn_buyinfos);
        Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_holdmoney_description,dia_kjorn_buyinfos_holdmoney); // "Это слишком дорого для меня."
        if(Npc_HasItems(other,itmi_gold) >= 50)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_givemoney_description,dia_kjorn_buyinfos_givemoney); // "Да держи."
        };
};
func void dia_kjorn_buyinfos_holdmoney()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");     //Это слишком дорого для меня.
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_givemoney()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");     //Вот, держи.
        b_giveinvitems(other,self,itmi_gold,50);
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");     //Теперь скажи мне...
        Info_ClearChoices(dia_kjorn_buyinfos);
        Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
        if(KJORNTOLDDRAGON == 0)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_dragon1_description,dia_kjorn_buyinfos_dragon1); // "... насчет драконов."
        }
        else if(KJORNTOLDDRAGON == 1)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_dragon2_description,dia_kjorn_buyinfos_dragon2); // "... еще о драконах."
        };
        if(KJORNTOLDCOLONY == 0)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_colony1_description,dia_kjorn_buyinfos_colony1); // "... о Долине Рудников."
        }
        else if(KJORNTOLDCOLONY == 1)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_colony2_description,dia_kjorn_buyinfos_colony2); // "... еще о Долине Рудников."
        };
        if(KJORNTOLDOLDCAMP == 0)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_oldcamp1_description,dia_kjorn_buyinfos_oldcamp1); // "... о замке."
        };
        if(KJORNTOLDORKS == 0)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_orks1_description,dia_kjorn_buyinfos_orks1); // "... об орках."
        }
        else if(KJORNTOLDORKS == 1)
        {
                Info_AddChoice(dia_kjorn_buyinfos,dia_kjorn_buyinfos_orks2_description,dia_kjorn_buyinfos_orks2); // "... еще об орках."
        };
};
func void dia_kjorn_buyinfos_back()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");  //Знаешь, верни мне мои деньги, я передумал.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");  //Как хочешь.
        b_giveinvitems(self,other,itmi_gold,50);
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_dragon1()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");       //Расскажи мне о драконах.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");       //Драконы - это древние невероятно сильные создания. Когда-то их было многие тысячи.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");       //Но уже больше сотни лет ни одного из них не было видно.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");       //Их кровь горяча, как кипящее масло. Если они посмотрят в твои глаза, твое сердце обратится в камень. Ну, так я слышал...
        KJORNTOLDDRAGON = 1;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_dragon2()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");       //Расскажи мне подробнее о драконах.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");       //Все драконы разные.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");       //Некоторые из них могут покрыть землю слоем льда несколько футов толщиной.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");       //Другие же предпочитают жить в болотистой местности или в вулканах.
        b_logentry(TOPIC_DRACHENJAGD,TOPIC_DRACHENJAGD_description_140); // "Охотник на драконов Кйорн полагает что драконы бывают различных типов. Некоторые из них предпочитают холодные сырые места а другим по его мнению больше нравится огонь."
        KJORNTOLDDRAGON = 2;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_colony1()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");       //Расскажи мне о Долине Рудников.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");       //Долина Рудников Хориниса известна всей стране из-за своей магической руды.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");       //Эти горы - единственное место, где встречается магическая руда.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");       //Оружие, выкованное из этой руды, никогда не ломается и может пробить даже самую прочную броню.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");       //До последнего времени вся долина была окружена магическим барьером. Он был непроницаем, и никто не мог выйти наружу.
        KJORNTOLDCOLONY = 1;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_colony2()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");       //Расскажи мне подробнее о Долине Рудников.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");       //Долина сильно изменилась за последние несколько дней.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");       //Когда пришли орки, вместе с ними появились и другие ужасные создания, многих из которых раньше никогда здесь не видели.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");       //Говорят, что несколько охотников-одиночек все еще находятся в долине, но я не уверен, что они еще живы.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");       //Создается впечатление, что все создания Белиара вдруг толпами ринулись в эту долину.
        KJORNTOLDCOLONY = 2;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_oldcamp1()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");      //Расскажи мне о замке.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");      //Он находится в самом центре Долины Рудников.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");      //Когда долина еще была тюрьмой, рудные бароны контролировали всю торговлю рудой отсюда.
        KJORNTOLDOLDCAMP = 1;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_orks1()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Расскажи мне об орках.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Орки появились здесь недавно. По крайней мере, те орки, что сейчас перед замком.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Но мне удивительно, как организованно они себя ведут. Орки обычно атакуют слепо, не взирая ни на что.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //А эти орки выжидают подходящего момента. Они ждут, но мы не знаем чего.
        KJORNTOLDORKS = 1;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
func void dia_kjorn_buyinfos_orks2()
{
        B_AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Расскажи мне подробнее об орках.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Орков возглавляют элитные воины. Эти воины очень сильны и облачены в хорошие доспехи. Их почти невозможно убить.
        B_AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //Я как-то видел, как один из них срубил большой дуб одним ударом своего топора.
        KJORNTOLDORKS = 2;
        Info_ClearChoices(dia_kjorn_buyinfos);
};
instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 5;
        condition = dia_kjorn_alldragonsdead_condition;
        information = dia_kjorn_alldragonsdead_info;
        permanent = FALSE;
        description = "Я убил всех драконов!";
};
func int dia_kjorn_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_kjorn_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00"); //Я убил всех драконов!
        B_AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(смеется) Конечно, а я паладин.
        B_AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Возможно, ты убил ОДНОГО, но чтобы всех? Иди, поищи дурака, который поверит тебе.
};
instance DIA_KJORN_PICKPOCKET(C_INFO)
{
        npc = djg_710_kjorn;
        nr = 900;
        condition = dia_kjorn_pickpocket_condition;
        information = dia_kjorn_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_kjorn_pickpocket_condition()
{
        return c_beklauen(47,75);
};
func void dia_kjorn_pickpocket_info()
{
        Info_ClearChoices(dia_kjorn_pickpocket);
        Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
        Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};
func void dia_kjorn_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_kjorn_pickpocket);
};
func void dia_kjorn_pickpocket_back()
{
        Info_ClearChoices(dia_kjorn_pickpocket);
};
