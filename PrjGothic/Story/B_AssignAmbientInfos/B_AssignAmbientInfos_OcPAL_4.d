
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
	description = "��� ��������� �����?";
};


func int dia_ocpal_4_people_condition()
{
	return TRUE;
};

func void dia_ocpal_4_people_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//��� ��������� �����?
	B_AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//����������� ������. �� ������� ��� � ����� ������� ������ �����.
};


instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_4_location_condition;
	information = dia_ocpal_4_location_info;
	permanent = TRUE;
	description = "��� �� ������ ���������� ��� � ������ ��������?";
};


func int dia_ocpal_4_location_condition()
{
	return TRUE;
};

func void dia_ocpal_4_location_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//��� �� ������ ���������� ��� � ������ ��������?
	B_AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//��������� � ����, ����� ���� ��������� ����, ���� ��� ��� �� ��������� ������.
	B_AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//���������, ���������� � ������, - ��� � �������� ����������, �� ����� ��� ����� ���� ��������� ���������.
};


instance DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_4_standard_condition;
	information = dia_ocpal_4_standard_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_ocpal_4_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_4_standard_info()
{
	B_AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//��� ����?
	if(KAPITEL <= 3)
	{
		B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//���� �������� ���! �� �� ����� ����������� �� ���������� ��������! � ����� ������� ��� ������ ��������!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//� �����, ����� ����� �� �������� ���� ����� �����. � ��� �� ��� ������� ������������?
			if(other.guild == GIL_DJG)
			{
				B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//�������, ��� �� �� ������� �������, ��� � ���, �������� �� ��������, ������������� ���� ���� ������ ���� ��������?
			}
			else
			{
				B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//��� ��� ���������� �������� �� �������� ���� �� ��� ��������!
			};
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//����� ������! ��� ��������� ����� ���� ����������!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//������ ��������, ������, �� ��������� ������� ����������� �� �����. � ������, �� ��� ������, ��� �� ������? ��� �����-�� �����������!
		}
		else
		{
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//��� ������� ������ ���������. ���� ������ � �����, � ����� �� ��������� ��.
			B_AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//���-�� ������ �������� ����� ������. �� ����� ����� � ������.
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

