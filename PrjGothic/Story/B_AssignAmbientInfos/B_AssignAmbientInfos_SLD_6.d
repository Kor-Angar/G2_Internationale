
instance DIA_SLD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_6_exit_condition;
	information = dia_sld_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_6_exit_condition()
{
	return TRUE;
};

func void dia_sld_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_6_join_condition;
	information = dia_sld_6_join_info;
	permanent = TRUE;
	description = "� ���� �������������� � ���!";
};


func int dia_sld_6_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_6_join_info()
{
	B_AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//� ���� �������������� � ���!
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		B_AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//� ������ �� ���� ���� � ����������. ������ �������, ��� �� ������ ���������. �� �������� ��� �����.
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		B_AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//������� �������� - ��� ����, �� �������� � ��� � ���������� - ��� ������ ������. ���� ���� ������ ����� ��� ����, � ���� �� ������.
	}
	else
	{
		B_AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//�������� � ��������. �� ������� ����... (�������)
	};
};


instance DIA_SLD_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_6_people_condition;
	information = dia_sld_6_people_info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int dia_sld_6_people_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_people_info()
{
	B_AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//��� ���������� �����?
	B_AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//��� ����� ����������� �����, ���� �� ��� ������ � ����. �� ���� ��������� ��.
	B_AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//�� ��� ��������� � ����������� �����. �� �� ������ �� �� ��������� ���� � �������. (�������)
	B_AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//������� ��� ���. ���� � ���� ��������� �������� �����, ��, �������, ������������, ��� ����� ������ ��. ��� ��������� ������ ������ � ���� �����.
};


instance DIA_SLD_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_6_location_condition;
	information = dia_sld_6_location_info;
	permanent = TRUE;
	description = "�� ��������� ��������?";
};


func int dia_sld_6_location_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_location_info()
{
	B_AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//�� ��������� ��������?
	B_AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//�� �������� �� ������ ����� �����, �� � ��� ��� ������.
	B_AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//���� �����, ����� �� ������ ��������� ����� ����������. ��� ��� ���������� ����� ���� ��� ��������.
};


instance DIA_SLD_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_6_standard_condition;
	information = dia_sld_6_standard_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_sld_6_standard_condition()
{
	return TRUE;
};

func void dia_sld_6_standard_info()
{
	B_AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//� ��� ����?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//�� ������ ���� �� ���, ������!
			}
			else
			{
				B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//���� ���� �����?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//����� � ������� � ��������, � ������� ���� �� �������.
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//������ - ��� ��� ��������� ���������. ��� �� ��, ��� �����-�� ��� ���� ��� ���������� ���������.
		}
		else
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//��� ��� ��� ���� �����, �� ��� �� ������� ����� �� ������ ����� ���������?
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//������, ������ ��� �������� �������� ���� ���������� ������� �� ������ � �������� �� ������.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//���� ����� ����� ������� ���� ����������. ��� ��������� ���� - � �� �� ��������� � ����� � ���������� ������� ����.
		}
		else
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//���� ������� �� �������� �� ������, �� ���� ������ ���� � ��������� ���.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//��� �� ��� ���������� �����? ����� �� �� ���������� � ������ ������ � ����������?
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//���� �� ��� ��� � ��������.
		}
		else
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//�� ������ ���� � ������ ��������. � ������, ��� ���� �������� ��� ���������� ������.
		};
	};
	if(KAPITEL >= 5)
	{
		if(hero.guild == GIL_DJG)
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//����� �� �������� �����, � ����� �����, ��� �� ��� ����� ����������� ����� ����.
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//�� �������? ��� ���-��! ������ ���� �� ���-�� ������� ����������� � �����.
		}
		else
		{
			B_AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//� �������. �� �� �� ����� �������, �� ������ ��� ��������� - ��� ������� ������.
		};
	};
};

func void b_assignambientinfos_sld_6(var C_NPC slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};

