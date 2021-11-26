instance DIA_CORNELIUS_EXIT(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 999;
        condition = dia_cornelius_exit_condition;
        information = dia_cornelius_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_cornelius_exit_condition()
{
        return TRUE;
};
func void dia_cornelius_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 4;
        condition = dia_cornelius_seemurder_condition;
        information = dia_cornelius_seemurder_info;
        permanent = FALSE;
        description = "Ты видел, как убили Лотара, да?";
};
func int dia_cornelius_seemurder_condition()
{
        if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
        {
                return TRUE;
        };
};
func void dia_cornelius_seemurder_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");  //Ты видел, как убили Лотара, да?
        B_AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");  //(нервно) Я не обязан отвечать на такие вопросы.
        B_AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");  //Лорд Хаген уже допрашивал меня.
};
instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 5;
        condition = dia_cornelius_whatyousee_condition;
        information = dia_cornelius_whatyousee_info;
        permanent = FALSE;
        description = "Что именно ты видел?";
};
func int dia_cornelius_whatyousee_condition()
{
        if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
        {
                return TRUE;
        };
};
func void dia_cornelius_whatyousee_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00"); //Что именно ты видел?
        B_AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01"); //(возбужденно) Послушай, у меня нет времени на болтовню с тобой.
        B_AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02"); //(возбужденно) Уходи, я сейчас никого не принимаю.
        b_logentry(TOPIC_RESCUEBENNET,TOPIC_RESCUEBENNET_description_530); // "Корнелиус отказывается разговаривать со мной."
        AI_StopProcessInfos(self);
};
instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 6;
        condition = dia_cornelius_enough_condition;
        information = dia_cornelius_enough_info;
        permanent = FALSE;
        description = "Хватит! ЧТО ТЫ ВИДЕЛ?";
};
func int dia_cornelius_enough_condition()
{
        if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
        {
                return TRUE;
        };
};
func void dia_cornelius_enough_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_Enough_15_00");     //Хватит! ЧТО ТЫ ВИДЕЛ?
        B_AI_Output(self,other,"DIA_Cornelius_Enough_13_01");     //(нервно) Я... я видел, как наемник нанес удар в спину паладину.
        B_AI_Output(self,other,"DIA_Cornelius_Enough_13_02");     //(нервно) А затем он вынул свой меч и вонзил его ему в грудь.
        B_AI_Output(other,self,"DIA_Cornelius_Enough_15_03");     //Ты в этом совершенно уверен?
        B_AI_Output(self,other,"DIA_Cornelius_Enough_13_04");     //(испуганно) Да, конечно. Я видел это своим собственными глазами.
        B_AI_Output(self,other,"DIA_Cornelius_Enough_13_05");     //(испуганно) Но мне правда сейчас некогда. Мне нужно работать с документами.
        AI_StopProcessInfos(self);
};
instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 4;
        condition = dia_cornelius_dontbelieveyou_condition;
        information = dia_cornelius_dontbelieveyou_info;
        permanent = TRUE;
        description = "Я тебе не верю.";
};
func int dia_cornelius_dontbelieveyou_condition()
{
        if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
        {
                return TRUE;
        };
};
func void dia_cornelius_dontbelieveyou_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");     //Я тебе не верю.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");     //(с напускной уверенностью) И что? Что ты собираешься делать?
        Info_ClearChoices(dia_cornelius_dontbelieveyou);
        Info_AddChoice(dia_cornelius_dontbelieveyou,dia_cornelius_dontbelieveyou_whatyouwant_description,dia_cornelius_dontbelieveyou_whatyouwant); // "Сколько ты хочешь?"
        Info_AddChoice(dia_cornelius_dontbelieveyou,dia_cornelius_dontbelieveyou_wantsurvive_description,dia_cornelius_dontbelieveyou_wantsurvive); // "Ты ведь очень дорожишь своей жизнью правда?"
        if(hero.guild == GIL_KDF)
        {
                Info_AddChoice(dia_cornelius_dontbelieveyou,dia_cornelius_dontbelieveyou_monastery_description,dia_cornelius_dontbelieveyou_monastery); // "Тебя могли бы заставить говорить в монастыре."
        };
        if(hero.guild == GIL_SLD)
        {
                Info_AddChoice(dia_cornelius_dontbelieveyou,dia_cornelius_dontbelieveyou_knowyourhome_description,dia_cornelius_dontbelieveyou_knowyourhome); // "Я могу сказать наемникам где ты живешь."
        };
        if(hero.guild == GIL_MIL)
        {
                Info_AddChoice(dia_cornelius_dontbelieveyou,dia_cornelius_dontbelieveyou_perjury_description,dia_cornelius_dontbelieveyou_perjury); // "За лжесвидетельство тебя посадят в тюрьму - и надолго!"
        };
};
func void dia_cornelius_dontbelieveyou_whatyouwant()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //Сколько ты хочешь?
        if(CORNELIUS_PAYFORPROOF == FALSE)
        {
                B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //(надменно) У тебя не хватит золота, чтобы заплатить мне.
                B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //Сколько?
                b_logentry(TOPIC_RESCUEBENNET,TOPIC_RESCUEBENNET_description_531); // "Корнелиус готов разговаривать со мной за 2000 золотых."
                CORNELIUS_PAYFORPROOF = TRUE;
        };
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2000 золотых. Ну... Тогда я, возможно, пересмотрю свою точку зрения.
        Info_ClearChoices(dia_cornelius_dontbelieveyou);
};
func void dia_cornelius_dontbelieveyou_wantsurvive()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //Ты ведь очень дорожишь своей жизнью, правда?
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //(испуганно) Если ты нападешь на меня, тебя повесят.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //У меня очень влиятельные друзья. Так что даже не думай тронуть меня хотя бы пальцем.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //А теперь убирайся отсюда! Иди я позову стражу!
        AI_StopProcessInfos(self);
};
func void dia_cornelius_dontbelieveyou_monastery()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");   //Тебя могли бы заставить говорить в монастыре.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");   //(белый как мел) Что ты этим хочешь сказать?
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");   //Ну, у нас есть методы заставить говорить правду. Очень болезненные методы.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");   //Нет, пожалуйста, не нужно. Я скажу тебе все, что ты хочешь узнать.
        CORNELIUS_TELLTRUTH = TRUE;
        Info_ClearChoices(dia_cornelius_dontbelieveyou);
};
func void dia_cornelius_dontbelieveyou_knowyourhome()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");        //Я могу сказать наемникам, где ты живешь.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");        //(белый как мел) Что ты этим хочешь сказать?
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");        //Ручаюсь, они жаждут познакомиться с тобой. Им очень не нравится эта ситуация.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");        //Ты не можешь сделать это. Они убьют меня!
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");        //Вполне вероятно.
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");        //Я скажу все, что ты хочешь, только не делай этого.
        CORNELIUS_TELLTRUTH = TRUE;
        Info_ClearChoices(dia_cornelius_dontbelieveyou);
};
func void dia_cornelius_dontbelieveyou_perjury()
{
        B_AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");     //За лжесвидетельство тебя посадят в тюрьму - и надолго!
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");     //Ты пытаешься угрожать мне? Какой-то жалкий стражник угрожает мне, секретарю губернатора?
        B_AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");     //Если ты немедленно не исчезнешь, я позабочусь, чтобы тебя разжаловали.
        CORNELIUS_THREATENBYMILSC = TRUE;
        AI_StopProcessInfos(self);
};
instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 4;
        condition = dia_cornelius_paycornelius_condition;
        information = dia_cornelius_paycornelius_info;
        permanent = FALSE;
        description = "Вот золото.";
};
func int dia_cornelius_paycornelius_condition()
{
        if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000) && (CORNELIUS_TELLTRUTH == FALSE))
        {
                return TRUE;
        };
};
func void dia_cornelius_paycornelius_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");       //Вот золото.
        b_giveinvitems(other,self,itmi_gold,2000);
        B_AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");       //Лучше я не буду спрашивать, где ты его взял.
        B_AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");       //Правда, если честно, меня это совсем не волнует.
        B_AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");       //Главное, что оно теперь мое.
        CORNELIUS_TELLTRUTH = TRUE;
};
instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 4;
        condition = dia_cornelius_realstory_condition;
        information = dia_cornelius_realstory_info;
        permanent = TRUE;
        description = "Так что произошло на самом деле?";
};
func int dia_cornelius_realstory_condition()
{
        if(CORNELIUS_TELLTRUTH == TRUE)
        {
                return TRUE;
        };
};
func void dia_cornelius_realstory_info()
{
        B_AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");  //Так что произошло на самом деле?
        B_AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");  //Я не видел, что произошло. Я получил золото за то, что обвиню этого наемника.
        B_AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");  //В нынешние времена каждый сам за себя. А мне нужны были деньги.
        B_AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");  //Кто заплатил тебе?
        B_AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");  //Тебе достаточно того, что я сказал. Он убьет меня, если я проговорюсь.
        B_AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");  //Ты готов подтвердить сказанное тобой перед лордом Хагеном?
        B_AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");  //Я пока еще не выжил из ума. Я не собираюсь оставаться в городе.
        if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
        {
                B_AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");  //Я дам тебе мой дневник, он послужит достаточным доказательством.
                b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
        };
        b_logentry(TOPIC_RESCUEBENNET,TOPIC_RESCUEBENNET_description_532); // "Корнелиус солгал. Ему заплатили чтобы упечь Беннета в тюрьму. Но он не говорит мне кто подкупил его. Он весь дрожит от страха."
        CORNELIUSFLEE = TRUE;
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"FLEE");
};
instance DIA_CORNELIUS_FLEEING(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 1;
        condition = dia_cornelius_fleeing_condition;
        information = dia_cornelius_fleeing_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_cornelius_fleeing_condition()
{
        if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_cornelius_fleeing_info()
{
        b_say(self,other,"$NOTNOW");
        AI_StopProcessInfos(self);
};
instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
        npc = vlk_401_cornelius;
        nr = 900;
        condition = dia_cornelius_pickpocket_condition;
        information = dia_cornelius_pickpocket_info;
        permanent = TRUE;
        description = "(пытаться украсть его книгу довольно рискованно)";
};
func int dia_cornelius_pickpocket_condition()
{
        if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)) && (RECUEBENNET_KNOWSCORNELIUS == TRUE))
        {
                return TRUE;
        };
};
func void dia_cornelius_pickpocket_info()
{
        Info_ClearChoices(dia_cornelius_pickpocket);
        Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
        Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};
func void dia_cornelius_pickpocket_doit()
{
        if(other.attribute[ATR_DEXTERITY] >= 60)
        {
                b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
                b_givethiefxp();
                Info_ClearChoices(dia_cornelius_pickpocket);
        }
        else
        {
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_THEFT,1);
        };
};
func void dia_cornelius_pickpocket_back()
{
        Info_ClearChoices(dia_cornelius_pickpocket);
};
