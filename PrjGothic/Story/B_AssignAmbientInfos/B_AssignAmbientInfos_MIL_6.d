
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "??? ??? ????? ???????, ????? ???????? ? ??????????";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	B_AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//??? ??? ????? ???????, ????? ???????? ? ??????????
	B_AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//??? ? ????? ????? ? ???????? ? ???. ? ??? ???, ??? ???????? ?????? ? ?????, ?? ????????? ???? ??????????.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		B_AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//?? ??????? ??? ? ????????. ?? ??????????? ?????? ???.
	};
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "???????? ??? ?? ???? ?????????.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	B_AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//???????? ??? ?? ???? ?????????.
	B_AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//? ??? ???, ??? ???????? ??????? ? ???????, ??? ???????????? ? ??????? ???????? ??????.
	B_AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//??? ?????? ???? ?????? ?? ???????. ?? ??????????? ??????? ?????? ? ?????????, ??????? ??.
	B_AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//????? ????????? ????????? ???????? ?? ??????? ? ??????. ?? ??? ?? ???????? ??????? ? ??????????.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "??? ??? ????? ????? ?? ???? ???????";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	B_AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//??? ??? ????? ????? ?? ???? ???????
	B_AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//???????? ???????????? ???? ?????. ????????? ????????? ??????????? ??.
	B_AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//???? ????? ????????? ??????????, ? ? ?? ?? ????? ?? ????????? ? ???? ?????.
	B_AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//???? ???? ???????? ???????? ?????, ???? ???????? ????????? ????? ???.
	B_AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//?? ?? ???????? ??????????????? ?????, ????????? ? ????. ?????? ????????????? ???????????? ???? ???????.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "??? ???????";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	B_AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//??? ???????????
	if(KAPITEL == 1)
	{
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//? ????????? ????? ????? ?????? ???????? ?????? ???????.
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//????????? ????? ?????? ???????????. ???? ????? ???????????, ??? ??? ???? ??? ?????.
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//?? ??? ????? ?? ??????????? ????? ???? ???? ???????? ???????, ?? ?????? ?? ?????.
	};
	if(KAPITEL == 2)
	{
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//??????, ?? ????? ???????? ? ????????? ??? ????????. ?????? ????????? ??? ???? ? ????.
	};
	if(KAPITEL == 3)
	{
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//???????? ? ?????? ?????????? ??? ???? ? ????. ? ??? ??-?? ????? ??????, ???????????? ?????. ??????? ????? ? ?????? ? ??????? ???????? ?? ????????? ? ?????? ????.
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//? ??????, ??? ?? ??????? ???-?? ?????. ?? ????? ? ??????????? ? ???? ? ???? ???????????, ?? ?????? ?????. ????? ?????????????? ????????...
	};
	if(KAPITEL == 4)
	{
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//???????, ??? ???? ????? ????? ?????????, ????? ?? ????????? ?????? ????????. ???-?? ??? ?????, ???? ? ??? ??? ?? ?? ????? ????????? ? ????????.
	};
	if(KAPITEL >= 5)
	{
		B_AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//???????, ??? ??? ??????? ??????????! ???? ????? ???????? ???? ??????, ????? ??????? ?????????? ?????? ?? ?????? ????????.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

