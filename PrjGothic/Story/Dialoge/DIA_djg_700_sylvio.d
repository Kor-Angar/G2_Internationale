instance DIA_SYLVIODJG_EXIT(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 999;
        condition = dia_sylviodjg_exit_condition;
        information = dia_sylviodjg_exit_info;
        important = FALSE;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_sylviodjg_exit_condition()
{
        return TRUE;
};
func void dia_sylviodjg_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_SYLVIODJG_HELLOAGAIN(C_INFO)
{
        npc = djg_700_sylvio;
        condition = dia_sylviodjg_helloagain_condition;
        information = dia_sylviodjg_helloagain_info;
        important = TRUE;
};
func int dia_sylviodjg_helloagain_condition()
{
        if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylviodjg_helloagain_info()
{
        if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00"); //Ох, будь я проклят! Ты тоже решил подзаработать, ха? Я знал это! У тебя душа наемника.
                B_AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01"); //Послушай, если ты думаешь, что загребешь здесь кучу золота, ты жестоко ошибаешься. Я был здесь первым.
        }
        else if(other.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02"); //Эй, ты! Меня тошнит от магов! Иди куда-нибудь еще! Здесь для тебя ничего нет.
        }
        else
        {
                B_AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03"); //Эй ты, паладин! Возвращайся в свою шахту. Здесь для тебя ничего нет.
        };
        B_AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04"); //Понял. Никто не хочет расставаться с награбленным.
        B_AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05"); //Ты сам сказал это. Исчезни.
};
instance DIA_SYLVIO_VERSAGER(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 6;
        condition = dia_sylvio_versager_condition;
        information = dia_sylvio_versager_info;
        description = "А что если не исчезну?";
};
func int dia_sylvio_versager_condition()
{
        if(Npc_KnowsInfo(other,dia_sylviodjg_helloagain) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylvio_versager_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");      //А что если не исчезну?
        B_AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");      //Не строй из себя крутого, выскочка, иначе тебя ждет такой же конец, как вот тех неудачников, лежащих в снегу.
};
instance DIA_SYLVIO_DEINELEUTE(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 7;
        condition = dia_sylvio_deineleute_condition;
        information = dia_sylvio_deineleute_info;
        description = "Это твои люди?";
};
func int dia_sylvio_deineleute_condition()
{
        if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_DJG_SYLVIO_KILLICEGOLEM == 0))
        {
                return TRUE;
        };
};
func void dia_sylvio_deineleute_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");    //Это твои люди?
        B_AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");    //Больше нет. Не такая уж большая потеря. Эти идиоты все равно мало что стоили.
};
instance DIA_SYLVIO_WASISTPASSIERT(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 8;
        condition = dia_sylvio_wasistpassiert_condition;
        information = dia_sylvio_wasistpassiert_info;
        description = "Что случилось с ними?";
};
func int dia_sylvio_wasistpassiert_condition()
{
        if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylvio_wasistpassiert_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");        //Что случилось с ними?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");        //Они не смогли пройти мимо этих ледяных гигантов. Те затоптали их.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");        //Если ты такой крутой, может, ты попробуешь?
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_ok_description,dia_sylvio_wasistpassiert_ok); // "Хорошо. Почему бы и нет?"
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_washastdudavon_description,dia_sylvio_wasistpassiert_washastdudavon); // "Чем это тебе поможет если я сделаю это?"
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_warum_description,dia_sylvio_wasistpassiert_warum); // "А что мне с этого будет?"
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_selbst_description,dia_sylvio_wasistpassiert_selbst); // "Почему ты не расправишься с ними сам?"
        Log_CreateTopic(TOPIC_SYLVIOKILLICEGOLEM,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_SYLVIOKILLICEGOLEM,LOG_RUNNING);
        b_logentry(TOPIC_SYLVIOKILLICEGOLEM,TOPIC_SYLVIOKILLICEGOLEM_description_116); // "Сильвио испугался двух ледяных големов у входа в заснеженный район Долины рудников."
        MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_RUNNING;
};
func void dia_sylvio_wasistpassiert_selbst()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00"); //Почему ты не расправишься с ними сам?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01"); //Давай, давай. Не мели чепухи.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02"); //По-моему, у тебя дрожат коленки.
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_keininteresse_description,dia_sylvio_wasistpassiert_keininteresse); // "Я не играю в твои игры."
};
var int djg_sylvio_promisedmoney;
func void dia_sylvio_wasistpassiert_warum()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");  //Что я за это получу?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");  //Не знаю. Ну, скажем... 1000 золотых монет. Как тебе это?
        DJG_SYLVIO_PROMISEDMONEY = TRUE;
};
func void dia_sylvio_wasistpassiert_washastdudavon()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00"); //Чем это тебе поможет, если я сделаю это?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01"); //Тебе это все равно. Но, отвечая на твой вопрос, скажу: я хочу попасть в этот ледяной район.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02"); //К сожалению, на моем пути стоят эти чертовы твари.
        Info_AddChoice(dia_sylvio_wasistpassiert,dia_sylvio_wasistpassiert_eisregion_description,dia_sylvio_wasistpassiert_eisregion); // "Что тебе делать в этом ледяном районе?"
};
func void dia_sylvio_wasistpassiert_keininteresse()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");     //Я не играю в твои игры.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");     //Ах-х. Тогда убирайся отсюда, трус.
        AI_StopProcessInfos(self);
};
func void dia_sylvio_wasistpassiert_eisregion()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");  //Что тебе делать в этом ледяном районе?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");  //Ты когда-нибудь перестанешь задавать вопросы, а? Хорошо, я скажу тебе.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");  //Там, за этими утесами, находится ледяная долина. Ты такой никогда раньше не видел.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");  //Там скрывается ледяной дракон вместе со своей ордой.
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");  //Мне нужно это. Так как? Да или нет?
};
func void dia_sylvio_wasistpassiert_ok()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");     //Хорошо. Почему бы и нет?
        B_AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");     //Тогда поторопись. Я не могу долго ждать.
        AI_StopProcessInfos(self);
};
instance DIA_SYLVIO_ICEGOLEMSKILLED(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 9;
        condition = dia_sylvio_icegolemskilled_condition;
        information = dia_sylvio_icegolemskilled_info;
        description = "Твой путь чист!";
};
func int dia_sylvio_icegolemskilled_condition()
{
        if(Npc_IsDead(icegolem_sylvio1) && Npc_IsDead(icegolem_sylvio2) && (MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_RUNNING) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylvio_icegolemskilled_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");       //Твой путь чист! Ледяных гигантов больше нет.
        B_AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");       //Отличная работа. Посмотрим, что там у нас есть.
        if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
        {
                B_AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");       //Минуточку. А как мои деньги?
                B_AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");       //Всему свое время.
        };
        AI_StopProcessInfos(self);
        MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_SUCCESS;
        b_giveplayerxp(XP_SYLVIODJGICEGOLEMDEAD);
        Npc_ExchangeRoutine(self,"IceWait1");
        b_startotherroutine(djg_bullco,"IceWait1");
};
instance DIA_SYLVIO_WASJETZT(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 10;
        condition = dia_sylvio_wasjetzt_condition;
        information = dia_sylvio_wasjetzt_info;
        description = "Что еще?";
};
func int dia_sylvio_wasjetzt_condition()
{
        if((MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_SUCCESS) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylvio_wasjetzt_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");      //Что еще?
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");      //Ну. Мне что-то обстановка там не очень нравится.
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");      //Будет лучше всего, если ты пойдешь вперед, а я пойду за тобой.
        Info_AddChoice(dia_sylvio_wasjetzt,dia_sylvio_wasjetzt_ok_description,dia_sylvio_wasjetzt_ok); // "Хорошо пошли."
        Info_AddChoice(dia_sylvio_wasjetzt,dia_sylvio_wasjetzt_trennen_description,dia_sylvio_wasjetzt_trennen); // "Ты боишься?"
        Info_AddChoice(dia_sylvio_wasjetzt,dia_sylvio_wasjetzt_nein_description,dia_sylvio_wasjetzt_nein); // "Я не собираюсь делать всю грязную работу за тебя."
        if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
        {
                Info_AddChoice(dia_sylvio_wasjetzt,dia_sylvio_wasjetzt_geld_description,dia_sylvio_wasjetzt_geld); // "Сначала я хочу увидеть свои деньги."
        };
};
func void dia_sylvio_wasjetzt_trennen()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");      //Ты боишься?
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");      //Чушь, хватит болтать. Иди вперед.
};
func void dia_sylvio_wasjetzt_ok()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");   //Хорошо, пошли.
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");   //Давай, быстрее!
        AI_StopProcessInfos(self);
};
func void dia_sylvio_wasjetzt_nein()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00"); //Я не собираюсь делать всю грязную работу за тебя.
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01"); //Трус!
        AI_StopProcessInfos(self);
};
func void dia_sylvio_wasjetzt_geld()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00"); //Сначала, я хочу увидеть свои деньги.
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01"); //Когда мы завалим дракона, у тебя будет столько денег, что не сможешь унести.
        Info_AddChoice(dia_sylvio_wasjetzt,dia_sylvio_wasjetzt_jetztgeld_description,dia_sylvio_wasjetzt_jetztgeld); // "Я хочу получить свои деньги сейчас."
};
func void dia_sylvio_wasjetzt_jetztgeld()
{
        B_AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");    //Я хочу получить свои деньги сейчас.
        B_AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");    //Либо ты пойдешь впереди меня, либо мне придется разобраться с тобой.
};
instance DIA_SYLVIO_KOMMSTDU(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 11;
        condition = dia_sylvio_kommstdu_condition;
        information = dia_sylvio_kommstdu_info;
        permanent = TRUE;
        description = "Я думал, ты направляешься в ледяной район.";
};
func int dia_sylvio_kommstdu_condition()
{
        if(Npc_KnowsInfo(other,dia_sylvio_wasjetzt) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_sylvio_kommstdu_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");      //Я думал, ты направляешься в ледяной район.
        B_AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");      //Иди вперед. А я пойду сзади.
        AI_StopProcessInfos(self);
};
instance DIA_SYLVIO_DUHIER(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 11;
        condition = dia_sylvio_duhier_condition;
        information = dia_sylvio_duhier_info;
        permanent = TRUE;
        description = "Мне не помешала бы твоя помощь.";
};
func int dia_sylvio_duhier_condition()
{
        if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == TRUE))
        {
                return TRUE;
        };
};
func void dia_sylvio_duhier_info()
{
        B_AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");        //Мне не помешала бы твоя помощь.
        B_AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");        //Чушь. Ты и так великолепно справляешься.
        AI_StopProcessInfos(self);
};
instance DIA_SYLVIODJG_WHATNEXT(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 12;
        condition = dia_sylviodjg_whatnext_condition;
        information = dia_sylviodjg_whatnext_info;
        important = TRUE;
};
func int dia_sylviodjg_whatnext_condition()
{
        if(Npc_IsDead(icedragon))
        {
                return TRUE;
        };
};
func void dia_sylviodjg_whatnext_info()
{
        B_AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");   //Ледяной дракон мертв! А теперь ты отдашь мне все, что у тебя есть!
        B_AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");   //Ни за что!
        B_AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");   //Это я получу всю славу за убийство ледяного дракона.
        B_AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");   //А твоя маленькая роль в этом деле окончена!
        TOPIC_END_SYLVIOKILLICEGOLEM = TRUE;
        b_giveplayerxp(XP_AMBIENT);
        Info_ClearChoices(dia_sylviodjg_whatnext);
        Info_AddChoice(dia_sylviodjg_whatnext,DIALOG_ENDE,dia_sylviodjg_whatnext_attack);
};
func void dia_sylviodjg_whatnext_attack()
{
        AI_StopProcessInfos(self);
        Npc_SetRefuseTalk(self,60);
        Npc_ExchangeRoutine(self,"Start");
        b_startotherroutine(djg_bullco,"Start");
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_117); // "Эта грязная свинья Сильвио собирался присвоить себе мою победу над ледяными драконами. Мы немного повздорили."
        b_attack(self,other,AR_NONE,1);
        b_attack(djg_bullco,other,AR_NONE,1);
};
instance DIA_SYLVIODJG_BUTNOW(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 13;
        condition = dia_sylviodjg_butnow_condition;
        information = dia_sylviodjg_butnow_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_sylviodjg_butnow_condition()
{
        if(Npc_IsDead(icedragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,dia_sylviodjg_whatnext))
        {
                return TRUE;
        };
};
func void dia_sylviodjg_butnow_info()
{
        B_AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");     //Пришло время расплаты.
        AI_StopProcessInfos(self);
        Npc_SetRefuseTalk(self,60);
        b_attack(self,other,AR_NONE,1);
        b_attack(djg_bullco,other,AR_NONE,1);
};
instance DIA_SYLVIO_PICKPOCKET(C_INFO)
{
        npc = djg_700_sylvio;
        nr = 900;
        condition = dia_sylvio_pickpocket_condition;
        information = dia_sylvio_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_100;
};
func int dia_sylvio_pickpocket_condition()
{
        return c_beklauen(78,560);
};
func void dia_sylvio_pickpocket_info()
{
        Info_ClearChoices(dia_sylvio_pickpocket);
        Info_AddChoice(dia_sylvio_pickpocket,DIALOG_BACK,dia_sylvio_pickpocket_back);
        Info_AddChoice(dia_sylvio_pickpocket,DIALOG_PICKPOCKET,dia_sylvio_pickpocket_doit);
};
func void dia_sylvio_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_sylvio_pickpocket);
};
func void dia_sylvio_pickpocket_back()
{
        Info_ClearChoices(dia_sylvio_pickpocket);
};
