instance DIA_KERVO_EXIT(C_INFO)
{
        npc = strf_1116_kervo;
        nr = 999;
        condition = dia_kervo_exit_condition;
        information = dia_kervo_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_kervo_exit_condition()
{
        return TRUE;
};
func void dia_kervo_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_KERVO_WASIST(C_INFO)
{
        npc = strf_1116_kervo;
        nr = 4;
        condition = dia_kervo_wasist_condition;
        information = dia_kervo_wasist_info;
        description = "Да что с тобой?";
};
func int dia_kervo_wasist_condition()
{
        return TRUE;
};
func void dia_kervo_wasist_info()
{
        B_AI_Output(other,self,"DIA_Kervo_WASIST_15_00"); //Да что с тобой?
        B_AI_Output(self,other,"DIA_Kervo_WASIST_13_01"); //Ты еще спрашиваешь? Ты только вокруг посмотри!
        B_AI_Output(self,other,"DIA_Kervo_WASIST_13_02"); //Эти чертовы луркеры заняли всю реку с тех пор, как я пришел сюда.
        B_AI_Output(self,other,"DIA_Kervo_WASIST_13_03"); //Сначала их было всего двое. Но вчера я насчитал уже пять.
        B_AI_Output(self,other,"DIA_Kervo_WASIST_13_04"); //Теперь я не знаю, как мне удастся выбраться отсюда.
};
instance DIA_KERVO_HILFE(C_INFO)
{
        npc = strf_1116_kervo;
        nr = 5;
        condition = dia_kervo_hilfe_condition;
        information = dia_kervo_hilfe_info;
        description = "Ты пытался пробраться через Проход?";
};
func int dia_kervo_hilfe_condition()
{
        if(Npc_KnowsInfo(other,dia_kervo_wasist))
        {
                return TRUE;
        };
};
func void dia_kervo_hilfe_info()
{
        B_AI_Output(other,self,"DIA_Kervo_HILFE_15_00");  //Ты пытался пробраться через Проход?
        B_AI_Output(self,other,"DIA_Kervo_HILFE_13_01");  //Я что, по-твоему, из ума выжил? Даже 20 солдат не вытащат меня отсюда, пока эти твари бродят там. Ненавижу их.
        B_AI_Output(self,other,"DIA_Kervo_HILFE_13_02");  //Стоит мне почувствовать их запах, и я покрываюсь холодным потом. А от их похрюкивания кровь стынет в моих венах.
        B_AI_Output(self,other,"DIA_Kervo_HILFE_13_03");  //Если тебе так хочется, чтобы с тебя содрали шкуру заживо, можешь рискнуть.
        Info_ClearChoices(dia_kervo_hilfe);
        Info_AddChoice(dia_kervo_hilfe,dia_kervo_hilfe_tschau_description,dia_kervo_hilfe_tschau); // "Ладно. Я ухожу."
        Info_AddChoice(dia_kervo_hilfe,dia_kervo_hilfe_ewig_description,dia_kervo_hilfe_ewig); // "Но ты же не можешь оставаться здесь вечно."
        if(KERVO_GOTSTUFF == TRUE)
        {
                Info_AddChoice(dia_kervo_hilfe,dia_kervo_hilfe_problem_description,dia_kervo_hilfe_problem); // "Что ты мне дашь если я убью этих тварей?"
        };
        MIS_KERVO_KILLLURKER = LOG_RUNNING;
};
func void dia_kervo_hilfe_ewig()
{
        B_AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");     //Но ты же не можешь оставаться здесь вечно.
        B_AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");     //Я не знаю, что тебе нужно от меня, но я могу сказать тебе одно: ты не заставишь меня уйти отсюда.
};
var int kervo_promisenugget;
func void dia_kervo_hilfe_problem()
{
        B_AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");  //Что ты мне дашь, если я убью этих тварей?
        B_AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");  //Ммм. Ну. Я был бы не прочь, чтобы эти луркеры, что бродят перед пещерой, исчезли.
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");  //Я нашел чистый рунный камень. Ты ведь маг. Я уверен, ты найдешь применение ему.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");  //Я нашел кусок руды.
        };
        B_AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");  //Я отдам тебе его.
        KERVO_PROMISENUGGET = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_kervo_hilfe_tschau()
{
        B_AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");   //Ладно. Я ухожу.
        B_AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");   //Как знаешь. Я тебя удерживать не буду.
        AI_StopProcessInfos(self);
};
instance DIA_KERVO_LURKERPLATT(C_INFO)
{
        npc = strf_1116_kervo;
        condition = dia_kervo_lurkerplatt_condition;
        information = dia_kervo_lurkerplatt_info;
        description = "Луркеров больше нет.";
};
func int dia_kervo_lurkerplatt_condition()
{
        if((MIS_KERVO_KILLLURKER == LOG_RUNNING) && Npc_IsDead(kervo_lurker1) && Npc_IsDead(kervo_lurker2) && Npc_IsDead(kervo_lurker3) && Npc_IsDead(kervo_lurker4) && Npc_IsDead(kervo_lurker5) && Npc_IsDead(kervo_lurker6))
        {
                return TRUE;
        };
};
func void dia_kervo_lurkerplatt_info()
{
        B_AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");    //Луркеров больше нет.
        B_AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");    //Отлично. Теперь я опять смогу спать спокойно.
        if(KERVO_PROMISENUGGET == TRUE)
        {
                B_AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");    //Вот то, что я обещал тебе.
                if(hero.guild == GIL_KDF)
                {
                        b_giveinvitems(self,other,itmi_runeblank,1);
                }
                else
                {
                        b_giveinvitems(self,other,itmi_nugget,1);
                };
        };
        b_giveplayerxp(XP_KERVOKILLLURKER);
        MIS_KERVO_KILLLURKER = LOG_SUCCESS;
};
instance DIA_KERVO_VERGISSES(C_INFO)
{
        npc = strf_1116_kervo;
        condition = dia_kervo_vergisses_condition;
        information = dia_kervo_vergisses_info;
        permanent = TRUE;
        description = "Ты теперь пойдешь к Проходу?";
};
func int dia_kervo_vergisses_condition()
{
        if(MIS_KERVO_KILLLURKER == LOG_SUCCESS)
        {
                return TRUE;
        };
};
func void dia_kervo_vergisses_info()
{
        B_AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");      //Ты теперь пойдешь к Проходу?
        B_AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");      //Забудь об этом, парень. Если меня поймают, то опять заставят работать в шахте. Я останусь здесь.
        AI_StopProcessInfos(self);
};
instance DIA_KERVO_PICKPOCKET(C_INFO)
{
        npc = strf_1116_kervo;
        nr = 900;
        condition = dia_kervo_pickpocket_condition;
        information = dia_kervo_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_kervo_pickpocket_condition()
{
        return c_beklauen(34,10);
};
func void dia_kervo_pickpocket_info()
{
        Info_ClearChoices(dia_kervo_pickpocket);
        Info_AddChoice(dia_kervo_pickpocket,DIALOG_BACK,dia_kervo_pickpocket_back);
        Info_AddChoice(dia_kervo_pickpocket,DIALOG_PICKPOCKET,dia_kervo_pickpocket_doit);
};
func void dia_kervo_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_kervo_pickpocket);
};
func void dia_kervo_pickpocket_back()
{
        Info_ClearChoices(dia_kervo_pickpocket);
};
