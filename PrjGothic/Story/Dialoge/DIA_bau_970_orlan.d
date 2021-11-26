instance DIA_ORLAN_EXIT(C_INFO)
{
        npc = bau_970_orlan;
        nr = 999;
        condition = dia_orlan_exit_condition;
        information = dia_orlan_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_orlan_exit_condition()
{
        return TRUE;
};
func void dia_orlan_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ORLAN_WEIN(C_INFO)
{
        npc = bau_970_orlan;
        nr = 3;
        condition = dia_orlan_wein_condition;
        information = dia_orlan_wein_info;
        permanent = FALSE;
        description = "Я принес вино из монастыря.";
};
func int dia_orlan_wein_condition()
{
        if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
        {
                return TRUE;
        };
};
func void dia_orlan_wein_info()
{
        B_AI_Output(other,self,"DIA_Orlan_Wein_15_00");   //Я принес вино из монастыря.
        B_AI_Output(self,other,"DIA_Orlan_Wein_05_01");   //Превосходно. Это именно то, что мне нужно.
        B_AI_Output(self,other,"DIA_Orlan_Wein_05_02");   //Я уже договорился о цене с мастером Гораксом. Я дам тебе 100 золотых монет прямо сейчас.
        Info_ClearChoices(dia_orlan_wein);
        Info_AddChoice(dia_orlan_wein,dia_orlan_wein_ja_description,dia_orlan_wein_ja); // "Хорошо давай мне это золото."
        Info_AddChoice(dia_orlan_wein,dia_orlan_wein_nein_description,dia_orlan_wein_nein); // "Ты пытаешься надуть меня?"
};
func void dia_orlan_wein_ja()
{
        B_AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");        //Хорошо, давай мне это золото.
        B_AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");        //Держи. С тобой приятно иметь дело.
        b_giveinvitems(self,other,itmi_gold,100);
        b_giveinvitems(other,self,itfo_wine,12);
        Info_ClearChoices(dia_orlan_wein);
};
func void dia_orlan_wein_nein()
{
        B_AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");      //Ты пытаешься надуть меня? Оно стоит 240 монет.
        B_AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");      //Так, Горакс предупредил тебя, да? Ну хорошо, может быть, мы сможем договориться. Послушай, давай поступим так - я дам тебе 100 монет за это вино.
        B_AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");      //Ты скажешь Гораксу, что я обманул тебя, а я дам тебе в придачу ЧЕТЫРЕ свитка с заклинаниями.
        Info_ClearChoices(dia_orlan_wein);
        Info_AddChoice(dia_orlan_wein,dia_orlan_wein_nie_description,dia_orlan_wein_nie); // "Эй давай сюда 240 монет."
        Info_AddChoice(dia_orlan_wein,dia_orlan_wein_okay_description,dia_orlan_wein_okay); // "Хм звучит заманчиво. Давай сюда эти свитки."
        Info_AddChoice(dia_orlan_wein,dia_orlan_wein_was_description,dia_orlan_wein_was); // "А что это за свитки?"
};
func void dia_orlan_wein_nie()
{
        B_AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");       //Эй, давай сюда 240 монет.
        B_AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");       //Ты не хочешь вести со мной бизнес, да? (вздыхает) Ну хорошо, вот твое золото.
        b_giveinvitems(self,other,itmi_gold,240);
        b_giveinvitems(other,self,itfo_wine,12);
        Info_ClearChoices(dia_orlan_wein);
};
func void dia_orlan_wein_okay()
{
        var string text;
        text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
        PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
        b_giveinvitems(self,other,itmi_gold,100);
        B_AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");      //Хм, звучит заманчиво. Давай сюда эти свитки.
        B_AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");      //Вот твои свитки и золото.
        b_giveinvitems(other,self,itfo_wine,12);
        CreateInvItems(hero,itsc_light,2);
        CreateInvItems(hero,itsc_lightheal,1);
        CreateInvItems(hero,itsc_sumgobskel,1);
        Info_ClearChoices(dia_orlan_wein);
};
func void dia_orlan_wein_was()
{
        B_AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");       //А что это за свитки?
        B_AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");       //Понятия не имею - я в этом ничего не понимаю. Они достались мне от гостя, который... э-э... забыл их здесь, да!
};
instance DIA_ORLAN_WERBISTDU(C_INFO)
{
        npc = bau_970_orlan;
        nr = 2;
        condition = dia_orlan_werbistdu_condition;
        information = dia_orlan_werbistdu_info;
        description = "Кто ты?";
};
func int dia_orlan_werbistdu_condition()
{
        return TRUE;
};
func void dia_orlan_werbistdu_info()
{
        B_AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");      //Ты кто?
        B_AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");      //Я Орлан, хозяин этой скромной таверны.
        B_AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");      //Ты что-нибудь ищешь, чужеземец? Может быть, приличный меч или хорошие доспехи?
        B_AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");      //Глоток вина, или, может быть, тебе нужна информация?
        B_AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");      //Я могу дать тебе все это и даже больше, если у тебя есть звонкие монеты.
};
instance DIA_ORLAN_RUESTUNG(C_INFO)
{
        npc = bau_970_orlan;
        nr = 5;
        condition = dia_orlan_ruestung_condition;
        information = dia_orlan_ruestung_info;
        permanent = TRUE;
        description = "Что за доспехи ты можешь предложить?";
};
var int dia_orlan_ruestung_noperm;
func int dia_orlan_ruestung_condition()
{
        if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE) && (hero.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_orlan_ruestung_info()
{
        B_AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");       //Что за доспехи ты можешь предложить?
        B_AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");       //У меня есть очень хороший экземпляр, я уверен, это заинтересует тебя.
        Info_ClearChoices(dia_orlan_ruestung);
        Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
        Info_AddChoice(dia_orlan_ruestung,dia_orlan_ruestung_buy_description,dia_orlan_ruestung_buy); // "Кожаные доспехи. Защита: оружие 25 стрелы 20 огонь 5 250 золота"
};
func void dia_orlan_ruestung_buy()
{
        B_AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");   //Я бы хотел купить кожаные доспехи.
        if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_LEATHER_L))
        {
                B_AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");   //Мудрый выбор.
                CreateInvItems(self,itar_leather_l,1);
                b_giveinvitems(self,other,itar_leather_l,1);
                AI_EquipBestArmor(other);
                DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");   //Извини. Заходи, когда у тебя появятся деньги.
        };
        Info_ClearChoices(dia_orlan_ruestung);
};
func void dia_orlan_ruestung_back()
{
        B_AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");  //Я подумаю над этим.
        B_AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");  //Как хочешь. Только не думай слишком долго.
        Info_ClearChoices(dia_orlan_ruestung);
};
instance DIA_ORLAN_TRADE(C_INFO)
{
        npc = bau_970_orlan;
        nr = 70;
        condition = dia_orlan_trade_condition;
        information = dia_orlan_trade_info;
        trade = TRUE;
        permanent = TRUE;
        description = "Покажи мне свои товары.";
};
func int dia_orlan_trade_condition()
{
        if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
        {
                return TRUE;
        };
};
func void dia_orlan_trade_info()
{
        B_AI_Output(other,self,"DIA_Orlan_TRADE_15_00");  //Покажи мне свои товары.
        b_givetradeinv(self);
        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
        {
                B_AI_Output(self,other,"DIA_Orlan_TRADE_05_01");  //Конечно. Для меня большая честь услужить такому важному гостю.
        }
        else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
        {
                B_AI_Output(self,other,"DIA_Orlan_TRADE_05_02");  //Конечно, сэр.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_TRADE_05_03");  //Если ты сможешь заплатить.
        };
};
instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
        npc = bau_970_orlan;
        nr = 6;
        condition = dia_orlan_hotelzimmer_condition;
        information = dia_orlan_hotelzimmer_info;
        permanent = TRUE;
        description = "Сколько ты берешь за комнату?";
};
var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;
func int dia_orlan_hotelzimmer_condition()
{
        if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
        {
                return TRUE;
        };
};
func void dia_orlan_hotelzimmer_info()
{
        B_AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");    //Сколько ты берешь за комнату?
        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
        {
                if(hero.guild == GIL_PAL)
                {
                        B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");    //Для рыцаря короля у меня всегда найдется свободная комната. Совершенно бесплатно, естественно.
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");    //Я бы никогда не посмел взять деньги за свои услуги с представителя Инноса на земле.
                };
                B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");    //Вот ключ от верхних комнат. Выбирай, которая больше понравится.
                CreateInvItems(self,itke_orlan_hotelzimmer,1);
                b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
                ORLAN_SCGOTHOTELZIMMER = TRUE;
                ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");    //Ты платишь 50 золотых монет в неделю - и комната твоя.
                Info_ClearChoices(dia_orlan_hotelzimmer);
                Info_AddChoice(dia_orlan_hotelzimmer,dia_orlan_hotelzimmer_nein_description,dia_orlan_hotelzimmer_nein); // "Черт побери как дорого-то!"
                Info_AddChoice(dia_orlan_hotelzimmer,dia_orlan_hotelzimmer_ja_description,dia_orlan_hotelzimmer_ja); // "Хорошо. Вот золото."
        };
};
func void dia_orlan_hotelzimmer_ja()
{
        B_AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00"); //Хорошо. Вот золото.
        if(b_giveinvitems(other,self,itmi_gold,50))
        {
                B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01"); //А вот ключ. Комнаты находятся вверх по лестнице. Но не загадь ее и не забывай платить ренту вовремя, понятно?
                CreateInvItems(self,itke_orlan_hotelzimmer,1);
                b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
                ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
                ORLAN_SCGOTHOTELZIMMER = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02"); //У тебя нет пятидесяти. Сначала деньги, потом удовольствие.
        };
        Info_ClearChoices(dia_orlan_hotelzimmer);
};
func void dia_orlan_hotelzimmer_nein()
{
        B_AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");       //Черт побери, как дорого-то!
        B_AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");       //Тогда попробуй поискать ночлег в другом месте, дружок.
        Info_ClearChoices(dia_orlan_hotelzimmer);
};
var int orlan_angriffwegenmiete;
instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
        npc = bau_970_orlan;
        nr = 10;
        condition = dia_orlan_mietefaellig_condition;
        information = dia_orlan_mietefaellig_info;
        important = TRUE;
        permanent = TRUE;
};
var int dia_orlan_mietefaellig_nomore;
func int dia_orlan_mietefaellig_condition()
{
        if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
        {
                if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
                {
                        return FALSE;
                };
                if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
                {
                        ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
                        ORLAN_ANGRIFFWEGENMIETE = FALSE;
                        return FALSE;
                };
        };
        if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
        {
                return TRUE;
        };
};
func void dia_orlan_mietefaellig_info()
{
        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
        {
                B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");   //(неискренне) Я очень рад визиту такого гостя. Оставайся здесь, сколько пожелаешь. Это честь для меня.
                DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");   //Когда я, наконец, получу мою ренту?
                Info_ClearChoices(dia_orlan_mietefaellig);
                Info_AddChoice(dia_orlan_mietefaellig,dia_orlan_mietefaellig_nein_description,dia_orlan_mietefaellig_nein); // "Забудь об этом. Я больше не буду платить тебе."
                Info_AddChoice(dia_orlan_mietefaellig,dia_orlan_mietefaellig_ja_description,dia_orlan_mietefaellig_ja); // "Вот твои 50 монет."
        };
};
var int dia_orlan_mietefaellig_onetime;
func void dia_orlan_mietefaellig_ja()
{
        B_AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");        //Вот твои 50 монет.
        if(b_giveinvitems(other,self,itmi_gold,50))
        {
                B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");        //Как раз вовремя.
                if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
                {
                        B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");        //Где ты шлялся весь день?
                        B_AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");        //Тебе лучше не знать.
                        B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");        //Мммм. Ну, да. Это, в общем-то, не мое дело.
                        DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
                };
                ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
                Info_ClearChoices(dia_orlan_mietefaellig);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");        //Ты что, пытаешься надуть меня? У даже тебя нет денег, чтобы заплатить за еду. Я проучу тебя, ах ты...
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,1);
        };
};
func void dia_orlan_mietefaellig_nein()
{
        B_AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");      //Забудь об этом. Я больше не буду платить тебе.
        B_AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");      //Тогда мне придется проучить тебя. Презренный жулик!
        ORLAN_ANGRIFFWEGENMIETE = TRUE;
        Info_ClearChoices(dia_orlan_mietefaellig);
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
        npc = bau_970_orlan;
        nr = 7;
        condition = dia_orlan_wettkampflaeuft_condition;
        information = dia_orlan_wettkampflaeuft_info;
        important = TRUE;
};
func int dia_orlan_wettkampflaeuft_condition()
{
        if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
        {
                return TRUE;
        };
};
func void dia_orlan_wettkampflaeuft_info()
{
        B_AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");        //Вот ты где, наконец. Я ждал тебя.
        B_AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");        //Что случилось?
        B_AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");        //Состязание 'кто кого перепьет' наконец-то закончилось.
        B_AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");        //Кто победил?
        if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
        {
                B_AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");        //На этот раз Рендольф. Рухару нынче не повезло.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");        //Как всегда Рухар напоил Рендольфа в стельку. Этого следовало ожидать.
                RUKHAR_WON_WETTKAMPF = TRUE;
        };
        if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
        {
                B_AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");        //Я надеюсь, это было в последний раз. Я не хочу, чтобы подобное повторялось в моем доме. Заруби это у себя на носу.
        };
        b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Start");
        b_startotherroutine(randolph,"Start");
        if(Hlp_IsValidNpc(rukhar))
        {
                if(RUKHAR_WON_WETTKAMPF == TRUE)
                {
                        b_startotherroutine(rukhar,"WettkampfRukharWon");
                }
                else
                {
                        b_startotherroutine(rukhar,"WettkampfRukharLost");
                };
        };
        MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
        npc = bau_970_orlan;
        nr = 8;
        condition = dia_orlan_eingebrockt_condition;
        information = dia_orlan_eingebrockt_info;
        important = TRUE;
};
func int dia_orlan_eingebrockt_condition()
{
        if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_orlan_eingebrockt_info()
{
        B_AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");    //Да уж, доставил ты мне проблем. Теперь мне нужно быть поосторожнее с Рухаром.
        B_AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");    //Почему?
        B_AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");    //Пока он устраивает здесь это свое состязание, лучше, чтобы никто посторонний не знал о нем. Это плохо для бизнеса, понимаешь?
};
instance DIA_ORLAN_PERM(C_INFO)
{
        npc = bau_970_orlan;
        nr = 99;
        condition = dia_orlan_perm_condition;
        information = dia_orlan_perm_info;
        permanent = TRUE;
        description = "Как дела в таверне?";
};
func int dia_orlan_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
        {
                return TRUE;
        };
};
func void dia_orlan_perm_info()
{
        B_AI_Output(other,self,"DIA_Orlan_Perm_15_00");   //Как дела в таверне?
        if(KAPITEL <= 2)
        {
                B_AI_Output(self,other,"DIA_Orlan_Perm_05_01");   //Бывало и лучше.
                B_AI_Output(self,other,"DIA_Orlan_Perm_05_02");   //Люди нынче не так охотно развязывают свои кошельки, как это было раньше.
        }
        else if(KAPITEL >= 3)
        {
                B_AI_Output(self,other,"DIA_Orlan_Perm_05_03");   //Надеюсь, эти черные маги скоро уйдут, иначе, боюсь, мне придется закрыть таверну.
                B_AI_Output(self,other,"DIA_Orlan_Perm_05_04");   //Почти никто не осмеливается больше заглядывать сюда.
        };
};
instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
        npc = bau_970_orlan;
        nr = 3;
        condition = dia_orlan_minenanteil_condition;
        information = dia_orlan_minenanteil_info;
        description = "Ты продаешь акции?";
};
func int dia_orlan_minenanteil_condition()
{
        if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
        {
                return TRUE;
        };
};
func void dia_orlan_minenanteil_info()
{
        B_AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");    //Ты продаешь акции?
        B_AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");    //Конечно. Ты тоже можешь купить, если цена тебя устраивает.
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
        npc = bau_970_orlan;
        nr = 900;
        condition = dia_orlan_pickpocket_condition;
        information = dia_orlan_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_100;
};
func int dia_orlan_pickpocket_condition()
{
        return c_beklauen(89,260);
};
func void dia_orlan_pickpocket_info()
{
        Info_ClearChoices(dia_orlan_pickpocket);
        Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
        Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};
func void dia_orlan_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_orlan_pickpocket);
};
func void dia_orlan_pickpocket_back()
{
        Info_ClearChoices(dia_orlan_pickpocket);
};
