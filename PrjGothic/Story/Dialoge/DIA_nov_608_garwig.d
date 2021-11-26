instance DIA_GARWIG_EXIT(C_INFO)
{
        npc = nov_608_garwig;
        nr = 999;
        condition = dia_garwig_exit_condition;
        information = dia_garwig_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_garwig_exit_condition()
{
        return TRUE;
};
func void dia_garwig_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GARWIG_WURST(C_INFO)
{
        npc = nov_608_garwig;
        nr = 3;
        condition = dia_garwig_wurst_condition;
        information = dia_garwig_wurst_info;
        permanent = FALSE;
        description = "Хочешь колбасы?";
};
func int dia_garwig_wurst_condition()
{
        if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
        {
                return TRUE;
        };
};
func void dia_garwig_wurst_info()
{
        var string novizetext;
        var string novizeleft;
        B_AI_Output(other,self,"DIA_Garwig_Wurst_15_00"); //Хочешь колбасы?
        B_AI_Output(self,other,"DIA_Garwig_Wurst_06_01"); //Ах, как вкусно. Огромное спасибо тебе, брат.
        b_giveinvitems(other,self,itfo_schafswurst,1);
        WURST_GEGEBEN = WURST_GEGEBEN + 1;
        CreateInvItems(self,itfo_sausage,1);
        b_useitem(self,itfo_sausage);
        novizeleft = IntToString(13 - WURST_GEGEBEN);
        novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
        AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};
instance DIA_GARWIG_HELLO(C_INFO)
{
        npc = nov_608_garwig;
        nr = 3;
        condition = dia_garwig_hello_condition;
        information = dia_garwig_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_garwig_hello_condition()
{
        if(other.guild == GIL_NOV)
        {
                return TRUE;
        };
};
func void dia_garwig_hello_info()
{
        B_AI_Output(self,other,"DIA_Garwig_Hello_06_00"); //Да пребудет с тобой Иннос, я никогда не видел тебя раньше. Ты новенький здесь?
        B_AI_Output(other,self,"DIA_Garwig_Hello_15_01"); //Да, я только что стал послушником.
        B_AI_Output(self,other,"DIA_Garwig_Hello_06_02"); //Тогда я желаю тебе освоиться здесь побыстрее. Дай мне знать, если тебе понадобится помощь.
};
instance DIA_GARWIG_ROOM(C_INFO)
{
        npc = nov_608_garwig;
        nr = 5;
        condition = dia_garwig_room_condition;
        information = dia_garwig_room_info;
        permanent = FALSE;
        description = "Что это за комната?";
};
func int dia_garwig_room_condition()
{
        return TRUE;
};
func void dia_garwig_room_info()
{
        B_AI_Output(other,self,"DIA_Garwig_Room_15_00");  //Что это за комната?
        B_AI_Output(self,other,"DIA_Garwig_Room_06_01");  //Здесь хранятся священные реликвии монастыря.
        B_AI_Output(other,self,"DIA_Garwig_Room_15_02");  //Какие реликвии?
        B_AI_Output(self,other,"DIA_Garwig_Room_06_03");  //Здесь покоится Молот Инноса, а также Щит Огня. Это самые важные реликвии Церкви Инноса здесь, вдали от столицы королевства.
};
instance DIA_GARWIG_HAMMER(C_INFO)
{
        npc = nov_608_garwig;
        nr = 99;
        condition = dia_garwig_hammer_condition;
        information = dia_garwig_hammer_info;
        permanent = TRUE;
        description = "Расскажи мне об этом молоте.";
};
func int dia_garwig_hammer_condition()
{
        if(Npc_KnowsInfo(other,dia_garwig_room))
        {
                return TRUE;
        };
};
func void dia_garwig_hammer_info()
{
        B_AI_Output(other,self,"DIA_Garwig_Hammer_15_00");        //Расскажи мне об этом молоте.
        B_AI_Output(self,other,"DIA_Garwig_Hammer_06_01");        //Это священный Молот Инноса. Этим молотом святой Робар поразил Каменного Часового.
        B_AI_Output(self,other,"DIA_Garwig_Hammer_06_02");        //В священных писаниях говорится, что Каменный часовой был неуязвим. Он возвышался над полем боя, как башня, и оружие его врагов разбивалось о его каменную кожу.
        B_AI_Output(self,other,"DIA_Garwig_Hammer_06_03");        //С именем Инноса на устах, Робар бросился на этого монстра и поразил его одним могучим ударом своего молота.
};
instance DIA_GARWIG_SHIELD(C_INFO)
{
        npc = nov_608_garwig;
        nr = 98;
        condition = dia_garwig_shield_condition;
        information = dia_garwig_shield_info;
        permanent = FALSE;
        description = "Расскажи мне об этом щите.";
};
func int dia_garwig_shield_condition()
{
        if(Npc_KnowsInfo(other,dia_garwig_room))
        {
                return TRUE;
        };
};
func void dia_garwig_shield_info()
{
        B_AI_Output(other,self,"DIA_Garwig_Shield_15_00");        //Расскажи мне об этом щите.
        B_AI_Output(self,other,"DIA_Garwig_Shield_06_01");        //Щит Огня принадлежал Доминику в битве на Южных островах.
        B_AI_Output(self,other,"DIA_Garwig_Shield_06_02");        //Но сила этого щита не должна больше использоваться - поэтому, мы прибили его на стене.
};
instance DIA_GARWIG_AUGE(C_INFO)
{
        npc = nov_608_garwig;
        nr = 4;
        condition = dia_garwig_auge_condition;
        information = dia_garwig_auge_info;
        permanent = FALSE;
        description = "А Глаз Инноса тоже храниться здесь?";
};
func int dia_garwig_auge_condition()
{
        if(Npc_KnowsInfo(other,dia_garwig_room) && (KAPITEL <= 2))
        {
                return TRUE;
        };
};
func void dia_garwig_auge_info()
{
        B_AI_Output(other,self,"DIA_Garwig_Auge_15_00");  //А Глаз Инноса тоже храниться здесь?
        B_AI_Output(self,other,"DIA_Garwig_Auge_06_01");  //Конечно нет. Что за странная мысль. Никто не знает, где хранится этот божественный артефакт.
};
instance DIA_GARWIG_SLEEP(C_INFO)
{
        npc = nov_608_garwig;
        nr = 23;
        condition = dia_garwig_sleep_condition;
        information = dia_garwig_sleep_info;
        permanent = TRUE;
        description = "Что ты делаешь здесь?";
};
func int dia_garwig_sleep_condition()
{
        if(other.guild == GIL_NOV)
        {
                return TRUE;
        };
};
func void dia_garwig_sleep_info()
{
        B_AI_Output(other,self,"DIA_Garwig_SLEEP_15_00"); //Что ты делаешь здесь?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_06_01"); //Я страж священных артефактов.
        Info_ClearChoices(dia_garwig_sleep);
        Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
        Info_AddChoice(dia_garwig_sleep,dia_garwig_sleep_exchange_description,dia_garwig_sleep_exchange); // "Что если я сменю тебя ненадолго?"
        Info_AddChoice(dia_garwig_sleep,dia_garwig_sleep_thief_description,dia_garwig_sleep_thief); // "Почему эти артефакты охраняются?"
        Info_AddChoice(dia_garwig_sleep,dia_garwig_sleep_never_description,dia_garwig_sleep_never); // "Ты когда-нибудь спишь?"
};
func void dia_garwig_sleep_back()
{
        Info_ClearChoices(dia_garwig_sleep);
};
func void dia_garwig_sleep_exchange()
{
        B_AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");        //Что если я сменю тебя ненадолго?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");        //Это испытание? Маги послали тебя испытать меня, правильно? Оох, я знал это!
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");        //Но я пройду это испытание. Скажи своим магам, что я был непоколебимым как скала и что я буду сопротивляться всем искушениям. Что я хороший страж.
};
func void dia_garwig_sleep_thief()
{
        B_AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");   //Почему эти артефакты охраняются? Есть причины полагать, что они могут быть украдены?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");   //Что за бредовая мысль. С чего ты это взял?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");   //Только те, кто служит Инносу, могут входить в монастырь. И ни у кого из истинных верующих такая мысль даже появиться не может.
};
func void dia_garwig_sleep_never()
{
        B_AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");   //Ты когда-нибудь спишь?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");   //Что за необычное замечание. Конечно же, я никогда не сплю. Сам Иннос дарует мне силы обходиться без сна.
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");   //Как же иначе мог бы я выполнять священные обязанности стража?
        Info_ClearChoices(dia_garwig_sleep);
        Info_AddChoice(dia_garwig_sleep,dia_garwig_sleep_again_description,dia_garwig_sleep_again); // "Ты действительно НИКОГДА не спишь?"
};
func void dia_garwig_sleep_again()
{
        B_AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");   //Ты действительно НИКОГДА не спишь?
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");   //Нет. Если страж заснет, он провалит свое испытание.
        B_AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");   //Но я не провалюсь, ведь Иннос дает мне силы и выносливость, и я никогда не устаю.
};
instance DIA_GARWIG_THIEF(C_INFO)
{
        npc = nov_608_garwig;
        nr = 2;
        condition = dia_garwig_thief_condition;
        information = dia_garwig_thief_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_garwig_thief_condition()
{
        if(Npc_IsInState(self,zs_talk) && (Npc_HasItems(hero,holy_hammer_mis) == 1))
        {
                return TRUE;
        };
};
func void dia_garwig_thief_info()
{
        if(HAMMER_TAKEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Garwig_THIEF_06_00"); //(разочаровано) Вор! Ты опозорил не только себя и меня, но и весь монастырь!
                B_AI_Output(self,other,"DIA_Garwig_THIEF_06_01"); //Ты поплатишься за это святотатство. И, заклинаю Инносом - ВЕРНИ МНЕ ЭТОТ МОЛОТ!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Garwig_THIEF_06_02"); //(в отчаянии) Молот исчез! Как это могло произойти?
                B_AI_Output(self,other,"DIA_Garwig_THIEF_06_03"); //Я провалил испытание. Иннос накажет меня!
        };
};
instance DIA_GARWIG_ABGEBEN(C_INFO)
{
        npc = nov_608_garwig;
        nr = 2;
        condition = dia_garwig_abgeben_condition;
        information = dia_garwig_abgeben_info;
        permanent = TRUE;
        description = "Я принес молот назад.";
};
func int dia_garwig_abgeben_condition()
{
        if(Npc_HasItems(other,holy_hammer_mis) >= 1)
        {
                return TRUE;
        };
};
func void dia_garwig_abgeben_info()
{
        B_AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");       //Я принес молот назад.
        if(HAMMER_TAKEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");       //Ах ты подлый вор!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");       //Так это ты взял его...
        };
        B_AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");       //Но я не вправе судить тебя. Пусть Иннос осудит тебя, и ты понесешь заслуженную кару!
        b_giveinvitems(other,self,holy_hammer_mis,1);
        HAMMER_TAKEN = FALSE;
};
instance DIA_GARWIG_PICKPOCKET(C_INFO)
{
        npc = nov_608_garwig;
        nr = 900;
        condition = dia_garwig_pickpocket_condition;
        information = dia_garwig_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_garwig_pickpocket_condition()
{
        return c_beklauen(52,80);
};
func void dia_garwig_pickpocket_info()
{
        Info_ClearChoices(dia_garwig_pickpocket);
        Info_AddChoice(dia_garwig_pickpocket,DIALOG_BACK,dia_garwig_pickpocket_back);
        Info_AddChoice(dia_garwig_pickpocket,DIALOG_PICKPOCKET,dia_garwig_pickpocket_doit);
};
func void dia_garwig_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_garwig_pickpocket);
};
func void dia_garwig_pickpocket_back()
{
        Info_ClearChoices(dia_garwig_pickpocket);
};
