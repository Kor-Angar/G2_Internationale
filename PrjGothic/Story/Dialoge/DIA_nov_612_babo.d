instance DIA_BABO_KAP1_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap1_exit_condition;
        information = dia_babo_kap1_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap1_exit_condition()
{
        if(KAPITEL == 1)
        {
                return TRUE;
        };
};
func void dia_babo_kap1_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_HELLO(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_hello_condition;
        information = dia_babo_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_babo_hello_condition()
{
        if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_hello_info()
{
        B_AI_Output(self,other,"DIA_Babo_Hello_03_00");   //(испуганно) Привет, ты тоже новичок здесь, да?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_01");   //Да. Ты давно здесь?
        B_AI_Output(self,other,"DIA_Babo_Hello_03_02");   //Четыре недели. Тебе уже выдали боевой посох?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_03");   //Пока нет.
        B_AI_Output(self,other,"DIA_Babo_Hello_03_04");   //Тогда возьми вот этот. Мы, послушники всегда ходим с посохом, чтобы показать, что мы способны защитить себя. Ты умеешь сражаться?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_05");   //Ну, мне случалось пользоваться оружием...
        B_AI_Output(self,other,"DIA_Babo_Hello_03_06");   //Если хочешь, я могу обучить тебя кое-чему. Но у меня есть просьба...
        CreateInvItems(other,itmw_1h_nov_mace,1);
        AI_PrintScreen("Боевой посох получено",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
};
instance DIA_BABO_ANLIEGEN(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_anliegen_condition;
        information = dia_babo_anliegen_info;
        permanent = FALSE;
        description = "Что за просьба?";
};
func int dia_babo_anliegen_condition()
{
        if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
        {
                return TRUE;
        };
};
func void dia_babo_anliegen_info()
{
        B_AI_Output(other,self,"DIA_Babo_Anliegen_15_00");        //Что за просьба?
        B_AI_Output(self,other,"DIA_Babo_Anliegen_03_01");        //Ну, один из паладинов, Сержио, сейчас живет в монастыре.
        B_AI_Output(self,other,"DIA_Babo_Anliegen_03_02");        //Если ты сможешь убедить его дать мне несколько уроков, тогда я потренирую тебя.
        B_AI_Output(other,self,"DIA_Babo_Anliegen_15_03");        //Я посмотрю, что можно сделать.
        Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
        b_logentry(TOPIC_BABOTRAIN,TOPIC_BABOTRAIN_description_304); // "Если я смогу убедить паладина Сержио немного потренироваться с Бабо он научит меня искусству обращения с двуручным оружием."
};
instance DIA_BABO_SERGIO(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_sergio_condition;
        information = dia_babo_sergio_info;
        permanent = FALSE;
        description = "Я поговорил с Сержио.";
};
func int dia_babo_sergio_condition()
{
        if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_sergio_info()
{
        B_AI_Output(other,self,"DIA_Babo_Sergio_15_00");  //Я поговорил с Сержио. Он будет тренировать тебя по два часа каждое утро, с пяти часов.
        B_AI_Output(self,other,"DIA_Babo_Sergio_03_01");  //Спасибо! Какая честь для меня!
        B_AI_Output(self,other,"DIA_Babo_Sergio_03_02");  //Если хочешь, я также могу показать тебе несколько секретов боевого искусства.
        BABO_TEACHPLAYER = TRUE;
        BABO_TRAINING = TRUE;
        b_giveplayerxp(XP_AMBIENT * 2);
        Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
        b_logentry(TOPIC_KLOSTERTEACHER,TOPIC_KLOSTERTEACHER_description_305); // "Бабо может обучить меня искусству обращения с двуручным оружием."
};
instance DIA_BABO_TEACH(C_INFO)
{
        npc = nov_612_babo;
        nr = 100;
        condition = dia_babo_teach_condition;
        information = dia_babo_teach_info;
        permanent = TRUE;
        description = "Я готов к обучению.";
};
var int dia_babo_teach_permanent;
var int babo_labercount;
func int dia_babo_teach_condition()
{
        if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
        {
                return TRUE;
        };
};
var int babo_merk2h;
func void dia_babo_teach_info()
{
        BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
        B_AI_Output(other,self,"DIA_Babo_Teach_15_00");   //Я готов к обучению.
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
func void dia_babo_teach_back()
{
        if(other.hitchance[NPC_TALENT_2H] >= 70)
        {
                B_AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");  //Ты знаешь больше о двуручном оружии, чем я мог бы научить тебя.
                DIA_BABO_TEACH_PERMANENT = TRUE;
        };
        Info_ClearChoices(dia_babo_teach);
};
func void dia_babo_teach_2h_1()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,70);
        if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
        {
                if(BABO_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");       //Сражайся за Инноса. Иннос - наша жизнь, и твоя вера придаст тебе силы.
                };
                if(BABO_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");       //Слуга Инноса никогда не провоцирует противника - он удивляет его!
                };
                if(BABO_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");       //Куда бы ты ни шел - всегда бери с собой свой посох.
                };
                if(BABO_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");       //Слуга Инноса всегда готов к бою. Если у тебя нет никакой магии, твой посох - твой самый важный элемент обороны.
                };
                BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
                if(BABO_LABERCOUNT >= 3)
                {
                        BABO_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
func void dia_babo_teach_2h_5()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,70);
        if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
        {
                if(BABO_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");  //Слуга Инноса сражается не только своим посохом, но также и своим сердцем.
                };
                if(BABO_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");  //Ты должен понимать, до какого предела ты можешь отступить.
                };
                if(BABO_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");  //Помни, ты хорошо сражаешься, когда ты контролируешь противника и не даешь ему шанса контролировать себя.
                };
                if(BABO_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");  //Когда ты бросаешь бой, ты только теряешь.
                };
                BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
                if(BABO_LABERCOUNT >= 3)
                {
                        BABO_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
instance DIA_BABO_WURST(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_wurst_condition;
        information = dia_babo_wurst_info;
        permanent = FALSE;
        description = "Вот, держи колбасу.";
};
func int dia_babo_wurst_condition()
{
        if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
        {
                return TRUE;
        };
};
func void dia_babo_wurst_info()
{
        var string novizetext;
        var string novizeleft;
        B_AI_Output(other,self,"DIA_Babo_Wurst_15_00");   //Вот, держи колбасу.
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_01");   //Ох, баранья колбаса, отлично! Какой потрясающий вкус - дай мне еще одну колбаску!
        B_AI_Output(other,self,"DIA_Babo_Wurst_15_02");   //Тогда у меня не хватит колбасы для других.
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_03");   //У тебя все равно на одну колбаску больше, чем нужно. Ну, на ту, что предназначена для тебя. Мы же друзья. Что мы будем делить какую-то колбасу?
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_04");   //Ну же, я дам тебе за нее свиток 'Огненная стрела'.
        b_giveinvitems(other,self,itfo_schafswurst,1);
        WURST_GEGEBEN = WURST_GEGEBEN + 1;
        CreateInvItems(self,itfo_sausage,1);
        b_useitem(self,itfo_sausage);
        novizeleft = IntToString(13 - WURST_GEGEBEN);
        novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
        AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
        Info_ClearChoices(dia_babo_wurst);
        if(Npc_HasItems(other,itfo_schafswurst) >= 1)
        {
                Info_AddChoice(dia_babo_wurst,dia_babo_wurst_ja_description,dia_babo_wurst_ja); // "Хорошо держи еще одну колбасу."
        };
        Info_AddChoice(dia_babo_wurst,dia_babo_wurst_nein_description,dia_babo_wurst_nein); // "Нет я не сделаю этого."
};
func void dia_babo_wurst_ja()
{
        B_AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");        //Хорошо, держи еще одну колбасу.
        B_AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");        //Отлично. Вот твой свиток.
        b_giveinvitems(other,self,itfo_schafswurst,1);
        b_giveinvitems(self,other,itsc_firebolt,1);
        Info_ClearChoices(dia_babo_wurst);
};
func void dia_babo_wurst_nein()
{
        B_AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");      //Нет, я не сделаю этого.
        B_AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");      //Слушай, ты что, один из тех людей, что очень щепетильно относятся ко всему, а?
        Info_ClearChoices(dia_babo_wurst);
};
instance DIA_BABO_YOUANDAGON(C_INFO)
{
        npc = nov_612_babo;
        nr = 3;
        condition = dia_babo_youandagon_condition;
        information = dia_babo_youandagon_info;
        permanent = FALSE;
        description = "Что произошло между тобой и Агоном?";
};
func int dia_babo_youandagon_condition()
{
        if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_youandagon_info()
{
        B_AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");      //Что произошло между тобой и Агоном?
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");      //Ох, мы поспорили о том, как нужно ухаживать за огненной крапивой.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");      //Агон поливал ее так, что корни бедного растения почти совсем сгнили.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");      //А когда они сгнили совсем, он обвинил в этом меня.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");      //Теперь меня постоянно заставляют подметать двор в наказание.
};
instance DIA_BABO_WHYDIDAGON(C_INFO)
{
        npc = nov_612_babo;
        nr = 4;
        condition = dia_babo_whydidagon_condition;
        information = dia_babo_whydidagon_info;
        permanent = FALSE;
        description = "Зачем Агон сделал это?";
};
func int dia_babo_whydidagon_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_whydidagon_info()
{
        B_AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");      //Зачем Агон сделал это?
        B_AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");      //Тебе лучше самому спросить его об этом. Я думаю, он просто не выносит, когда кто-то оказывается лучше его.
};
instance DIA_BABO_PLANTLORE(C_INFO)
{
        npc = nov_612_babo;
        nr = 5;
        condition = dia_babo_plantlore_condition;
        information = dia_babo_plantlore_info;
        permanent = FALSE;
        description = "Похоже ты хорошо разбираешься в растениях?";
};
func int dia_babo_plantlore_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_plantlore_info()
{
        B_AI_Output(other,self,"DIA_Babo_PlantLore_15_00");       //Похоже ты хорошо разбираешься в растениях?
        B_AI_Output(self,other,"DIA_Babo_PlantLore_03_01");       //У нас в семье была делянка, где мы выращивали различные травы, и я научился кое-чему у дедушки.
        B_AI_Output(self,other,"DIA_Babo_PlantLore_03_02");       //Я бы так хотел опять работать в саду.
        MIS_HELPBABO = LOG_RUNNING;
        Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
        b_logentry(TOPIC_BABOGAERTNER,TOPIC_BABOGAERTNER_description_306); // "Бабо предпочел бы пропалывать травы чем подметать двор."
};
instance DIA_BABO_FEGEN(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_fegen_condition;
        information = dia_babo_fegen_info;
        permanent = FALSE;
        description = "Я должен подметать кельи послушников.";
};
func int dia_babo_fegen_condition()
{
        if(MIS_PARLANFEGEN == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_babo_fegen_info()
{
        B_AI_Output(other,self,"DIA_Babo_Fegen_15_00");   //Я должен подметать кельи послушников.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_01");   //Ты взвалил на себя слишком много работы. Знаешь что - я помогу тебе. Тебе ни за что не справиться одному.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_02");   //Но мне очень нужен свиток с заклинанием 'Кулак Ветра'. Знаешь, мне повезло, и мне было позволено прочесть книгу о нем.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_03");   //И теперь, естественно, я хочу испытать это заклинание. Так что если ты принесешь мне этот свиток, я помогу тебе.
        b_logentry(TOPIC_PARLANFEGEN,TOPIC_PARLANFEGEN_description_307); // "Бабо поможет мне подмести кельи послушников если я принесу ему свиток с заклинанием Кулак ветра."
};
instance DIA_BABO_WINDFAUST(C_INFO)
{
        npc = nov_612_babo;
        nr = 3;
        condition = dia_babo_windfaust_condition;
        information = dia_babo_windfaust_info;
        permanent = TRUE;
        description = "Насчет свитка с заклинанием... (ОТДАТЬ КУЛАК ВЕТРА)";
};
var int dia_babo_windfaust_permanent;
func int dia_babo_windfaust_condition()
{
        if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
func void dia_babo_windfaust_info()
{
        B_AI_Output(other,self,"DIA_Babo_Windfaust_15_00");       //Насчет свитка...
        B_AI_Output(self,other,"DIA_Babo_Windfaust_03_01");       //У тебя есть свиток 'Кулак Ветра' для меня?
        if(b_giveinvitems(other,self,itsc_windfist,1))
        {
                B_AI_Output(other,self,"DIA_Babo_Windfaust_15_02");       //Вот свиток, который ты хотел получить.
                B_AI_Output(self,other,"DIA_Babo_Windfaust_03_03");       //Отлично. Тогда я помогу тебе подметать кельи.
                NOV_HELFER = NOV_HELFER + 1;
                DIA_BABO_WINDFAUST_PERMANENT = TRUE;
                b_giveplayerxp(XP_FEGER);
                AI_StopProcessInfos(self);
                Npc_ExchangeRoutine(self,"FEGEN");
                b_logentry(TOPIC_PARLANFEGEN,TOPIC_PARLANFEGEN_description_308); // "Бабо поможет мне подмести кельи послушников."
        }
        else
        {
                B_AI_Output(other,self,"DIA_Babo_Windfaust_15_04");       //Нет, пока нет.
                B_AI_Output(self,other,"DIA_Babo_Windfaust_03_05");       //Ничего, я подожду.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_LIFE(C_INFO)
{
        npc = nov_612_babo;
        nr = 10;
        condition = dia_babo_life_condition;
        information = dia_babo_life_info;
        permanent = TRUE;
        description = "Как жизнь в монастыре?";
};
func int dia_babo_life_condition()
{
        if(other.guild == GIL_NOV)
        {
                return TRUE;
        };
};
func void dia_babo_life_info()
{
        B_AI_Output(other,self,"DIA_Babo_Life_15_00");    //Как жизнь в монастыре?
        B_AI_Output(self,other,"DIA_Babo_Life_03_01");    //Не хочу жаловаться, но я никогда не думал, что здесь такие жесткие правила. Если ты не нарушаешь правила, тебя наказывают.
        B_AI_Output(self,other,"DIA_Babo_Life_03_02");    //Конечно, многие послушники хотят изучать учения Инноса в библиотеке, чтобы подготовиться стать избранными.
        B_AI_Output(self,other,"DIA_Babo_Life_03_03");    //Но я думаю, что лучшая подготовка к испытанию магией - это тщательно выполнять нашу работу.
        if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
        {
                B_AI_Output(other,self,"DIA_Babo_Life_15_04");    //Что ты там говорил об избранных, и что за испытание?
                B_AI_Output(self,other,"DIA_Babo_Life_03_05");    //Поговори с братом Игарацем. Он больше знает об этом.
        };
};
instance DIA_BABO_HOWISIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 1;
        condition = dia_babo_howisit_condition;
        information = dia_babo_howisit_info;
        permanent = TRUE;
        description = "Как ты?";
};
func int dia_babo_howisit_condition()
{
        if((hero.guild == GIL_KDF) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
var int babo_xpgiven;
func void dia_babo_howisit_info()
{
        B_AI_Output(other,self,"DIA_Babo_HowIsIt_15_00"); //Как дела?
        if(MIS_HELPBABO == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_01"); //(робко) Я благодарю магов за данные мне поручения.
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_02"); //Мне нравится работать в саду, и я надеюсь, что маги довольны мной, Мастер.
                if(BABO_XPGIVEN == FALSE)
                {
                        b_giveplayerxp(XP_AMBIENT);
                        BABO_XPGIVEN = TRUE;
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_03"); //(испуганно) Х... х... хорошо, Мастер.
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_04"); //Я, я усердно работаю и пытаюсь не разочаровать магов.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP2_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap2_exit_condition;
        information = dia_babo_kap2_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap2_exit_condition()
{
        if(KAPITEL == 2)
        {
                return TRUE;
        };
};
func void dia_babo_kap2_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP3_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap3_exit_condition;
        information = dia_babo_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_babo_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP3_HELLO(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_hello_condition;
        information = dia_babo_kap3_hello_info;
        permanent = FALSE;
        description = "Что ты делаешь здесь?";
};
func int dia_babo_kap3_hello_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_babo_kap3_hello_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");      //Что ты делаешь здесь?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");      //(застенчиво) Я пытаюсь выполнить задания, данные мне, так, чтобы маги монастыря остались довольны.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");      //Я не должен говорить с тобой. Вряд ли это послужит мне на пользу, если заметят, что я говорю с чужаком.
        };
};
instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_keepthefaith_condition;
        information = dia_babo_kap3_keepthefaith_info;
        permanent = FALSE;
        description = "Ты не должен терять веры.";
};
func int dia_babo_kap3_keepthefaith_condition()
{
        if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_keepthefaith_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");       //Ты не должен терять веры.
        B_AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");       //(застигнутый врасплох) Нет... Я хочу сказать, это больше не повторится. Клянусь!
        B_AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");       //Мы все проходим через суровые испытания.
        B_AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");       //Да, Мастер. Я буду всегда помнить это. Спасибо.
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_unhappy_condition;
        information = dia_babo_kap3_unhappy_info;
        permanent = FALSE;
        description = "Ты не выглядишь особенно веселым.";
};
func int dia_babo_kap3_unhappy_condition()
{
        if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_unhappy_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");    //Ты не выглядишь особенно веселым.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");    //(застигнутый врасплох) Эээ... я хочу сказать, со мной все в порядке, правда.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");    //Только... Ох, я не хочу жаловаться.
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_lament_description,dia_babo_kap3_unhappy_lament); // "Тогда прекрати хныкать."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_tellme_description,dia_babo_kap3_unhappy_tellme); // "Да ладно мне-то ты можешь сказать."
};
func void dia_babo_kap3_unhappy_lament()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");     //Тогда прекрати хныкать.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");     //(испуганно) Я... Я... пожалуйста, не говори магам.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");     //Я не хочу, чтобы меня опять наказали.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");     //Я подумаю над этим.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_tellme()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");     //Да ладно, мне-то ты можешь сказать.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");     //А ты правда не скажешь магам?
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");     //Я похож на того, кто сразу бежит докладывать?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");     //Ну, хорошо. У меня проблемы с одним из послушников. Он шантажирует меня.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");     //Давай, выкладывай.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");     //Игарац, так зовут этого послушника, нашел мои личные записи.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");     //Он угрожает передать их магам, если я не буду делать то, что он говорит.
        MIS_BABOSDOCS = LOG_RUNNING;
        Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
        b_logentry(TOPIC_BABOSDOCS,TOPIC_BABOSDOCS_description_309); // "Игарац шантажирует послушника Бабо какими-то документами."
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_privat_description,dia_babo_kap3_unhappy_privat); // "Я думаю что мне не стоит влезать в эти дрязги."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_shoulddo_description,dia_babo_kap3_unhappy_shoulddo); // "Что ты должен делать для него?"
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_documents_description,dia_babo_kap3_unhappy_documents); // "Что это были за записи?"
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_canhelpyou_description,dia_babo_kap3_unhappy_canhelpyou); // "Может быть я могу помочь тебе?"
};
func void dia_babo_kap3_unhappy_privat()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");     //Я думаю, что мне не стоит влезать в эти дрязги.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");     //Я понимаю, тебе не нужны проблемы. Я сам с этим как-нибудь разберусь.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");     //Я верю, ты справишься.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_shoulddo()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");   //Что ты должен делать для него?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");   //Мне так стыдно говорить. Это все не понравится Инносу.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");   //Мне даже думать не хочется, что будет, если все раскроется.
};
func void dia_babo_kap3_unhappy_documents()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");  //Что это были за записи?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");  //(неуверенно) Это никого не касается. Это мое личное дело.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");  //Да ладно, говори.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");  //Они... это... абсолютно нормальные записи. Ничего особенного.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");  //Я больше не буду спрашивать.
};
func void dia_babo_kap3_unhappy_canhelpyou()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //Может быть, я могу помочь тебе?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //Ты сделаешь это?
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //Ну... возможно... это зависит от...
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(поспешно) Конечно же, я заплачу тебе за это.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //Сколько?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //Ну, у меня не так много денег, но я мог бы дать тебе свиток с заклинанием. У меня есть лечебное заклинание.
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_no_description,dia_babo_kap3_unhappy_no); // "Я лучше не буду связываться с этим."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_yes_description,dia_babo_kap3_unhappy_yes); // "Я попробую."
};
func void dia_babo_kap3_unhappy_no()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00"); //Я лучше не буду связываться с этим.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //Тогда у меня нет выбора, мне придется выпутываться самому.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_yes()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");        //Я посмотрю, что можно сделать.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");        //(счастливо) Правда?! Я знаю, у тебя получится. Я верю!
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");        //Тебе нужно только выяснить, где Игарац держит свои вещи. Затем ты выкрадешь их у него, и все будет в порядке.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");        //Расслабься. Продолжай работать. А я позабочусь об остальном.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_haveyourdocs_condition;
        information = dia_babo_kap3_haveyourdocs_info;
        permanent = FALSE;
        description = "Я нашел твои записки.";
};
func int dia_babo_kap3_haveyourdocs_condition()
{
        if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_haveyourdocs_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");       //Я нашел твои записки.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");       //Правда? Спасибо, ты спас меня. Я даже не знаю, как благодарить тебя.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");       //Да, да, просто успокойся.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");       //(нервно) Это действительно мои? Ты уверен? Покажи мне.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_description,dia_babo_kap3_haveyourdocs_keepthem); // "Я подержу их пока у себя."
        if(BABOSDOCSOPEN == TRUE)
        {
                Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_description,dia_babo_kap3_haveyourdocs_iwantmore); // "Теперь учитывая все обстоятельства цена выросла."
        };
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_heretheyare_description,dia_babo_kap3_haveyourdocs_heretheyare); // "Вот держи."
};
func void dia_babo_kap3_haveyourdocs_keepthem()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");      //Я подержу их пока у себя .
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");      //(ошеломленно) Что?! Что это все значит? Что ты задумал?
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_justjoke_description,dia_babo_kap3_haveyourdocs_keepthem_justjoke); // "Просто шучу."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_myconcern_description,dia_babo_kap3_haveyourdocs_keepthem_myconcern); // "Это мое дело."
        if(IGARAZ_ISPARTNER == LOG_SUCCESS)
        {
                Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_description,dia_babo_kap3_haveyourdocs_keepthem_partner); // "Игарац и я теперь партнеры."
        };
};
func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");     //Просто шучу.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");     //(кисло) Ха-ха, но мне что-то не смешно. Где же они?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");     //Здесь.
        if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
        {
                b_giveinvitems(other,self,itwr_babosdocs_mis,1);
        }
        else
        {
                b_giveinvitems(other,self,itwr_babospinup_mis,1);
                b_giveinvitems(other,self,itwr_babosletter_mis,1);
        };
        b_usefakescroll();
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");     //Я не хотел обидеть тебя, но я просто очень переживаю.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");     //Все хорошо. Наслаждайся своими записками.
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");    //Это мое дело.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");    //Эти записи принадлежат мне. Ты не имеешь права забирать их себе.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");    //Еще увидимся.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");      //Игарац и я теперь партнеры.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");      //(ошеломленно) Что? Ты не можешь поступить со мной так.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");      //А я думаю, что могу. Я придержу у себя эти бумаги, пусть все пока останется так, как есть.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");      //Я должен обговорить финансовую часть с Игарацем.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");      //А ты пока занимайся своими растениями.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");      //Ты свинья. Презренная жадная свинья. Иннос покарает тебя.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm_description,dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm); // "Придержи язык."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo_description,dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo); // "Тебе что нечем заняться?"
};
func void dia_babo_kap3_haveyourdocs_end()
{
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");     //Придержи язык.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");     //Я буду вежлив как всегда.
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");   //Тебе что, нечем заняться?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");   //Я все понимаю, но, поверь мне, ты пожалеешь об этом.
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_iwantmore()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");     //Теперь, учитывая все обстоятельства, цена выросла.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");     //Ту не лучше остальных. Чего ты хочешь?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");     //А что у тебя есть?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");     //Я могу дать тебе 121 золотую монету - это все, что у меня есть.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_notenough_description,dia_babo_kap3_haveyourdocs_iwantmore_notenough); // "Этого недостаточно."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_thatsenough_description,dia_babo_kap3_haveyourdocs_iwantmore_thatsenough); // "Договорились."
};
func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");   //Этого недостаточно.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");   //Но у меня нет больше денег. Если бы я знал об этом раньше, ноги бы моей не было в монастыре.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //Договорились.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //Вот деньги, и свиток.
        CreateInvItems(self,itsc_mediumheal,1);
        CreateInvItems(self,itmi_gold,121);
        b_giveinvitems(self,other,itsc_mediumheal,1);
        b_giveinvitems(self,other,itmi_gold,121);
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_heretheyare()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");   //Вот, держи.
        if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
        {
                b_giveinvitems(other,self,itwr_babosdocs_mis,1);
        }
        else
        {
                b_giveinvitems(other,self,itwr_babospinup_mis,1);
                b_giveinvitems(other,self,itwr_babosletter_mis,1);
        };
        b_usefakescroll();
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");   //Да, все на месте.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");   //Ты читал их?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");   //Это имеет какое-то значение?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");   //Нет, когда они у меня в руках.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");   //Теперь я надеюсь, что смогу опять спать спокойно.
        CreateInvItems(self,itsc_mediumheal,1);
        b_giveinvitems(self,other,itsc_mediumheal,1);
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
instance DIA_BABO_KAP3_PERM(C_INFO)
{
        npc = nov_612_babo;
        nr = 39;
        condition = dia_babo_kap3_perm_condition;
        information = dia_babo_kap3_perm_info;
        permanent = TRUE;
        description = "Ты доволен своей работой?";
};
func int dia_babo_kap3_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_perm_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");       //Ты доволен своей работой?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");       //(неубедительно) Да, конечно. Моя вера в мудрость и силу Инноса придает мне силы.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");       //(уклончиво) Я не хочу показаться невежливым, но у меня много дел сегодня.
                B_AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");       //Можешь продолжать.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");       //(облегченно) Спасибо.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");       //Все хорошо, но мне нужно возвращаться к работе, иначе мне ни за что не закончить ее сегодня.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");       //Я не хочу опять трудиться до полуночи, чтобы выполнить свою работу и не быть наказанным.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP4_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap4_exit_condition;
        information = dia_babo_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_babo_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP5_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap5_exit_condition;
        information = dia_babo_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_babo_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_PICKPOCKET(C_INFO)
{
        npc = nov_612_babo;
        nr = 900;
        condition = dia_babo_pickpocket_condition;
        information = dia_babo_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_20;
};
func int dia_babo_pickpocket_condition()
{
        return c_beklauen(17,25);
};
func void dia_babo_pickpocket_info()
{
        Info_ClearChoices(dia_babo_pickpocket);
        Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
        Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};
func void dia_babo_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_babo_pickpocket);
};
func void dia_babo_pickpocket_back()
{
        Info_ClearChoices(dia_babo_pickpocket);
};
