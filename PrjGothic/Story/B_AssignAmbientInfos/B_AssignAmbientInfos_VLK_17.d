
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_17_exit_condition;
	information = dia_vlk_17_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_17_exit_condition()
{
	return TRUE;
};

func void dia_vlk_17_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_17_join_condition;
	information = dia_vlk_17_join_info;
	permanent = TRUE;
	description = "��� ����� ��� ����, ����� ����� ����������� ����� ������?";
};


func int dia_vlk_17_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_17_join_info()
{
	B_AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//��� ����� ��� ����, ����� ����� ����������� ����� ������?
	B_AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//�������-������������ �� ������ ����� ������ ����� ����� ������� ������� �����, � ��������. ���� ����� ���������� � ����� �� ���.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "� ��� ����� ���������� ������� � ���� ������?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	B_AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//� ��� ����� ���������� ������� � ���� ������?
	B_AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//� ��� ���, ��� � ����� ������ ��������, ��� ����� � ���� ���� ��� ������.
	B_AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//���� ����� ������������ �����. �� ������� ��� � ��������.
	B_AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//�� ���� ����� ���� � ����, ������ ���� �� ������� ����� ��� ������ �������� � ���������.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "� �������� ���� ���������� �����?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	B_AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//� �������� ���� ���������� �����?
	B_AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(�������) ��������, ���� ����� �������� �� ���� ������. ���� ���� ����� �����������, ������� ������� � �����.
	B_AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//�� ���� �� ������ ���-������ ������, ��� �� �������� ������� � ��������� �����, ��� � ������ ����� ������.
};


instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_17_standard_condition;
	information = dia_vlk_17_standard_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_vlk_17_standard_condition()
{
	return TRUE;
};

func void dia_vlk_17_standard_info()
{
	B_AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//��� ����������?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		B_AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//���������, ����� ���� ������� ��������? ��� ������ ��������� ������, ������� � ������, �� ���� �� ������� ������ ������ ������.
		B_AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//���� �� ��� ������� ���� �������� ��� �� ����� ��� ��������, ��� �� ������-����� ������������ � ����. ������ ����, � ��� �����-�� ������ �������...
	};
	if(KAPITEL == 3)
	{
		B_AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//� ������ ��� ������, ��� ������ ����� ��������. ��� ��� ��-�� ����. �� ����� �� ��� ������ ����� �������� �����.
	};
	if(KAPITEL == 4)
	{
		B_AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//�������, ��� ����� � �������� �������� �������. ����� ����� ������ �������� ���-�� �����������. �� ����� �� �� ��� ��� ������ ������ ��� �� �������� ��������.
	};
	if(KAPITEL == 5)
	{
		B_AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//������, ����� ��� ������� ������, �������� ������ ����������� � ���������� �������.
	};
};

func void b_assignambientinfos_vlk_17(var C_NPC slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

