instance DIA_LANDSTREICHER_EXIT(C_INFO)
{
        npc = bdt_1050_landstreicher;
        nr = 999;
        condition = dia_landstreicher_exit_condition;
        information = dia_landstreicher_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_landstreicher_exit_condition()
{
        return TRUE;
};
func void dia_landstreicher_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_LANDSTREICHER_HALLO(C_INFO)
{
        npc = bdt_1050_landstreicher;
        nr = 5;
        condition = dia_landstreicher_hallo_condition;
        information = dia_landstreicher_hallo_info;
        important = TRUE;
};
func int dia_landstreicher_hallo_condition()
{
        return TRUE;
};
func void dia_landstreicher_hallo_info()
{
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");  //Что происходит?
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");  //Что ты имеешь в виду?
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");  //Ты уже второй здесь, кто несется, как будто ужаленный кровавой мухой.
        Info_ClearChoices(dia_landstreicher_hallo);
        Info_AddChoice(dia_landstreicher_hallo,dia_landstreicher_hallo_weg_description,dia_landstreicher_hallo_weg); // "Мне нужно идти."
        Info_AddChoice(dia_landstreicher_hallo,dia_landstreicher_hallo_wo_description,dia_landstreicher_hallo_wo); // "А куда первый побежал?"
        Info_AddChoice(dia_landstreicher_hallo,dia_landstreicher_hallo_wer_description,dia_landstreicher_hallo_wer); // "Что это за парень?"
};
func void dia_landstreicher_hallo_wo()
{
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");       //А куда первый побежал?
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");       //Вон туда. Бежал, это еще мягко сказано.
};
func void dia_landstreicher_hallo_wer()
{
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");      //А кто это был?
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");      //Он был похож на одного из этих головастых послушников из монастыря.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");      //Можешь говорить, что угодно, но, по-моему, у этих парней не все в порядке с головой.
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");      //Только посмотри на их дурацкое одеяние. Я бы не хотел быть пойманным на улице ночью в такой одежке. (смеется)
                Info_AddChoice(dia_landstreicher_hallo,dia_landstreicher_hallo_wer_vorsicht_description,dia_landstreicher_hallo_wer_vorsicht); // "Дай мне это доказательство и я позабочусь чтобы за вами больше никто не охотился."
        };
};
func void dia_landstreicher_hallo_wer_vorsicht()
{
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");     //Попридержи язык. Я сам был послушником в монастыре.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");     //(смеется) Ах ты, бедняга. Это объясняет кое-что.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");     //Ничего личного. Ступай с богом. Ты занятой человек, не буду задерживать тебя.
        Info_AddChoice(dia_landstreicher_hallo,dia_landstreicher_hallo_wer_vorsicht_manieren_description,dia_landstreicher_hallo_wer_vorsicht_manieren); // "Кто-нибудь должен поучить тебя хорошим манерам."
};
func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");    //Кто-нибудь должен поучить тебя хорошим манерам.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");    //Ладно, не обижайся. Но если ты так уж хочешь сразиться, то давай.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");    //Покажи мне, на что вы, послушники, способны.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_landstreicher_hallo_weg()
{
        B_AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");      //Мне нужно идти.
        B_AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");      //Хе. Нет проблем.
        AI_StopProcessInfos(self);
};
instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
        npc = bdt_1050_landstreicher;
        nr = 6;
        condition = dia_landstreicher_wasmachstdu_condition;
        information = dia_landstreicher_wasmachstdu_info;
        permanent = TRUE;
        description = "Что ты делаешь здесь?";
};
func int dia_landstreicher_wasmachstdu_condition()
{
        return TRUE;
};
func void dia_landstreicher_wasmachstdu_info()
{
        B_AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");    //Что ты делаешь здесь?
        if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
        {
                B_AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");    //Ты задаешь слишком много вопросов, молокосос.
        };
        B_AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");    //Назови пещеру гоблинов, в которой мы ползали вместе, и я расскажу тебе все свои тайны.
        B_AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");    //А в противном случае, это не твое дело.
        AI_StopProcessInfos(self);
};
