instance DIA_MIL_310_STADTWACHE_EXIT(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 999;
        condition = dia_mil_310_stadtwache_exit_condition;
        information = dia_mil_310_stadtwache_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_mil_310_stadtwache_exit_condition()
{
        return TRUE;
};
func void dia_mil_310_stadtwache_exit_info()
{
        AI_StopProcessInfos(self);
};
const string MIL_310_CHECKPOINT = "NW_CITY_ENTRANCE_MAIN";
var int mil_310_personal_absolutionlevel;
instance DIA_MIL_310_STADTWACHE_FIRSTWARN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 1;
        condition = dia_mil_310_stadtwache_firstwarn_condition;
        information = dia_mil_310_stadtwache_firstwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_firstwarn_condition()
{
        if(Npc_GetDistToWP(other,MIL_310_CHECKPOINT) <= 700)
        {
                Npc_SetRefuseTalk(self,5);
                return FALSE;
        };
        if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_310_PERSONAL_ABSOLUTIONLEVEL))
        {
                self.aivar[AIV_PASSGATE] = FALSE;
        }
        else if(MIL_310_SCHONMALREINGELASSEN == TRUE)
        {
                self.aivar[AIV_PASSGATE] = TRUE;
        };
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_firstwarn_info()
{
        var C_ITEM itm;
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //СТОЙ!
        if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
        {
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(вздыхает) Что еще?
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //Ты сам знаешь, что!
                if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //Ты разыскиваешься за убийство в городе!
                };
                if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //Мы не потерпим здесь грязных воров!
                };
                if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //Нам не нужны смутьяны в городе!
                };
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //С чего ты взял, что мы должны впустить тебя?
        }
        else
        {
                itm = Npc_GetEquippedArmor(other);
                if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
                {
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //Что?
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //Тебе туда нельзя!
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //Почему?
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //От таких оборванцев, как ты, одни проблемы!
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //В городе и так хватает всякого сброда. Нам не нужны люди, у которых нет денег.
                        Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
                        Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
                        b_logentry(TOPIC_CITY,TOPIC_CITY_description_241); // "Чтобы стражники позволили мне войти в город я должен выглядеть так как будто у меня есть деньги. Ну или я должен найти какой-нибудь другой способ."
                }
                else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
                {
                        if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //Что тебе нужно на этот раз?
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //Меня послал фермер.
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //И? У тебя хотя бы на этот раз есть уважительная причина, чтобы попасть в город?
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //Ты один из работников с фермы Лобарта? Я никогда не видел тебя!
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //Я недавно работаю на Лобарта.
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //Что тебе нужно в городе?
                        };
                }
                else
                {
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(спокойно) Что?
                        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //Прошу извинить меня, я просто выполняю приказ.
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //Ты хочешь остановить меня?
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //Конечно, нет. Мы всегда рады служителям Инноса.
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //Я просто хотел рассмотреть тебя. Похоже, у тебя есть деньги. Можешь походить.
                        };
                        self.aivar[AIV_PASSGATE] = TRUE;
                        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
                        MIL_310_SCHONMALREINGELASSEN = TRUE;
                        b_checklog();
                        AI_StopProcessInfos(self);
                };
        };
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};
instance DIA_MIL_310_STADTWACHE_SECONDWARN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 2;
        condition = dia_mil_310_stadtwache_secondwarn_condition;
        information = dia_mil_310_stadtwache_secondwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_secondwarn_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_secondwarn_info()
{
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");        //Хватит шутить. Еще один шаг - и я порублю тебя в капусту!
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_ATTACK(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 3;
        condition = dia_mil_310_stadtwache_attack_condition;
        information = dia_mil_310_stadtwache_attack_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_attack_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_attack_info()
{
        other.aivar[AIV_LASTDISTTOWP] = 0;
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");    //Ты сам напросился...
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};
instance DIA_MIL_310_STADTWACHE_BRIBE(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 5;
        condition = dia_mil_310_stadtwache_bribe_condition;
        information = dia_mil_310_stadtwache_bribe_info;
        permanent = TRUE;
        description = "Вот 100 золотых. Позволь мне пройти!";
};
func int dia_mil_310_stadtwache_bribe_condition()
{
        if(self.aivar[AIV_PASSGATE] == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_bribe_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");     //Вот 100 золотых. Позволь мне пройти!
        if(b_giveinvitems(other,self,itmi_gold,100))
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");     //(жадно) 100 золотых - это неплохо. Проходи, конечно.
                if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");     //И сразу иди к Андрэ! Или я в следующий раз опять возьму с тебя 100 золотых!
                };
                self.aivar[AIV_PASSGATE] = TRUE;
                stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
                MIL_310_SCHONMALREINGELASSEN = TRUE;
                b_checklog();
                MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");     //Что?! Где?! Я не вижу золота. Проваливай!
        };
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_PASSIERSCHEIN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 4;
        condition = dia_mil_310_stadtwache_passierschein_condition;
        information = dia_mil_310_stadtwache_passierschein_info;
        permanent = FALSE;
        description = "У меня есть пропуск!";
};
func int dia_mil_310_stadtwache_passierschein_condition()
{
        if(Npc_HasItems(other,itwr_passierschein) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_passierschein_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");     //У меня есть пропуск!
        if(Npc_HasEquippedArmor(other) == FALSE)
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");     //Да ну? И кого ты убил ради этой бумажки?
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");     //Так ты позволишь мне пройти или нет?
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");     //Ладно, иди, пока я не передумал!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");     //Все в порядке. Проходи.
        };
        self.aivar[AIV_PASSGATE] = TRUE;
        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
        MIL_310_SCHONMALREINGELASSEN = TRUE;
        b_checklog();
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_ZUMSCHMIED(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 3;
        condition = dia_mil_310_stadtwache_zumschmied_condition;
        information = dia_mil_310_stadtwache_zumschmied_info;
        permanent = FALSE;
        description = "Я хочу увидеться с кузнецом. Он должен починить кое-какую утварь.";
};
func int dia_mil_310_stadtwache_zumschmied_condition()
{
        var C_ITEM itm;
        itm = Npc_GetEquippedArmor(other);
        if(((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE)) && Npc_KnowsInfo(other,dia_maleth_tothecity) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_zumschmied_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");        //Я хочу увидеться с кузнецом. Он должен починить кое-какую утварь.
        if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");        //(зло) Да? А почему ты это сразу не сказал?
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");        //Мне просто было интересно, как ты будешь реагировать.
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");        //Что?! Еще раз выкинешь такой номер, и я покажу тебе, как я реагирую на такие выходки, тупой деревенщина!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");        //Хорошо, ты можешь проходить.
        };
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");        //И если увидишь Лобарта, скажи ему, чтобы лучше кормил своих овец: мы скоро зайдем к нему за ними! (грязный смех)
        self.aivar[AIV_PASSGATE] = TRUE;
        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
        MIL_310_SCHONMALREINGELASSEN = TRUE;
        b_checklog();
        b_giveplayerxp(XP_AMBIENT);
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_MILIZWERDEN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 2;
        condition = dia_mil_310_stadtwache_milizwerden_condition;
        information = dia_mil_310_stadtwache_milizwerden_info;
        permanent = FALSE;
        description = "Я пришел, чтобы вступить в ополчение!";
};
func int dia_mil_310_stadtwache_milizwerden_condition()
{
        if(MIL_310_SCHONMALREINGELASSEN == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_milizwerden_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");       //Я пришел, чтобы вступить в ополчение!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");       //Да ты что?! Попробуй рассказать эту сказку у других ворот - может, они купятся на нее.
        MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};
instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 1;
        condition = dia_mil_310_stadtwache_paladine_condition;
        information = dia_mil_310_stadtwache_paladine_info;
        permanent = FALSE;
        description = "Мне нужно увидеть главу паладинов!";
};
func int dia_mil_310_stadtwache_paladine_condition()
{
        if(MIL_310_SCHONMALREINGELASSEN == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_paladine_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");  //Мне нужно увидеть главу паладинов! У меня важное сообщение для него!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");  //Ох? И что это за важное сообщение?
        MIL_310_SCHEISSE_ERZAEHLT = TRUE;
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_attacksoon_description,dia_mil_310_stadtwache_paladine_attacksoon); // "Город скоро подвергнется нападению!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_evilarmy_description,dia_mil_310_stadtwache_paladine_evilarmy); // "Силы зла собираются в Долине Хориниса!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_eyeinnos_description,dia_mil_310_stadtwache_paladine_eyeinnos); // "Я пришел чтобы получить Глаз Инноса!"
};
func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //Я пришел, чтобы получить Глаз Инноса!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //Что? Никогда не слышал о нем. А что это такое?
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //Это очень важный артефакт.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //Ты не похож на важного посланника. У тебя есть какие-нибудь документы?
        if(!Npc_HasItems(other,itwr_passierschein) > 0)
        {
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //Нет!
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //Тогда не трать мое время попусту!
        };
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};
func void dia_mil_310_stadtwache_paladine_evilarmy()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //Силы зла собираются в Долине Хориниса!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //В Долине Рудников? Ты пришел оттуда? Ты видел там армию?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nosomeone_description,dia_mil_310_stadtwache_paladine_nosomeone); // "Нет но меня послал человек который видел их."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nodragons_description,dia_mil_310_stadtwache_paladine_nodragons); // "Нет. Но я знаю что ее ведут драконы!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_yesdragons_description,dia_mil_310_stadtwache_paladine_yesdragons); // "Да. Я был в долине Хориниса. Я видел там гигантских драконов!"
};
func void dia_mil_310_stadtwache_paladine_attacksoon()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");       //Город скоро подвергнется нападению!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");       //Что? Кого? Орков? ты видел армию?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nosomeone_description,dia_mil_310_stadtwache_paladine_nosomeone); // "Нет но меня послал человек который видел их."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nodragons_description,dia_mil_310_stadtwache_paladine_nodragons); // "Нет. Но я знаю что ее ведут драконы!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_yesdragons_description,dia_mil_310_stadtwache_paladine_yesdragons); // "Да. Я был в долине Хориниса. Я видел там гигантских драконов!"
};
func void dia_mil_310_stadtwache_paladine_nodragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");        //Нет. Но я знаю, что ее ведут драконы!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");        //Ну конечно! Моя бабушка консультирует генералов орков.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");        //Я не думаю, что мы позволим тебе донести эти бредовые сплетни до ушей лорда Хагена!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");        //Проваливай!
        PLAYER_KNOWSLORDHAGEN = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_nosomeone()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");        //Нет, но меня послал человек, который видел их.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");        //(недоверчиво) КТО послал тебя?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_canttellyou_description,dia_mil_310_stadtwache_paladine_canttellyou); // "Я не вправе рассказывать тебе об этом."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_apaladin_description,dia_mil_310_stadtwache_paladine_apaladin); // "Паладин."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_amage_description,dia_mil_310_stadtwache_paladine_amage); // "Маг."
};
func void dia_mil_310_stadtwache_paladine_yesdragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");       //Да. Я был в долине Хориниса. Я видел там гигантских драконов!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");       //Ты лжешь! Проход в долину закрыт с обеих сторон. Никто не пройдет там!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");       //Убирайся отсюда!
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_amage()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");    //Маг.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");    //Ты несешь новости от мага? Тогда у тебя, конечно, есть печать в качестве доказательства?!
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");    //Нет.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");    //Что? Маги ВСЕГДА дают своим посыльным печать.
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");    //Но не этот маг.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");    //Я не верю тебе. Если ты настоящий посланник, то давай, выкладывай свои новости или проваливай!
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_onlypaladins_description,dia_mil_310_stadtwache_paladine_onlypaladins); // "Я могу передать это сообщение только паладинам!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "Армию зла возглавляют драконы!"
};
func void dia_mil_310_stadtwache_paladine_apaladin()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //Паладин.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //Хм, это возможно - паладины охраняют проход в Долину Рудников.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //Дай мне твое сообщение, и я доложу о тебе.
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_onlypaladins_description,dia_mil_310_stadtwache_paladine_onlypaladins); // "Я могу передать это сообщение только паладинам!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "Армию зла возглавляют драконы!"
};
func void dia_mil_310_stadtwache_paladine_canttellyou()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");      //Я не вправе рассказывать тебе об этом.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");      //Не говорит так, мой мальчик! Я состою в городской страже.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");      //Ты можешь рассказать мне ВСЕ. Итак, кто послал тебя?
};
func void dia_mil_310_stadtwache_paladine_depechedragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");   //Армию зла возглавляют драконы!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");   //Что? Это не может быть правдой. А я чуть не впустил тебя!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");   //Если бы ты рассказал ЭТУ историю Лорду Хагену, он бы повесил меня за халатность.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");   //Проваливай!
        PLAYER_KNOWSLORDHAGEN = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");     //Я могу передать это сообщение только паладинам!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");     //Так не получится, мой мальчик!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");     //Я ни за что не позволю тебе обратиться к лорду Хагену, пока не буду уверен, что ты не потратишь его драгоценное время впустую.
        PLAYER_KNOWSLORDHAGEN = TRUE;
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_only2_description,dia_mil_310_stadtwache_paladine_only2); // "Нет. Это сообщение предназначено ТОЛЬКО паладинам."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "Армию зла возглавляют драконы!"
};
func void dia_mil_310_stadtwache_paladine_only2()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");    //Нет. Это сообщение предназначено ТОЛЬКО паладинам.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");    //Тогда твой путь оканчивается здесь, чужеземец.
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_PERM(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 5;
        condition = dia_mil_310_stadtwache_perm_condition;
        information = dia_mil_310_stadtwache_perm_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_perm_condition()
{
        if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_perm_info()
{
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");      //Проходи!
        AI_StopProcessInfos(self);
};
