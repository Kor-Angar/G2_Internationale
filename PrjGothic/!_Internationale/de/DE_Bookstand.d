
func void Use_Bookstand_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			knows_fire_contest = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest,"Als Novize habe ich das Recht die Prüfung des Feuers zu fordern. Dabei wird mir jeder der drei Magier aus dem hohen Rat eine Prüfung stellen. Wenn ich sie bestehe, werde ich in den Kreis des Feuers aufgenommen.");
		};
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Die Prüfung des Feuers");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"So ein Novize nicht erwählt ist, mag es sein, das er trotzdem die Bereitschaft verspürt sich der Prüfung der Magie zu unterwerfen. Wenn er diesen Entschluß reiflich überlegt hat und er darauf besteht, ist es ihm gewährt, die Prüfung zu verlangen und kein Magier darf sie ihm verweigern. Doch nicht nur die Prüfung der Magie wird ihm auferlegt, sondern er soll durch das Feuer seine Erleuchtung finden. Wenn er vor dem hohen Rat darauf besteht, so soll ihm die PRÜFUNG DES FEUERS gewährt werden.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"In dieser Prüfung soll gleichermaßen die Klugheit, Stärke und das Geschick des Novizen gefordert werden. So soll er drei Prüfungen erfüllen, jede empfangen durch einen der Magier des hohen Rates, bevor er den Eid der Flamme schwört und den Bund mit dem Feuer eingehen kann. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"So ist es Innos Wille und so soll es geschehen. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Der hohe Rat");
		Doc_Show(nDocID);
	};
};


var int FinalDragonEquipment_Once;

func void Use_FINALDRAGONEQUIPMENT_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"...Ich hoffe, dass die Kuppel das Erz vor dem Zugriff Beliars zu schützen vermag. Der König ist einfältig genug zu glauben, dass wir die Kuppel zum Schutz vor Ausbrüchen errichten, doch solange wir mit diesen Ratschlagen unsere höheren Zeile erreichen, soll es uns recht sein. Ich hoffe, das uns genug Zeit bleibt uns auf den Kampf vorzubereiten. Sobald die Kuppel um das Minental erschaffen ist, werde ich mit all meiner mir zur Verfügung stehenden Macht versuchen in den bevorstehenden Kampf einzugreifen. ");
		Doc_PrintLines(nDocID,0,"");
		if(hero.guild == GIL_KDF)
		{
			PlayerGetsAmulettOfDeath = TRUE;
			player_talent_runes[SPL_MasterOfDisaster] = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"Zutaten für die Rune ´Heiliges Geschoss´: 1 geweihtes Wasser, aber keine Spruchrolle");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...ich habe, genau nach Anleitung einfach Innos geweihtes Wasser auf einen Runenrohling geträufelt und am Runentisch zusammengeführt. Der Runenstein ist zerstört, ich glaube, dieser Spruch ist wirklich nur dem Einen zugänglich.");
			Doc_PrintLines(nDocID,1,"Die Heilige Aura Innos habe ich dem Klosterschtz übergeben. Sie wird von nun an, vom Klostervorsteher aufbewahrt, bis zu dem Tag, an dem sich der Eine offenbart.");
			Doc_PrintLines(nDocID,1,"Die Tränen Innos mögen in dem bevorstehenden Kampf eine Rolle spielen. Doch ist es wohl zu gefährlich sie offen aufzubewahren. Ich werde sie hier in der Bibliothek lassen.");
			Doc_Show(nDocID);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			player_talent_runes[SPL_PalTeleportSecret] = TRUE;
			PrintScreen(PRINT_LearnPalTeleportSecret,-1,-1,FONT_Screen,2);
			Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
			B_LogEntry(TOPIC_TalentRunes,"Um eine Rune zu erschaffen, benötige ich für jede Rune unterschiedliche Zutaten. Mit diesen Zutaten und einem Runenrohling kann ich dann die gewünschte Rune am Runentisch erschaffen.");
			B_LogEntry(TOPIC_TalentRunes,"Zutaten für die Rune ´Geheimer Teleport´: 1 Geweihtes Wasser");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Um in den geheimen Ort zu gelangen muss man eine Teleportrune bauen. Dazu benötigst du einen Runenrohling und eine kleines Fläschchen geweihtes Wasser. Mit der erstellten Runen kannst du dich in den Raum teleporteiren.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Ich bin nun sehr sicher, dass es die Tränen Innos waren, mit den die Paladine aus der vorderen Zeit, die längst vergessene Hohe Schwertweihe abgehalten haben. Es sollte also möglich sein, mit dem von mir entdeckten Fläschchen eine geweihten Waffe zusaätzliche Kraft zu geben.");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		}
		else
		{
			player_talent_smith[WEAPON_1H_Special_04] = TRUE;
			player_talent_smith[WEAPON_2H_Special_04] = TRUE;
			PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
			B_LogEntry(TOPIC_TalentSmith,"Um eine Waffe zu schmiede, brauche ich zunächst ein Stück Rohstahl. An einem Schmiedefeuer muss ich den Stahl erhitzen und anschließend an einem Amboss in die gewünschte Form bringen. Für hochwertigere Waffe benötigt man häufig noch Substanzen, welche der Waffe besondere Eigenschaften verleihen.");
			B_LogEntry(TOPIC_TalentSmith,"Wenn ich 4 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´ERZ-DRACHENTÖTER´ schmieden.");
			B_LogEntry(TOPIC_TalentSmith,"Wenn ich 5 Erz und 5 Drachenblut hinzugebe, kann ich mir einen ´GROßEN ERZ-DRACHENTÖTER´ schmieden.");
			PlayergetsFinalDJGArmor = TRUE;
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Aus den Waffen des Dracheherren.");
			Doc_PrintLines(nDocID,1,"´Um einem Panzer aus Drachenschuppen die höchste Härte zu verleihen, so kann man die Schuppen mit dem Erz überzeihen, welches in dem Tal der Insel Karynis gefördert wird.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Um eine dem Drachenherren würdige Klinge zu erhalten, muss man die Klinge in Drachenblut tränken. Schon die Beigabe einer Menge von 5 kleinen Phiolen verleiht dem Stahl eine Härte und Schärfe, der nichts entgegen zu setzten ist.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Anmerkung: Mit Karynis ist zeifelsfrei das heutige Khorinis gemeint.");
			Doc_Show(nDocID);
		};
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};


var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

func void Use_BookstandALCHEMY1_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Tränke magischer Kraft");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Mana Essenz");
		Doc_PrintLine(nDocID,0,"2 Feuernesseln");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Mana Extrakt");
		Doc_PrintLine(nDocID,0,"2 Feuerkräuter");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Mana Elixier");
		Doc_PrintLine(nDocID,0,"2 Feuerwurzeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die während des Prozesses verbraucht wird.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken der Heilung oder der Stärkung der magischen Kraft, benötigt der Anwender neben der speziellen Zutat immer eine Pflanze:");
		Doc_PrintLine(nDocID,1,"Feldknöterich");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken die permanente Veränderungen des Körpers oder Geistes bewirken, benötigt der Anwender immer eine Pflanze: ");
		Doc_PrintLines(nDocID,1,"Kronstöckl");
		Doc_Show(nDocID);
		if(ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY2_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Tränke heilender Kraft");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Essenz der Heilung");
		Doc_PrintLine(nDocID,0,"2 Heilpflanzen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Extrakt der Heilung");
		Doc_PrintLine(nDocID,0,"2 Heilkräuter");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixier der Heilung");
		Doc_PrintLine(nDocID,0,"2 Heilwurzeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die während des Prozesses verbraucht wird.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken der Heilung oder der Stärkung der magischen Kraft, benötigt der Anwender neben der speziellen Zutat immer eine Pflanze:");
		Doc_PrintLine(nDocID,1,"Feldknöterich");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken die permanente Veränderungen des Körpers oder Geistes bewirken, benötigt der Anwender immer eine Pflanze: ");
		Doc_PrintLines(nDocID,1,"Kronstöckl");
		Doc_Show(nDocID);
		if(ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY3_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Tränke permanenter Veränderungen");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixier der Geschicklichkeit");
		Doc_PrintLine(nDocID,0,"1 Goblin Beere");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Trank der Geschwindigkeit");
		Doc_PrintLines(nDocID,0,"1 Snapperkraut - dieser Trank benötigt keinen Kronstöckl, sondern Feldknöterich");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Elixier der Stärke");
		Doc_PrintLine(nDocID,0,"1 Drachenwurzel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Elixier des Lebens");
		Doc_PrintLine(nDocID,0,"1 Heilwurzel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Elixier des Geistes");
		Doc_PrintLine(nDocID,0,"1 Feuerwurzel");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Das Brauen dieser Rezepturen ist die hohe Kunst der Alchemie und erfordert gewisse Vorkenntnisse. Im Allgemeinen lässt sich sagen, erst wenn jemand den sachgerechten Umgang mit der Heil- oder Feuerwurzel beherscht, ist er kundig genug, um sich an den hohen Tränken zu probieren. Ihnen allen ist zu eigen, dass sie einen Kronstöckl als Zutat verlangen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Der Trank der Geschwindigkeit ist viel einfacher herzustellen, was auch daran liegt, das man keinen Kronstöckl benötigt. Schon einfache Alchemiekenntnisse reichen aus um die Rezeptur zu verstehen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_3_permanent = TRUE;
		};
	};
};


var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

func void Use_BookstandAnimals1_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Jagd und Beute");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ein erfahrener Jäger weiß um die Trophäen seiner Beute und kennt die verschiedenen Methoden sie auszunehmen.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Zähne reißen");
		Doc_PrintLines(nDocID,0,"Die Zähne, sind die Waffe von vielen Tieren und Wesen. Wer darum weiß, wie er sie seiner Beute fachkundig entreißt, findet bei Wölfen, Snappern, Schattenläufern, Sumpfhaien und Trollen seine Beute.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Felle abziehen");
		Doc_PrintLines(nDocID,1,"Ein Talent das der erfahrene Jäger oft zu nutzen weiß - gibt es doch viele Tiere, deren Körper von einem Fell geschützt ist. Schafe, Wölfe und Schattenläufer um nur einige zu benennen.");
		Doc_PrintLines(nDocID,1,"Ein Jäger, der dieses Talent beherrscht, kann auch die Häute von Sumphaien und Lurkern abziehen.  ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Krallen brechen");
		Doc_PrintLines(nDocID,1,"Eine Kunst, die bei Waranen aller Art, Snappern, Lurkern und Schattenläufern eingesetzt werden kann.  ");
		Doc_Show(nDocID);
		if(Animals_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Animals_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandAnimals2_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Jagd und Beute");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Die Blutfliegen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Um diese fliegenden Teufel auszunehmen, bedarf es zwei besonderer Künste.");
		Doc_PrintLines(nDocID,0,"Zum einen können ihnen die Flügel abgetrennt, zum anderen kann der Stachel entrissen werden.");
		Doc_PrintLines(nDocID,0,"Beide Künste sollte der erfahrene Jäger einsetzen, um sich die Trophäen anzueignen.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Feldräuber und Minecrawler greifen mit Zangen an. Vor allem die Zangen der Minecrawler");
		Doc_PrintLines(nDocID,1,"gelten als besonders wertvoll, weil sie ein Sekret enthalten, das magische Kräfte steigert.");
		Doc_PrintLines(nDocID,1,"Allerdings sollte es mit Vorsicht genossen werden, da der menschliche Körper mit der Zeit nicht mehr darauf reagiert.");
		Doc_PrintLines(nDocID,1,"Ebenfalls sehr begehrt sind die Platten der Minecrawler. Aus ihnen lassen sich Rüstungen herstellen. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
		if(Animals_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Animals_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandAnimals3_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Jagd und Beute");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Jedes Tier und Wesen besitzt eigene Trophäen, die den Ruhm und Reichtum eines erfahrenen Jäger mehren.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Der Feuerwaran");
		Doc_PrintLines(nDocID,0,"Dieses besondere Wesen zählt zur Gattung der Warane, allerdings ist es in der Lage Feuer zu speien, das jeden der sich ihm auf ein paar Schritt nähert, unweigerlich tötet.");
		Doc_PrintLines(nDocID,0,"Nur wer sich gegen Feuer zu schützen vermag, kann sich im Kampf mit diesen Wesen messen und ihm die kostbare Zunge entreissen.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Der Schattenläufer");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Der Schattenläufer ist ein uralter Einzelgänger der versteckt in Wäldern lebt.");
		Doc_PrintLines(nDocID,1,"Es gibt nur noch wenige Exemplare, so das er für den Menschen keine Gefahr mehr darstellt, solange er nicht seine Jagdrevier kreuzt.");
		Doc_PrintLines(nDocID,1,"Der Kopf des Schattenläufers wird von einem Horn gekrönt, das als wertvolle Trophäe gilt. Ein Jäger muss die Kunst lernen, das Horn richtig zu brechen,");
		Doc_PrintLines(nDocID,1,"damit er diese Trophäe bekommt.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Animals_3_permanent = TRUE;
		};
	};
};


func void Use_BookstandDementor_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);
	};
};


var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

func void Use_BookstandHistory1_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Der Weg des Kampfes");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Angriff ist die beste Verteidigung, bei allem was nicht Mensch ist. Eine Parade gegen Tiere oder Monster auszuführen ist sinnlos.");
		Doc_PrintLines(nDocID,0,"Da ist es besser den Gegner mit gezielten Seitenschlägen auf Distanz zu halten um überraschend eine Kombination aus mehreren Schlägen durchzuführen.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Kombinationen mehrerer Schläge sind natürlich einem erfahrenen Kämpfer vorbehalten. Und wer sogar die Meisterschaft im Kampf erreicht, kann weitere Kombinationen ausführen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			History_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory2_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Die Insel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Hafenstadt Khorinis liegt auf einer Insel vor der Küste des Königreiches Myrtana.");
		Doc_PrintLines(nDocID,0,"Die Insel ist vor allem durch das Minental bekannt geworden. Ein zweifelhafter Ruf, denn viele Jahre erstreckte sich eine magische Barriere über das gesamte Tal und alle Gefangenen des Reiches wurden dort hinein gebracht.");
		Doc_PrintLines(nDocID,0,"So wurde das Tal zur Strafkolonie für viele Verurteilte, die tief unter der Erde nach dem magischen Erz schürften. ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Außerhalb von Khorinis gibt es noch einige Bauernhöfe, die den guten Boden nutzen, um Weizen und Rüben anzubauen, aber auch um Schafe zu züchten.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Seit Generationen ist der größte Hof im Besitz eines Großbauern, der sein umliegendes Land an andere Bauern verpachtet. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Mitten auf der Insel steht ein altes Kloster. Ein Kloster Innos, das von den Magiern des Feuers geführt wird. Dort gehen sie magischen und alchmistischen Forschungen nach und keltern Wein.");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			History_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory3_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Das Gesetz der Insel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Überall dort, wo Menschen zusammenkommen, muss das gemeinsame Leben geregelt werden. Ob das im Kloster, in der Stadt oder auf dem Hof des Großbauers ist.");
		Doc_PrintLines(nDocID,0,"So wird jedes Verbrechen wider der Gemeinschaft bestraft.");
		Doc_PrintLines(nDocID,0,"Im Sinne der Gemeinschaft ist es nicht erlaubt Schlägereien anzuzetteln oder sich in solche verwickeln zu lassen. ");
		Doc_PrintLines(nDocID,0,"Ebenso ist Diebstahl ein Vergehen, das nicht ohne Folge bleibt. Und auch die Schafe stehen unter dem Schutz des Gesetzes.  ");
		Doc_PrintLines(nDocID,0," ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Wer gar einen anderen Menschen niederschlägt und ermordet, muß damit rechnen auf der Stelle gerichtet zu werden.");
		Doc_PrintLines(nDocID,1,"Und wer dem entgehen kann, muß eine hohen Strafe zahlen. ");
		Doc_PrintLines(nDocID,1,"An allen großen Orten, führen Männer das Amt des Rechts aus. Ihnen wird zugetragen welche Taten geschehen und sie fordern die Strafe ein, auf das der Frieden wiederhergestellt wird. ");
		Doc_PrintLines(nDocID,1,"Denn wer Opfer eines Vergehens wird oder solche bezeugen kann, wird nicht gut auf den Täter zu sprechen sein.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Es gibt natürlich auch Volk das sich nicht um die Gesetze schert. Vor allem Banditen und Söldner. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			History_2_permanent = TRUE;
		};
	};
};


func void Use_Bookstand_Rune_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Seite 1");
		Doc_PrintLine(nDocID,0,"Die Runensteine");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Seite 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rune_02_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Seite 1");
		Doc_PrintLine(nDocID,0,"Die Runen und ihre Ingredenzien");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Seite 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Seite 1");
		Doc_PrintLine(nDocID,0,"Die Lehren Innos");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Seite 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_02_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Seite 1");
		Doc_PrintLine(nDocID,0,"Die Gebote Innos");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Seite 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER ERSTE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des ersten Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Licht");
		Doc_PrintLine(nDocID,0,"Goldmünze");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Feuerpfeil");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kleiner Blitz");
		Doc_PrintLine(nDocID,0,"Bergkristall");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Goblin Skelett");
		Doc_PrintLine(nDocID,0,"Knochen eines Goblins");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Leichte Wunden heilen");
		Doc_PrintLine(nDocID,0,"Heilpflanze");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_02_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER ZWEITE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des zweiten Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Feuerball");
		Doc_PrintLine(nDocID,0,"Pech");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Eispfeil");
		Doc_PrintLine(nDocID,0,"Gletscher Quartz");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Wolf rufen");
		Doc_PrintLine(nDocID,0,"Wolfsfell");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Windfaust");
		Doc_PrintLine(nDocID,0,"Kohle");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Schlaf");
		Doc_PrintLine(nDocID,0,"Sumpfkraut");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_03_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER DRITTE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des dritten Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Mittlere Wunden heilen");
		Doc_PrintLine(nDocID,0,"Heilkraut");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kleiner Feuersturm");
		Doc_PrintLine(nDocID,0,"Pech");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Skelett erschaffen");
		Doc_PrintLine(nDocID,0,"Knochen eines Skeletts");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Furcht");
		Doc_PrintLine(nDocID,0,"Schwarze Perle");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Eisblock");
		Doc_PrintLine(nDocID,0,"Gletscher Quartz");
		Doc_PrintLine(nDocID,0,"Aquamarin");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Kugelblitz");
		Doc_PrintLine(nDocID,0,"Bergkristall");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,"Feuerball");
		Doc_PrintLine(nDocID,0,"Pech");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_04_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER VIERTE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des vierten Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Grosser Feuerball");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"Pech");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Blitzschlag");
		Doc_PrintLine(nDocID,0,"Bergkristall");
		Doc_PrintLine(nDocID,0,"Gletscher Quartz");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Golem erwecken");
		Doc_PrintLine(nDocID,0,"Herz eines Steingolems");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Untote vernichten");
		Doc_PrintLine(nDocID,0,"Geweihtes Wasser");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_05_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER FÜNFTE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des fünften Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Eiswelle");
		Doc_PrintLine(nDocID,0,"Gletscher Quartz");
		Doc_PrintLine(nDocID,0,"Aquamarin");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Grosser Feuersturm");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"Flammenzunge");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Dämon beschwören");
		Doc_PrintLine(nDocID,0,"Herz eines Dämonen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Schwere Wunden heilen");
		Doc_PrintLine(nDocID,0,"Heilwurzel");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_06_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"DER SECHSTE KREIS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Die Runen des sechsten Kreises und die zu deren Herstellung benötigten Ingredenzien ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Feuerregen");
		Doc_PrintLine(nDocID,0,"Pech");
		Doc_PrintLine(nDocID,0,"Schwefel");
		Doc_PrintLine(nDocID,0,"Flammenzunge");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Todeshauch");
		Doc_PrintLine(nDocID,0,"Kohle");
		Doc_PrintLine(nDocID,0,"Schwarze Perle");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Todeswelle");
		Doc_PrintLine(nDocID,0,"Knochen eines Skeletts");
		Doc_PrintLine(nDocID,0,"Schwarze Perle");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Armee der Finsternis");
		Doc_PrintLine(nDocID,0,"Knochen eines Skeletts");
		Doc_PrintLine(nDocID,0,"Schwarze Perle");
		Doc_PrintLine(nDocID,0,"Herz eines Steingolems");
		Doc_PrintLine(nDocID,0,"Herz eines Dämonen");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Monster schrumpfen");
		Doc_PrintLine(nDocID,1,"Knochen eines Goblins");
		Doc_PrintLine(nDocID,1,"Trollhauer");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für die Herstellung einer Rune ist jeweils EINE der aufgeführten Ingredenzien erforderlich.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Dem Anwender muss die Formel für den Zauber bekannt sein und er muss einen blanken Runenstein, sowie eine Spruchrolle des jeweiligen Zaubers besitzen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Erst wenn diese Vorraussetzungen erfüllt sind, kann er am Runentisch zu Werke gehen.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rules_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Seite 1");
		Doc_PrintLine(nDocID,0,"Regeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Seite 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};


func void Bookstand_Milten_03_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Es ist spät geworden.");
		Doc_PrintLines(nDocID,0,"Mit dem Zusammenbruch der alten Mine ist auch die Stimmung der Erzbarone zusammmengebrochen.");
		Doc_PrintLines(nDocID,0,"Gomez ist wie ein Pulverfaß, das kurz vor dem explodieren steht.  ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Corristo");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Er glaubt das dieser neue Kerl schuld am Zusammenbruch der Mine ist. Dieser Mann ist in der Tat ungewöhnlich. Aber er sollte sich hier besser nicht mehr blicken lassen.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Corristo");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Gomez ist jähzorniger denn je zuvor und ich glaube zu wissen was er vorhat. Wir müssen unbedingt die Wassermagier unterrichten, bevor es zu spät ist. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Corristo");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Vielleicht gelingt es uns eine Katastrophe zu verhindern. Nicht auszudenken was passieren würde, wenn er die freie Mine, ");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_02_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ich war so frei, mich hier ein wenig einzurichten. Wer hätte gedacht, das ich einmal der einzige Magier des Lagers sein werde?");
		Doc_PrintLines(nDocID,0,"Nun ja, ich kann mich nicht wirklich darüber freuen, das ich wieder hier bin. Eigentlich sollte ich zusehen, das ich hier wegkomme.");
		Doc_PrintLines(nDocID,0,"Diese Expedition ist einfach nicht erfolgreich.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Die Schürfer sind gestern aufgebrochen. Sie haben Diego mitgenommen - würde mich nicht wundern, wenn er abhaut. ");
		Doc_PrintLines(nDocID,1,"Denn er wird garantiert keine Spitzhacke schwingen. ");
		Doc_PrintLines(nDocID,1,"Nun, ich werde die Zeit nutzen, um mich in die Kunst der Alchemie einzuarbeiten. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Milten");
		Doc_Show(nDocID);
	};
};

func void Bookstand_Milten_01_S1_de()
{
	var C_Npc her;
	var int Document;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		Document = Doc_CreateMap();
		Doc_SetPages(Document,1);
		Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
		Doc_Show(Document);
	};
};

func void Bookstand_Engor_01_S1_de()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Bestand");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Haben einigen Kram vorgefunden - kaum noch verwertbares Material, darunter wie folgt");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"3 Kisten alte Stoffe");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"8 Kisten rostige Eisenware");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"4 Kisten kaputte Rüstungsteile ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"5 Kisten Leder und Fellwaren (stinken schon!)");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"2 Kisten Spitzhacken");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"3 Kisten Werkzeuge");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"16 Kisten Gesteinsbrocken (kaum Erzgehalt)");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 Kiste mit rostigen Rasiermessern");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"4 Kisten kaputtes Geschirr ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"56 Fässer Wasser");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"1 Kiste Sumpf...- (was auch immer es war, es ist verdorben.)");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Engor");
		Doc_Show(nDocID);
	};
};

