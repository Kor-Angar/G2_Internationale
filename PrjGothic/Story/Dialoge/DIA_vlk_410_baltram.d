instance DIA_BALTRAM_EXIT(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 999;
        condition = dia_baltram_exit_condition;
        information = dia_baltram_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_baltram_exit_condition()
{
        return TRUE;
};
func void dia_baltram_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BALTRAM_SPERRE(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 1;
        condition = dia_baltram_sperre_condition;
        information = dia_baltram_sperre_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_baltram_sperre_condition()
{
        if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_baltram_sperre_info()
{
        B_AI_Output(self,other,"DIA_Baltram_Sperre_01_00");       //Чего тебе нужно? Ты заключенный из горнодобывающей колонии. Я не хочу иметь с тобой никаких дел!
        AI_StopProcessInfos(self);
};
instance DIA_BALTRAM_HALLO(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 2;
        condition = dia_baltram_hallo_condition;
        information = dia_baltram_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_baltram_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (MIS_NAGUR_BOTE == FALSE))
        {
                return TRUE;
        };
};
func void dia_baltram_hallo_info()
{
        if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Baltram_Hallo_01_00");        //Добро пожаловать, чужеземец, меня зовут Бальтрам. Ты хочешь запастись продовольствием?
                B_AI_Output(self,other,"DIA_Baltram_Hallo_01_01");        //Боюсь, что мне придется разочаровать тебя. В настоящий момент я мало что могу предложить.
                B_AI_Output(self,other,"DIA_Baltram_Hallo_01_02");        //Но скоро я жду новую поставку.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Baltram_Hallo_01_03");        //Если ты пришел купить у меня съестные припасы, ты пришел напрасно.
                B_AI_Output(self,other,"DIA_Baltram_Hallo_01_04");        //Я не самого лучшего мнения о вас, наемниках! От вас одни проблемы.
        };
        Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
        b_logentry(TOPIC_CITYTRADER,TOPIC_CITYTRADER_description_570); // "Бальтрам торгует продуктами на рыночной площади."
};
instance DIA_BALTRAM_JOB(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 3;
        condition = dia_baltram_job_condition;
        information = dia_baltram_job_info;
        permanent = FALSE;
        description = "У тебя есть работа для меня?";
};
func int dia_baltram_job_condition()
{
        if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_baltram_job_info()
{
        B_AI_Output(other,self,"DIA_Baltram_Job_15_00");  //У тебя есть работа для меня?
        B_AI_Output(self,other,"DIA_Baltram_Job_01_01");  //Нет, у меня уже есть мальчик на побегушках. Попробуй поговорить с другими торговцами.
};
instance DIA_BALTRAM_TRICK(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 4;
        condition = dia_baltram_trick_condition;
        information = dia_baltram_trick_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_baltram_trick_condition()
{
        if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_baltram_trick_info()
{
        B_AI_Output(self,other,"DIA_Baltram_Trick_01_00");        //Ты ищешь работу?
        B_AI_Output(other,self,"DIA_Baltram_Trick_15_01");        //Конечно, а что нужно?
        B_AI_Output(self,other,"DIA_Baltram_Trick_01_02");        //Мой мальчик на побегушках не вернулся, а я жду поставку от фермера Акила.
        B_AI_Output(other,self,"DIA_Baltram_Trick_15_03");        //И во сколько ты оцениваешь эту работу?
        B_AI_Output(self,other,"DIA_Baltram_Trick_01_04");        //Я дам тебе 50 золотых монет.
        B_AI_Output(other,self,"DIA_Baltram_Trick_15_05");        //Отлично, я согласен.
        B_AI_Output(self,other,"DIA_Baltram_Trick_01_06");        //Хорошо, просто скажи Акилу, что тебя послал я. Он передаст тебе пакет. Принеси его мне.
        MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
        b_logentry(TOPIC_NAGUR,TOPIC_NAGUR_description_571); // "Бальтрам нанял меня в качестве мальчика на побегушках. Теперь я должен доставить ему посылку с фермы Акила."
        Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
        b_logentry(TOPIC_BALTRAM,TOPIC_BALTRAM_description_572); // "Если я принесу Бальтраму его посылку рн заплатит мне 50 золотых монет."
};
instance DIA_BALTRAM_WAREZ(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 2;
        condition = dia_baltram_warez_condition;
        information = dia_baltram_warez_info;
        permanent = TRUE;
        trade = TRUE;
        description = "Покажи мне свои товары.";
};
func int dia_baltram_warez_condition()
{
        return TRUE;
};
func void dia_baltram_warez_info()
{
        b_givetradeinv(self);
        B_AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");        //Покажи мне свои товары.
        if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
        {
                B_AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");        //Им не стоило допускать, чтобы все зашло так далеко. Теперь вот один из наемников убил паладина.
                B_AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");        //Что-то подобное обязательно должно было случиться!
        };
        if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
        {
                B_AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");        //Такие как ты ничего от меня не получат.
                B_AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");        //Почему?
                B_AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");        //Сначала ты сбиваешь фермеров с пути истинного, а затем ведешь себя так, как будто ничего не произошло.
                B_AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");        //Теперь проваливай, ты распугаешь всех моих клиентов.
                MIS_BALTRAMTRADE = LOG_FAILED;
                AI_StopProcessInfos(self);
        };
};
instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 4;
        condition = dia_baltram_akilshof_condition;
        information = dia_baltram_akilshof_info;
        permanent = FALSE;
        description = "Где мне найти ферму Акила?";
};
func int dia_baltram_akilshof_condition()
{
        if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_baltram_akilshof_info()
{
        B_AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");     //Где мне найти ферму Акила?
        B_AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");     //Как только выйдешь из восточных ворот, держись дороги, ведущей на юго-восток.
        B_AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");     //Вскоре ты увидишь каменную лестницу. Когда ты поднимешься по ней, ты уже сможешь видеть ферму Акила.
};
instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 5;
        condition = dia_baltram_lieferung_condition;
        information = dia_baltram_lieferung_info;
        permanent = FALSE;
        description = "Я принес пакет от Акила.";
};
func int dia_baltram_lieferung_condition()
{
        if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
        {
                return TRUE;
        };
};
func void dia_baltram_lieferung_info()
{
        B_AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");    //Я принес пакет от Акила.
        B_AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");    //Превосходно. Теперь я опять смогу торговать свежими продуктами. Вот твои 50 золотых монет.
        b_giveinvitems(other,self,itmi_baltrampaket,1);
        b_giveinvitems(self,other,itmi_gold,50);
        MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
        MIS_NAGUR_BOTE = LOG_FAILED;
        b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
        Npc_RemoveInvItems(self,itmi_baltrampaket,1);
        CreateInvItems(self,itfo_cheese,5);
        CreateInvItems(self,itfo_apple,10);
        CreateInvItems(self,itfo_beer,5);
        CreateInvItems(self,itfo_bacon,5);
        CreateInvItems(self,itfo_sausage,5);
};
instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 6;
        condition = dia_baltram_letustrade_condition;
        information = dia_baltram_letustrade_info;
        permanent = FALSE;
        description = "Может, нам опять поработать вместе?";
};
func int dia_baltram_letustrade_condition()
{
        if(MIS_BALTRAMTRADE == LOG_FAILED)
        {
                return TRUE;
        };
};
func void dia_baltram_letustrade_info()
{
        B_AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");   //Может, нам опять поработать вместе?
        B_AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");   //Послушай, если ты принесешь мне 10 окороков и 10 бутылок вина, тогда я опять готов иметь с тобой дело.
        B_AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");   //Я попробую.
        MIS_BALTRAMTRADE = LOG_RUNNING;
};
var int baltramenoughbacon;
var int baltramenoughwine;
instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 6;
        condition = dia_baltram_haveyourwarez_condition;
        information = dia_baltram_haveyourwarez_info;
        permanent = TRUE;
        description = "Я принес то, что ты просил.";
};
func int dia_baltram_haveyourwarez_condition()
{
        if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
        {
                return TRUE;
        };
};
func void dia_baltram_haveyourwarez_info()
{
        B_AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");        //Я принес то, что ты просил.
        B_AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");        //Покажи.
        if(Npc_HasItems(other,itfo_bacon) < 10)
        {
                B_AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");        //Мы договорились на 10 окороков. Возвращайся когда добудешь их.
                BALTRAMENOUGHBACON = FALSE;
        }
        else
        {
                BALTRAMENOUGHBACON = TRUE;
        };
        if(Npc_HasItems(other,itfo_wine) < 10)
        {
                B_AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");        //А что насчет 10 бутылок вина? Ты что, забыл про них?
                BALTRAMENOUGHWINE = FALSE;
        }
        else
        {
                BALTRAMENOUGHWINE = TRUE;
        };
        if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
        {
                B_AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");        //Хммм, товар не самого лучшего качества, но в наше время не приходится привередничать.
                b_giveinvitems(other,self,itfo_bacon,10);
                b_giveinvitems(other,self,itfo_wine,10);
                MIS_BALTRAMTRADE = LOG_SUCCESS;
                b_giveplayerxp(XP_BALTRAMTRADE);
                B_AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");        //Теперь ничто не мешает нам вести дела.
        };
};
instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
        npc = vlk_410_baltram;
        nr = 900;
        condition = dia_baltram_pickpocket_condition;
        information = dia_baltram_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_baltram_pickpocket_condition()
{
        return c_beklauen(76,175);
};
func void dia_baltram_pickpocket_info()
{
        Info_ClearChoices(dia_baltram_pickpocket);
        Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
        Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};
func void dia_baltram_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_baltram_pickpocket);
};
func void dia_baltram_pickpocket_back()
{
        Info_ClearChoices(dia_baltram_pickpocket);
};
