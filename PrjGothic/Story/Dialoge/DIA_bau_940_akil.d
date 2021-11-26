instance DIA_AKIL_EXIT(C_INFO)
{
        npc = bau_940_akil;
        nr = 999;
        condition = dia_akil_exit_condition;
        information = dia_akil_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_akil_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_akil_exit_info()
{
        B_AI_Output(other,self,"DIA_Akil_EXIT_15_00");    //Я должен идти.
        if(!Npc_KnowsInfo(other,dia_akil_nachkampf))
        {
                B_AI_Output(self,other,"DIA_Akil_EXIT_13_01");    //Не буду задерживать тебя.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Akil_EXIT_13_02");    //Пока! Всегда рад буду помочь чем-нибудь.
        };
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_HALLO(C_INFO)
{
        npc = bau_940_akil;
        nr = 4;
        condition = dia_akil_hallo_condition;
        information = dia_akil_hallo_info;
        permanent = FALSE;
        description = "У тебя какие-то проблемы?";
};
func int dia_akil_hallo_condition()
{
        if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
        {
                return TRUE;
        };
};
func void dia_akil_hallo_info()
{
        B_AI_Output(other,self,"DIA_Akil_Hallo_15_00");   //У тебя какие-то проблемы?
        B_AI_Output(self,other,"DIA_Akil_Hallo_13_01");   //(в поту)... Э-э... нет, нет... все в порядке. (нервно) Это... тебе лучше уйти сейчас.
        B_AI_Output(other,self,"DIA_Akil_Hallo_15_02");   //Ты в этом уверен?
        B_AI_Output(self,other,"DIA_Akil_Hallo_13_03");   //Э-э... да, да... все в порядке. Ты... э-э... я... я сейчас не могу говорить с тобой.
        Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
        b_logentry(TOPIC_AKILSSLDSTILLTHERE,TOPIC_AKILSSLDSTILLTHERE_description_34); // "Фермеру Акилу угрожают наемники."
        AKILS_SLDSTILLTHERE = TRUE;
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_NICHTJETZT(C_INFO)
{
        npc = bau_940_akil;
        nr = 7;
        condition = dia_akil_nichtjetzt_condition;
        information = dia_akil_nichtjetzt_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_akil_nichtjetzt_condition()
{
        if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
        {
                return TRUE;
        };
};
func void dia_akil_nichtjetzt_info()
{
        B_AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");      //Э-э... не сейчас, я сейчас не могу говорить с тобой.
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_NACHKAMPF(C_INFO)
{
        npc = bau_940_akil;
        nr = 5;
        condition = dia_akil_nachkampf_condition;
        information = dia_akil_nachkampf_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_akil_nachkampf_condition()
{
        if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
        {
                return TRUE;
        };
};
func void dia_akil_nachkampf_info()
{
        B_AI_Output(self,other,"DIA_Akil_NachKampf_13_00");       //Слава Инносу. Я уж думал, мне конец.
        B_AI_Output(self,other,"DIA_Akil_NachKampf_13_01");       //Меня зовут Акил. Я фермер на этом маленьком клочке земли.
        B_AI_Output(other,self,"DIA_Akil_NachKampf_15_02");       //Кто эти люди?
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Akil_NachKampf_13_03");       //Ты должен знать их. Это наемники с фермы Онара. Как и ты.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Akil_NachKampf_13_04");       //Это наемники с фермы Онара. Эти ублюдки только и знают, что грабить и убивать.
        };
        B_AI_Output(self,other,"DIA_Akil_NachKampf_13_05");       //Я боялся худшего...
        B_AI_Output(self,other,"DIA_Akil_NachKampf_13_06");       //(глубоко вздыхает)... слава Инносу до этого не дошло. Скажи мне, что я могу сделать для тебя?
        Info_ClearChoices(dia_akil_nachkampf);
        Info_AddChoice(dia_akil_nachkampf,dia_akil_nachkampf_ehre_description,dia_akil_nachkampf_ehre); // "Ничего. Я просто рад что у тебя теперь все в порядке."
        Info_AddChoice(dia_akil_nachkampf,dia_akil_nachkampf_gold_description,dia_akil_nachkampf_gold); // "Как насчет нескольких золотых?"
        Npc_ExchangeRoutine(self,"Start");
        self.flags = 0;
        if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
        {
                Npc_ExchangeRoutine(kati,"Start");
                AI_ContinueRoutine(kati);
                kati.flags = 0;
        };
        if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
        {
                Npc_ExchangeRoutine(randolph,"Start");
                AI_ContinueRoutine(randolph);
                randolph.flags = 0;
        };
        TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
        b_giveplayerxp(XP_AMBIENT);
};
func void dia_akil_nachkampf_ehre()
{
        B_AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");  //Ничего. Я просто рад, что у тебя теперь все в порядке.
        B_AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");  //Ты настоящий друг. Да хранит тебя Иннос на твоем пути.
        b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
        Info_ClearChoices(dia_akil_nachkampf);
};
func void dia_akil_nachkampf_gold()
{
        B_AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");  //Как насчет нескольких золотых?
        B_AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");  //Боюсь, мне придется разочаровать тебя - мы бедные фермеры. Нам еле на жизнь хватает.
        if(!Npc_IsDead(kati))
        {
                B_AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");  //Все, что я могу предложить тебе - это еду. Иди к Кати, пусть она накормит тебя.
        };
        b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
        Info_ClearChoices(dia_akil_nachkampf);
        KATI_MAHLZEIT = TRUE;
};
instance DIA_AKIL_SOELDNER(C_INFO)
{
        npc = bau_940_akil;
        nr = 7;
        condition = dia_akil_soeldner_condition;
        information = dia_akil_soeldner_info;
        permanent = FALSE;
        description = "Что эти наемники хотели от тебя?";
};
func int dia_akil_soeldner_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_nachkampf))
        {
                return TRUE;
        };
};
func void dia_akil_soeldner_info()
{
        B_AI_Output(other,self,"DIA_Akil_Soeldner_15_00");        //Что эти наемники хотели от тебя?
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Akil_Soeldner_13_01");        //Ты издеваешься надо мной? Эти наемники хотели собрать ренту.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Akil_Soeldner_13_02");        //Ты этого не знаешь? Их нанял Онар, лендлорд. Они охраняют его ферму и собирают ренту для него.
                B_AI_Output(self,other,"DIA_Akil_Soeldner_13_03");        //Это означает, что они ходят с фермы на ферму и забирают то, что им больше нравится. А те, кто не могут платить, рискуют расстаться с жизнью.
        };
};
instance DIA_AKIL_LIEFERUNG(C_INFO)
{
        npc = bau_940_akil;
        nr = 20;
        condition = dia_akil_lieferung_condition;
        information = dia_akil_lieferung_info;
        permanent = FALSE;
        description = "Меня прислал Бальтрам. Я должен забрать посылку для него.";
};
func int dia_akil_lieferung_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_akil_lieferung_info()
{
        B_AI_Output(other,self,"DIA_Akil_Lieferung_15_00");       //Меня прислал Бальтрам. Я должен забрать посылку для него.
        B_AI_Output(self,other,"DIA_Akil_Lieferung_13_01");       //Так ты его новый посыльный. Хорошо, я уже приготовил ее.
        CreateInvItems(self,itmi_baltrampaket,1);
        b_giveinvitems(self,other,itmi_baltrampaket,1);
        LIEFERUNG_GEHOLT = TRUE;
        b_logentry(TOPIC_BALTRAM,TOPIC_BALTRAM_description_35); // "Я получил посылку. Теперь я могу доставить ее Бальтраму..."
        b_logentry(TOPIC_NAGUR,TOPIC_NAGUR_description_36); // "Я получил посылку. Теперь я могу отнести ее Нагуру..."
};
instance DIA_AKIL_GEGEND(C_INFO)
{
        npc = bau_940_akil;
        nr = 90;
        condition = dia_akil_gegend_condition;
        information = dia_akil_gegend_info;
        permanent = FALSE;
        description = "Ты знаешь здешние места...";
};
func int dia_akil_gegend_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
var int knows_taverne;
func void dia_akil_gegend_info()
{
        B_AI_Output(other,self,"DIA_Akil_Gegend_15_00");  //Ты знаешь здешние места...
        B_AI_Output(self,other,"DIA_Akil_Gegend_13_01");  //Конечно, что ты хочешь узнать?
};
instance DIA_AKIL_HOF(C_INFO)
{
        npc = bau_940_akil;
        nr = 20;
        condition = dia_akil_hof_condition;
        information = dia_akil_hof_info;
        permanent = FALSE;
        description = "Как мне найти ферму Онара?";
};
func int dia_akil_hof_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_gegend))
        {
                return TRUE;
        };
};
func void dia_akil_hof_info()
{
        B_AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");     //Как мне найти ферму Онара?
        B_AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");     //Спустись по каменной лестнице вон там, а дальше иди по дороге на восток.
        B_AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");     //По пути тебе встретится таверна. От нее иди дальше на восток, пока не выйдешь на большое поле. Вот там-то эти наемники и живут.
        KNOWS_TAVERNE = TRUE;
};
instance DIA_AKIL_TAVERNE(C_INFO)
{
        npc = bau_940_akil;
        nr = 20;
        condition = dia_akil_taverne_condition;
        information = dia_akil_taverne_info;
        permanent = FALSE;
        description = "Что это за таверна к востоку отсюда?";
};
func int dia_akil_taverne_condition()
{
        if(KNOWS_TAVERNE == TRUE)
        {
                return TRUE;
        };
};
func void dia_akil_taverne_info()
{
        B_AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");  //Что это за таверна к востоку отсюда?
        B_AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");  //Спроси об этом Рендольфа. Он знает о ней лучше меня. Он бывал там несколько раз.
};
instance DIA_AKIL_WALD(C_INFO)
{
        npc = bau_940_akil;
        nr = 20;
        condition = dia_akil_wald_condition;
        information = dia_akil_wald_info;
        permanent = FALSE;
        description = "А что там, в лесу за твоей фермой?";
};
func int dia_akil_wald_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_gegend))
        {
                return TRUE;
        };
};
func void dia_akil_wald_info()
{
        B_AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");     //А что там, в лесу за твоей фермой?
        B_AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");     //Там бродят монстры. И волки еще самые безобидные из них.
        B_AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");     //Также говорят, что там устроили себе логово бандиты. Ну - хотя бы они не трогают мою ферму.
};
instance DIA_AKIL_PERM(C_INFO)
{
        npc = bau_940_akil;
        nr = 32;
        condition = dia_akil_perm_condition;
        information = dia_akil_perm_info;
        permanent = TRUE;
        description = "Есть что-нибудь интересное?";
};
func int dia_akil_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
        {
                return TRUE;
        };
};
func void dia_akil_perm_info()
{
        B_AI_Output(other,self,"DIA_Akil_Perm_15_00");    //Есть что-нибудь интересное?
        if(KAPITEL == 3)
        {
                if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
                {
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_01");    //Нет. Я надеюсь, теперь мои овцы больше не будут пропадать.
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_02");    //Мои овцы постоянно пропадают. Скоро нам нечего будет есть.
                };
        }
        else
        {
                if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
                {
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_03");    //Орки теперь повсюду. Говорят даже, что у них здесь где-то есть штаб-квартира. Расспроси об этом фермера Лобарта.
                };
                if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
                {
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_04");    //Говорят, что в округе появились люди-ящеры. На твоем месте я бы не ходил в пещеры.
                };
                if(hero.guild == GIL_KDF)
                {
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_05");    //Люди в черных рясах ищут тебя.
                        B_AI_Output(other,self,"DIA_Akil_Perm_15_06");    //Это не новость.
                        B_AI_Output(self,other,"DIA_Akil_Perm_13_07");    //Ну и ладно. Я просто подумал, что тебе стоит знать это.
                };
        };
};
instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
        npc = bau_940_akil;
        nr = 999;
        condition = dia_akil_kap3_exit_condition;
        information = dia_akil_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_akil_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_akil_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
        npc = bau_940_akil;
        nr = 2;
        condition = dia_akil_schafdieb_condition;
        information = dia_akil_schafdieb_info;
        description = "Это не новость.";
};
func int dia_akil_schafdieb_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_akil_schafdieb_info()
{
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");       //Есть еще новости?
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");       //Кто-то постоянно крадет моих овец. Я теперь не могу спокойно спать по ночам.
        Info_ClearChoices(dia_akil_schafdieb);
        Info_AddChoice(dia_akil_schafdieb,dia_akil_schafdieb_nein_description,dia_akil_schafdieb_nein); // "Это не мои проблемы."
        Info_AddChoice(dia_akil_schafdieb,dia_akil_schafdieb_wieviel_description,dia_akil_schafdieb_wieviel); // "Сколько овец у тебя пропало?"
        Info_AddChoice(dia_akil_schafdieb,dia_akil_schafdieb_wer_description,dia_akil_schafdieb_wer); // "Кто может делать это?"
        MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
        Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
        b_logentry(TOPIC_AKILSCHAFDIEBE,TOPIC_AKILSCHAFDIEBE_description_37); // "Овцы Акила продолжают пропадать. Он подозревает что к этому причастны бандиты живущие в пещере в соседнем лесу."
};
func void dia_akil_schafdieb_wer()
{
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");   //Кто может делать это?
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");   //У меня есть подозрения.
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");   //Какие-то темные личности обосновались в пещере вон в том лесу.
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");   //Мне трудно поверить, что они питаются только ягодами. Я почти уверен, что именно они виновны в исчезновении моих овец.
        Info_ClearChoices(dia_akil_schafdieb);
};
func void dia_akil_schafdieb_wieviel()
{
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");       //Сколько овец у тебя пропало?
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");       //По крайней мере, три.
};
func void dia_akil_schafdieb_nein()
{
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");  //Это не мои проблемы.
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");  //Понимаю. У тебя других забот полно.
        Info_ClearChoices(dia_akil_schafdieb);
};
instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
        npc = bau_940_akil;
        nr = 2;
        condition = dia_akil_schafdiebeplatt_condition;
        information = dia_akil_schafdiebeplatt_info;
        description = "Я нашел тех, кто воровал у тебя овец.";
};
func int dia_akil_schafdiebeplatt_condition()
{
        if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
        {
                return TRUE;
        };
};
func void dia_akil_schafdiebeplatt_info()
{
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00"); //Я нашел тех, кто воровал у тебя овец.
        B_AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01"); //Ты был прав. Это были бандиты из пещеры в лесу. Но больше они у тебя ничего не украдут.
        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
        {
                B_AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02"); //Спасибо тебе, о, благородный служитель Инноса.
        }
        else if(hero.guild == GIL_MIL)
        {
                B_AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03"); //Спасибо. Теперь я вижу, что ополчение иногда помогает нам, мелким фермерам.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04"); //Спасибо. Ты очень странный наемник. Не такой, как другие.
        };
        B_AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05"); //Возьми это в качестве благодарности за бескорыстную услугу, что ты оказал мне.
        CreateInvItems(self,itmi_gold,150);
        b_giveinvitems(self,other,itmi_gold,150);
        MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
        b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};
instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
        npc = bau_940_akil;
        nr = 2;
        condition = dia_akil_akilsschaf_condition;
        information = dia_akil_akilsschaf_info;
        description = "(вернуть овцу Акила)";
};
func int dia_akil_akilsschaf_condition()
{
        if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
        {
                return TRUE;
        };
};
func void dia_akil_akilsschaf_info()
{
        B_AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");      //Очень хорошо. Вот несколько золотых. Надеюсь, этого достаточно.
        CreateInvItems(self,itmi_gold,150);
        b_giveinvitems(self,other,itmi_gold,150);
        follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
        follow_sheep_akil.wp = "NW_FARM2_OUT_02";
        follow_sheep_akil.start_aistate = zs_mm_allscheduler;
        b_giveplayerxp(XP_AKILSSCHAF);
};
instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
        npc = bau_940_akil;
        nr = 999;
        condition = dia_akil_kap4_exit_condition;
        information = dia_akil_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_akil_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_akil_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
        npc = bau_940_akil;
        nr = 999;
        condition = dia_akil_kap5_exit_condition;
        information = dia_akil_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_akil_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_akil_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
        npc = bau_940_akil;
        nr = 999;
        condition = dia_akil_kap6_exit_condition;
        information = dia_akil_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_akil_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_akil_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_AKIL_PICKPOCKET(C_INFO)
{
        npc = bau_940_akil;
        nr = 900;
        condition = dia_akil_pickpocket_condition;
        information = dia_akil_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_akil_pickpocket_condition()
{
        return c_beklauen(37,30);
};
func void dia_akil_pickpocket_info()
{
        Info_ClearChoices(dia_akil_pickpocket);
        Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
        Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};
func void dia_akil_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_akil_pickpocket);
};
func void dia_akil_pickpocket_back()
{
        Info_ClearChoices(dia_akil_pickpocket);
};
