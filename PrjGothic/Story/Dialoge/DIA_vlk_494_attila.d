instance DIA_ATTILA_EXIT(C_INFO)
{
        npc = vlk_494_attila;
        nr = 999;
        condition = dia_attila_exit_condition;
        information = dia_attila_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_attila_exit_condition()
{
        return TRUE;
};
func void dia_attila_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ATTILA_PICKPOCKET(C_INFO)
{
        npc = vlk_494_attila;
        nr = 900;
        condition = dia_attila_pickpocket_condition;
        information = dia_attila_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_attila_pickpocket_condition()
{
        return c_beklauen(55,100);
};
func void dia_attila_pickpocket_info()
{
        Info_ClearChoices(dia_attila_pickpocket);
        Info_AddChoice(dia_attila_pickpocket,DIALOG_BACK,dia_attila_pickpocket_back);
        Info_AddChoice(dia_attila_pickpocket,DIALOG_PICKPOCKET,dia_attila_pickpocket_doit);
};
func void dia_attila_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_attila_pickpocket);
};
func void dia_attila_pickpocket_back()
{
        Info_ClearChoices(dia_attila_pickpocket);
};
instance DIA_ATTILA_HALLO(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_hallo_condition;
        information = dia_attila_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_attila_hallo_condition()
{
        if(MIS_THIEFGUILD_SUCKED == TRUE)
        {
                return TRUE;
        };
};
func void dia_attila_hallo_info()
{
        B_AI_Output(self,other,"DIA_Attila_Hallo_09_00"); //(спокойно) Ах, наконец. Я ждал тебя, чужеземец.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_was_description,dia_attila_hallo_was); // "Что тебе нужно от меня?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_wer_description,dia_attila_hallo_wer); // "Кто ты?"
        b_giveplayerxp(XP_ATTILA_METHIM);
};
func void dia_attila_hallo_wer()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");     //Кто ты?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");     //Меня зовут Аттила... но разве мое имя важно? Наши имена ничего не значат.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");     //Ты это должен знать, чужеземец. (тихо смеется)
        KNOWS_ATTILA_WER = TRUE;
        Info_ClearChoices(dia_attila_hallo);
        if(KNOWS_ATTILA_WAS == FALSE)
        {
                Info_AddChoice(dia_attila_hallo,dia_attila_hallo_was_description,dia_attila_hallo_was); // "Что тебе нужно от меня?"
        };
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_theater_description,dia_attila_hallo_theater); // "К чему весь этот фарс?"
};
func void dia_attila_hallo_was()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");     //Что тебе нужно от меня?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");     //Я здесь, чтобы объяснить тебе несколько вещей. И кроме этого, я собираюсь убить тебя.
        KNOWS_ATTILA_WAS = TRUE;
        Info_ClearChoices(dia_attila_hallo);
        if(KNOWS_ATTILA_WER == FALSE)
        {
                Info_AddChoice(dia_attila_hallo,dia_attila_hallo_wer_description,dia_attila_hallo_wer); // "Кто ты?"
        };
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "Кто платит тебе за это?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_theater_description,dia_attila_hallo_theater); // "К чему весь этот фарс?"
};
func void dia_attila_hallo_theater()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00"); //К чему весь этот фарс?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01"); //Ты не должен умереть в неведении. Считай это проявлением уважения к приговоренным.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_ende_description,dia_attila_hallo_ende); // "Я пожалуй пойду. КОНЕЦ"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "Кто платит тебе за это?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "Почему ты хочешь убить меня?"
};
func void dia_attila_hallo_ende()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");    //Я, пожалуй, пойду...
        B_AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");    //Боюсь... я не могу позволить тебе этого. Смирись. Пришло время умереть.
        AI_DrawWeapon(self);
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "Кто платит тебе за это?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "Почему ты хочешь убить меня?"
};
func void dia_attila_hallo_auftrag()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00"); //Кто платит тебе за это?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01"); //Мои хозяева стараются работать в тени, как и я.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02"); //В условиях моего контракта записано, что я не имею права разглашать ни их имя, ни их резиденцию.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "Почему ты хочешь убить меня?"
};
func void dia_attila_hallo_warum()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");   //Почему ты хочешь убить меня?
        if(BETRAYAL_HALVOR == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");   //Ты сдал Халвора. Теперь он сидит в тюрьме. Так не пойдет.
        };
        if(RENGARU_INKNAST == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");   //Ты продал Ренгару ополчению. Он всего лишь мелкий воришка, но тебе не следовало делать этого.
        };
        if(NAGUR_AUSGELIEFERT == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");   //Нагур попал за решетку по твоей вине. Кое-кому кажется, что это непростительная ошибка.
        };
        B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");   //Мои хозяева недовольны этим. Чтобы не дать тебе совершить еще одну ошибку, они послали меня.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_gold_description,dia_attila_hallo_gold); // "Я могу дать тебе золото - много золота."
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_attacke_description,dia_attila_hallo_attacke); // "Дай мне хотя бы вынуть свое оружие."
};
func void dia_attila_hallo_gold()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");    //Я могу дать тебе золото - много золота.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");    //Тщетно. Я не за этим сюда пришел. Единственная цена, которую ты заплатишь - твоя жизнь. И заплатишь ты ее прямо сейчас.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_attila_hallo_attacke()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00"); //Дай мне хотя бы вынуть свое оружие.
        if(Npc_HasEquippedWeapon(other) == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01"); //Хорошо, приготовься к своей последней битве.
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,1);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02"); //Да у тебя нет никакого оружия на поясе. У тебя осталось очень мало времени, чужеземец. Смерть уже близко.
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,2);
        };
};
instance DIA_ATTILA_WILLKOMMEN(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_willkommen_condition;
        information = dia_attila_willkommen_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_attila_willkommen_condition()
{
        if(Npc_IsInState(self,zs_talk) && (MIS_THIEFGUILD_SUCKED == FALSE))
        {
                return TRUE;
        };
};
func void dia_attila_willkommen_info()
{
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_00");    //Ах, наконец. Я ждал тебя, чужеземец.
        b_giveplayerxp(XP_ATTILA_FRIEND);
        B_AI_Output(other,self,"DIA_Attila_Willkommen_15_01");    //Кто ты и что тебе нужно от меня?
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_02");    //Это неважно. Важно лишь то, что ты делал. Ты оставался лояльным - даже если ты сам не знал об этом.
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_03");    //Некоторые покровители прослышали про твою лояльность. И они дают тебе шанс. Так используй его.
        B_AI_Output(other,self,"DIA_Attila_Willkommen_15_04");    //Эй, просто скажи мне кто они.
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_05");    //У меня есть для тебя подарок. А все остальное в твоих руках, чужеземец. (тихо смеется)
        b_giveinvitems(self,other,itke_thiefguildkey_mis,1);
        ATTILA_KEY = TRUE;
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"AFTER");
};
instance DIA_ATTILA_NACHSCHLUESSEL(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_nachschluessel_condition;
        information = dia_attila_nachschluessel_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_attila_nachschluessel_condition()
{
        if(Npc_KnowsInfo(other,dia_attila_wer) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_attila_nachschluessel_info()
{
        B_AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");        //Моя задача выполнена - пока.
        B_AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");        //Но кто знает, может, наши пути опять пересекутся...
        AI_StopProcessInfos(self);
};
instance DIA_ATTILA_WER(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_wer_condition;
        information = dia_attila_wer_info;
        permanent = FALSE;
        description = "Кто ты?";
};
func int dia_attila_wer_condition()
{
        if(Npc_KnowsInfo(other,dia_attila_willkommen))
        {
                return TRUE;
        };
};
func void dia_attila_wer_info()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");     //Кто ты?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");     //Меня зовут Аттила... но разве мое имя важно? Наши имена ничего не значат.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");     //Ты это должен знать, чужеземец. (тихо смеется)
        AI_StopProcessInfos(self);
};
