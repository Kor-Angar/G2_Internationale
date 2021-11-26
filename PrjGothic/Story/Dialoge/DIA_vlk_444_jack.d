instance DIA_JACK_EXIT(C_INFO)
{
        npc = vlk_444_jack;
        nr = 999;
        condition = dia_jack_exit_condition;
        information = dia_jack_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jack_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_jack_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JACK_PICKPOCKET(C_INFO)
{
        npc = vlk_444_jack;
        nr = 900;
        condition = dia_jack_pickpocket_condition;
        information = dia_jack_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_jack_pickpocket_condition()
{
        return c_beklauen(50,100);
};
func void dia_jack_pickpocket_info()
{
        Info_ClearChoices(dia_jack_pickpocket);
        Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
        Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};
func void dia_jack_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_jack_pickpocket);
};
func void dia_jack_pickpocket_back()
{
        Info_ClearChoices(dia_jack_pickpocket);
};
instance DIA_JACK_GREET(C_INFO)
{
        npc = vlk_444_jack;
        nr = 4;
        condition = dia_jack_greet_condition;
        information = dia_jack_greet_info;
        important = TRUE;
};
func int dia_jack_greet_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_jack_greet_info()
{
        B_AI_Output(self,other,"DIA_Jack_GREET_14_00");   //Привет, сухопутная крыса, похоже, ты сейчас на мели.
        B_AI_Output(self,other,"DIA_Jack_GREET_14_01");   //У тебя жабры какие-то бледные.
        B_AI_Output(self,other,"DIA_Jack_GREET_14_02");   //Не бери в голову, парень. Все, что тебе нужно - это крепкий морской бриз.
};
instance DIA_JACK_JOB(C_INFO)
{
        npc = vlk_444_jack;
        nr = 5;
        condition = dia_jack_job_condition;
        information = dia_jack_job_info;
        description = "Что ты делаешь здесь?";
};
func int dia_jack_job_condition()
{
        if(Npc_KnowsInfo(other,dia_jack_greet))
        {
                return TRUE;
        };
};
func void dia_jack_job_info()
{
        B_AI_Output(other,self,"DIA_Jack_Job_15_00");     //Что ты делаешь здесь?
        B_AI_Output(self,other,"DIA_Jack_Job_14_01");     //Когда я был еще юношей, я отправился странствовать по морям, и пережил много сильных штормов.
        B_AI_Output(self,other,"DIA_Jack_Job_14_02");     //Но много лет назад, я осел здесь, и с тех пор работал смотрителем маяка Хориниса.
        B_AI_Output(self,other,"DIA_Jack_Job_14_03");     //В этом нет ничего сложного. Совсем. Но этот старый маяк стал мне родным домом.
        B_AI_Output(self,other,"DIA_Jack_Job_14_04");     //Но я так давно уже не был в нем.
        B_AI_Output(other,self,"DIA_Jack_Job_15_05");     //Почему?
        B_AI_Output(self,other,"DIA_Jack_Job_14_06");     //С тех пор, как эти подонки захватили мой маяк, я не осмеливаюсь подойти к нему ближе, чем на двадцать футов. Это очень плохие люди.
        B_AI_Output(self,other,"DIA_Jack_Job_14_07");     //Они преступники из Долины Рудников, понимаешь?
        B_AI_Output(self,other,"DIA_Jack_Job_14_08");     //По другую сторону гор раздался оглушительный взрыв, а затем они налетели на эту землю как мухи на дерьмо. Теперь они скрываются здесь повсюду - даже на моем маяке.
        B_AI_Output(self,other,"DIA_Jack_Job_14_09");     //Я думаю, они поджидают корабль, на котором могли бы уплыть.
        B_AI_Output(self,other,"DIA_Jack_Job_14_10");     //Ха! Пусть плывут куда хотят. Тогда, по крайней мере, они уберутся с моего маяка.
        Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
        b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,TOPIC_KILLLIGHTHOUSEBANDITS_description_680); // "Старый морской волк Джек не может вернуться на свой маяк так как там засели бандиты."
        MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};
instance DIA_JACK_CITY(C_INFO)
{
        npc = vlk_444_jack;
        nr = 6;
        condition = dia_jack_city_condition;
        information = dia_jack_city_info;
        description = "Ты часто бываешь в городе?";
};
func int dia_jack_city_condition()
{
        if(Npc_KnowsInfo(other,dia_jack_job))
        {
                return TRUE;
        };
};
func void dia_jack_city_info()
{
        B_AI_Output(other,self,"DIA_Jack_City_15_00");    //Ты часто бываешь в городе?
        B_AI_Output(self,other,"DIA_Jack_City_14_01");    //Я всегда говорю: город настолько хорош, насколько хорош его порт.
        B_AI_Output(self,other,"DIA_Jack_City_14_02");    //Порт - это ворота в мир. Здесь все встречаются, и все начинается здесь.
        B_AI_Output(self,other,"DIA_Jack_City_14_03");    //А когда в порту царит запустение, город неминуемо ждет та же участь.
};
instance DIA_JACK_HARBOR(C_INFO)
{
        npc = vlk_444_jack;
        nr = 70;
        condition = dia_jack_harbor_condition;
        information = dia_jack_harbor_info;
        permanent = TRUE;
        description = "Расскажи мне об этом порте.";
};
func int dia_jack_harbor_condition()
{
        if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
        {
                return TRUE;
        };
};
func void dia_jack_harbor_info()
{
        B_AI_Output(other,self,"DIA_Jack_Harbor_15_00");  //Расскажи мне об этом порте.
        B_AI_Output(self,other,"DIA_Jack_Harbor_14_01");  //Порт Хориниса сейчас не тот, что был раньше.
        B_AI_Output(self,other,"DIA_Jack_Harbor_14_02");  //Здесь никого не осталось, кроме праздношатающегося сброда, корабли сюда больше не заходят, и торговля пришла в упадок. Этому порту, похоже, скоро придет конец.
        Info_ClearChoices(dia_jack_harbor);
        Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
        Info_AddChoice(dia_jack_harbor,dia_jack_harbor_ships_description,dia_jack_harbor_ships); // "Почему корабли больше не приходят сюда?"
        Info_AddChoice(dia_jack_harbor,dia_jack_harbor_rogue_description,dia_jack_harbor_rogue); // "Что ты имеешь в виду под сбродом?"
        Info_AddChoice(dia_jack_harbor,dia_jack_harbor_leave_description,dia_jack_harbor_leave); // "Так почему ты не уедешь отсюда?"
};
func void dia_jack_harbor_back()
{
        Info_ClearChoices(dia_jack_harbor);
};
func void dia_jack_harbor_ships()
{
        B_AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");    //Почему корабли больше не приходят сюда?
        B_AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");    //Здесь говорят, что когда война будет окончена, все вернется на круги своя. Это все чушь собачья.
        B_AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");    //Уверяю тебя, настоящий матрос всегда первым понимает, что город приходит в упадок.
        B_AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");    //Матрос чувствует это своим нутром. И я говорю тебе, забудь об этом порте, его лучшие дни давно позади.
};
func void dia_jack_harbor_rogue()
{
        B_AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");    //Что ты имеешь в виду под сбродом?
        B_AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");    //Посмотри на них, это же сборище лодырей. Большинство из них даже не знает, что такое работа. Они только и делают, что пьют все дни напролет и относят свои последние гроши в бордель.
        B_AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");    //Говорю тебе, держись от них подальше.
};
func void dia_jack_harbor_leave()
{
        B_AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");    //Так почему ты не уедешь отсюда?
        B_AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");    //Сегодня никто не возьмет на корабль старого морского волка вроде меня.
        B_AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");    //Большинство полагает, что Старый Джек ни на что не годен, и что его старые кости разъедает подагра.
        B_AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");    //И? Они правы?
        B_AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");    //Вздор. Как только я опять почувствую под своими ногами палубу, я дам фору любому из этих нахальных юнцов.
};
instance DIA_JACK_BANDITENWEG(C_INFO)
{
        npc = vlk_444_jack;
        nr = 7;
        condition = dia_jack_banditenweg_condition;
        information = dia_jack_banditenweg_info;
        description = "Бандитов, которые захватили твой маяк, больше нет.";
};
func int dia_jack_banditenweg_condition()
{
        if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_jack_banditenweg_info()
{
        B_AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");     //Бандитов, которые захватили твой маяк, больше нет.
        B_AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");     //Это правда? Наконец-то я смогу опять вернуться к своей работе.
        B_AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");     //Пойдем со мной к маяку. Оттуда ты сможешь насладиться потрясающим видом на море.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Lighthouse");
        MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
        b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};
instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
        npc = vlk_444_jack;
        nr = 8;
        condition = dia_jack_lighthousefree_condition;
        information = dia_jack_lighthousefree_info;
        permanent = TRUE;
        description = "Мне нравится твой маяк.";
};
func int dia_jack_lighthousefree_condition()
{
        if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
        {
                return TRUE;
        };
};
func void dia_jack_lighthousefree_info()
{
        B_AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");  //Мне нравится твой маяк.
        B_AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");  //Спасибо. Поднимись по лестнице наверх, оттуда открывается такой потрясающий вид. Чувствуй себя здесь как дома.
};
instance DIA_JACK_KAP3_EXIT(C_INFO)
{
        npc = vlk_444_jack;
        nr = 999;
        condition = dia_jack_kap3_exit_condition;
        information = dia_jack_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jack_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_jack_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JACK_KAP4_EXIT(C_INFO)
{
        npc = vlk_444_jack;
        nr = 999;
        condition = dia_jack_kap4_exit_condition;
        information = dia_jack_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jack_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_jack_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JACK_KAP5_EXIT(C_INFO)
{
        npc = vlk_444_jack;
        nr = 999;
        condition = dia_jack_kap5_exit_condition;
        information = dia_jack_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jack_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_jack_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
        npc = vlk_444_jack;
        nr = 51;
        condition = dia_jack_bemycaptain_condition;
        information = dia_jack_bemycaptain_info;
        permanent = TRUE;
        description = "Ты бы не хотел опять выйти в море?";
};
func int dia_jack_bemycaptain_condition()
{
        if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
        {
                return TRUE;
        };
};
func void dia_jack_bemycaptain_info()
{
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");     //Ты бы не хотел опять выйти в море?
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");     //Я бы с радостью отдал свою правую руку только за то, чтобы кто-нибудь нанял меня на большую шхуну, хотя бы ненадолго.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");     //Но для старого морского волка вроде меня это не так-то легко, приятель. Да и к тому же, кто тогда будет присматривать за маяком?
        Info_ClearChoices(dia_jack_bemycaptain);
        Info_AddChoice(dia_jack_bemycaptain,dia_jack_bemycaptain_no_description,dia_jack_bemycaptain_no); // "Забудь. Это я просто так сказал."
        Info_AddChoice(dia_jack_bemycaptain,dia_jack_bemycaptain_seaman_description,dia_jack_bemycaptain_seaman); // "Я нуждаюсь в твоем опыте моряка."
};
func void dia_jack_bemycaptain_seaman()
{
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");      //Я нуждаюсь в твоем опыте моряка.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");      //Черт меня побери! Что ты задумал, приятель? Ты же не собираешься захватить королевскую военную галеру, а?
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");      //Кто знает?
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");      //(смеется) Это будет что-то! Ох, черт. Но я не могу вот так взять и бросить свой маяк. Ммм. Что же нам с этим делать?
        Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
        b_logentry(TOPIC_CAPTAIN,TOPIC_CAPTAIN_description_681); // "Джек старый морской волк из гавани мог бы стать хорошим капитаном. Но сначала я должен найти кого-нибудь кто посторожит его маяк."
        Info_ClearChoices(dia_jack_bemycaptain);
        Info_AddChoice(dia_jack_bemycaptain,dia_jack_bemycaptain_no_description,dia_jack_bemycaptain_no); // "Забудь. Это я просто так сказал."
        Info_AddChoice(dia_jack_bemycaptain,dia_jack_bemycaptain_seaman_newofficer_description,dia_jack_bemycaptain_seaman_newofficer); // "А что если я приведу к тебе кого-нибудь ...?"
};
func void dia_jack_bemycaptain_seaman_newofficer()
{
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");   //А что если я приведу к тебе кого-нибудь, кто позаботился бы о маяке в твое отсутствие?
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");   //Неплохая идея, приятель. И у меня есть подходящая кандидатура.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");   //У Гарада, кузнеца, есть подмастерье по имени Брайан. Я много раз беседовал с ним.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");   //Я бы хотел доверить свой маяк ему. Я думаю, он лучше всего подходит для этого.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");   //Иди, поговори с ним. Возможно, нам повезет, и этот парень согласится помочь нам.
        Info_ClearChoices(dia_jack_bemycaptain);
        MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};
func void dia_jack_bemycaptain_no()
{
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");  //Забудь. Это я просто так сказал.
        Info_ClearChoices(dia_jack_bemycaptain);
};
instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
        npc = vlk_444_jack;
        nr = 52;
        condition = dia_jack_bemycaptain2_condition;
        information = dia_jack_bemycaptain2_info;
        description = "Насчет Брайана...";
};
func int dia_jack_bemycaptain2_condition()
{
        if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
        {
                return TRUE;
        };
};
func void dia_jack_bemycaptain2_info()
{
        if(Npc_IsDead(brian))
        {
                B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");    //Брайан мертв.
                B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");    //Ох. Ужасные времена. Он был таким хорошим парнем.
                MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
        }
        else
        {
                B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");    //Брайан позаботится о твоем маяке.
                B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");    //Я надеялся, что ты скажешь это.
                b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
                if(SCGOTCAPTAIN == FALSE)
                {
                        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");    //Я тебе все еще нужен?
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");    //Посмотрим, выйдет ли из этого парня толк.
                        AI_StopProcessInfos(self);
                };
        };
};
instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
        npc = vlk_444_jack;
        nr = 53;
        condition = dia_jack_bemycaptain3_condition;
        information = dia_jack_bemycaptain3_info;
        description = "Будь моим капитаном.";
};
func int dia_jack_bemycaptain3_condition()
{
        if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
        {
                return TRUE;
        };
};
func void dia_jack_bemycaptain3_info()
{
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");    //Будь моим капитаном.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");    //Я переплыл семь морей, приятель, но еще никогда я не был капитаном корабля.
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");    //Я ничего не знаю о навигации. Ты должен взять на себя эти обязанности.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");    //Я сделаю все, что будет в моих силах.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");    //А теперь, покажи мне мой корабль и твою команду. А ты, вообще, знаешь, куда направляешься? Я имею в виду, у тебя есть морская карта?
        B_AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");    //Подожди меня в порту. А об остальном не волнуйся.
        B_AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");    //Ну, как скажешь.
        AI_StopProcessInfos(self);
        SCGOTCAPTAIN = TRUE;
        JACKISCAPTAIN = TRUE;
        self.flags = NPC_FLAG_IMMORTAL;
        Npc_ExchangeRoutine(self,"WaitForShipCaptain");
        b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};
instance DIA_JACK_LOSFAHREN(C_INFO)
{
        npc = vlk_444_jack;
        nr = 59;
        condition = dia_jack_losfahren_condition;
        information = dia_jack_losfahren_info;
        permanent = TRUE;
        description = "Отлично, старик. Поднять паруса!";
};
func int dia_jack_losfahren_condition()
{
        if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
        {
                return TRUE;
        };
};
func void dia_jack_losfahren_info()
{
        B_AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");       //Отлично, старик. Поднять паруса!
        if(b_captainconditions(self) == TRUE)
        {
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");       //Все в полном порядке. А теперь покажи мне свою морскую карту.
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");       //Это будет нелегкое плавание. Но я все же надеюсь, что мы доберемся туда целыми и невредимыми.
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");       //У тебя действительно есть все, что тебе нужно? Мы не станем возвращаться назад только потому, что ты что-то забыл.
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");       //Если ты уверен, что у тебя есть все необходимое, иди в капитанскую каюту и вздремни немного. Силы тебе скоро понадобятся.
                AI_StopProcessInfos(self);
                b_captaincallsallonboard(self);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");       //Полегче, приятель. Я еще даже не видел это корыто. Так не пойдет.
                B_AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");       //Сначала, ты должен укомплектовать команду, не менее чем из 5 человек, получить доступ на корабль и достать морскую карту. В противном случае, забудь об этом.
                AI_StopProcessInfos(self);
        };
};
instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
        npc = vlk_444_jack;
        nr = 59;
        condition = dia_jack_perm5_notcaptain_condition;
        information = dia_jack_perm5_notcaptain_info;
        permanent = TRUE;
        description = "И что дальше?";
};
func int dia_jack_perm5_notcaptain_condition()
{
        if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
        {
                return TRUE;
        };
};
func void dia_jack_perm5_notcaptain_info()
{
        B_AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");        //И что дальше?
        B_AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");        //Я передумал. Я все же решил остаться здесь и охранять свой маяк.
        AI_StopProcessInfos(self);
};
instance DIA_JACK_KAP6_EXIT(C_INFO)
{
        npc = vlk_444_jack;
        nr = 999;
        condition = dia_jack_kap6_exit_condition;
        information = dia_jack_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jack_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_jack_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
