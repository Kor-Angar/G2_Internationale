instance DIA_SEKOB_EXIT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 999;
        condition = dia_sekob_exit_condition;
        information = dia_sekob_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sekob_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_sekob_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_HALLO(C_INFO)
{
        npc = bau_930_sekob;
        nr = 3;
        condition = dia_sekob_hallo_condition;
        information = dia_sekob_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_sekob_hallo_condition()
{
        if((KAPITEL < 3) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_hallo_info()
{
        B_AI_Output(self,other,"DIA_Sekob_HALLO_01_00");  //Что ты делаешь на моей земле? Здесь нечего украсть. Проваливай.
        B_AI_Output(other,self,"DIA_Sekob_HALLO_15_01");  //Неужели в этой проклятой стране нет ни клочка земли, который никому не принадлежит?
        B_AI_Output(self,other,"DIA_Sekob_HALLO_01_02");  //А ты займись делом, тогда, возможно, когда-нибудь и ты сможешь назвать кусок земли своей собственностью. Но до той поры, будь добр, бей баклуши где-нибудь в другом месте.
};
instance DIA_SEKOB_PERMVORMIS(C_INFO)
{
        npc = bau_930_sekob;
        nr = 3;
        condition = dia_sekob_permvormis_condition;
        information = dia_sekob_permvormis_info;
        permanent = TRUE;
        description = "Послушай...";
};
func int dia_sekob_permvormis_condition()
{
        if((KAPITEL < 3) && (MIS_TORLOF_HOLPACHTVONSEKOB == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_permvormis_info()
{
        B_AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");     //Послушай...
        B_AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");     //У меня сейчас нет для тебя никакой работы. Уходи!
};
instance DIA_SEKOB_ZAHLPACHT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 5;
        condition = dia_sekob_zahlpacht_condition;
        information = dia_sekob_zahlpacht_info;
        permanent = FALSE;
        description = "Онар хочет, чтобы ты, наконец, заплатил ренту.";
};
func int dia_sekob_zahlpacht_condition()
{
        if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_sekob_zahlpacht_info()
{
        B_AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");      //Эта земля принадлежит крупному землевладельцу. Ты здесь всего лишь арендатор. Онар хочет, чтобы ты, наконец, заплатил ренту. Ты должен был сделать это еще несколько недель назад.
        B_AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");      //Что? И он послал бандита вроде тебя? Да ты сам не веришь в это!
        B_AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");      //Убирайся отсюда, пока я не вышел из себя.
        self.aivar[AIV_DEFEATEDBYPLAYER] = FALSE;
};
instance DIA_SEKOB_KOHLERAUS(C_INFO)
{
        npc = bau_930_sekob;
        nr = 5;
        condition = dia_sekob_kohleraus_condition;
        information = dia_sekob_kohleraus_info;
        permanent = TRUE;
        description = "Давай сюда деньги, или я выбью тебе последние зубы.";
};
func int dia_sekob_kohleraus_condition()
{
        if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_kohleraus_info()
{
        B_AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");      //Давай сюда деньги, или я выбью тебе последние зубы.
        B_AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");      //Ты не получишь ни цента из моего кошелька, преступник. ТОЛЬКО НЕ ТЫ!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_SEKOB_INFORMONAR(C_INFO)
{
        npc = bau_930_sekob;
        nr = 5;
        condition = dia_sekob_informonar_condition;
        information = dia_sekob_informonar_info;
        permanent = FALSE;
        description = "Тогда мне придется доложить об этом Онару.";
};
func int dia_sekob_informonar_condition()
{
        if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_informonar_info()
{
        B_AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");     //Тогда мне придется доложить об этом Онару.
        B_AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");     //Меня это не волнует! Можешь сказать Онару, что у меня ничего нет. Это печальная правда.
        MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_DEFEATED(C_INFO)
{
        npc = bau_930_sekob;
        nr = 5;
        condition = dia_sekob_defeated_condition;
        information = dia_sekob_defeated_info;
        permanent = FALSE;
        description = "Где ты хранишь деньги?!";
};
func int dia_sekob_defeated_condition()
{
        if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) && Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (SEKOB_PACHTBEZAHLT == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_defeated_info()
{
        B_AI_Output(other,self,"DIA_Sekob_Defeated_15_00");       //Где ты хранишь деньги?!
        B_AI_Output(self,other,"DIA_Sekob_Defeated_01_01");       //Не бей меня больше, пожалуйста. Я сделаю все, что ты скажешь.
        B_AI_Output(other,self,"DIA_Sekob_Defeated_15_02");       //Заплати ренту.
        B_AI_Output(self,other,"DIA_Sekob_Defeated_01_03");       //(хныча) Но, господин, у меня ничего нет. Я простой бедняк, я сам пухну от голода.
        B_AI_Output(self,other,"DIA_Sekob_Defeated_01_04");       //Мой последний урожай полностью погиб от засухи. Я ХОЧУ заплатить ренту, но мне просто НЕЧЕМ. Мне очень жаль.
        Info_ClearChoices(dia_sekob_defeated);
        Info_AddChoice(dia_sekob_defeated,dia_sekob_defeated_hart_description,dia_sekob_defeated_hart); // "Заплати ренту или я убью тебя."
        Info_AddChoice(dia_sekob_defeated,dia_sekob_defeated_weich_description,dia_sekob_defeated_weich); // "Хорошо я поговорю с Онаром."
};
func void dia_sekob_defeated_weich()
{
        B_AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00"); //Хорошо, я поговорю с Онаром.
        B_AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01"); //Спасибо, господин. Огромное спасибо!
        MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
        AI_StopProcessInfos(self);
};
func void b_sekob_kassieren()
{
        B_AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");      //Хватит нести чушь. Дожди шли почти не переставая, и твои закрома ломятся от зерна. Заплати ренту, или я убью тебя.
        B_AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");      //(подобострастно) Нет, пожалуйста, вот, возьми золото. Я даже прибавлю сверху, если ты оставишь меня в живых.
        b_giveinvitems(self,other,itmi_gold,60);
        B_AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");      //Вот видишь, это было не так уж и сложно.
        B_AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");      //(в отчаянии) Я разорен.
        SEKOB_PACHTBEZAHLT = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_sekob_defeated_hart()
{
        b_sekob_kassieren();
};
instance DIA_SEKOB_AGAIN(C_INFO)
{
        npc = bau_930_sekob;
        nr = 5;
        condition = dia_sekob_again_condition;
        information = dia_sekob_again_info;
        permanent = TRUE;
        description = "Насчет ренты...";
};
func int dia_sekob_again_condition()
{
        if((MIS_SEKOB_REDEMITONAR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sekob_defeated) && (SEKOB_PACHTBEZAHLT == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_again_info()
{
        B_AI_Output(other,self,"DIA_Sekob_Again_15_00");  //Насчет ренты...
        B_AI_Output(self,other,"DIA_Sekob_Again_01_01");  //Ты поговоришь с Онаром, правда?
        Info_ClearChoices(dia_sekob_again);
        Info_AddChoice(dia_sekob_again,dia_sekob_again_nein_description,dia_sekob_again_nein); // "Я передумал."
        if(ONAR_WEGENSEKOB == TRUE)
        {
                Info_AddChoice(dia_sekob_again,dia_sekob_again_verarscht_description,dia_sekob_again_verarscht); // "Я поговорил..."
        }
        else
        {
                Info_AddChoice(dia_sekob_again,dia_sekob_again_ja_description,dia_sekob_again_ja); // "Конечно."
        };
};
func void dia_sekob_again_nein()
{
        B_AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");     //Я передумал.
        b_sekob_kassieren();
};
func void dia_sekob_again_ja()
{
        B_AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");       //Конечно.
        B_AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");       //У тебя получится.
        AI_StopProcessInfos(self);
};
func void dia_sekob_again_verarscht()
{
        MIS_SEKOB_REDEMITONAR = LOG_SUCCESS;
        B_AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");        //Я поговорил...
        B_AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");        //И? Что он сказал?
        B_AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");        //Извини, но теперь мне придется оторвать тебе голову.
        B_AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");        //За что? Что я такого сделал?
        B_AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");        //Ты пытался провести меня.
        B_AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");        //Я сказал правду - честно!
        b_sekob_kassieren();
};
instance DIA_SEKOB_PERMKAP1(C_INFO)
{
        npc = bau_930_sekob;
        nr = 6;
        condition = dia_sekob_permkap1_condition;
        information = dia_sekob_permkap1_info;
        permanent = TRUE;
        description = "В следующий раз ты заплатишь вовремя, понятно?";
};
func int dia_sekob_permkap1_condition()
{
        if((SEKOB_PACHTBEZAHLT == TRUE) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_sekob_permkap1_info()
{
        B_AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");       //В следующий раз ты заплатишь вовремя, понятно?
        B_AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");       //(себе под нос) Что я сделал, чтобы заслужить такое...
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_KAP3_EXIT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 999;
        condition = dia_sekob_kap3_exit_condition;
        information = dia_sekob_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sekob_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_sekob_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_DMT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 30;
        condition = dia_sekob_dmt_condition;
        information = dia_sekob_dmt_info;
        description = "Что-нибудь случилось?";
};
func int dia_sekob_dmt_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_sekob_dmt_info()
{
        B_AI_Output(other,self,"DIA_Sekob_DMT_15_00");    //Что-нибудь случилось?
        B_AI_Output(self,other,"DIA_Sekob_DMT_01_01");    //Ты должен помочь мне. Мой дом заняли люди в черных рясах.
        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
        {
                B_AI_Output(self,other,"DIA_Sekob_DMT_01_02");    //Вы, слуги короля, ведь должны заботиться о населении, правда?
        };
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Sekob_DMT_01_03");    //Я знаю, что вы, наемники, не занимаетесь благотворительностью, но я заплачу тебе.
        };
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Sekob_DMT_01_04");    //Ты должен помочь мне, о, великий маг.
        };
        B_AI_Output(self,other,"DIA_Sekob_DMT_01_05");    //Эти люди говорят, что кого-то ищут. Но почему в моем доме?!
        B_AI_Output(self,other,"DIA_Sekob_DMT_01_06");    //Пожалуйста, помоги мне. Заставь их убраться.
        Log_CreateTopic(TOPIC_SEKOBDMT,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_SEKOBDMT,LOG_RUNNING);
        b_logentry(TOPIC_SEKOBDMT,TOPIC_SEKOBDMT_description_19); // "Черные маги выгнали Секоба из дома. Секоб хочет чтобы я изгнал их."
};
instance DIA_SEKOB_DMTWEG(C_INFO)
{
        npc = bau_930_sekob;
        nr = 31;
        condition = dia_sekob_dmtweg_condition;
        information = dia_sekob_dmtweg_info;
        description = "Твой дом пуст. Людей в черных рясах больше нет.";
};
func int dia_sekob_dmtweg_condition()
{
        if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_sekob_dmt) && Npc_IsDead(dmt_dementorambientsekob1) && Npc_IsDead(dmt_dementorambientsekob2) && Npc_IsDead(dmt_dementorambientsekob3) && Npc_IsDead(dmt_dementorambientsekob4))
        {
                return TRUE;
        };
};
func void dia_sekob_dmtweg_info()
{
        B_AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00"); //Твой дом пуст. Людей в черных рясах больше нет.
        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
        {
                B_AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01"); //Я знал, что на стражника можно положиться.
        };
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02"); //Ты отлично справился. Онар может гордиться, что на его стороне есть такие люди.
        };
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03"); //Спасибо тебе, о великий маг. Что бы с нами сталось без защиты духовенства?!
        };
        TOPIC_END_SEKOBDMT = TRUE;
        b_giveplayerxp(XP_SEKOBDMTWEG);
        if(KAPITEL < 5)
        {
                Npc_ExchangeRoutine(self,"Start");
        }
        else
        {
                Npc_ExchangeRoutine(self,"Obsessed");
        };
        if(ROSI_FLEEFROMSEKOB_KAP5 == FALSE)
        {
                b_startotherroutine(rosi,"Start");
                b_startotherroutine(till,"Start");
        };
        if(BalthasarMovedToBengar == FALSE)
        {
                b_startotherroutine(balthasar,"Start");
        };
        b_startotherroutine(bau_933_rega,"Start");
        b_startotherroutine(bau_934_babera,"Start");
        b_startotherroutine(bau_937_bauer,"Start");
        b_startotherroutine(bau_938_bauer,"Start");
};
instance DIA_SEKOB_BELOHNUNG(C_INFO)
{
        npc = bau_930_sekob;
        nr = 32;
        condition = dia_sekob_belohnung_condition;
        information = dia_sekob_belohnung_info;
        description = "Не так быстро, мой друг.";
};
func int dia_sekob_belohnung_condition()
{
        if(Npc_KnowsInfo(other,dia_sekob_dmtweg) && (KAPITEL >= 3))
        {
                return TRUE;
        };
};
func void dia_sekob_belohnung_info()
{
        B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");      //Не так быстро, мой друг.
        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
        {
                if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
                {
                        B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");      //Отныне тебе придется оставить свои грязные делишки и встать на путь добра, или я вернусь...
                };
                B_AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");      //Я не понимаю. Что еще тебе нужно?
        };
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");      //Ты что-то там болтал о награде, или мне послышалось?
        };
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");      //Меня интересует только одно. Что эти люди в черных рясах делали в твоем доме?
                B_AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");      //Я сам не понимаю, о, великий маг. Возможно, они...
                B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");      //Что?
                B_AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");      //Прошу извинить меня. Несколько лет назад я поклялся никогда не говорить об этом и не собираюсь нарушать свою клятву.
        };
        B_AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");      //Все, что я могу сделать, - это дать тебе немного золота и просить тебя пощадить меня.
        B_AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");      //Тогда давай его сюда. Я тороплюсь.
        B_AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");      //Вот.
        CreateInvItems(self,itmi_gold,250);
        b_giveinvitems(self,other,itmi_gold,250);
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_PERM(C_INFO)
{
        npc = bau_930_sekob;
        nr = 80;
        condition = dia_sekob_perm_condition;
        information = dia_sekob_perm_info;
        permanent = TRUE;
        description = "Что-нибудь произошло интересного?";
};
func int dia_sekob_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_sekob_belohnung) && (KAPITEL >= 3) && (NPCOBSESSEDBYDMT_SEKOB == FALSE))
        {
                return TRUE;
        };
};
func void dia_sekob_perm_info()
{
        if((hero.guild == GIL_KDF) && (KAPITEL >= 5))
        {
                b_npcobsessedbydmt(self);
        }
        else
        {
                B_AI_Output(other,self,"DIA_Sekob_PERM_15_00");   //Что-нибудь произошло интересного?
                if(MIS_BRINGROSIBACKTOSEKOB == LOG_FAILED)
                {
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_01");   //Проваливай.
                }
                else if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
                {
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_02");   //Нет. Ничего особенного.
                }
                else if((KAPITEL >= 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
                {
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_03");   //Моя жена исчезла. Сначала я не придал этому внимания, но она так и не вернулась.
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_04");   //Я подозреваю, что она убежала в лес, спасаясь от полевых хищников.
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_05");   //Окажи мне услугу: если ты найдешь ее, приведи ее домой.
                        MIS_BRINGROSIBACKTOSEKOB = LOG_RUNNING;
                        Log_CreateTopic(TOPIC_BRINGROSIBACKTOSEKOB,LOG_MISSION);
                        Log_SetTopicStatus(TOPIC_BRINGROSIBACKTOSEKOB,LOG_RUNNING);
                        b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,TOPIC_BRINGROSIBACKTOSEKOB_description_20); // "Жена Секоба Рози пропала. Секоб хочет чтобы она вернулась."
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Sekob_PERM_01_06");   //Ничего с тех пор, как эти негодяи в черном захватили мой дом.
                };
        };
};
instance DIA_SEKOB_KAP4_EXIT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 999;
        condition = dia_sekob_kap4_exit_condition;
        information = dia_sekob_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sekob_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_sekob_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SEKOB_KAP5_EXIT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 999;
        condition = dia_sekob_kap5_exit_condition;
        information = dia_sekob_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sekob_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_sekob_kap5_exit_info()
{
        b_npcclearobsessionbydmt(self);
};
instance DIA_SEKOB_HEILUNG(C_INFO)
{
        npc = bau_930_sekob;
        nr = 55;
        condition = dia_sekob_heilung_condition;
        information = dia_sekob_heilung_info;
        permanent = TRUE;
        description = "У тебя проблема.";
};
func int dia_sekob_heilung_condition()
{
        if((NPCOBSESSEDBYDMT_SEKOB == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 5))
        {
                return TRUE;
        };
};
var int dia_sekob_heilung_onetime;
func void dia_sekob_heilung_info()
{
        B_AI_Output(other,self,"DIA_Sekob_Heilung_15_00");        //У тебя проблема.
        if(DIA_SEKOB_HEILUNG_ONETIME == FALSE)
        {
                B_AI_Output(self,other,"DIA_Sekob_Heilung_01_01");        //Да, это точно. ТЫ моя проблема, грязный маг. Убирайся прочь, пока я не содрал с тебя шкуру живьем.
                B_AI_Output(other,self,"DIA_Sekob_Heilung_15_02");        //(себе под нос) Тяжелый случай.
                b_npcclearobsessionbydmt(self);
                DIA_SEKOB_HEILUNG_ONETIME = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Sekob_Heilung_01_03");        //Ты что, меня не слышишь?!
                B_AI_Output(other,self,"DIA_Sekob_Heilung_15_04");        //(себе под нос) Безнадежный случай.
                b_npcclearobsessionbydmt(self);
                b_attack(self,other,AR_NONE,1);
        };
};
instance DIA_SEKOB_ROSIBACKATSEKOB(C_INFO)
{
        npc = bau_930_sekob;
        nr = 53;
        condition = dia_sekob_rosibackatsekob_condition;
        information = dia_sekob_rosibackatsekob_info;
        description = "Я привел твою жену назад.";
};
func int dia_sekob_rosibackatsekob_condition()
{
        if((KAPITEL >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_sekob_rosibackatsekob_info()
{
        B_AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");        //Я привел твою жену назад.
        B_AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");        //Превосходно. Вот, возьми это за свои труды.
        MIS_BRINGROSIBACKTOSEKOB = LOG_SUCCESS;
        CreateInvItems(self,itmi_gold,650);
        b_giveinvitems(self,other,itmi_gold,650);
        b_giveplayerxp(XP_AMBIENT);
        b_npcclearobsessionbydmt(self);
        b_startotherroutine(rosi,"Start");
        b_startotherroutine(till,"Start");
};
instance DIA_SEKOB_ROSINEVERBACK(C_INFO)
{
        npc = bau_930_sekob;
        nr = 56;
        condition = dia_sekob_rosineverback_condition;
        information = dia_sekob_rosineverback_info;
        description = "Рози никогда не вернется к тебе.";
};
func int dia_sekob_rosineverback_condition()
{
        if((MIS_BRINGROSIBACKTOSEKOB == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
        {
                return TRUE;
        };
};
func void dia_sekob_rosineverback_info()
{
        B_AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");  //Рози никогда не вернется к тебе. Я отвел ее в безопасное место.
        B_AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");  //Безопасное. От кого?
        B_AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");  //От тебя.
        B_AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");  //Ты пожалеешь об этом, грязная свинья.
        b_npcclearobsessionbydmt(self);
        b_attack(self,other,AR_NONE,1);
        b_giveplayerxp(XP_AMBIENT);
        MIS_BRINGROSIBACKTOSEKOB = LOG_FAILED;
};
instance DIA_SEKOB_KAP6_EXIT(C_INFO)
{
        npc = bau_930_sekob;
        nr = 999;
        condition = dia_sekob_kap6_exit_condition;
        information = dia_sekob_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sekob_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_sekob_kap6_exit_info()
{
        b_npcclearobsessionbydmt(self);
};
instance DIA_SEKOB_PICKPOCKET(C_INFO)
{
        npc = bau_930_sekob;
        nr = 900;
        condition = dia_sekob_pickpocket_condition;
        information = dia_sekob_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_sekob_pickpocket_condition()
{
        return c_beklauen(75,230);
};
func void dia_sekob_pickpocket_info()
{
        Info_ClearChoices(dia_sekob_pickpocket);
        Info_AddChoice(dia_sekob_pickpocket,DIALOG_BACK,dia_sekob_pickpocket_back);
        Info_AddChoice(dia_sekob_pickpocket,DIALOG_PICKPOCKET,dia_sekob_pickpocket_doit);
};
func void dia_sekob_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_sekob_pickpocket);
};
func void dia_sekob_pickpocket_back()
{
        Info_ClearChoices(dia_sekob_pickpocket);
};
