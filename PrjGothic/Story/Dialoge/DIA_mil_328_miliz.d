instance DIA_328_MILIZ_EXIT(C_INFO)
{
        npc = mil_328_miliz;
        nr = 999;
        condition = dia_328_miliz_exit_condition;
        information = dia_328_miliz_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_328_miliz_exit_condition()
{
        return TRUE;
};
func void dia_328_miliz_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_328_MILIZ_HI(C_INFO)
{
        npc = mil_328_miliz;
        nr = 1;
        condition = dia_328_miliz_hi_condition;
        information = dia_328_miliz_hi_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_328_miliz_hi_condition()
{
        return TRUE;
};
func void dia_328_miliz_hi_info()
{
        B_AI_Output(self,other,"DIA_328_Miliz_Hi_08_00"); //��, ���� ������ ������ �����. �������?
        B_AI_Output(other,self,"DIA_328_Miliz_Hi_15_01"); //��� �� �����?
        B_AI_Output(self,other,"DIA_328_Miliz_Hi_08_02"); //��� �� ���� ����! ����� � �������. �����?
        B_AI_Output(other,self,"DIA_328_Miliz_Hi_15_03"); //�������? ��� ���? ��� ����� ���������?
        B_AI_Output(self,other,"DIA_328_Miliz_Hi_08_04"); //��, ���� ����� ��������� � ���� �������, �����? ��� ��� ����������, ��� � ������� ���� �����.
        AI_StopProcessInfos(self);
        Npc_SetRefuseTalk(self,30);
};
instance DIA_328_MILIZ_KILL(C_INFO)
{
        npc = mil_328_miliz;
        nr = 2;
        condition = dia_328_miliz_kill_condition;
        information = dia_328_miliz_kill_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_328_miliz_kill_condition()
{
        if(Npc_RefuseTalk(self) == FALSE)
        {
                return TRUE;
        };
};
func void dia_328_miliz_kill_info()
{
        B_AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");       //��, �� ��� ��� �����! ����� � �� ������ ����, ����� �� ����������?
        B_AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");       //��, �������! ������ � ������ ����, ��� ����� �������!
        AI_StopProcessInfos(self);
        Npc_SetRefuseTalk(self,20);
        b_attack(self,other,AR_KILL,1);
};
