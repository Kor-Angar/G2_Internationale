instance DIA_GEROLD_EXIT(C_INFO)
{
        npc = pal_261_gerold;
        nr = 999;
        condition = dia_gerold_exit_condition;
        information = dia_gerold_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_gerold_exit_condition()
{
        if(KAPITEL < 4)
        {
                return TRUE;
        };
};
func void dia_gerold_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_HALLO(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_hallo_condition;
        information = dia_gerold_hallo_info;
        permanent = FALSE;
        description = "Что ты охраняешь?";
};
func int dia_gerold_hallo_condition()
{
        if(KAPITEL == 2)
        {
                return TRUE;
        };
};
func void dia_gerold_hallo_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Hallo_15_00"); //Что ты охраняешь?
        B_AI_Output(self,other,"DIA_Gerold_Hallo_12_01"); //Заключенных.
        B_AI_Output(other,self,"DIA_Gerold_Hallo_15_02"); //А кто там?
        B_AI_Output(self,other,"DIA_Gerold_Hallo_12_03"); //Несколько каторжников и наемник Горн. Серьезный парень - сильный как бык.
        B_AI_Output(self,other,"DIA_Gerold_Hallo_12_04"); //Четыре человека еле затолкали его туда.
};
instance DIA_GEROLD_JAIL(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_jail_condition;
        information = dia_gerold_jail_info;
        permanent = FALSE;
        description = "Ты пропустишь меня в темницу?";
};
func int dia_gerold_jail_condition()
{
        if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_jail_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Jail_15_00");  //Ты пропустишь меня в темницу?
        B_AI_Output(self,other,"DIA_Gerold_Jail_12_01");  //Нет. НИКТО не может входить в темницу. Это касается ВСЕХ. Тебя, Милтена и всех остальных.
        B_AI_Output(self,other,"DIA_Gerold_Jail_12_02");  //Здесь вам не таверна, куда вы можете входить и выходить когда захотите. Помни об этом.
        KNOWSABOUTGORN = TRUE;
};
instance DIA_GEROLD_AUSNAHME(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_ausnahme_condition;
        information = dia_gerold_ausnahme_info;
        permanent = FALSE;
        description = "Ты не мог бы сделать исключение для меня?";
};
func int dia_gerold_ausnahme_condition()
{
        if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_ausnahme_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");      //Ты не мог бы сделать исключение для меня?
        B_AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");      //Нет.
};
instance DIA_GEROLD_GOLD(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_gold_condition;
        information = dia_gerold_gold_info;
        permanent = FALSE;
        description = "А что если я заплачу золотом?";
};
func int dia_gerold_gold_condition()
{
        if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_gold_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Gold_15_00");  //А что если я заплачу золотом?
        B_AI_Output(self,other,"DIA_Gerold_Gold_12_01");  //... хм ...
        B_AI_Output(self,other,"DIA_Gerold_Gold_12_02");  //Нет.
};
instance DIA_GEROLD_DEAL(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_deal_condition;
        information = dia_gerold_deal_info;
        permanent = FALSE;
        description = "У меня есть записка для одного из заключенных...";
};
func int dia_gerold_deal_condition()
{
        if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_deal_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Deal_15_00");  //У меня есть записка для одного из заключенных. Ты можешь передать ее?
        B_AI_Output(self,other,"DIA_Gerold_Deal_12_01");  //Хм... в принципе, я не вижу препятствий для этого. Для кого эта записка?
        B_AI_Output(other,self,"DIA_Gerold_Deal_15_02");  //Для Горна.
        B_AI_Output(self,other,"DIA_Gerold_Deal_12_03");  //Это очень важный заключенный. Я не думаю, что Гаронд согласится. Но если это для тебя так важно, мы всегда можем договориться.
        B_AI_Output(other,self,"DIA_Gerold_Deal_15_04");  //Что ты хочешь за это?
        B_AI_Output(self,other,"DIA_Gerold_Deal_12_05");  //Наши пайки последнее время стали совсем скудные. Я хочу нормальной еды.
        B_AI_Output(self,other,"DIA_Gerold_Deal_12_06");  //Принеси мне колбасы и буханку свежего хлеба - и немного сладкого меда.
        B_AI_Output(self,other,"DIA_Gerold_Deal_12_07");  //Бутылку вина, чтобы запить все это... Да этого должно хватить. Я верю, у тебя получится достать все это. Так что заходи, когда найдешь продукты.
        b_logentry(TOPIC_RESCUEGORN,TOPIC_RESCUEGORN_description_372); // "Если я принесу Герольду колбасу хлеб вино и мед он передаст записку Горну."
};
instance DIA_GEROLD_STUFF(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_stuff_condition;
        information = dia_gerold_stuff_info;
        permanent = TRUE;
        description = "Я принес тебе кое-что. Вот еда, как ты и просил.";
};
var int dia_gerold_stuff_permanent;
func int dia_gerold_stuff_condition()
{
        if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_stuff_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Stuff_15_00"); //Я принес тебе кое-что. Вот еда, как ты и просил.
        if(b_giveinvitems(other,self,itfo_honey,1) && b_giveinvitems(other,self,itfo_bread,1) && b_giveinvitems(other,self,itfo_wine,1) && b_giveinvitems(other,self,itfo_sausage,1))
        {
                B_AI_Output(self,other,"DIA_Gerold_Stuff_12_01"); //Хорошо, дай посмотрю. Записка у тебя с собой?
                B_AI_Output(other,self,"DIA_Gerold_Stuff_15_02"); //Да, вот. Не забудь, она для Горна.
                B_AI_Output(self,other,"DIA_Gerold_Stuff_12_03"); //Заходи завтра, он к этому времени уже получит ее.
                b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
                DAYCONTACTGORN = Wld_GetDay();
                DIA_GEROLD_STUFF_PERMANENT = TRUE;
                b_logentry(TOPIC_RESCUEGORN,TOPIC_RESCUEGORN_description_373); // "Герольд получил то что хотел и передаст записку."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Gerold_Stuff_12_04"); //Заходи, когда у тебя будет то, что я просил.
        };
};
instance DIA_GEROLD_ANTWORT(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_antwort_condition;
        information = dia_gerold_antwort_info;
        permanent = TRUE;
        description = "Горн получил записку?";
};
var int dia_gerold_antwort_permanent;
func int dia_gerold_antwort_condition()
{
        if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
func void dia_gerold_antwort_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Antwort_15_00");       //Горн получил записку?
        if(DAYCONTACTGORN < Wld_GetDay())
        {
                B_AI_Output(self,other,"DIA_Gerold_Antwort_12_01");       //Да, и я должен передать тебе его слова:
                B_AI_Output(other,self,"DIA_Gerold_Antwort_15_02");       //И?
                B_AI_Output(self,other,"DIA_Gerold_Antwort_12_03");       //Это находится у южных ворот.
                B_AI_Output(other,self,"DIA_Gerold_Antwort_15_04");       //Он сказал что-нибудь еще?
                B_AI_Output(self,other,"DIA_Gerold_Antwort_12_05");       //Нет. Понятия не имею, что это значит. А ты знаешь?
                B_AI_Output(other,self,"DIA_Gerold_Antwort_15_06");       //Возможно. Но тебе не стоит сильно напрягать мозги по этому поводу.
                B_AI_Output(self,other,"DIA_Gerold_Antwort_12_07");       //Да, возможно, ты прав.
                GORNSTREASURE = TRUE;
                DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
                b_logentry(TOPIC_RESCUEGORN,TOPIC_RESCUEGORN_description_374); // "Горн говорит что его золото находится у южных ворот."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");   //Нет еще. Зайди попозже.
        };
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
        npc = pal_261_gerold;
        nr = 2;
        condition = dia_gerold_setgornfree_condition;
        information = dia_gerold_setgornfree_info;
        permanent = FALSE;
        description = "Освободи Горна.";
};
func int dia_gerold_setgornfree_condition()
{
        if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
        {
                return TRUE;
        };
};
func void dia_gerold_setgornfree_info()
{
        B_AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");   //Освободи Горна. Это приказ командующего Гаронда.
        B_AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");   //Мне уже сообщили об этом. Вот ключ, ты можешь войти туда.
        CreateInvItems(self,itke_prisonkey_mis,1);
        b_giveinvitems(self,other,itke_prisonkey_mis,1);
        b_logentry(TOPIC_RESCUEGORN,TOPIC_RESCUEGORN_description_375); // "Герольд дал мне ключ от тюрьмы."
};
instance DIA_GEROLD_PERM(C_INFO)
{
        npc = pal_261_gerold;
        nr = 900;
        condition = dia_gerold_perm_condition;
        information = dia_gerold_perm_info;
        permanent = TRUE;
        description = "Ты когда-нибудь спишь?";
};
func int dia_gerold_perm_condition()
{
        if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
        {
                return TRUE;
        };
};
func void dia_gerold_perm_info()
{
        B_AI_Output(other,self,"DIA_Gerold_Perm_15_00");  //Ты когда-нибудь спишь?
        B_AI_Output(self,other,"DIA_Gerold_Perm_12_01");  //Нет. Сам Иннос дарует мне силу никогда не спать на посту.
};
instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
        npc = pal_261_gerold;
        nr = 999;
        condition = dia_gerold_kap4_exit_condition;
        information = dia_gerold_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_gerold_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_gerold_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
        npc = pal_261_gerold;
        nr = 30;
        condition = dia_gerold_kap4_allesruhig_condition;
        information = dia_gerold_kap4_allesruhig_info;
        description = "Все тихо?";
};
func int dia_gerold_kap4_allesruhig_condition()
{
        if(KAPITEL >= 4)
        {
                return TRUE;
        };
};
func void dia_gerold_kap4_allesruhig_info()
{
        B_AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");       //Все тихо?
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");       //Тихо, да.
        B_AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");       //Но?
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");       //У меня пупок уже прилип к позвоночнику. Гаронд опять урезал наши пайки.
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");       //Если я не найду где-нибудь приличной еды, я пойду и откушу кусок жирной задницы Гаронда.
        Info_ClearChoices(dia_gerold_kap4_allesruhig);
        Info_AddChoice(dia_gerold_kap4_allesruhig,dia_gerold_kap4_allesruhig_nein_description,dia_gerold_kap4_allesruhig_nein); // "Это не мои проблемы."
        Info_AddChoice(dia_gerold_kap4_allesruhig,dia_gerold_kap4_allesruhig_geben_description,dia_gerold_kap4_allesruhig_geben); // "Возможно я могу угостить тебя."
};
func void dia_gerold_kap4_allesruhig_geben()
{
        B_AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //Возможно, я могу угостить тебя.
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //Ты с ума сошел? Только не здесь! Если кто-нибудь это увидит, у меня сразу появится куча новых друзей, если ты понимаешь, о чем я.
        if(Wld_IsTime(23,10,8,0) == FALSE)
        {
                B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //Ты найдешь меня в храме, когда все лягут спать.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //Быстрее, пошли в храм, пока остальные не повылезли из своих нор. Я не могу ждать до завтра.
        };
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //Я думаю, в это время в храме никого нет. Я буду ждать тебя там.
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //Но смотри, чтобы это не оказалась черствая корка хлеба или какой-нибудь сырой кусок мяса, ты понял?
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Food");
        Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
        b_logentry(TOPIC_GEROLDGIVEFOOD,TOPIC_GEROLDGIVEFOOD_description_376); // "Гаронд опять урезал паек. Мне лучше принести Герольду что-нибудь поесть пока он с голодухи не выкинул какую-нибудь глупость. Я должен встретиться с ним в доме магов когда все уснут."
        MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};
func void dia_gerold_kap4_allesruhig_nein()
{
        B_AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");  //Это не мои проблемы.
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");  //Тебе легко говорить. Твою-то пайку Гаронд наверняка не урежет.
        B_AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");  //Даже хотя он и не признает это, он страшно напуган и видит в тебе свое единственное спасение.
        AI_StopProcessInfos(self);
};
var int gerold_foodcounter;
instance DIA_GEROLD_FOOD(C_INFO)
{
        npc = pal_261_gerold;
        nr = 31;
        condition = dia_gerold_food_condition;
        information = dia_gerold_food_info;
        important = TRUE;
};
func int dia_gerold_food_condition()
{
        if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
        {
                return TRUE;
        };
};
func void dia_gerold_morefood()
{
        Info_ClearChoices(dia_gerold_food);
        if(GEROLD_FOODCOUNTER > 8)
        {
                B_AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");      //Этого достаточно. Этого достаточно! Теперь я меня некоторое время не будет мучить голод.
                B_AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");      //Вот мое золото. Я все равно ничего не могу на него купить здесь, а тебе оно, может быть, пригодится.
                B_AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");      //А теперь я лучше пойду, пока никто не увидел нас.
                AI_StopProcessInfos(self);
                Npc_ExchangeRoutine(self,"Start");
                MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
                b_giveplayerxp(XP_GEROLDGIVEFOOD);
                CreateInvItems(self,itmi_gold,450);
                b_giveinvitems(self,other,itmi_gold,450);
        }
        else
        {
                if(GEROLD_FOODCOUNTER == 0)
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_nichts_description,dia_gerold_food_nichts); // "Сейчас у меня ничего нет."
                }
                else
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_kaese_nichtmehr_description,dia_gerold_food_kaese_nichtmehr); // "Это все что у меня есть."
                        if(GEROLD_FOODCOUNTER < 5)
                        {
                                B_AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");      //Конечно. Давай сюда. А еще у тебя есть?
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");      //Да. Еще, еще!
                        };
                };
                if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_suppe_description,dia_gerold_food_suppe); // "Дать суп"
                };
                if(Npc_HasItems(other,itfomutton))
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_fleisch_description,dia_gerold_food_fleisch); // "Дать мясо"
                };
                if(Npc_HasItems(other,itfo_bacon))
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_schinken_description,dia_gerold_food_schinken); // "Дать окорок"
                };
                if(Npc_HasItems(other,itfo_cheese))
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_kaese_description,dia_gerold_food_kaese); // "Дать сыр"
                };
                if(Npc_HasItems(other,itfo_sausage))
                {
                        Info_AddChoice(dia_gerold_food,dia_gerold_food_wurst_description,dia_gerold_food_wurst); // "Дать колбасу"
                };
                GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
        };
};
func void dia_gerold_food_info()
{
        B_AI_Output(self,other,"DIA_Gerold_FOOD_12_00");  //Вот ты где. И как? У тебя есть что-нибудь поесть?
        dia_gerold_morefood();
};
func void dia_gerold_food_nichts()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");   //Сейчас у меня ничего нет.
        B_AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");   //Сначала наобещаешь с три короба, а затем хочешь обмануть меня?
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
        Npc_ExchangeRoutine(self,"Start");
        MIS_GEROLDGIVEFOOD = LOG_FAILED;
        b_giveplayerxp(XP_AMBIENT);
};
func void dia_gerold_food_kaese_nichtmehr()
{
        var int xp_geroldgivefoodlow;
        var int teiler;
        B_AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");  //Это все, что у меня есть.
        B_AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");  //И я, по-твоему, поверю в это? Ладно, это все же лучше, чем ничего. Вот, возьми немного золота за этоit.
        CreateInvItems(self,itmi_gold,50);
        b_giveinvitems(self,other,itmi_gold,50);
        B_AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");  //Хорошо. А теперь мне нужно возвращаться на мой пост.
        AI_StopProcessInfos(self);
        if(GEROLD_FOODCOUNTER < 4)
        {
                teiler = 3;
        }
        else
        {
                teiler = 2;
        };
        xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
        Npc_ExchangeRoutine(self,"Start");
        MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
        b_giveplayerxp(xp_geroldgivefoodlow);
};
func void dia_gerold_food_kaese()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");    //Как насчет сочного куска сыра?
        b_giveinvitems(other,self,itfo_cheese,1);
        dia_gerold_morefood();
};
func void dia_gerold_food_wurst()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");    //Кусок колбасы?
        b_giveinvitems(other,self,itfo_sausage,1);
        dia_gerold_morefood();
};
func void dia_gerold_food_schinken()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00"); //Я могу дать тебе этот окорок.
        b_giveinvitems(other,self,itfo_bacon,1);
        dia_gerold_morefood();
};
func void dia_gerold_food_fleisch()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");  //Кусок мяса?
        b_giveinvitems(other,self,itfomutton,1);
        dia_gerold_morefood();
};
func void dia_gerold_food_suppe()
{
        B_AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");    //Хороший суп еще никому не повредил, тебе так не кажется?
        if(b_giveinvitems(other,self,itfo_fishsoup,1))
        {
        }
        else
        {
                b_giveinvitems(other,self,itfo_stew,1);
        };
        dia_gerold_morefood();
};
instance DIA_GEROLD_PERM4(C_INFO)
{
        npc = pal_261_gerold;
        nr = 41;
        condition = dia_gerold_perm4_condition;
        information = dia_gerold_perm4_info;
        permanent = TRUE;
        description = "Все еще голоден?";
};
func int dia_gerold_perm4_condition()
{
        if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
        {
                return TRUE;
        };
};
func void dia_gerold_perm4_info()
{
        B_AI_Output(other,self,"DIA_Gerold_PERM4_15_00"); //Все еще голоден?
        if(MIS_OCGATEOPEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Gerold_PERM4_12_01"); //Если орки атакуют нас опять, даже полный желудок не поможет мне.
        }
        else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Gerold_PERM4_12_02"); //Ты, должно быть, шутишь. В меня больше не лезет. Спасибо еще раз.
        }
        else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
        {
                B_AI_Output(self,other,"DIA_Gerold_PERM4_12_03"); //Да. Но все же, спасибо за помощь.
        }
        else if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Gerold_PERM4_12_04"); //Все в порядке, Мастер.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Gerold_PERM4_12_05"); //Проваливай!
        };
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
        npc = pal_261_gerold;
        nr = 999;
        condition = dia_gerold_kap5_exit_condition;
        information = dia_gerold_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_gerold_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_gerold_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
        npc = pal_261_gerold;
        nr = 999;
        condition = dia_gerold_kap6_exit_condition;
        information = dia_gerold_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_gerold_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_gerold_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
        npc = pal_261_gerold;
        nr = 900;
        condition = dia_gerold_pickpocket_condition;
        information = dia_gerold_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_gerold_pickpocket_condition()
{
        return c_beklauen(71,170);
};
func void dia_gerold_pickpocket_info()
{
        Info_ClearChoices(dia_gerold_pickpocket);
        Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
        Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};
func void dia_gerold_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_gerold_pickpocket);
};
func void dia_gerold_pickpocket_back()
{
        Info_ClearChoices(dia_gerold_pickpocket);
};
