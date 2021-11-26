instance DIA_DJG_715_FERROS_EXIT(C_INFO)
{
        npc = djg_715_ferros;
        nr = 999;
        condition = dia_djg_715_ferros_exit_condition;
        information = dia_djg_715_ferros_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_djg_715_ferros_exit_condition()
{
        return TRUE;
};
func void dia_djg_715_ferros_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_DJG_715_FERROS_HELLO(C_INFO)
{
        npc = djg_715_ferros;
        nr = 4;
        condition = dia_djg_715_ferros_hello_condition;
        information = dia_djg_715_ferros_hello_info;
        permanent = FALSE;
        description = "Откуда ты?";
};
func int dia_djg_715_ferros_hello_condition()
{
        return TRUE;
};
func void dia_djg_715_ferros_hello_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00"); //Откуда ты?
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01"); //С материка. Мои люди и я бежали оттуда.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02"); //Там становится все хуже. Орки сжигают за собой все, что горит.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Король потерял контроль над своим королевством.
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Вы, паладины, провалили все дело, если тебе интересно мое мнение.
        };
};
instance DIA_DJG_715_FERROS_FRIENDS(C_INFO)
{
        npc = djg_715_ferros;
        nr = 5;
        condition = dia_djg_715_ferros_friends_condition;
        information = dia_djg_715_ferros_friends_info;
        permanent = FALSE;
        description = "А где сейчас твои люди?";
};
func int dia_djg_715_ferros_friends_condition()
{
        if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
        {
                return TRUE;
        };
};
func void dia_djg_715_ferros_friends_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");       //А где сейчас твои люди?
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");       //Я покинул их.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");       //Они думали, что им дозволено брать все, что им угодно, даже если это не принадлежит им. Я не хочу принимать в этом участия.
};
instance DIA_DJG_715_FERROS_WAR(C_INFO)
{
        npc = djg_715_ferros;
        nr = 6;
        condition = dia_djg_715_ferros_war_condition;
        information = dia_djg_715_ferros_war_info;
        permanent = FALSE;
        description = "Что еще ты знаешь о войне?";
};
func int dia_djg_715_ferros_war_condition()
{
        if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
        {
                return TRUE;
        };
};
func void dia_djg_715_ferros_war_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");   //Что еще ты знаешь о войне?
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");   //Ты ведь давно не видел своего короля, а?
        };
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");   //Орки окружили столицу. Но пала она уже или нет, я не знаю.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");   //Последнее, что я слышал, - что король мертв. Но я в это не верю.
};
instance DIA_DJG_715_FERROS_OLDCAMP(C_INFO)
{
        npc = djg_715_ferros;
        nr = 7;
        condition = dia_djg_715_ferros_oldcamp_condition;
        information = dia_djg_715_ferros_oldcamp_info;
        permanent = FALSE;
        description = "А что ты делаешь здесь, в замке?";
};
func int dia_djg_715_ferros_oldcamp_condition()
{
        return TRUE;
};
func void dia_djg_715_ferros_oldcamp_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");       //А что ты делаешь здесь, в замке?
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");       //Я услышал о драконах и пришел помочь сражаться с ними.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");       //К несчастью, я потерял свой меч, когда пробирался мимо орков. И вот я застрял здесь.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");       //Без меча я не могу выйти отсюда, а те мечи, что продают здесь, - бесполезный хлам.
        Info_ClearChoices(dia_djg_715_ferros_oldcamp);
        Info_AddChoice(dia_djg_715_ferros_oldcamp,dia_djg_715_ferros_oldcamp_no_description,dia_djg_715_ferros_oldcamp_no); // "Я желаю тебе удачи в твоих поисках."
        Info_AddChoice(dia_djg_715_ferros_oldcamp,dia_djg_715_ferros_oldcamp_price_description,dia_djg_715_ferros_oldcamp_price); // "Что ты дашь мне если я найду твой меч?"
        Info_AddChoice(dia_djg_715_ferros_oldcamp,dia_djg_715_ferros_oldcamp_yes_description,dia_djg_715_ferros_oldcamp_yes); // "Я найду твой меч."
        Wld_InsertItem(itmw_1h_ferrossword_mis,"FP_OW_ITEM_08");
        MIS_FERROSSWORD = LOG_RUNNING;
        Log_CreateTopic(TOPIC_FERROSSWORD,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_FERROSSWORD,LOG_RUNNING);
        b_logentry(TOPIC_FERROSSWORD,TOPIC_FERROSSWORD_description_151); // "Ферос потерял свой меч из-за орков. Это было глупостью."
};
func void dia_djg_715_ferros_oldcamp_no()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");    //Я желаю тебе удачи в твоих поисках.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");    //Я все задаю себе вопрос - а зачем я вообще пришел сюда?
        Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};
func void dia_djg_715_ferros_oldcamp_price()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Что ты дашь мне, если я найду твой меч?
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Боже, я ничего не могу дать. Я потратил все свои деньги на этот меч.
        Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};
func void dia_djg_715_ferros_oldcamp_yes()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");   //Я найду твой меч.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");   //Это было бы великолепно. Тебе стоит поискать у большого утеса на юге.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");   //Я, вероятно, потерял его там, около палаток орков.
        b_logentry(TOPIC_FERROSSWORD,TOPIC_FERROSSWORD_description_152); // "Похоже Ферос потерял свой меч на высоком утесе на юге там где находятся палатки орков."
        Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};
instance DIA_DJG_715_FERROS_FERROSANYSWORD(C_INFO)
{
        npc = djg_715_ferros;
        nr = 6;
        condition = dia_djg_715_ferros_ferrosanysword_condition;
        information = dia_djg_715_ferros_ferrosanysword_info;
        permanent = FALSE;
        description = "Возможно, у меня есть для тебя другой меч.";
};
func int dia_djg_715_ferros_ferrosanysword_condition()
{
        if((MIS_FERROSSWORD == LOG_RUNNING) && ((Npc_HasItems(other,itmw_1h_special_01) >= 1) || (Npc_HasItems(other,itmw_1h_special_02) >= 1)))
        {
                return TRUE;
        };
};
func void dia_djg_715_ferros_ferrosanysword_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");    //Возможно, у меня есть для тебя другой меч.
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
        Info_AddChoice(dia_djg_715_ferros_ferrosanysword,DIALOG_BACK,dia_djg_715_ferros_ferrosanysword_back);
        if(Npc_HasItems(other,itmw_1h_special_01) >= 1)
        {
                Info_AddChoice(dia_djg_715_ferros_ferrosanysword,name_itmw_1h_special_01,dia_djg_715_ferros_ferrosanysword_silverblade);
        };
        if(Npc_HasItems(other,itmw_1h_special_02) >= 1)
        {
                Info_AddChoice(dia_djg_715_ferros_ferrosanysword,name_itmw_1h_special_02,dia_djg_715_ferros_ferrosanysword_oreblade);
        };
};
func void dia_djg_715_ferros_ferrosanysword_back()
{
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};
func void b_ferros_ferrosanysword_give()
{
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");   //Это хороший клинок. Превосходной работы.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");   //Ты уверен, что хочешь отдать его мне просто так?
};
func void dia_djg_715_ferros_ferrosanysword_silverblade()
{
        b_ferros_ferrosanysword_give();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
        Info_AddChoice(dia_djg_715_ferros_ferrosanysword,dia_djg_715_ferros_ferrosanysword_silverblade_no_description,dia_djg_715_ferros_ferrosanysword_silverblade_no); // "Нет он нужен мне самому."
        Info_AddChoice(dia_djg_715_ferros_ferrosanysword,dia_djg_715_ferros_ferrosanysword_silverblade_yes_description,dia_djg_715_ferros_ferrosanysword_silverblade_yes); // "Да забирай."
};
func void dia_djg_715_ferros_ferrosanysword_oreblade()
{
        b_ferros_ferrosanysword_give();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
        Info_AddChoice(dia_djg_715_ferros_ferrosanysword,dia_djg_715_ferros_ferrosanysword_oreblade_no_description,dia_djg_715_ferros_ferrosanysword_oreblade_no); // "Нет он нужен мне самому."
        Info_AddChoice(dia_djg_715_ferros_ferrosanysword,dia_djg_715_ferros_ferrosanysword_oreblade_yes_description,dia_djg_715_ferros_ferrosanysword_oreblade_yes); // "Да забирай."
};
func void b_ferros_ferrosanysword_yes1()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");      //Да, забирай.
};
func void b_ferros_ferrosanysword_yes2()
{
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");     //Спасибо. Я твой должник.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");     //Взамен я покажу тебе парочку трюков, которые позволят тебе лучше использовать силу и ловкость в бою.
        Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
        b_logentry(TOPIC_TEACHER,TOPIC_TEACHER_description_153); // "Ферос может повысить мои силу и ловкость."
};
func void b_ferros_ferrosanysword_no()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");       //Нет, он нужен мне самому.
        B_AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");       //Понимаю.
};
func void dia_djg_715_ferros_ferrosanysword_silverblade_yes()
{
        b_ferros_ferrosanysword_yes1();
        b_giveinvitems(other,self,itmw_1h_special_01,1);
        b_ferros_ferrosanysword_yes2();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
        MIS_FERROSSWORD = LOG_SUCCESS;
        b_giveplayerxp(XP_FERROSSWORD);
};
func void dia_djg_715_ferros_ferrosanysword_silverblade_no()
{
        b_ferros_ferrosanysword_no();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};
func void dia_djg_715_ferros_ferrosanysword_oreblade_yes()
{
        b_ferros_ferrosanysword_yes1();
        b_giveinvitems(other,self,itmw_1h_special_02,1);
        b_ferros_ferrosanysword_yes2();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
        MIS_FERROSSWORD = LOG_SUCCESS;
        b_giveplayerxp(XP_FERROSSWORD);
};
func void dia_djg_715_ferros_ferrosanysword_oreblade_no()
{
        b_ferros_ferrosanysword_no();
        Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};
instance DIA_DJG_715_FERROS_FERROSHISSWORD(C_INFO)
{
        npc = djg_715_ferros;
        nr = 6;
        condition = dia_djg_715_ferros_ferroshissword_condition;
        information = dia_djg_715_ferros_ferroshissword_info;
        permanent = FALSE;
        description = "Я нашел твой меч.";
};
func int dia_djg_715_ferros_ferroshissword_condition()
{
        if((MIS_FERROSSWORD == LOG_RUNNING) && (Npc_HasItems(other,itmw_1h_ferrossword_mis) >= 1))
        {
                return TRUE;
        };
};
func void dia_djg_715_ferros_ferroshissword_info()
{
        B_AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");        //Я нашел твой меч.
        b_giveinvitems(other,self,itmw_1h_ferrossword_mis,1);
        b_ferros_ferrosanysword_yes2();
        MIS_FERROSSWORD = LOG_SUCCESS;
        b_giveplayerxp(XP_FERROSSWORD);
};
instance DIA_FERROS_TEACH(C_INFO)
{
        npc = djg_715_ferros;
        nr = 1;
        condition = dia_ferros_teach_condition;
        information = dia_ferros_teach_info;
        permanent = TRUE;
        description = "Покажи мне, как можно улучшить свои способности.";
};
func int dia_ferros_teach_condition()
{
        if(MIS_FERROSSWORD == LOG_SUCCESS)
        {
                return TRUE;
        };
};
func void dia_ferros_teach_info()
{
        B_AI_Output(other,self,"DIA_Ferros_Teach_15_00"); //Покажи мне, как можно улучшить свои способности.
        if(MIS_OCGATEOPEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Ferros_Teach_01_01"); //После всех этих нападений орков я больше этим не занимаюсь. Я рад, что вообще остался жив, парень.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Ferros_Teach_01_02"); //Хороший боец должен уметь напрямую передавать свои способности своему оружию.
                Info_ClearChoices(dia_ferros_teach);
                Info_AddChoice(dia_ferros_teach,DIALOG_BACK,dia_ferros_teach_back);
                Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
                Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
                Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
                Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
        };
};
func void dia_ferros_teach_back()
{
        Info_ClearChoices(dia_ferros_teach);
};
func void dia_ferros_teach_str_1()
{
        b_teachattributepoints(self,other,ATR_STRENGTH,1,70);
        Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
};
func void dia_ferros_teach_str_5()
{
        b_teachattributepoints(self,other,ATR_STRENGTH,5,70);
        Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
};
func void dia_ferros_teach_dex_1()
{
        b_teachattributepoints(self,other,ATR_DEXTERITY,1,70);
        Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
};
func void dia_ferros_teach_dex_5()
{
        b_teachattributepoints(self,other,ATR_DEXTERITY,5,70);
        Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
};
instance DIA_FERROS_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_715_ferros;
        nr = 5;
        condition = dia_ferros_alldragonsdead_condition;
        information = dia_ferros_alldragonsdead_info;
        permanent = FALSE;
        description = "Все драконы мертвы.";
};
func int dia_ferros_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_ferros_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");        //Все драконы мертвы.
        B_AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");        //Отлично! Если бы у нас было побольше людей вроде тебя, все, возможно, не зашло бы так далеко.
};
instance DIA_FERROS_PICKPOCKET(C_INFO)
{
        npc = djg_715_ferros;
        nr = 900;
        condition = dia_ferros_pickpocket_condition;
        information = dia_ferros_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_ferros_pickpocket_condition()
{
        return c_beklauen(56,75);
};
func void dia_ferros_pickpocket_info()
{
        Info_ClearChoices(dia_ferros_pickpocket);
        Info_AddChoice(dia_ferros_pickpocket,DIALOG_BACK,dia_ferros_pickpocket_back);
        Info_AddChoice(dia_ferros_pickpocket,DIALOG_PICKPOCKET,dia_ferros_pickpocket_doit);
};
func void dia_ferros_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_ferros_pickpocket);
};
func void dia_ferros_pickpocket_back()
{
        Info_ClearChoices(dia_ferros_pickpocket);
};
