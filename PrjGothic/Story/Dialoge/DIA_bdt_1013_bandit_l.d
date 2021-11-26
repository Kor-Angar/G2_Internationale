instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 999;
        condition = dia_bdt_1013_bandit_firstexit_condition;
        information = dia_bdt_1013_bandit_firstexit_info;
        permanent = FALSE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1013_bandit_firstexit_condition()
{
        return TRUE;
};
func void dia_bdt_1013_bandit_firstexit_info()
{
        if(BDT13_FRIEND == TRUE)
        {
                B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");    //На твоем месте я бы не ходил в эту пещеру - мои приятели, что живут там, сдерут с тебя шкуру живьем.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1013_BANDIT_EXIT(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 999;
        condition = dia_bdt_1013_bandit_exit_condition;
        information = dia_bdt_1013_bandit_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bdt_1013_bandit_exit_condition()
{
        if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
        {
                return TRUE;
        };
};
func void dia_bdt_1013_bandit_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BDT_1013_BANDIT_WHERE(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 3;
        condition = dia_bdt_1013_bandit_where_condition;
        information = dia_bdt_1013_bandit_where_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_bdt_1013_bandit_where_condition()
{
        return TRUE;
};
func void dia_bdt_1013_bandit_where_info()
{
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");        //Эй - откуда ты такой взялся, а?
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_mountain_description,dia_bdt_1013_bandit_where_mountain); // "Я спустился с гор."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_xardas_description,dia_bdt_1013_bandit_where_xardas); // "Я пришел от Ксардаса..."
};
func void dia_bdt_1013_bandit_where_mountain()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");       //Я спустился с гор.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");       //Точно. Ты спустился с гор. И это плохо для тебя.
        B_UseFakeHeroFace();
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");       //Очень плохо.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");       //Тебя ищут - целая куча плохих парней.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");       //Есть человек, с которым тебе просто необходимо переговорить. Иди за мной!
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_later_description,dia_bdt_1013_bandit_where_later); // "Может быть позже..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_who_description,dia_bdt_1013_bandit_where_who); // "Кто ищет меня?"
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_yes_description,dia_bdt_1013_bandit_where_yes); // "Хорошо! Ты идешь первым!"
};
func void dia_bdt_1013_bandit_where_xardas()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //Я пришел от Ксардаса...
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //Это тот старый маг? Он называет себя Ксардасом... Браго это будет интересно...
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};
func void dia_bdt_1013_bandit_where_yes()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");    //Хорошо! Ты идешь первым!
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");    //Просто следуй за мной, пещера находится вон там.
        Npc_ExchangeRoutine(self,"AMBUSH");
        AI_StopProcessInfos(self);
};
func void dia_bdt_1013_bandit_where_who()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");    //Кто ищет меня?
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");    //За тобой охотится половина Хориниса, а ты хочешь сказать мне, что ничего не знаешь об этом?
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");    //Ах! Понимаю! Ты не хочешь говорить мне об этом, хм? Хорошо - это твое дело.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");    //Так ты идешь или нет?
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_later_description,dia_bdt_1013_bandit_where_later); // "Может быть позже..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_talkpartner_description,dia_bdt_1013_bandit_where_talkpartner); // "С кем я должен поговорить?"
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_yes_description,dia_bdt_1013_bandit_where_yes); // "Хорошо! Ты идешь первым!"
};
func void dia_bdt_1013_bandit_where_talkpartner()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");    //С кем я должен поговорить?
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");    //С нашим главарем. Его зовут Браго. Он лучше все тебе объяснит, чем я.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");    //Ну что ты - мы идем?
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_later_description,dia_bdt_1013_bandit_where_later); // "Может быть позже..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_notrap_description,dia_bdt_1013_bandit_where_notrap); // "Откуда мне знать что это не ловушка?"
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_yes_description,dia_bdt_1013_bandit_where_yes); // "Хорошо! Ты идешь первым!"
};
func void dia_bdt_1013_bandit_where_notrap()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //Откуда мне знать, что это не ловушка?
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //Знаешь, я уже устал от тебя. Если тебе не нужна моя помощь, можешь просто идти в город, пусть там тебя посадят за решетку!
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //Либо ты сейчас идешь со мной, либо забудь о том, что я тебе говорил!
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_later_description,dia_bdt_1013_bandit_where_later); // "Может быть позже..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_damals_description,dia_bdt_1013_bandit_where_damals); // "Полегче приятель! Кое-кто уже пытался провести меня..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_yes_description,dia_bdt_1013_bandit_where_yes); // "Хорошо! Ты идешь первым!"
};
func void dia_bdt_1013_bandit_where_damals()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //Полегче, приятель! Кое-кто уже пытался провести меня...
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //Ох?
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //Этот парень предложил, чтобы мы вместе нашли амулет и поделили доход.
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //А когда мы достигли нашей цели, он и со своими дружками напал на меня.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //Похоже, ты просто связался с плохими людьми - и где это было?
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_notimportant_description,dia_bdt_1013_bandit_where_notimportant); // "Это не так уж важно."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_prisoner_description,dia_bdt_1013_bandit_where_prisoner); // "Я был заключенным в горнодобывающей колонии."
};
func void dia_bdt_1013_bandit_where_prisoner()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");       //Я был заключенным в горнодобывающей колонии.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");       //(потрясенный) Ты пришел из-за Барьера? Парень, тогда мы были там вместе.
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");       //Я не знаю тебя...
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");       //Я был шахтером в Старом Лагере. Я оттуда почти никогда не выходил.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");       //(заговорщицки) Но сейчас важнее то, что у тебя большие проблемы!
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");       //Кто-то назначил кругленькую сумму за твою голову. И раздал несколько постеров с твоей физиономией!
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");       //На твоем месте я был бы очень, очень осторожным. Среди нас есть люди, которые за деньги готовы убить свою собственную мать.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");       //Но я думаю, что мы, бывшие заключенные из колонии, должны держаться вместе!
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");       //Тогда я должен сказать тебе большое спасибо...
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");       //Пустяки. Просто постарайся остаться в живых.
        BDT13_FRIEND = TRUE;
        b_setattitude(self,ATT_FRIENDLY);
        self.npctype = NPCTYPE_FRIEND;
        self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
        Info_ClearChoices(dia_bdt_1013_bandit_where);
};
func void dia_bdt_1013_bandit_where_notimportant()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");   //Это не так уж важно.
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");   //Как знаешь. Так как, ты идешь или нет?
        Info_ClearChoices(dia_bdt_1013_bandit_where);
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_later_description,dia_bdt_1013_bandit_where_later); // "Может быть позже..."
        Info_AddChoice(dia_bdt_1013_bandit_where,dia_bdt_1013_bandit_where_yes_description,dia_bdt_1013_bandit_where_yes); // "Хорошо! Ты идешь первым!"
};
func void dia_bdt_1013_bandit_where_later()
{
        B_AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");  //Может быть, позже...
        B_AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");  //Позже не будет, приятель!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};
instance DIA_1013_BANDIT_AMBUSH(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 1;
        condition = dia_1013_bandit_ambush_condition;
        information = dia_1013_bandit_ambush_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_1013_bandit_ambush_condition()
{
        if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (BDT13_FRIEND == FALSE))
        {
                return TRUE;
        };
};
func void dia_1013_bandit_ambush_info()
{
        if(Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
        {
                B_AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");   //Тебе не стоило идти за мной...
                b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
                AI_StopProcessInfos(self);
        }
        else
        {
                B_AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");   //Эй, парни, посмотрите, кто у нас здесь...
                AI_StopProcessInfos(self);
        };
};
instance DIA_1013_BANDIT_NAME(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 1;
        condition = dia_1013_bandit_name_condition;
        information = dia_1013_bandit_name_info;
        permanent = FALSE;
        description = "Кто назначил цену за мою голову?";
};
func int dia_1013_bandit_name_condition()
{
        if(BDT13_FRIEND == TRUE)
        {
                return TRUE;
        };
};
func void dia_1013_bandit_name_info()
{
        B_AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");     //Кто назначил цену за мою голову?
        B_AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");     //Я этого не знаю, только один из нас видел его.
        B_AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");     //И кто это?
        B_AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");     //Эй, послушай - я действительно не могу сказать тебе это. Кто знает, как все выйдет...
        Log_CreateTopic(TOPIC_BANDITS,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BANDITS,LOG_RUNNING);
        b_logentry(TOPIC_BANDITS,TOPIC_BANDITS_description_100); // "За мной охотятся бандиты. У них есть листок с моим изображением. Интересно что все это значит."
        MIS_STECKBRIEFE = LOG_RUNNING;
};
instance DIA_1013_BANDIT_DEXTER(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 1;
        condition = dia_1013_bandit_dexter_condition;
        information = dia_1013_bandit_dexter_info;
        permanent = TRUE;
        description = "10 золотых монет за имя того, кто назначил цену за мою голову.";
};
func int dia_1013_bandit_dexter_condition()
{
        if((BDT13_FRIEND == TRUE) && (BDT13_DEXTER_VERRATEN == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
        {
                return TRUE;
        };
};
func void dia_1013_bandit_dexter_info()
{
        B_AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");   //10 золотых монет за имя того, кто назначил цену за мою голову.
        B_AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");   //Ох, я действительно не могу сказать...
        B_AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");   //Выкладывай, живее!
        B_AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");   //(делает глубокий вдох) Ох, парень! Хорошо. Его зовут Декстер. Около большой фермы есть крутая скала.
        B_AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");   //На ней сторожевая башня и несколько шахт. Он устроил свое логово где-то там.
        b_logentry(TOPIC_BANDITS,TOPIC_BANDITS_description_101); // "Главаря бандитов зовут Декстер. Он скрывается в шахте около поместья лендлорда."
        if(b_giveinvitems(other,self,itmi_gold,10))
        {
                B_AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");   //Видишь, это было не так уж и сложно. Вот твое золото.
        }
        else
        {
                B_AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");   //Эээ - я только что понял, что у меня не осталось даже десяти монет.
                B_AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");   //Что?! Я... Ох - забудь об этом - я сам виноват. Не нужно было называть тебе имя, пока я не увидел золота...
        };
        B_AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");   //Только никому не говори, что это я назвал тебе его.
        BDT13_DEXTER_VERRATEN = TRUE;
};
instance DIA_1013_BANDIT_PIC(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 2;
        condition = dia_1013_bandit_pic_condition;
        information = dia_1013_bandit_pic_info;
        permanent = FALSE;
        description = "Могу я взять эту картинку?";
};
func int dia_1013_bandit_pic_condition()
{
        if(BDT13_FRIEND == TRUE)
        {
                return TRUE;
        };
};
func void dia_1013_bandit_pic_info()
{
        B_AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");      //Могу я взять эту картинку?
        B_AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");      //Конечно (ухмыляется) - ведь на ней ТВОЯ рожа.
        b_giveinvitems(self,other,itwr_poster_mis,1);
};
instance DIA_1013_BANDIT_FROMMALETH(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 3;
        condition = dia_1013_bandit_frommaleth_condition;
        information = dia_1013_bandit_frommaleth_info;
        permanent = FALSE;
        description = "Меня послал один из фермеров у города...";
};
func int dia_1013_bandit_frommaleth_condition()
{
        if((BDT13_FRIEND == TRUE) && ((MIS_MALETH_BANDITS == LOG_RUNNING) || (MIS_MALETH_BANDITS == LOG_SUCCESS)))
        {
                return TRUE;
        };
};
func void dia_1013_bandit_frommaleth_info()
{
        var C_NPC b14;
        var C_NPC b15;
        B_AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");       //Меня послал один из фермеров у города...
        B_AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");       //Что? Фермеры знают об этом укрытии?
        B_AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");       //Они заметили пропажу овцы.
        b14 = Hlp_GetNpc(bdt_1014_bandit_l);
        b15 = Hlp_GetNpc(bdt_1015_bandit_l);
        if(Npc_IsDead(b14) && Npc_IsDead(b15))
        {
                B_AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");       //Черт! Ну, тогда мне стоит поискать другое место. Если они найдут это логово пустым, может быть, они прекратят искать меня.
        }
        else
        {
                B_AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");       //Он хочет, чтобы вы все были мертвы...
                B_AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");       //Подожди - ты ведь не сделаешь этого со мной, правда, ведь я помог тебе?
                B_AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");       //Иди туда и расправься с другими, если ты так жаждешь крови - а я сваливаю отсюда!
        };
        b_giveplayerxp(XP_BANDITWEG);
        Npc_ExchangeRoutine(self,"AWAY");
        AI_StopProcessInfos(self);
};
var int bdt13_gossip_wildnis;
instance DIA_1013_BANDIT_PERM(C_INFO)
{
        npc = bdt_1013_bandit_l;
        nr = 4;
        condition = dia_1013_bandit_perm_condition;
        information = dia_1013_bandit_perm_info;
        permanent = TRUE;
        description = "Есть что-нибудь еще, что может заинтересовать меня?";
};
func int dia_1013_bandit_perm_condition()
{
        if(BDT13_FRIEND == TRUE)
        {
                return TRUE;
        };
};
func void dia_1013_bandit_perm_info()
{
        B_AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");     //Есть что-нибудь еще, что может заинтересовать меня?
        if(BDT13_GOSSIP_WILDNIS == FALSE)
        {
                B_AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");     //Ты имеешь в виду эту местность? Если хочешь остаться в живых, тебе лучше держаться дороги.
                B_AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");     //Чем дальше ты заходишь в глушь, тем опаснее там находиться.
                BDT13_GOSSIP_WILDNIS = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");     //Я сказал тебе все, что мог.
        };
};
