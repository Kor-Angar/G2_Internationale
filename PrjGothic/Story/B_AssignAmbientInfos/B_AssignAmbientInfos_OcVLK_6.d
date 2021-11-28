
instance DIA_OCVLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_6_exit_condition;
	information = dia_ocvlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_6_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_6_people_condition;
	information = dia_ocvlk_6_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_ocvlk_6_people_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_people_info()
{
	B_AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//��� ��������� �����?
	B_AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//������ ��������� ���� ������ - ������, ���, ��� �� ���� ��������.
	B_AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//�� ��� �� �� ������������� ����������� ������. ��, ���� ������ ���-���� �� ��� ����� �� ������� � ����.
	if(Npc_IsDead(engor) == FALSE)
	{
		B_AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//���� ���� ����� ����������, �������� � �������. �� ������� ��� � ���� �������� ���� �������.
	};
};


instance DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_6_location_condition;
	information = dia_ocvlk_6_location_info;
	permanent = TRUE;
	description = "��� �� ������ ���������� ��� � �������� � ������ ��������?";
};


func int dia_ocvlk_6_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_6_location_info()
{
	B_AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//��� �� ������ ���������� ��� � �������� � ������ ��������?
	B_AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//���� ��������� �������� ����� �����. � ���� ����� �� ����, ��� ���� �������� �� ���.
	B_AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//������� �� ���� ���� - ��� ������� ��� �����. � �����, ������� �����, ��� ���������� ������� ������.
	B_AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//��� �������, � �� ������ �������� ��� �����.
	B_AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//�� ������ ����� ����. ���� ��� �������� ������� � ������, � ��� �� ����� �� ������� �����.
};


instance DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_6_standard_condition;
	information = dia_ocvlk_6_standard_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_ocvlk_6_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_standard_info()
{
	B_AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//��� ����?
	if(KAPITEL <= 3)
	{
		B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//��� ��������: '������ � ����� � � ���� �� ����� �����'. � ��� ��� ��� �����.
		B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//������ ��� ������� ������ ��������� ���� ������������ � ������� ��������������. ������, ������, ������, ��� �� ������� ������� � ������ ������. (������� �������)
		B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//�� ��� ����� ������� �� ������, ���� ��� ������� ������� �� ����� ��� ������!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//�������� �� ��������. �� ����� ����! ��� ������ �� �������.
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//�������, ��� ��� ������� �����! ������ � ��� �������� ����!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//��� ��-�� ���� ��������� ����. ��� �� ����� ��������� ���, ��� �� ���������� �����. �����, ����� ���� ������� ��� � �����.
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//��� �������� �����, ��� ��� �������� ����� ������, �� ������ ���������� �����!
		};
	};
};

func void b_assignambientinfos_ocvlk_6(var C_NPC slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

