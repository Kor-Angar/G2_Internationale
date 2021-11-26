instance DIA_ANDRE_EXIT(C_INFO)
{
        npc = mil_311_andre;
        nr = 999;
        condition = dia_andre_exit_condition;
        information = dia_andre_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_andre_exit_condition()
{
        if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
        {
                return TRUE;
        };
};
func void dia_andre_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
        npc = mil_311_andre;
        nr = 999;
        condition = dia_andre_firstexit_condition;
        information = dia_andre_firstexit_info;
        permanent = FALSE;
        description = DIALOG_ENDE;
};
func int dia_andre_firstexit_condition()
{
        if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
        {
                return TRUE;
        };
};
func void dia_andre_firstexit_info()
{
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"START");
        b_startotherroutine(wulfgar,"START");
};
var int andre_steckbrief;
func void b_andre_steckbrief()
{
        B_AI_Output(self,other,"DIA_Andre_Add_08_00");    //Один из моих людей сказал мне, что бандиты распространяют объявления о розыске с твоим изображением.
        B_AI_Output(self,other,"DIA_Andre_Add_08_01");    //Он также сказал, что поначалу ты это отрицал.
        B_AI_Output(self,other,"DIA_Andre_Add_08_02");    //Так что все это значит?
        B_AI_Output(other,self,"DIA_Andre_Add_15_03");    //Я не знаю, почему они ищут меня...
        B_AI_Output(self,other,"DIA_Andre_Add_08_04");    //Надеюсь, ради твоего же блага, что ты говоришь мне правду.
        B_AI_Output(self,other,"DIA_Andre_Add_08_05");    //Мне не нужны в ополчении люди с запятнанной репутацией.
        B_AI_Output(self,other,"DIA_Andre_Add_08_06");    //Большинство из этих бандитов - бывшие каторжники из колонии.
        B_AI_Output(self,other,"DIA_Andre_Add_08_07");    //Я надеюсь, что ты никак не связан с этими головорезами!
        ANDRE_STECKBRIEF = TRUE;
};
var int andre_cantharfalle;
func void b_andre_cantharfalle()
{
        B_AI_Output(self,other,"B_Andre_CantharFalle_08_00");     //Ко мне приходил торговец Кантар. Он сказал, что ты беглый каторжник из колонии.
        B_AI_Output(self,other,"B_Andre_CantharFalle_08_01");     //Я не знаю, правда ли это, и предпочитаю не спрашивать тебя об этом, но ты должен уладить этот вопрос.
        b_removenpc(vlk_470_sarah);
        b_startotherroutine(canthar,"MARKTSTAND");
        AI_Teleport(canthar,"NW_CITY_SARAH");
        if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
        {
                CANTHAR_SPERRE = TRUE;
        };
        MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
        b_checklog();
        ANDRE_CANTHARFALLE = TRUE;
};
instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
        npc = mil_311_andre;
        nr = 3;
        condition = dia_andre_cantharfalle_condition;
        information = dia_andre_cantharfalle_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_andre_cantharfalle_condition()
{
        if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
        {
                return TRUE;
        };
        if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
        {
                return TRUE;
        };
};
func void dia_andre_cantharfalle_info()
{
        if(ANDRE_STECKBRIEF == FALSE)
        {
                b_andre_steckbrief();
        };
        if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
        {
                b_andre_cantharfalle();
        };
};
var int andre_lastpetzcounter;
var int andre_lastpetzcrime;
instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_pmschulden_condition;
        information = dia_andre_pmschulden_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_andre_pmschulden_condition()
{
        if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
        {
                return TRUE;
        };
};
func void dia_andre_pmschulden_info()
{
        var int diff;
        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");     //Ты пришел заплатить штраф?
        if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
        {
                b_andre_steckbrief();
        };
        if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
        {
                b_andre_cantharfalle();
        };
        if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
        {
                B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");     //Я даже задавался вопросом, осмелишься ли ты появиться здесь?!
                B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");     //Обвинения против тебя только множатся!
                if(ANDRE_SCHULDEN < 1000)
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");     //Я предупреждал тебя! Теперь штраф, который тебе придется заплатить, только увеличился!
                        B_AI_Output(other,self,"DIA_Andre_PMAdd_15_00");  //Сколько?
                        diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
                        if(diff > 0)
                        {
                                ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
                        };
                        if(ANDRE_SCHULDEN > 1000)
                        {
                                ANDRE_SCHULDEN = 1000;
                        };
                        b_say_gold(self,other,ANDRE_SCHULDEN);
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");     //Ты глубоко разочаровал меня!
                };
        }
        else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
        {
                B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");     //Выяснились новые подробности.
                if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");     //Неожиданно не осталось никого, кто бы мог обвинить тебя в убийстве.
                };
                if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");     //Никто больше не помнит, чтобы ты что-то крал.
                };
                if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");     //Больше нет свидетелей того, как ты принимал участие в драке.
                };
                if(b_getgreatestpetzcrime(self) == CRIME_NONE)
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");     //Похоже, что все обвинения против тебя оказались несостоятельными.
                };
                B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");     //Я не знаю, что произошло, но я предупреждаю тебя: не пытайся провести меня!
                if(b_getgreatestpetzcrime(self) == CRIME_NONE)
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");     //Как бы то ни было, я решил снять с тебя все обвинения.
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");     //Смотри, чтобы больше не было никаких проблем!
                        ANDRE_SCHULDEN = 0;
                        ANDRE_LASTPETZCOUNTER = 0;
                        ANDRE_LASTPETZCRIME = CRIME_NONE;
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");     //Я хочу, чтобы тебе было понятно: тебе все равно придется заплатить полную сумму штрафа.
                        b_say_gold(self,other,ANDRE_SCHULDEN);
                        B_AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");     //Что скажешь?
                };
        };
        if(b_getgreatestpetzcrime(self) != CRIME_NONE)
        {
                Info_ClearChoices(dia_andre_pmschulden);
                Info_ClearChoices(dia_andre_petzmaster);
                Info_AddChoice(dia_andre_pmschulden,dia_andre_petzmaster_paylater_description,dia_andre_petzmaster_paylater); // "У меня недостаточно золота."
                Info_AddChoice(dia_andre_pmschulden,dia_andre_pmschulden_howmuchagain_description,dia_andre_pmschulden_howmuchagain); // "Сколько там еще?"
                if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
                {
                        Info_AddChoice(dia_andre_pmschulden,dia_andre_petzmaster_paynow_description,dia_andre_petzmaster_paynow); // "Я хочу заплатить штраф!"
                };
        };
};
func void dia_andre_pmschulden_howmuchagain()
{
        B_AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");        //Сколько там еще?
        b_say_gold(self,other,ANDRE_SCHULDEN);
        Info_ClearChoices(dia_andre_pmschulden);
        Info_ClearChoices(dia_andre_petzmaster);
        Info_AddChoice(dia_andre_pmschulden,dia_andre_petzmaster_paylater_description,dia_andre_petzmaster_paylater); // "У меня недостаточно золота."
        Info_AddChoice(dia_andre_pmschulden,dia_andre_pmschulden_howmuchagain_description,dia_andre_pmschulden_howmuchagain); // "Сколько там еще?"
        if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
        {
                Info_AddChoice(dia_andre_pmschulden,dia_andre_petzmaster_paynow_description,dia_andre_petzmaster_paynow); // "Я хочу заплатить штраф!"
        };
};
instance DIA_ANDRE_PETZMASTER(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_petzmaster_condition;
        information = dia_andre_petzmaster_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_andre_petzmaster_condition()
{
        if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
        {
                return TRUE;
        };
};
func void dia_andre_petzmaster_info()
{
        ANDRE_SCHULDEN = 0;
        if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
        {
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");     //Ты тот новичок, что баламутит город.
        };
        if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
        {
                b_andre_steckbrief();
        };
        if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
        {
                b_andre_cantharfalle();
        };
        if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
        {
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");     //Хорошо, что ты пришел ко мне пока все еще можно уладить.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");     //Убийство - серьезное преступление!
                ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
                ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
                if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
                {
                        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");     //Не говоря уже о других делах, что ты натворил.
                };
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");     //Страже приказано казнить убийц на месте.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");     //И большинство горожан не потерпят убийц в городе!
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");     //Но я не заинтересован в том, чтобы повесить тебя. Идет война, и нам нужен каждый солдат.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");     //Но будет не так-то просто успокоить народ.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");     //Ты мог бы подтвердить свое раскаяние, заплатив штраф - естественно, он должен быть довольно значительным.
        };
        if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
        {
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");     //Хорошо, что ты пришел! Тебя обвиняют в воровстве! Есть свидетели!
                if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
                {
                        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");     //Не говоря уже о других твоих прегрешениях, о которых я слышал.
                };
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");     //Я не потерплю такого поведения в моем городе!
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");     //Ты должен заплатить штраф, чтобы искупить свою вину.
                ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
        };
        if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
        {
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");     //Если ты дерешься со всяким сбродом в гавани - это одно...
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");     //Но когда ты нападаешь на граждан или королевских солдат, я должен принимать меры.
                if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
                {
                        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");     //А эту овцу было обязательно убивать?
                };
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");     //Если я просто так отпущу тебя, скоро все будут делать то, что хотят.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");     //Так что тебе придется заплатить соответствующий штраф - и твои прегрешения будут забыты.
                ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
        };
        if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
        {
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");     //Я слышал, что ты зарезал овцу.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");     //Ты же понимаешь, что я не могу оставить это дело просто так.
                B_AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");     //Тебе придется заплатить компенсацию!
                ANDRE_SCHULDEN = 100;
        };
        B_AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");     //Сколько?
        if(ANDRE_SCHULDEN > 1000)
        {
                ANDRE_SCHULDEN = 1000;
        };
        b_say_gold(self,other,ANDRE_SCHULDEN);
        Info_ClearChoices(dia_andre_pmschulden);
        Info_ClearChoices(dia_andre_petzmaster);
        Info_AddChoice(dia_andre_petzmaster,dia_andre_petzmaster_paylater_description,dia_andre_petzmaster_paylater); // "У меня недостаточно золота."
        if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
        {
                Info_AddChoice(dia_andre_petzmaster,dia_andre_petzmaster_paynow_description,dia_andre_petzmaster_paynow); // "Я хочу заплатить штраф!"
        };
};
func void dia_andre_petzmaster_paynow()
{
        B_AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");      //Я хочу заплатить штраф!
        b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");      //Хорошо! Я позабочусь, чтобы все в городе узнали об этом - это хоть как-то восстановит твою репутацию.
        b_grantabsolution(LOC_CITY);
        ANDRE_SCHULDEN = 0;
        ANDRE_LASTPETZCOUNTER = 0;
        ANDRE_LASTPETZCRIME = CRIME_NONE;
        Info_ClearChoices(dia_andre_petzmaster);
        Info_ClearChoices(dia_andre_pmschulden);
};
func void dia_andre_petzmaster_paylater()
{
        B_AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");    //У меня недостаточно золота.
        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");    //Тогда постарайся собрать необходимую сумму как можно быстрее.
        B_AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");    //Но должен предупредить тебя: если ты при этом усугубишь свою вину, то твой штраф только возрастет.
        ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
        ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
        AI_StopProcessInfos(self);
};
instance DIA_ANDRE_HALLO(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_hallo_condition;
        information = dia_andre_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_andre_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
        {
                return TRUE;
        };
};
func void dia_andre_hallo_info()
{
        B_AI_Output(self,other,"DIA_Andre_Hallo_08_00");  //Да пребудет с тобой Иннос, чужеземец! Что привело тебя ко мне?
};
instance DIA_ANDRE_MESSAGE(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_message_condition;
        information = dia_andre_message_info;
        permanent = FALSE;
        description = "У меня есть важное сообщение для лорда Хагена.";
};
func int dia_andre_message_condition()
{
        if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
        {
                return TRUE;
        };
};
func void dia_andre_message_info()
{
        B_AI_Output(other,self,"DIA_Andre_Message_15_00");        //У меня есть важное сообщение для лорда Хагена.
        B_AI_Output(self,other,"DIA_Andre_Message_08_01");        //Ну, ты стоишь перед его представителем. Так что там такое?
        Info_ClearChoices(dia_andre_message);
        Info_AddChoice(dia_andre_message,dia_andre_message_personal_description,dia_andre_message_personal); // "Это я могу сказать только лорду Хагену."
        Info_AddChoice(dia_andre_message,dia_andre_message_dragons_description,dia_andre_message_dragons); // "Армию орков возглавляют ДРАКОНЫ!"
        Info_AddChoice(dia_andre_message,dia_andre_message_eyeinnos_description,dia_andre_message_eyeinnos); // "Это насчет священного артефакта - Глаза Инноса."
};
func void b_andre_lordhagennichtzusprechen()
{
        B_AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00"); //Лорд Хаген принимает только паладинов и тех, кто служит паладинам.
        B_AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01"); //Он считает ниже своего достоинства тратить время на простых людей.
};
func void dia_andre_message_eyeinnos()
{
        B_AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");       //Это насчет священного артефакта - Глаза Инноса.
        B_AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");       //Глаз Инноса - никогда не слышал о таком. Но это еще ничего не значит.
        B_AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");       //Если действительно существует артефакт, носящий Его имя, только самые высокопоставленные члены нашего ордена могут знать о нем.
        B_AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");       //Вот почему мне нужно поговорить именно с лордом Хагеном.
        ANDRE_EYEINNOS = TRUE;
        b_andre_lordhagennichtzusprechen();
        Info_ClearChoices(dia_andre_message);
};
func void dia_andre_message_dragons()
{
        B_AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");        //Армия орков, возглавляемая ДРА...
        B_AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");        //(прерывает) Я ЗНАЮ, что армия орков становится все сильнее
        B_AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");        //Ты же не хочешь мне сказать, что ты ТОЛЬКО это хочешь доложить лорду Хагену.
        B_AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");        //Он оторвет тебе голову, если ты будешь попусту тратить его время, отвлекая его такими историями.
        B_AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");        //Я уверен, что ты достаточно умен и понимаешь это сам.
        B_AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");        //Так все-таки, зачем тебе нужно увидеть его?
};
func void dia_andre_message_personal()
{
        B_AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");       //Это я могу сказать только лорду Хагену.
        B_AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");       //Как знаешь. Но ты должен понять одно:
        b_andre_lordhagennichtzusprechen();
        Info_ClearChoices(dia_andre_message);
};
instance DIA_ANDRE_PALADINE(C_INFO)
{
        npc = mil_311_andre;
        nr = 3;
        condition = dia_andre_paladine_condition;
        information = dia_andre_paladine_info;
        permanent = FALSE;
        description = "Что паладины делают в городе?";
};
func int dia_andre_paladine_condition()
{
        if((other.guild != GIL_MIL) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_andre_paladine_info()
{
        B_AI_Output(other,self,"DIA_Andre_Paladine_15_00");       //Почему паладины прибыли в город?
        B_AI_Output(self,other,"DIA_Andre_Paladine_08_01");       //Цели нашей операции являются тайной.
        B_AI_Output(self,other,"DIA_Andre_Paladine_08_02");       //Я могу сказать тебе только, что гражданам города не грозит никакая опасность.
        B_AI_Output(self,other,"DIA_Andre_Paladine_08_03");       //Тебе не о чем волноваться.
};
instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
        npc = mil_311_andre;
        nr = 3;
        condition = dia_andre_paladineagain_condition;
        information = dia_andre_paladineagain_info;
        permanent = FALSE;
        description = "Что паладины делают в городе?";
};
func int dia_andre_paladineagain_condition()
{
        if((other.guild == GIL_MIL) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_andre_paladineagain_info()
{
        if(Npc_KnowsInfo(other,dia_andre_paladine))
        {
                B_AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");  //Так ты скажешь мне, зачем паладины прибыли в Хоринис?
        }
        else
        {
                B_AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");  //Что паладины делают в городе?
        };
        B_AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");  //Теперь, когда ты вступил в городскую стражу, ты подчиняешься паладинам.
        B_AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");  //И теперь я могу доверять тебе.
        B_AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");  //Мы прибыли по поручению короля Робара. С разрушением Барьера поставки руды прекратились.
        B_AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");  //Поэтому теперь мы добываем руду и доставляем ее на материк. При помощи этой руды мы выкуем новое оружие и победим орков.
        KNOWSPALADINS_ORE = TRUE;
};
instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_asktojoin_condition;
        information = dia_andre_asktojoin_info;
        permanent = FALSE;
        description = "Я хочу поступить на службу к паладинам!";
};
func int dia_andre_asktojoin_condition()
{
        if(hero.guild == GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_andre_asktojoin_info()
{
        B_AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");      //Я хочу поступить на службу к паладинам!
        if(Npc_KnowsInfo(other,dia_andre_message))
        {
                B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");      //Хорошо. Нам нужны люди. И меня не интересует, почему ты решил присоединиться к нам.
                B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");      //Если ты поступишь на службы к паладинам, я помогу тебе добиться аудиенции у лорда Хагена.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");      //Достойное решение.
        };
        B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");      //Однако у меня есть приказ принимать в ополчение только граждан этого города.
        B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");      //Мой командующий опасается, что в наши ряды могут проникнуть шпионы или диверсанты.
        B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");      //Он хочет таким образом свести риск к минимуму.
        B_AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");      //Поэтому, ты сначала должен стать гражданином города. Не знаю, имеет это правило смысл или нет, но приказ есть приказ.
        Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
        b_logentry(TOPIC_BECOMEMIL,TOPIC_BECOMEMIL_description_243); // "Прежде чем я смогу вступить в ряды городской стражи я должен стать гражданином города."
};
instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
        npc = mil_311_andre;
        nr = 5;
        condition = dia_andre_aboutmiliz_condition;
        information = dia_andre_aboutmiliz_info;
        permanent = FALSE;
        description = "Что я получу от вступления в ополчение?";
};
func int dia_andre_aboutmiliz_condition()
{
        if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
        {
                return TRUE;
        };
};
func void dia_andre_aboutmiliz_info()
{
        B_AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");     //Что я получу от вступления в ополчение?
        B_AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");     //Позволь мне прояснить один момент. Обязанности солдата ополчения не ограничиваются расхаживанием по городу в униформе.
        B_AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");     //Это грязная и даже кровавая работа. Когда ты станешь одним из нас, тебя будет ждать целая гора работы.
        B_AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");     //Но это того стоит. Помимо жалования, у тебя появляется шанс однажды стать священным воином Инноса.
};
instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_alternative_condition;
        information = dia_andre_alternative_info;
        permanent = FALSE;
        description = "А нет более быстрого способа присоединиться к вам?";
};
func int dia_andre_alternative_condition()
{
        if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_andre_alternative_info()
{
        B_AI_Output(other,self,"DIA_Andre_Alternative_15_00");    //А нет более быстрого способа присоединиться к вам?
        B_AI_Output(self,other,"DIA_Andre_Alternative_08_01");    //М-м-м. (задумывается) У тебя действительно серьезные намерения, да?
        B_AI_Output(self,other,"DIA_Andre_Alternative_08_02");    //Хорошо. Слушай. У меня есть проблема. Если ты решишь ее для меня, я обещаю, что ты будешь зачислен в ополчение.
        B_AI_Output(self,other,"DIA_Andre_Alternative_08_03");    //И самое главное: никому ни слова!
};
instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_guildofthieves_condition;
        information = dia_andre_guildofthieves_info;
        permanent = FALSE;
        description = "В чем твоя проблема?";
};
func int dia_andre_guildofthieves_condition()
{
        if(Npc_KnowsInfo(other,dia_andre_alternative))
        {
                return TRUE;
        };
};
func void dia_andre_guildofthieves_info()
{
        B_AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00"); //Что у тебя за проблема?
        B_AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01"); //Последнее время в городе развелось слишком много воров. И мы никак не можем поймать ни одного из них. Воры действуют очень осторожно.
        B_AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02"); //Эти мерзавцы знают свое дело. Я уверен, что в городе действует организованная банда.
        B_AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03"); //Я не удивлюсь, если в Хоринисе появилась гильдия воров. Найди главарей этой банды и ликвидируй их.
        if(other.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04"); //Тогда я смогу гарантировать, что ты будешь принят в ополчение - неважно, гражданин ты или нет.
                B_AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05"); //Но ты никому не должен говорить о нашем соглашении!
        };
        MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
        b_logentry(TOPIC_BECOMEMIL,TOPIC_BECOMEMIL_description_244); // "Есть также другой способ вступить в ряды городской стражи - найти и уничтожить гильдию воров Хориниса."
};
instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_wherethieves_condition;
        information = dia_andre_wherethieves_info;
        permanent = FALSE;
        description = "Где мне лучше начать искать этих воров?";
};
func int dia_andre_wherethieves_condition()
{
        if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_andre_wherethieves_info()
{
        B_AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");   //Где мне лучше начать искать этих воров?
        B_AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");   //Если бы я знал это, я бы сделал это сам!
        B_AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");   //Могу сказать одно: мы недавно перевернули вверх дном весь портовый квартал и ничего не нашли. Абсолютно ничего.
        B_AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");   //Люди, живущие там, не склонны к сотрудничеству, особенно, если на тебе доспехи паладина.
        B_AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");   //Но ты нездешний. Возможно, тебе они будут больше доверять.
        B_AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");   //Ты можешь поспрашивать в портовом квартале. Но будь осторожен. Если люди поймут, что ты работаешь на паладинов, ты не узнаешь НИЧЕГО!
        b_logentry(TOPIC_BECOMEMIL,TOPIC_BECOMEMIL_description_245); // "Если я хочу найти гильдию воров мне лучше начать прислушиваться к тому что говорят в портовом квартале."
};
instance DIA_ANDRE_WHATTODO(C_INFO)
{
        npc = mil_311_andre;
        nr = 3;
        condition = dia_andre_whattodo_condition;
        information = dia_andre_whattodo_info;
        permanent = FALSE;
        description = "Что мне делать, когда я найду этих воров?";
};
func int dia_andre_whattodo_condition()
{
        if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_andre_whattodo_info()
{
        B_AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");       //Что мне делать, когда я найду этих воров?
        B_AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");       //Если дело касается мелкой рыбешки - рядового вора или наводчика, лучше всего избежать схватки.
        B_AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");       //Просто приди ко мне и доложи. А я позабочусь, чтобы эта мразь оказалась за решеткой.
        B_AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");       //Городская стража может вмешаться в драку и у тебя не будет возможности объяснить им, что происходит.
        B_AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");       //Кроме того, за каждого преступника, который с твоей помощью будет засажен за решетку, тебе полагается награда.
        B_AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");       //Однако, если ты найдешь логово главарей - ну, тогда тебе, вероятно, не удастся избежать боя.
        b_logentry(TOPIC_BECOMEMIL,TOPIC_BECOMEMIL_description_246); // "Если я поймаю какую-нибудь мелкую рыбешку гильдии воров я должен привести его прямо к лорду Андре. А чтобы ликвидировать гильдию воров я должен найти их логово."
};
instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
        npc = mil_311_andre;
        nr = 200;
        condition = dia_andre_auslieferung_condition;
        information = dia_andre_auslieferung_info;
        permanent = TRUE;
        description = "Я пришел получить награду за преступника.";
};
func int dia_andre_auslieferung_condition()
{
        if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_andre_auslieferung_info()
{
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");   //Я пришел получить награду за преступника.
        Info_ClearChoices(dia_andre_auslieferung);
        Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_back_description,dia_andre_auslieferung_back); // "Я зайду позже НАЗАД"
        if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
        {
                Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_rengaru_description,dia_andre_auslieferung_rengaru); // "Ренгару украл у торговца Джоры."
        };
        if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
        {
                Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_halvor_description,dia_andre_auslieferung_halvor); // "Халвор торгует краденым."
        };
        if((MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE))
        {
                Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_nagur_description,dia_andre_auslieferung_nagur); // "Нагур убил посыльного Бальтрама."
        };
        if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
        {
                Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_canthar_description,dia_andre_auslieferung_canthar); // "Кантар пытается избавиться от Сары!"
        };
        if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
        {
                Info_AddChoice(dia_andre_auslieferung,dia_andre_auslieferung_sarah_description,dia_andre_auslieferung_sarah); // "Сара продает оружие Онару."
        };
};
func void dia_andre_auslieferung_back()
{
        Info_ClearChoices(dia_andre_auslieferung);
};
func void dia_andre_auslieferung_rengaru()
{
        AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");   //Ренгар украл у торговца Джоры. Он пытался скрыться, но я поймал его.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");   //Хорошо, мои люди уже схватили его. Больше он не сможет воровать у добропорядочных граждан.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");   //Вот твои деньги.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD);
        RENGARU_AUSGELIEFERT = TRUE;
        MIS_THIEFGUILD_SUCKED = TRUE;
        b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
        Info_ClearChoices(dia_andre_auslieferung);
        b_startotherroutine(rengaru,"PRISON");
};
func void dia_andre_auslieferung_halvor()
{
        AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");    //Халвор торгует краденым. Он продает товары, украденные бандитами у торговцев.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");    //Так вот, кто этим занимается. Мои люди немедленно схватят его.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");    //Я не думаю, что это будет сложно. Я готов вручить тебе твою награду прямо сейчас.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD);
        b_startotherroutine(halvor,"PRISON");
        MIS_THIEFGUILD_SUCKED = TRUE;
        HALVOR_AUSGELIEFERT = TRUE;
        b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
        Info_ClearChoices(dia_andre_auslieferung);
};
func void dia_andre_auslieferung_nagur()
{
        AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");     //Нагур убил посыльного Бальтрама. Он пытался использовать меня в качестве нового посыльного, чтобы перехватить товар с фермы Акила.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");     //Он понесет заслуженное наказание. Я немедленно прикажу посадить его за решетку.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");     //Вот, получи награду. Ты ее заслужил.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD);
        b_startotherroutine(nagur,"PRISON");
        MIS_THIEFGUILD_SUCKED = TRUE;
        NAGUR_AUSGELIEFERT = TRUE;
        b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
        Info_ClearChoices(dia_andre_auslieferung);
};
func void dia_andre_auslieferung_canthar()
{
        AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");   //Торговец Кантар пытается избавиться от Сары!
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");   //Сары? Торговки оружием с рыночной площади?
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");   //Я должен был подсунуть Саре письмо, которое подтвердило бы, что она поставляет оружие Онару.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");   //Понимаю. Я с радостью заплачу награду за этого ублюдка. Можешь считать, что он уже за решеткой.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD);
        b_startotherroutine(canthar,"KNAST");
        MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
        b_checklog();
        CANTHAR_AUSGELIEFERT = TRUE;
        b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
        Info_ClearChoices(dia_andre_auslieferung);
};
func void dia_andre_auslieferung_sarah()
{
        AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
        AI_Teleport(canthar,"NW_CITY_SARAH");
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");     //Сара продает оружие Онару.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");     //Сара? Торговка оружием с рыночной площади? У тебя есть доказательство?
        B_AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");     //В ее кармане письмо, с деталями поставки оружия ему.
        B_AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");     //Она поплатится за это. Я прикажу арестовать ее.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD);
        b_startotherroutine(sarah,"KNAST");
        b_startotherroutine(canthar,"MARKTSTAND");
        SARAH_AUSGELIEFERT = TRUE;
        MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
        b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
        Info_ClearChoices(dia_andre_auslieferung);
};
instance DIA_ANDRE_DGRUNNING(C_INFO)
{
        npc = mil_311_andre;
        nr = 4;
        condition = dia_andre_dgrunning_condition;
        information = dia_andre_dgrunning_info;
        permanent = TRUE;
        description = "Насчет гильдии воров...";
};
func int dia_andre_dgrunning_condition()
{
        if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_andre_dgrunning_info()
{
        B_AI_Output(other,self,"DIA_Andre_DGRunning_15_00");      //Насчет гильдии воров...
        if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
        {
                B_AI_Output(self,other,"DIA_Andre_DGRunning_08_01");      //Ты можешь забыть об этом деле. Я послал своих людей в канализацию.
                B_AI_Output(self,other,"DIA_Andre_DGRunning_08_02");      //Гильдия воров теперь не более чем перевернутая страница истории этого города.
                MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
                if(MIS_CASSIAKELCHE == LOG_RUNNING)
                {
                        MIS_CASSIAKELCHE = LOG_OBSOLETE;
                };
                if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
                {
                        MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
                };
                return;
        };
        B_AI_Output(self,other,"DIA_Andre_DGRunning_08_03");      //Да?
        Info_ClearChoices(dia_andre_dgrunning);
        Info_AddChoice(dia_andre_dgrunning,dia_andre_dgrunning_back_description,dia_andre_dgrunning_back); // "Я работаю над этим..."
        if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
        {
                Info_AddChoice(dia_andre_dgrunning,dia_andre_dgrunning_success_description,dia_andre_dgrunning_success); // "Я всех их ликвидировал!"
        };
        if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
        {
                Info_AddChoice(dia_andre_dgrunning,dia_andre_dgrunning_verrat_description,dia_andre_dgrunning_verrat); // "Я нашел логово гильдии воров!"
        };
};
func void dia_andre_dgrunning_back()
{
        B_AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00"); //Я работаю над этим...
        if(DIEBESGILDE_VERRATEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01"); //Хорошо. Я дам тебе еще немного времени на выполнение этого задания.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02"); //Хорошо! Держи меня в курсе.
        };
        Info_ClearChoices(dia_andre_dgrunning);
};
func void dia_andre_dgrunning_verrat()
{
        B_AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");       //Я нашел логово гильдии воров!
        B_AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");       //Где?
        B_AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");       //В канализации под городом.
        B_AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");       //Что? Мы запечатали канализацию...
        B_AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");       //Похоже, это не помешало им проникнуть туда.
        B_AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");       //Ты ликвидировал этих преступников?
        DIEBESGILDE_VERRATEN = TRUE;
        DG_GEFUNDEN = TRUE;
};
func void dia_andre_dgrunning_success()
{
        B_AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");      //Я всех их ликвидировал!
        B_AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");      //Ты оказал городу большую услугу.
        DG_GEFUNDEN = TRUE;
        MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
        b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
        if(MIS_CASSIAKELCHE == LOG_RUNNING)
        {
                MIS_CASSIAKELCHE = LOG_OBSOLETE;
        };
        if(other.guild == GIL_NONE)
        {
                B_AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");      //Если ты все еще хочешь вступить в ополчение, дай мне знать.
        }
        else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
        {
                B_AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");      //Ты выполнил нашу работу, как настоящий слуга Инноса и солдат короля.
        };
        B_AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");      //Тебе полагается награда за этих бандитов. Вот, возьми.
        b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
        Info_ClearChoices(dia_andre_dgrunning);
};
instance DIA_ANDRE_JOIN(C_INFO)
{
        npc = mil_311_andre;
        nr = 100;
        condition = dia_andre_join_condition;
        information = dia_andre_join_info;
        permanent = TRUE;
        description = "Я готов вступить в ополчение!";
};
func int dia_andre_join_condition()
{
        if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
        {
                return TRUE;
        };
};
func void dia_andre_join_info()
{
        B_AI_Output(other,self,"DIA_Andre_JOIN_15_00");   //Я готов вступить в ополчение!
        if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
        {
                B_AI_Output(self,other,"DIA_Andre_JOIN_08_01");   //Я сдержу свое слово и приму тебя в ополчение, даже хотя ты и не являешься гражданином этого города.
                B_AI_Output(self,other,"DIA_Andre_JOIN_08_02");   //Но никому об этом не говори! Чем меньше людей будут знать об этом исключении, тем меньше мне придется оправдываться.
        }
        else if(PLAYER_ISAPPRENTICE > APP_NONE)
        {
                B_AI_Output(self,other,"DIA_Andre_JOIN_08_03");   //А ты являешься гражданином Хориниса?
                if(PLAYER_ISAPPRENTICE == APP_HARAD)
                {
                        B_AI_Output(other,self,"DIA_Andre_JOIN_15_04");   //Кузнец взял меня в ученики.
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_05");   //Гарад? Я знаю его. Он работает на нас. Он достойный человек.
                };
                if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
                {
                        B_AI_Output(other,self,"DIA_Andre_JOIN_15_06");   //Я ученик алхимика!
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_07");   //У нас, в ополчении, не так уж много ученых мужей. Возможно, твои навыки весьма пригодятся нам.
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_08");   //Я мало что знаю об алхимии. Но люди говорят, что он уважаемый человек.
                };
                if(PLAYER_ISAPPRENTICE == APP_BOSPER)
                {
                        B_AI_Output(other,self,"DIA_Andre_JOIN_15_09");   //Боспер, мастер-лучник, взял меня в ученики.
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_10");   //Тогда ты наверняка знаешь кое-что о том, как выжить в лесу? Это хорошо, потому что ополчению приходится выполнять задачи не только в городе.
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_11");   //Нам, определенно, нужны люди, умеющие ориентироваться в дикой местности.
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_12");   //И Боспер уважаемый человек в этом городе.
                };
                B_AI_Output(self,other,"DIA_Andre_JOIN_08_13");   //Если он поручился за тебя, ничто не мешает твоему вступлению в ряды ополчения.
                if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
                {
                        B_AI_Output(self,other,"DIA_Andre_JOIN_08_14");   //Кроме того, тебе удалось избавить город от гильдии воров. Я бы принял тебя только за этот подвиг.
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Andre_JOIN_08_15");   //Может быть - но ты все еще не гражданин этого города, а у меня есть приказ.
                return;
        };
        B_AI_Output(self,other,"DIA_Andre_JOIN_08_16");   //Ты можешь вступить в наши ряды, если хочешь. Но твое решение должно быть окончательным.
        B_AI_Output(self,other,"DIA_Andre_JOIN_08_17");   //После того, как ты наденешь доспехи ополчения, ты уже не сможешь просто так снять его и выйти из наших рядов.
        B_AI_Output(self,other,"DIA_Andre_JOIN_08_18");   //Ты готов сражаться вместе с нами за Инноса и короля?
        Info_ClearChoices(dia_andre_join);
        Info_AddChoice(dia_andre_join,dia_andre_join_no_description,dia_andre_join_no); // "Я пока не уверен..."
        Info_AddChoice(dia_andre_join,dia_andre_join_yes_description,dia_andre_join_yes); // "Я готов!"
};
func void dia_andre_join_yes()
{
        B_AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");       //Я готов!
        B_AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");       //Тогда так тому и быть. Добро пожаловать в ряды ополчения.
        Npc_SetTrueGuild(other,GIL_MIL);
        other.guild = GIL_MIL;
        Snd_Play("LEVELUP");
        B_AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");       //Вот твои доспехи.
        b_giveinvitems(self,other,itar_mil_l,1);
        B_AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");       //Носи их с гордостью и достоинством.
        SLD_AUFNAHME = LOG_OBSOLETE;
        KDF_AUFNAHME = LOG_OBSOLETE;
        MIL_AUFNAHME = LOG_SUCCESS;
        b_giveplayerxp(XP_BECOMEMILIZ);
        Info_ClearChoices(dia_andre_join);
};
func void dia_andre_join_no()
{
        B_AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");        //Я пока не уверен...
        B_AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");        //Если ты еще сомневаешься в своем решении, я не могу принять тебя в ополчение.
        Info_ClearChoices(dia_andre_join);
};
instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_lordhagen_condition;
        information = dia_andre_lordhagen_info;
        permanent = FALSE;
        description = "Могу я теперь увидеть лорда Хагена?";
};
func int dia_andre_lordhagen_condition()
{
        if((other.guild == GIL_MIL) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_andre_lordhagen_info()
{
        B_AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");      //Могу я теперь увидеть лорда Хагена?
        B_AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");      //Теперь ты состоишь нас службе у паладинов. Они пропустят тебя. Но твое сообщение должно быть действительно важным.
        B_AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");      //Не волнуйся, это так и есть...
        B_AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");      //Помни, что ты встречаешься с главой паладинов. Веди себя соответствующе. Теперь ты представляешь не только себя, но все ополчение.
};
instance DIA_ANDRE_WAFFE(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_waffe_condition;
        information = dia_andre_waffe_info;
        permanent = FALSE;
        description = "А я получу оружие?";
};
func int dia_andre_waffe_condition()
{
        if((other.guild == GIL_MIL) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
func void dia_andre_waffe_info()
{
        B_AI_Output(other,self,"DIA_Andre_Waffe_15_00");  //А я получу оружие?
        B_AI_Output(self,other,"DIA_Andre_Waffe_08_01");  //Конечно. Обычно этим занимается Пек. Но что-то я давно его не видел.
        B_AI_Output(self,other,"DIA_Andre_Waffe_08_02");  //Найди, где он скрывается, и приведи его сюда. Тогда он выдаст тебе оружие.
        B_AI_Output(self,other,"DIA_Andre_Waffe_08_03");  //А если ты хочешь поспать, можешь выбрать любую койку в наших казармах.
        MIS_ANDRE_PECK = LOG_RUNNING;
        Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
        b_logentry(TOPIC_PECK,TOPIC_PECK_description_247); // "Пек где-то в городе. Если я приведу его назад в казармы я смогу получить от него оружие."
        AI_StopProcessInfos(self);
};
instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_found_peck_condition;
        information = dia_andre_found_peck_info;
        permanent = FALSE;
        description = "Мне удалось найти Пека.";
};
func int dia_andre_found_peck_condition()
{
        if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
        {
                return TRUE;
        };
};
func void dia_andre_found_peck_info()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");     //Мне удалось найти Пека.
        B_AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");     //Да, он уже вернулся на свой пост и приступил к выполнению своих обязанностей. Где ты нашел его?
        Info_ClearChoices(dia_andre_found_peck);
        Info_AddChoice(dia_andre_found_peck,dia_andre_found_peck_somewhere_description,dia_andre_found_peck_somewhere); // "Я случайно наткнулся на него в городе."
        Info_AddChoice(dia_andre_found_peck,dia_andre_found_peck_redlight_description,dia_andre_found_peck_redlight); // "В 'Красном Фонаре'..."
};
func void dia_andre_found_peck_somewhere()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");   //Я случайно наткнулся на него в городе.
        B_AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");   //Хорошо, а теперь иди к нему и получи оружие.
        MIS_ANDRE_PECK = LOG_OBSOLETE;
        b_giveplayerxp(XP_FOUNDPECK);
        Info_ClearChoices(dia_andre_found_peck);
};
func void dia_andre_found_peck_redlight()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");    //"Он был в ""Красном Фонаре""."
        B_AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");    //То есть он развлекался с девочками вместо того, чтобы выполнять свои обязанности.
        B_AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");    //Я думаю, мне нужно серьезно поговорить с ним.
        b_giveplayerxp(XP_FOUNDPECK * 2);
        MIS_ANDRE_PECK = LOG_SUCCESS;
        Info_ClearChoices(dia_andre_found_peck);
};
func void b_andresold()
{
        B_AI_Output(self,other,"DIA_Andre_Sold_08_00");   //Вот твое жалование.
        b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};
instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_firstmission_condition;
        information = dia_andre_firstmission_info;
        permanent = FALSE;
        description = "У тебя есть задание для меня?";
};
func int dia_andre_firstmission_condition()
{
        if(other.guild == GIL_MIL)
        {
                return TRUE;
        };
};
func void dia_andre_firstmission_info()
{
        B_AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");   //У тебя есть задание для меня?
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");   //Последнее время в городе появилось очень много болотной травы.
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");   //Мы не можем позволить, чтобы эта зараза расползлась по городу.
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");   //В противном случае, все будут только курить травку и не смогут работать, не говоря уже о том, чтобы держать оружие.
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");   //Это недопустимо. Особенно сейчас, когда так велика опасность нападения орков или наемников.
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");   //Я подозреваю, что к этому имеют отношение наемники. Ручаюсь, это они принесли траву в город.
        B_AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");   //Что я могу сделать?
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");   //Мортис, один из наших людей, слышал в портовом кабаке, что где-то в порту находится целый тюк этой травы.
        B_AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");   //Поищи там и принеси этот тюк мне.
        MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
        Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
        b_logentry(TOPIC_WAREHOUSE,TOPIC_WAREHOUSE_description_248); // "Тюк болотной травы прибыл в гавань. Мортис прослышал об этом в местном пабе. Я должен найти этот тюк и принести его лорду Андре."
};
instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_found_stuff_condition;
        information = dia_andre_found_stuff_info;
        permanent = TRUE;
        description = "Насчет тюка...";
};
func int dia_andre_found_stuff_condition()
{
        if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_andre_found_stuff_info()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");    //Насчет тюка...
        B_AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");    //Ты нашел его?
        if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
        {
                Info_ClearChoices(dia_andre_found_stuff);
                if(Npc_HasItems(other,itmi_herbpaket) > 0)
                {
                        Info_AddChoice(dia_andre_found_stuff,dia_andre_found_stuff_ja_description,dia_andre_found_stuff_ja); // "Да вот он."
                };
                Info_AddChoice(dia_andre_found_stuff,dia_andre_found_stuff_becken_description,dia_andre_found_stuff_becken); // "Я выбросил ее в море."
        }
        else
        {
                B_AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");    //Пока нет.
        };
};
func void dia_andre_found_stuff_ja()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00"); //Да, вот он.
        b_giveinvitems(other,self,itmi_herbpaket,1);
        B_AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01"); //Отлично. Мы будем охранять эту траву.
        b_andresold();
        MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
        MIS_CIPHER_PAKET = LOG_FAILED;
        b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
        Info_ClearChoices(dia_andre_found_stuff);
};
func void dia_andre_found_stuff_becken()
{
        B_AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");     //Я выбросил ее в море.
        B_AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");     //Да? Ну, главное, что она теперь не сможет попасть в плохие руки.
        b_andresold();
        MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
        b_giveplayerxp(XP_WAREHOUSE_SUPER);
        Info_ClearChoices(dia_andre_found_stuff);
};
instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_find_dealer_condition;
        information = dia_andre_find_dealer_info;
        permanent = FALSE;
        description = "У тебя есть еще работа для меня?";
};
func int dia_andre_find_dealer_condition()
{
        if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
        {
                return TRUE;
        };
};
func void dia_andre_find_dealer_info()
{
        B_AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");    //У тебя есть еще работа для меня?
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");    //Ты вывел болотную траву из оборота - это хорошо.
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");    //Но я хочу знать, кто распространяет ее среди горожан.
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");    //Это, должно быть, кто-то в портовом квартале.
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");    //Если бы этот человек часто приходил в город, он давно бы был пойман.
        B_AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");    //Что именно мне нужно сделать?
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");    //Найди торговца и заставь его продать тебе этой травы. Это будет непросто, но иначе мы не сможем арестовать его.
        B_AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");    //Поговори с Мортисом. Он хорошо знает портовый квартал. Возможно, он сможет помочь тебе.
        MIS_ANDRE_REDLIGHT = LOG_RUNNING;
        b_startotherroutine(nadja,"SMOKE");
        Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
        b_logentry(TOPIC_REDLIGHT,TOPIC_REDLIGHT_description_249); // "Я должен найти человека продающего болотную траву в портовом квартале. Я должен заставить его продать мне немного травы. Мортис может помочь мне в этом."
};
instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
        npc = mil_311_andre;
        nr = 2;
        condition = dia_andre_redlight_success_condition;
        information = dia_andre_redlight_success_info;
        permanent = TRUE;
        description = "Насчет травы...";
};
func int dia_andre_redlight_success_condition()
{
        if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_andre_redlight_success_info()
{
        B_AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");       //Насчет травы...
        if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
        {
                B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");       //Я не думаю, что мы теперь сможем что-то узнать в портовом квартале.
                if(Npc_IsDead(borka) == TRUE)
                {
                        B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");       //Только не теперь, когда этот вышибала мертв.
                };
                if(NADJA_VICTIM == TRUE)
                {
                        B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");       //Эта девочка из Красного Фонаря, Надя, мертва. Возможно, это просто случайное совпадение.
                        b_removenpc(vlk_435_nadja);
                };
                if(UNDERCOVER_FAILED == TRUE)
                {
                        B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");       //Ты был недостаточно осторожен.
                };
                MIS_ANDRE_REDLIGHT = LOG_FAILED;
                b_checklog();
        }
        else if(BORKA_DEAL == 2)
        {
                B_AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");       //Я знаю, кто распространяет траву в городе. Это Борка, вышибала в Красном Фонаре.
                B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");       //Точно? У тебя есть доказательства?
                B_AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");       //Он продал мне болотной травы.
                B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");       //Отлично, этого достаточно для нас. Я прикажу немедленно арестовать его.
                b_startotherroutine(borka,"PRISON");
                MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
                b_giveplayerxp(XP_REDLIGHT);
                b_andresold();
        }
        else
        {
                B_AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");       //...я все еще работаю над этим.
                B_AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");       //Хорошо. Помни, что ты должен заставить этого человека совершить сделку с тобой.
        };
};
instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
        npc = mil_311_andre;
        nr = 3;
        condition = dia_andre_hilfbauerlobart_condition;
        information = dia_andre_hilfbauerlobart_info;
        description = "У тебя есть еще задания для меня?";
};
func int dia_andre_hilfbauerlobart_condition()
{
        if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
        {
                return TRUE;
        };
};
func void dia_andre_hilfbauerlobart_info()
{
        B_AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");        //У тебя есть еще задания для меня?
        B_AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");        //У фермера Лобарта какие-то проблемы на его полях.
        B_AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");        //Если мы поможем ему, это укрепит его отношения с городом. Так что отправляйся туда и посмотри, что там не так.
        Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
        b_logentry(TOPIC_FELDRAEUBER,TOPIC_FELDRAEUBER_description_250); // "Андре отправил меня на ферму Лобарта. Я опять должен помочь Лобарту восстановить порядок на ферме."
        MIS_ANDREHELPLOBART = LOG_RUNNING;
        Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
        Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
        Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
        Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
        Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
        Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
        Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
        b_startotherroutine(vino,"BUGSTHERE");
        b_startotherroutine(lobartsbauer1,"BUGSTHERE");
        b_startotherroutine(lobartsbauer2,"BUGSTHERE");
        AI_StopProcessInfos(self);
};
instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
        npc = mil_311_andre;
        condition = dia_andre_lobart_success_condition;
        information = dia_andre_lobart_success_info;
        description = "Я помог Лобарту.";
};
func int dia_andre_lobart_success_condition()
{
        if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
        {
                return TRUE;
        };
};
func void dia_andre_lobart_success_info()
{
        B_AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00"); //Я помог Лобарту.
        B_AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01"); //Превосходно. Если Лобарт будет счастлив, он продолжит продавать репу городу.
        b_giveplayerxp(XP_LOBARTBUGS);
        b_andresold();
};
func void b_andre_gotolordhagen()
{
        B_AI_Output(self,other,"DIA_Andre_Add_08_11");    //Тебе лучше отправиться прямо к нему.
};
instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_berichtdrachen_condition;
        information = dia_andre_berichtdrachen_info;
        permanent = FALSE;
        description = "Я был в Долине Рудников и видел драконов!";
};
func int dia_andre_berichtdrachen_condition()
{
        if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
        {
                return TRUE;
        };
};
func void dia_andre_berichtdrachen_info()
{
        B_AI_Output(other,self,"DIA_Andre_Add_15_13");    //Я был в Долине Рудников и видел драконов!
        if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
        {
                B_AI_Output(other,self,"DIA_Andre_Add_15_14");    //У меня есть письмо от командующего Гаронда, подтверждающее то, что я сказал.
        };
        B_AI_Output(self,other,"DIA_Andre_Add_08_10");    //Это заинтересует лорда Хагена!
        b_andre_gotolordhagen();
};
instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
        npc = mil_311_andre;
        condition = dia_andre_bennetinprison_condition;
        information = dia_andre_bennetinprison_info;
        permanent = TRUE;
        description = "А что насчет Беннета, кузнеца?";
};
func int dia_andre_bennetinprison_condition()
{
        if(MIS_RESCUEBENNET == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_andre_bennetinprison_info()
{
        B_AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00"); //А что насчет Беннета, кузнеца?
        B_AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01"); //Ты имеешь в виду этого наемника? Он сидит за решеткой, где ему самое место.
        B_AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");    //Могу я поговорить с ним?
        B_AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");    //Конечно. Но если ты попытаешься помочь ему бежать, ты окажешься за решеткой рядом с ним.
};
instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
        npc = mil_311_andre;
        condition = dia_andre_cornelius_liar_condition;
        information = dia_andre_cornelius_liar_info;
        permanent = TRUE;
        description = "Я думаю, Корнелиус лжет.";
};
func int dia_andre_cornelius_liar_condition()
{
        if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
        {
                return TRUE;
        };
};
func void dia_andre_cornelius_liar_info()
{
        B_AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00"); //Я думаю, Корнелиус лжет.
        B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01"); //Ты уверен?
        Info_ClearChoices(dia_andre_cornelius_liar);
        Info_AddChoice(dia_andre_cornelius_liar,dia_andre_cornelius_liar_no_description,dia_andre_cornelius_liar_no); // "Нет."
        Info_AddChoice(dia_andre_cornelius_liar,dia_andre_cornelius_liar_yes_description,dia_andre_cornelius_liar_yes); // "Да."
};
func void dia_andre_cornelius_liar_no()
{
        B_AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");      //Нет.
        B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");      //Тогда не стоит заявлять о своих подозрениях во весь голос.
        B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");      //Корнелиус - влиятельный человек. Он может сделать твою жизнь адом, если захочет.
        B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");      //Пока у тебя нет доказательств, я ничем не могу помочь тебе.
        Info_ClearChoices(dia_andre_cornelius_liar);
};
func void dia_andre_cornelius_liar_yes()
{
        B_AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");     //Да.
        B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");     //Что за доказательства у тебя есть?
        if(CORNELIUS_ISLIAR == TRUE)
        {
                B_AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");     //Я прочел его дневник! Его подкупили. Все, что он сказал, было ложью.
                B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");     //Если это действительно так, ты должен немедленно сообщить об этом лорду Хагену.
                B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");     //Покажи ему этот дневник. Он разберется в этом деле.
        }
        else
        {
                B_AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");     //Э-э-э, ну, я думаю...
                B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");     //Мне нужны доказательства, а не предположения. Принеси доказательства, и тогда я смогу что-нибудь сделать.
                B_AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");     //А до того времени тебе стоит поосторожнее выбирать слова.
        };
        Info_ClearChoices(dia_andre_cornelius_liar);
};
instance DIA_ANDRE_PALADIN(C_INFO)
{
        npc = mil_311_andre;
        condition = dia_andre_paladin_condition;
        information = dia_andre_paladin_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_andre_paladin_condition()
{
        if(other.guild == GIL_PAL)
        {
                return TRUE;
        };
};
func void dia_andre_paladin_info()
{
        B_AI_Output(self,other,"DIA_Andre_Paladin_08_00");        //Теперь ты паладин! Поздравляю!
        B_AI_Output(self,other,"DIA_Andre_Paladin_08_01");        //Я с самого начала знал, что ты не задержишься долго в ополчении.
};
instance DIA_ANDRE_PERM(C_INFO)
{
        npc = mil_311_andre;
        nr = 100;
        condition = dia_andre_perm_condition;
        information = dia_andre_perm_info;
        permanent = TRUE;
        description = "Как обстановка в городе?";
};
func int dia_andre_perm_condition()
{
        if(other.guild != GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_andre_perm_info()
{
        B_AI_Output(other,self,"DIA_Andre_PERM_15_00");   //Как обстановка в городе?
        B_AI_Output(self,other,"DIA_Andre_PERM_08_01");   //Все под контролем.
        if(other.guild == GIL_MIL)
        {
                B_AI_Output(self,other,"DIA_Andre_PERM_08_02");   //Выполняй свои задания.
        };
        if(other.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Andre_PERM_08_03");   //С этого времени ты должен докладывать непосредственно Лорду Хагену. Иди, поговори с ним.
        };
};
instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_berichtdrachentot_condition;
        information = dia_andre_berichtdrachentot_info;
        permanent = FALSE;
        description = "Я убил всех драконов в Долине Рудников!";
};
func int dia_andre_berichtdrachentot_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_andre_berichtdrachentot_info()
{
        B_AI_Output(other,self,"DIA_Andre_Add_15_15");    //Я убил всех драконов в Долине Рудников!
        B_AI_Output(self,other,"DIA_Andre_Add_08_08");    //Если это правда, ты должен рассказать об этом лорду Хагену.
        b_andre_gotolordhagen();
};
instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
        npc = mil_311_andre;
        nr = 1;
        condition = dia_andre_berichttorauf_condition;
        information = dia_andre_berichttorauf_info;
        permanent = FALSE;
        description = "Замок в Долине Рудников штурмовали орки!";
};
func int dia_andre_berichttorauf_condition()
{
        if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
        {
                return TRUE;
        };
};
func void dia_andre_berichttorauf_info()
{
        B_AI_Output(other,self,"DIA_Andre_Add_15_16");    //Замок в Долине Рудников штурмовали орки!
        B_AI_Output(self,other,"DIA_Andre_Add_08_09");    //Нет! Лорд Хаген должен услышать об этом.
        b_andre_gotolordhagen();
};
