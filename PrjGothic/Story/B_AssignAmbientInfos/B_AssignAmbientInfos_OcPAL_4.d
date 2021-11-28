
instance DIA_OCPAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_4_exit_condition;
	information = dia_ocpal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_4_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_4_people_condition;
	information = dia_ocpal_4_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_ocpal_4_people_condition()
{
	return TRUE;
};

func void dia_ocpal_4_people_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//Кто командует здесь?
	B_AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//Командующий Гаронд. Ты найдешь его в самом большом здании замка.
};


instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_4_location_condition;
	information = dia_ocpal_4_location_info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне о Долине Рудников?";
};


func int dia_ocpal_4_location_condition()
{
	return TRUE;
};

func void dia_ocpal_4_location_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//Что ты можешь рассказать мне о Долине Рудников?
	B_AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//Насколько я знаю, здесь есть несколько шахт, если они еще не захвачены орками.
	B_AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//Старатели, работающие в шахтах, - это в основном каторжники, но среди них также есть несколько паладинов.
};


instance DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_4_standard_condition;
	information = dia_ocpal_4_standard_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_ocpal_4_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_4_standard_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Как дела?
	if(KAPITEL <= 3)
	{
		B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//Орки окружили нас! Но мы будем обороняться до последнего человека! И Иннос поможет нам против драконов!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//Я думаю, атака орков не заставит себя долго ждать. И где же это чертово подкрепление?
			if(other.guild == GIL_DJG)
			{
				B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//Надеюсь, что ты не думаешь всерьез, что у вас, охотники на драконов, действительно есть шанс против ВСЕХ драконов?
			}
			else
			{
				B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//Эти так называемые охотники на драконов мало на что способны!
			};
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//Слава Инносу! Эти проклятые твари были уничтожены!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//Гибель драконов, похоже, не произвела особого впечатления на орков. И почему, во имя Инноса, они не уходят? Это какая-то дьявольщина!
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//Эти чертовы ворота заклинило. Орки рвутся в замок, и ничто не остановит их.
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//Кто-то должен сообщить лорду Хагену. Он нужен ЗДЕСЬ и сейчас.
		};
	};
};

func void b_assignambientinfos_ocpal_4(var C_NPC slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

