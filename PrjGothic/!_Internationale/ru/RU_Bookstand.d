
func void use_bookstand_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_logentry(TOPIC_FIRECONTEST,"Будучи послушником, я имею право требовать прохождения Испытания Огнем. Каждый из трех магов Высшего Совета должен дать мне задание. Если я пройду эти испытания, я буду принят в Круг Огня.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Испытание Огнем");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Хотя послушник может чувствовать себя готовым пройти Испытание Магией, из этого не следует, что он обязательно будет выбран. Если, однако, он принял это решение после зрелого размышления и если он настаивает на своем решении, он наделен правом требовать прохождения этого Испытания, и ни один маг не может отказать ему в этом. Но послушник обязан не только пройти Испытание Магией, но также найти просвещение через огонь.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Это Испытание должно позволять дать оценку мудрости, силе и ловкости послушника. Следовательно, он должен пройти три испытания, каждое из которых дается ему одним из магов Высшего Совета, прежде чем ему будет позволено принять Клятву Огня и присоединиться к Соглашению Огня.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Такова воля Инноса и так тому и быть.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Высший совет");
		Doc_Show(ndocid);
	};
};


//var int finaldragonequipment_once;

func void use_finaldragonequipment_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"... Я надеюсь, что этот купол защитит руду от коварства Белиара. Король настолько наивен, что верит, что мы строим этот купол для предотвращения побегов. Что ж, пока эта уловка позволяет нам следовать нашей высшей цели, пусть так и будет. Мне остается только надеяться, что у нас остается достаточно времени, чтобы подготовиться к битве. Как только купол вокруг Долины рудников будет воздвигнут, я соберу все силы, имеющиеся в моем распоряжении, чтобы принять участие в грядущей битве.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"Ингредиенты для руны 'Святой удар': 1 святая вода, свиток не нужен");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"... Я следовал инструкциям и просто окропил святой водой Инноса чистый рунный камень, лежащий на рунном столе. Рунный камень был уничтожен. Я подозреваю, что это заклинание подвластно только Избранному.");
			Doc_PrintLines(ndocid,1,"Я оставил священную ауру Инноса под защитой монастыря. Настоятель монастыря позаботится о ней до тех пор, пока не объявится Избранный.");
			Doc_PrintLines(ndocid,1,"Слезы Инноса, вероятно, будут играть важную роль в грядущей битве. Но слишком опасно оставлять их у всех на виду. Я лучше спрячу их здесь, в библиотеке.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"Для создания руны необходимы специфические ингредиенты. При помощи этих ингредиентов и чистого рунного камня, можно создать руну на рунном столе.");
			b_logentry(TOPIC_TALENTRUNES,"Ингредиенты для руны 'Секретный телепорт': 1 Слезы Инноса");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Чтобы достичь секретного места, необходимо создать руну телепортации. Для этого необходим чистый рунный камень и небольшая бутылочка святой воды. При помощи этой руны можно телепортироваться в комнату.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Теперь я вполне уверен, что слезы Инноса - именно то, что паладины древности использовали в давно забытом ритуале 'Освящение Меча'. Это означает, что при помощи этой бутылочки, что я нашел, я смогу придать дополнительную силу освящаемому оружию.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"Чтобы выковать оружие, Чтобы выковать оружие, прежде всего мне нужна сырая сталь. Я должен докрасна нагреть ее в огне кузнечного горна, а затем придать форму на наковальне. Особое оружие зачастую требует особых материалов, придающих оружию особые свойства.");
			b_logentry(TOPIC_TALENTSMITH,"Если я добавлю 4 куска руды и 5 частей драконьей крови, я смогу выковать рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			b_logentry(TOPIC_TALENTSMITH,"Если я добавлю 5 кусков руды и 5 частей драконьей крови, я смогу выковать большой рудный клинок 'УБИЙЦА ДРАКОНОВ'.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Оружие повелителя драконов.");
			Doc_PrintLines(ndocid,1,"Чтобы сделать доспехи из чешуи дракона максимально прочными, чешуйки можно покрыть рудой, добытой в долине на острове Каринис.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Чтобы изготовить меч, достойный повелителя драконов, этот меч должен быть закален в драконьей крови. 5 пиал крови могут придать стали непревзойденную остроту и прочность.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Примечание: 'Каринис' вероятно соответствует нынешнему названию 'Хоринис'.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};


//var int alchemy_1_permanent;
//var int alchemy_2_permanent;
//var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Зелья магической силы");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эссенция маны");
		Doc_PrintLine(ndocid,0,"2 огненные крапивы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Экстракт маны");
		Doc_PrintLine(ndocid,0,"2 огненные травы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир маны");
		Doc_PrintLine(ndocid,0,"2 огненных корня");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(ndocid,1,"Луговой горец");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить зелье, оказывающее перманентное воздействие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(ndocid,1,"Царский щавель");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебные зелья");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебная эссенция");
		Doc_PrintLine(ndocid,0,"2 лечебные травы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебный экстракт");
		Doc_PrintLine(ndocid,0,"2 лечебных растения");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечебный эликсир");
		Doc_PrintLine(ndocid,0,"2 лечебных корня");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(ndocid,1,"Луговой горец");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Чтобы сварить зелье, имеющее перманентное действие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(ndocid,1,"Царский щавель");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Зелья, дающие перманентные изменения");
		Doc_PrintLine(ndocid,0,"и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир ловкости");
		Doc_PrintLine(ndocid,0,"1 гоблинская ягода");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Зелье скорости");
		Doc_PrintLines(ndocid,0,"1 снеппер-трава - для этого зелья необходим не царский щавель, а луговой горец.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Эликсир силы");
		Doc_PrintLine(ndocid,0,"1 драконий корень");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Эликсир жизни");
		Doc_PrintLine(ndocid,0,"1 лечебный корень");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Эликсир духа");
		Doc_PrintLine(ndocid,0,"1 огненный корень");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Применение этих рецептов - высшее алхимическое искусство. Они требуют большого опыта. В общем, можно сказать, что только у того, кто знает, как обращаться с лечебным или огненным корнем может быть достаточно опыта, чтобы попробовать сварить эти зелья. Все они требуют царского щавеля.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Зелье скорости варить значительно легче, частично потому, что для него не требуется царского щавеля. Базовые познания в алхимии позволят вам воспроизвести этот рецепт.");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};


//var int animals_1_permanent;
//var int animals_2_permanent;
//var int animals_3_permanent;

func void use_bookstandanimals1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Опытный охотник знает все о трофеях жертвы и как получить их.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Изъятие зубов");
		Doc_PrintLines(ndocid,0,"Зубы - оружие многих зверей и животных. Если вы знаете, как изъять их у вашей жертвы, то волков, снепперов, мракорисов, болотных акул и троллей можно считать лучшими целями.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Снятие шкур");
		Doc_PrintLines(ndocid,1,"Талантливые и опытные охотники высоко ценятся, у них всегда много шкур - овец, волков и мракорисов, например.");
		Doc_PrintLines(ndocid,1,"Очень опытные охотники могут также снимать шкуры с болотных акул и луркеров.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Изъятие когтей");
		Doc_PrintLines(ndocid,1,"Это искусство применимо ко всем типам ящеров, снепперам, луркерам и мракорисам.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Кровавые мухи");
		Doc_PrintLines(ndocid,0,"Чтобы выпотрошить этих летающих дьяволов, необходимо обладать двумя навыками.");
		Doc_PrintLines(ndocid,0,"У них можно вырезать крылья и жала.");
		Doc_PrintLines(ndocid,0,"Оба этих навыка используются опытными охотниками для добывания трофеев.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Полевые хищники и краулеры атакуют при помощи мандибул. Мандибулы краулеров");
		Doc_PrintLines(ndocid,1,"особенно ценятся, так как они содержат железы, повышающие магическую силу.");
		Doc_PrintLines(ndocid,1,"Однако, их следует использовать аккуратно, так как человеческий организм постепенно становится невосприимчив к ним.");
		Doc_PrintLines(ndocid,1,"Панцири краулеров также весьма популярны. Из них можно изготавливать доспехи.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Охота и трофеи");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"С каждого зверя или животного можно получить трофеи, преумножающие славу и богатство опытного охотника.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный ящер");
		Doc_PrintLines(ndocid,0,"Этот зверь - ящер, изрыгающий огонь, который может убить любого в пределах нескольких шагов от этой твари.");
		Doc_PrintLines(ndocid,0,"Только те, кто обладает защитой от огня, могут охотиться на этих созданий и добывать их ценные языки.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Мракорис");
		Doc_PrintLines(ndocid,1,"Мракорис - это древний зверь, предпочитающий уединение и живущий под покровом леса.");
		Doc_PrintLines(ndocid,1,"Этих созданий осталось очень мало, и поэтому они не представляют особой опасности для людей, если только те не забредут на территорию их охоты.");
		Doc_PrintLines(ndocid,1,"Рог мракориса считается ценным охотничьим трофеем. Но чтобы заполучить его, охотник");
		Doc_PrintLines(ndocid,1,"должен уметь правильно вырезать рог.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};


func void use_bookstanddementor_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Dementor_R.tga",0);
		Doc_Show(ndocid);
	};
};


//var int history_1_permanent;
//var int history_2_permanent;
//var int history_3_permanent;

func void use_bookstandhistory1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Путь воина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Лучшая защита - это хорошее нападение, по крайней мере, когда дело касается зверей. Бесполезно парировать атаки зверей или монстров.");
		Doc_PrintLines(ndocid,0,"Лучше всего держать врага на расстоянии при помощи точных, выверенных ударов, а затем нанести неожиданную комбинационную атаку.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Конечно, только опытные бойцы могут пользоваться комбинациями. Если вы станете мастером боя, вы даже сможете использовать несколько комбинаций.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Остров");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Портовый город Хоринис находится на острове у побережья королевства Миртана.");
		Doc_PrintLines(ndocid,0,"Этот остров известен, прежде всего, своей Долиной рудников. О ней ходят разные слухи, много лет она была закрыта магическим барьером и служила тюрьмой для всех осужденных королевства.");
		Doc_PrintLines(ndocid,0,"Таким образом, эта долина стала тюремной колонией, где каторжники глубоко под землей добывали магическую руду.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Неподалеку от Хориниса находятся несколько ферм, где крестьяне на плодородной почве выращивают пшеницу и репу, а также разводят овец.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Уже многие поколения самая большая ферма принадлежит лендлорду, который сдает в аренду прилежащие земли другим фермерам.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"В центре острова находится древний монастырь Инноса, возглавляемый магами огня. Они проводят там исследования в области мании и алхимии, а также делают неплохое вино.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Закон на острове");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Когда люди живут вместе, приходится искать способы поддержания мира - будь это монастырь, город или ферма лендлорда.");
		Doc_PrintLines(ndocid,0,"Любое преступление против сообщества подлежит наказанию.");
		Doc_PrintLines(ndocid,0,"Сообщество запрещает нападать на других, а также ввязываться в уже идущую схватку.");
		Doc_PrintLines(ndocid,0,"Воровство также подлежит наказанию. Кроме того под защитой закона также находятся священные животные - овцы.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Если кто-либо ударит другого или убьет его, правосудие обычно вершится на месте. Чтобы избежать подобной судьбы, виновный должен заплатить высокий штраф.");
		Doc_PrintLines(ndocid,1,"Во всех местах большого скопления народа, спокойствие поддерживают судьи. До них доходят сведения обо всех преступлениях, и в их обязанность входит вынесение приговора и восстановление порядка.");
		Doc_PrintLines(ndocid,1,"Тот, кто стал жертвой преступления или был свидетелем такового, обязан сообщить об этом властям.");
		Doc_Show(ndocid);
		if(HISTORY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_3_PERMANENT = TRUE;
		};
	};
};


func void use_bookstand_rune_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Рунные камни");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Руны и ингредиенты");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Учение Инноса");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Заповеди Инноса");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны первого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Свет:");
		Doc_PrintLine(ndocid,0,"- золотая монета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненная стрела:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов скелета гоблина:");
		Doc_PrintLine(ndocid,0,"- кость гоблина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение легких ранений:");
		Doc_PrintLine(ndocid,0,"- лечебная трава");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны второго круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный шар:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная стрела:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов волка:");
		Doc_PrintLine(ndocid,0,"- шкура волка");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Кулак ветра:");
		Doc_PrintLine(ndocid,0,"- уголь");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Сон:");
		Doc_PrintLine(ndocid,0,"- болотная трава");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны третьего круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение средних ранений:");
		Doc_PrintLine(ndocid,0,"- лечебное растение");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Малая огненная буря:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов скелета:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Страх:");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяной блок:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"- аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Шаровая молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны четвертого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большой огненный шар:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Молния:");
		Doc_PrintLine(ndocid,0,"- горный хрусталь");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов голема:");
		Doc_PrintLine(ndocid,0,"- сердце каменного голема");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Уничтожение нежити:");
		Doc_PrintLine(ndocid,0,"- святая вода");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны пятого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ледяная волна:");
		Doc_PrintLine(ndocid,0,"- ледяной кварц");
		Doc_PrintLine(ndocid,0,"- аквамарин");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Большая огненная буря:");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Вызов демона:");
		Doc_PrintLine(ndocid,0,"- сердце демона");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Лечение тяжелых ранений:");
		Doc_PrintLine(ndocid,0,"- лечебный корень");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Руны шестого круга и ингредиенты для их создания.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Огненный дождь:");
		Doc_PrintLine(ndocid,0,"- смола");
		Doc_PrintLine(ndocid,0,"- сера");
		Doc_PrintLine(ndocid,0,"- огненный язык");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Дыхание смерти:");
		Doc_PrintLine(ndocid,0,"- уголь");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Волна смерти:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Армия тьмы:");
		Doc_PrintLine(ndocid,0,"- кость скелета");
		Doc_PrintLine(ndocid,0,"- черная жемчужина");
		Doc_PrintLine(ndocid,0,"- сердце каменного голема");
		Doc_PrintLine(ndocid,0,"- сердце демона");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Уменьшение монстра:");
		Doc_PrintLine(ndocid,1,"- кость гоблина");
		Doc_PrintLine(ndocid,1,"- клык тролля");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Страница 1");
		Doc_PrintLine(ndocid,0,"Правила");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Страница 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};


func void bookstand_milten_03_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Поздно.");
		Doc_PrintLines(ndocid,0,"Обрушение этой старой шахты вызвало сильное недовольство рудных баронов.");
		Doc_PrintLines(ndocid,0,"Гомеш похож на пороховую бочку, которая вот-вот взорвется.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Корристо");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Он думает, что в обрушении шахты виноват этот новый парень. Да, конечно, мне он тоже кажется странным. И лучше ему больше здесь не показываться.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Корристо");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Гомеш готов со злости разнести все вокруг, и мне кажется, я знаю, что он планирует. Мы должны предупредить Магов Воды, пока еще не слишком поздно.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Корристо");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Возможно, нам удастся избежать катастрофы. Невыносимо думать о том, что произойдет, если шахта ...");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Я позволил себе устроиться здесь немного комфортнее. Кто бы мог подумать, что однажды я останусь единственным магом в лагере?");
		Doc_PrintLines(ndocid,0,"Ну, не могу сказать, что я рад возвращению. На самом деле, мне очень хочется убраться отсюда.");
		Doc_PrintLines(ndocid,0,"Этой экспедиции не суждено увенчаться успехом.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Старатели ушли вчера. Они взяли с собой Диего - не удивлюсь, если он сбежит.");
		Doc_PrintLines(ndocid,1,"Не думаю, что ему понравится махать киркой.");
		Doc_PrintLines(ndocid,1,"Ну, а я использую свободное время для более углубленного изучения алхимии.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Милтен");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1_ru()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Запасы");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Мы нашли кое-что - ничего полезного. Список прилагается:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 ящика старья");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 ящиков ржавых железяк");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 ящика с разбитыми доспехами");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 ящиков (вонючих) кожи и шкур");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 ящика с кирками");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 ящика с инструментами");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 ящиков с камнями (руды там почти нет)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ящик с ржавыми лезвиями");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 ящика с разбитой посудой");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 бочек с водой");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ящик с чем-то липким (что бы там ни было, оно сгнило)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Энгор");
		Doc_Show(ndocid);
	};
};

