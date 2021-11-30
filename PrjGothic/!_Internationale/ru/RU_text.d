var string PRINT_STR;
var string PRINT_MANA;
var string PRINT_DEX;



func void menu_text_ru()
{
	PRINT_STR = "Сила";
	PRINT_MANA = "Мана";
	PRINT_DEX = "Ловкость";
};


func void menu_text_de ()
{
	PRINT_STR = "Сила";
	PRINT_MANA = "Мана";
	PRINT_DEX = "Ловкость";
};

func void RU_text ()
{
MOBNAME_CRATE = "Ящик";
MOBNAME_CHEST = "Сундук";
MOBNAME_BED = "Кровать";
MOBNAME_DOOR = "Дверь";
MOBNAME_CAMPFIRE = "";
MOBNAME_TORCH = "";
MOBNAME_TORCHHOLDER = "";
MOBNAME_BARBQ_SCAV = "";
MOBNAME_BARBQ_SHEEP = "";
MOBNAME_BENCH = "";
MOBNAME_ANVIL = "Наковальня";
MOBNAME_BUCKET = "Ведро для воды";
MOBNAME_FORGE = "Кузнечный горн";
MOBNAME_GRINDSTONE = "Точильный камень";
MOBNAME_WHEEL = "Лебедка";
MOBNAME_LAB = "Стол алхимика";
MOBNAME_BOOKSTAND = "Книжный стенд";
MOBNAME_BOOKSBOARD = "Книжный стенд";
MOBNAME_CHAIR = "";
MOBNAME_CAULDRON = "";
MOBNAME_SEAT = "";
MOBNAME_THRONE = "";
MOBNAME_PAN = "Сковорода";
MOBNAME_REPAIR = "";
MOBNAME_WATERPIPE = "Кальян";
MOBNAME_SWITCH = "Выключатель";
MOBNAME_ORE = "Рудная жила";
MOBNAME_WINEMAKER = "";
MOBNAME_ORCDRUM = "";
MOBNAME_STOVE = "Плита";
MOBNAME_INNOS = "Алтарь Инноса";
MOBNAME_RUNEMAKER = "Рунный стол";
MOBNAME_SAW = "Пила";
MOBNAME_ARMCHAIR = "Кресло";
MOBNAME_LIBRARYLEVER = "Лампа";
MOBNAME_SECRETSWITCH = "";
MOBNAME_BIBLIOTHEK = "Библиотека";
MOBNAME_VORRATSKAMMER = "Кладовка";
MOBNAME_SCHATZKAMMER = "Сокровищница";
MOBNAME_IGARAZ = "Сундук Игараца";
MOBNAME_ALMANACH = "Альманах";
MOBNAME_CITY = "Хоринис";
MOBNAME_TAVERN = "Таверна";
MOBNAME_GR_PEASANT = "Лендлорд";
MOBNAME_MONASTERY = "К монастырю";
MOBNAME_PASSOW = "Проход";
MOBNAME_CITY2 = "Таверна";
MOBNAME_LIGHTHOUSE = "Маяк";
MOBNAME_MONASTERY2 = "Таверна";
MOBNAME_PRISON = "Колония";
MOBNAME_GR_PEASANT2 = "Таверна";
MOBNAME_INCITY01 = "Порт";
MOBNAME_INCITY02 = "Рыночная площадь";
MOBNAME_INCITY03 = "Верхний квартал";
MOBNAME_INCITY04 = "Портовый квартал";
MOBNAME_INCITY05 = "Храмовая площадь";
MOBNAME_BOW_01 = "Лавка 'У смертоносной стрелы'";
MOBNAME_MIX_01 = "Лавка 'Всякая всячина Маттео'";
MOBNAME_MIX_02 = "Рыбная лавка Халвора 'Скользкая форель'";
MOBNAME_SMITH_01 = "Лавка 'У горячей наковальни'";
MOBNAME_BAR_01 = "Таверна 'У одноногого разбойника'";
MOBNAME_BAR_02 = "Таверна 'У веселого поросенка'";
MOBNAME_TAVERN_01 = "Таверна 'Мертвая гарпия'";
MOBNAME_HOTEL_01 = "Постоялый двор 'У спящего толстосума'";
MOBNAME_HOTEL_02 = "Бордель 'Красный Фонарь'";
MOBNAME_SALANDRIL = "Лавка 'Зелья Саландрила'";
MOBNAME_GRAVETEAM_01 = "Сноэльк - 'Смотри-ка, выключатель'";
MOBNAME_GRAVETEAM_02 = "Оэльк - 'НЕЕЕЕЕТ'";
MOBNAME_GRAVETEAM_03 = "Ходжес - 'Все будет хорошо'";
MOBNAME_GRAVETEAM_04 = "Хош - 'Хуже уже не будет'";
MOBNAME_GRAVETEAM_05 = "Чейз - 'Зачем все это?'";
MOBNAME_GRAVETEAM_06 = "Бьорн - 'Мы выступаем!'";
MOBNAME_GRAVETEAM_07 = "Михаэль - 'Вот немного посплю...'";
MOBNAME_GRAVETEAM_08 = "Кайро - 'Секундочку!'";
MOBNAME_GRAVETEAM_09 = "Дядюшка Кранкл - 'Наконец, он нашел человека-скорпиона'";
MOBNAME_GRAVETEAM_10 = "НикоДЕ - 'Привет, мир!'";
MOBNAME_GRAVETEAM_11 = "Саша - 'Игрок не знает, зачем он идет туда...'";
MOBNAME_GRAVETEAM_12 = "Андрэ - 'Эти паруса обвисают быстро или медленно?'";
MOBNAME_GRAVETEAM_13 = "Михай - 'Да, я покажу тебе кое-что...'";
MOBNAME_GRAVETEAM_14 = "Уве - 'Какой уровень у твоего паладина?'";
MOBNAME_GRAVETEAM_15 = "Неизвестный ???-432 - 'Его звали Геристун, он вышел из моря'";
MOBNAME_GRAVETEAM_16 = "Эрнесто Ортой 350-410 - 'Я всегда буду с вами'";
MOBNAME_GRAVE_01 = "Барон Генрих фон Сталь 551-589 - 'Пришел, увидел и упал замертво'";
MOBNAME_GRAVE_02 = "Бертран 465-480 - 'Я всегда любил есть поганки'";
MOBNAME_GRAVE_03 = "Изольда 525-550";
MOBNAME_GRAVE_04 = "Неизвестный";
MOBNAME_GRAVE_05 = "Декс Кантионис 325-431 - 'Я уже несколько дней ничего не ел'";
MOBNAME_GRAVE_06 = "Утар Лайтбрингер 205-532";
MOBNAME_GRAVE_07 = "Жасмин 510-546";
MOBNAME_GRAVE_08 = "Онурб 634-579 - 'Дерепан модаз'";
MOBNAME_GRAVE_09 = "Неизвестный солдат";
MOBNAME_GRAVE_10 = "Могучий инопланетный гном 2894-3787 - 'Все это ложь! Поверь мне...'";
MOBNAME_GRAVE_11 = "Теодор 220-310 - 'Спи спокойно'";
MOBNAME_GRAVE_12 = "Вераним Садеа ???-390 - 'Преисподняя была вся в его распоряжении'";
MOBNAME_GRAVE_13 = "Серано Укара 234-298 - 'Страж башни'";
MOBNAME_GRAVE_14 = "Виктимо Сорн 456-512 - 'Только Феникс смог остановить его'";
MOBNAME_GRAVE_17 = "Артаг Амашрог 730-756";
MOBNAME_GRAVE_18 = "Иотар 721-762";
MOBNAME_GRAVE_19 = "Мидос 757-759";
MOBNAME_GRAVE_20 = "Оскар Сорн 703-736";
MOBNAME_GRAVE_21 = "Марта Укара 732-771";
MOBNAME_GRAVE_22 = "Вилфид Укара 722-764";
MOBNAME_GRAVE_23 = "Викторус Сталь 741-755";
MOBNAME_GRAVE_24 = "Себ 725-773";
MOBNAME_GRAVE_25 = "Неизвестный";
MOBNAME_GRAVE_26 = "Март Мульго 721-779";
MOBNAME_GRAVE_27 = "Цахра 713-752";
MOBNAME_GRAVE_28 = "Барон Симбус фон Кар 120-212";
MOBNAME_GRAVE_29 = "Граф Аниб цу Вальдфрид 117-212";
MOBNAME_GRAVE_30 = "Граф Лазарь фон Зигбург 156-212";
MOBNAME_GRAVE_31 = "Мечник Асуб Укара 145-212";
MOBNAME_GRAVE_32 = "Мечник Дитмар Укара 112-212";
MOBNAME_GRAVE_33 = "Почетный страж Утар Серанис 178-212";
MOBNAME_ADDON_IDOL = "Алтарь Белиара";
/*
TXT_GUILDS[66] =
{
	"Нет гильдии",
	"Паладин",
	"Ополченец",
	"Горожанин",
	"Маг Огня",
	"Послушник",
	"Охотник на драконов",
	"Наемник",
	"Крестьянин",
	"Бандит",
	"Каторжник",
	"Ищущий",
	"Бродяга",
	"Пират",
	"Маг Воды",
	"GIL_PUBLIC",
	"GIL_SEPERATOR_HUM",
	"Мясной жук",
	"Овца",
	"Гоблин",
	"Скелет гоблина",
	"Вызванный скелет гоблина",
	"Падальщик",
	"Гигантская крыса",
	"Полевой хищник",
	"Кровавая муха",
	"Ящер",
	"Волк",
	"Вызванный волк",
	"Краулер",
	"Луркер",
	"Скелет",
	"Вызванный скелет",
	"Скелет-маг",
	"Зомби",
	"Снеппер",
	"Мракорис",
	"Скелет мракориса",
	"Гарпия",
	"Каменный голем",
	"Огненный голем",
	"Ледяной голем",
	"Вызванный голем",
	"Демон",
	"Вызванный демон",
	"Тролль",
	"Болотная акула",
	"Дракон",
	"Крысокрот",
	"Аллигатор",
	"Болотный голем",
	"Каменный страж",
	"Пантера",
	"Блуждающий огонек",
	"Вызванный страж",
	"Вызванный зомби",
	"GIL_EMPTY_B",
	"GIL_EMPTY_C",
	"GIL_SEPERATOR_ORC",
	"Орк",
	"Дружественный орк",
	"Орк-нежить",
	"Человек-ящер",
	"GIL_EMPTY_X",
	"GIL_EMPTY_Y",
	"GIL_EMPTY_Z"
};

TXT_SPELLS[100] =
{
	"Святой свет",
	"Малое исцеление",
	"Святая стрела",
	"Среднее исцеление",
	"Изгнание Зла",
	"Большое исцеление",
	"Уничтожение Зла",
	"Секретный телепорт",
	"В порт",
	"В монастырь",
	"К лендлорду",
	"К Ксардасу",
	"К проходу Хориниса",
	"К проходу Долины Рудников",
	"В замок",
	"К старой демонической башне",
	"К таверне",
	"T3",
	"Свет",
	"Огненная стрела",
	"Ледяная стрела",
	"Лечение легких ранений",
	"Вызов скелета гоблина",
	"Огненный шар",
	"Малая молния",
	"Вызов волка",
	"Кулак ветра",
	"Сон",
	"Лечение средних ранений",
	"Молния",
	"Большой огненный шар",
	"Вызов скелета",
	"Страх",
	"Ледяной блок",
	"Шаровая молния",
	"Вызов голема",
	"Уничтожение нежити",
	"Большая огненная буря",
	"Малая огненная буря",
	"Ледяная волна",
	"Вызов демона",
	"Лечение тяжелых ранений",
	"Огненный дождь",
	"Дыхание смерти",
	"Волна смерти",
	"Армия Тьмы",
	"Уменьшение монстра",
	"Превращение в овцу",
	"Превращение в падальщика",
	"Превращение в гигантскую крысу",
	"Превращение в полевого хищника",
	"Превращение в волка",
	"Превращение в ящера",
	"Превращение в снеппера",
	"Превращение в варга",
	"Превращение в огненного ящера",
	"Превращение в луркера",
	"Превращение в мракориса",
	"Превращение в драконьего снеппера",
	"Забвение",
	"Святой удар",
	"Стрела смерти",
	"Шар смерти",
	"Стрела сотрясения",
	"Телепорт зодчих",
	"TXT_SPL_RESERVED_65",
	"TXT_SPL_RESERVED_66",
	"TXT_SPL_RESERVED_67",
	"TXT_SPL_RESERVED_68",
	"TXT_SPL_RESERVED_69",
	"Буря",
	"Смерч",
	"Кулак воды",
	"Ледяное копье",
	"Надувание людей",
	"Гейзер",
	"Водопад",
	"TXT_SPL_RESERVED_77",
	"TXT_SPL_RESERVED_78",
	"TXT_SPL_RESERVED_79",
	"Нашествие насекомых",
	"Рой насекомых",
	"Корень-ловушка",
	"Землетрясение",
	"Вызов стража",
	"Гнев Белиара",
	"Кража энергии",
	"Крик смерти",
	"Вызов зомби",
	"Вызов Мада",
	"TXT_SPL_RESERVED_90",
	"TXT_SPL_RESERVED_91",
	"TXT_SPL_RESERVED_92",
	"TXT_SPL_RESERVED_93",
	"TXT_SPL_RESERVED_94",
	"TXT_SPL_RESERVED_95",
	"TXT_SPL_RESERVED_96",
	"TXT_SPL_RESERVED_97",
	"TXT_SPL_RESERVED_98",
	"TXT_SPL_RESERVED_99"
};
*/
NAME_SPL_PALLIGHT = "Святой свет";
NAME_SPL_PALLIGHTHEAL = "Малое исцеление";
NAME_SPL_PALHOLYBOLT = "Святая стрела";
NAME_SPL_PALMEDIUMHEAL = "Среднее исцеление";
NAME_SPL_PALREPELEVIL = "Изгнание зла";
NAME_SPL_PALFULLHEAL = "Большое исцеление";
NAME_SPL_PALDESTROYEVIL = "Уничтожение зла";
NAME_SPL_PALTELEPORTSECRET = "Секретный телепорт";
NAME_SPL_TELEPORTSEAPORT = "Телепорт в порт";
NAME_SPL_TELEPORTMONASTERY = "Телепорт в монастырь";
NAME_SPL_TELEPORTFARM = "Телепорт к лендлорду";
NAME_SPL_TELEPORTXARDAS = "Телепорт к Ксардасу";
NAME_SPL_TELEPORTPASSNW = "Телепорт к Проходу Хориниса";
NAME_SPL_TELEPORTPASSOW = "Телепорт к Проходу долины рудников";
NAME_SPL_TELEPORTOC = "Телепорт в замок";
NAME_SPL_TELEPORTOWDEMONTOWER = "Телепорт в древнюю демоническую башню";
NAME_SPL_TELEPORTTAVERNE = "Телепорт к таверне";
NAME_SPL_TELEPORT_3 = "T3";
NAME_SPL_LIGHT = "Свет";
NAME_SPL_FIREBOLT = "Огненная стрела";
NAME_SPL_ICEBOLT = "Ледяная стрела";
NAME_SPL_LIGHTHEAL = "Лечение легких ранений";
NAME_SPL_SUMMONGOBLINSKELETON = "Вызов скелета гоблина";
NAME_SPL_INSTANTFIREBALL = "Огненный шар";
NAME_SPL_ZAP = "Малая молния";
NAME_SPL_SUMMONWOLF = "Вызов волка";
NAME_SPL_WINDFIST = "Кулак ветра";
NAME_SPL_SLEEP = "Сон";
NAME_SPL_MEDIUMHEAL = "Лечение средних ранений";
NAME_SPL_FIRESTORM = "Малая огненная буря";
NAME_SPL_SUMMONSKELETON = "Вызов скелета";
NAME_SPL_FEAR = "Страх";
NAME_SPL_ICECUBE = "Ледяной блок";
NAME_SPL_CHARGEZAP = "Шаровая молния";
NAME_SPL_LIGHTNINGFLASH = "Молния";
NAME_SPL_SUMMONGOLEM = "Вызов голема";
NAME_SPL_DESTROYUNDEAD = "Уничтожение нежити";
NAME_SPL_CHARGEFIREBALL = "Большой огненный шар";
NAME_SPL_PYROKINESIS = "Большая огненная буря";
NAME_SPL_ICEWAVE = "Ледяная волна";
NAME_SPL_SUMMONDEMON = "Вызов демона";
NAME_SPL_FULLHEAL = "Лечение тяжелых ранений";
NAME_SPL_FIRERAIN = "Огненный дождь";
NAME_SPL_BREATHOFDEATH = "Дыхание смерти";
NAME_SPL_MASSDEATH = "Волна смерти";
NAME_SPL_ARMYOFDARKNESS = "Армия тьмы";
NAME_SPL_SHRINK = "Уменьшение монстра";
NAME_SPL_TRFSHEEP = "Превращение в овцу";
NAME_SPL_TRFSCAVENGER = "Превращение в падальщика";
NAME_SPL_TRFGIANTRAT = "Превращение в гигантскую крысу";
NAME_SPL_TRFGIANTBUG = "Превращение в полевого хищника";
NAME_SPL_TRFWOLF = "Превращение в волка";
NAME_SPL_TRFWARAN = "Превращение в ящера";
NAME_SPL_TRFSNAPPER = "Превращение в снеппера";
NAME_SPL_TRFWARG = "Превращение в варга";
NAME_SPL_TRFFIREWARAN = "Превращение в огненного ящера";
NAME_SPL_TRFLURKER = "Превращение в луркера";
NAME_SPL_TRFSHADOWBEAST = "Превращение в мракориса";
NAME_SPL_TRFDRAGONSNAPPER = "Превращение в драконьего снеппера";
NAME_SPL_CHARM = "Забвение";
NAME_SPL_MASTEROFDISASTER = "Святой удар";
/*
TXT_TALENTS[22] =
{
	"",
	"Одноручное",
	"Двуручное",
	"Лук",
	"Арбалет",
	"Отмычки",
	"",
	"Магия",
	"Подкрадывание",
	"",
	"",
	"Акробатика",
	"Карманник",
	"Ковка оружия",
	"Создание рун",
	"Алхимия",
	"Снятие шкур",
	"",
	"",
	"",
	"",
	""
};



TXT_INV_CAT[9] =
{
	"",
	"Оружие",
	"Доспехи",
	"Магия",
	"Артефакты",
	"Еда",
	"Зелья",
	"Документы",
	"Разное"
};
*/
/*
	TXT_TALENTS_SKILLS[1] ="";
	TXT_TALENTS_SKILLS[2] ="Новичок|Боец|Мастер";
	TXT_TALENTS_SKILLS[3] ="Новичок|Боец|Мастер";
	TXT_TALENTS_SKILLS[4] ="Новичок|Стрелок|Мастер";
	TXT_TALENTS_SKILLS[5] ="Новичок|Стрелок|Мастер";
	TXT_TALENTS_SKILLS[6] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[7] ="";
	TXT_TALENTS_SKILLS[8] ="Не изучено|Круг 1|Круг 2|Круг 3|Круг 4|Круг 5|Круг 6";
	TXT_TALENTS_SKILLS[9] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[10] ="";
	TXT_TALENTS_SKILLS[11] ="";
	TXT_TALENTS_SKILLS[12] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[13] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[14] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[15] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[16] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[17] ="Не изучено|Изучено";
	TXT_TALENTS_SKILLS[18] ="";
	TXT_TALENTS_SKILLS[19] ="";
	TXT_TALENTS_SKILLS[20] ="";
	TXT_TALENTS_SKILLS[21] ="";
	TXT_TALENTS_SKILLS[22] ="";
*/
/*
const	string TXT_TALENTS_SKILLS[22] =
{
	"",
	"Новичок|Боец|Мастер",
	"Новичок|Боец|Мастер",
	"Новичок|Стрелок|Мастер",
	"Новичок|Стрелок|Мастер",
	"Не изучено|Изучено",
	"",
	"Не изучено|Круг 1|Круг 2|Круг 3|Круг 4|Круг 5|Круг 6",
	"Не изучено|Изучено",
	"",
	"",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"",
	"",
	"",
	"",
	""
};
*/
/*
const	string TXT_TALENTS_SKILLS[22] =
{
	"",
	"Новичок|Боец|Мастер",
	"Новичок|Боец|Мастер",
	"Новичок|Стрелок|Мастер",
	"Новичок|Стрелок|Мастер",
	"Не изучено|Изучено",
	"",
	"Не изучено|Круг 1|Круг 2|Круг 3|Круг 4|Круг 5|Круг 6",
	"Не изучено|Изучено",
	"",
	"",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"Не изучено|Изучено",
	"",
	"",
	"",
	"",
	""
};
*/

NAME_PALADIN = "Паладин";
NAME_MILIZ = "Ополченец";
NAME_TORWACHE = "Стражник у ворот";
NAME_TUERWACHE = "Стражник у двери";
NAME_STADTWACHE = "Городской стражник";
NAME_ARBEITER = "Рабочий";
NAME_RITTER = "Рыцарь";
NAME_WACHE = "Стражник";
NAME_BUERGER = "Гражданин";
NAME_BUERGERIN = "Гражданка";
NAME_MAGD = "Служанка";
NAME_MAGIER = "Маг Огня";
NAME_NOVIZE = "Послушник";
NAME_DRACHENJAEGER = "Охотник на драконов";
NAME_TOTERDRACHENJAEGER = "Мертвый охотник на драконов";
NAME_SOELDNER = "Наемник";
NAME_BAUER = "Крестьянин";
NAME_BAEUERIN = "Крестьянка";
NAME_BANDIT = "Бандит";
NAME_STRAEFLING = "Каторжник";
NAME_WAFFENKNECHT = "Оруженосец";
NAME_DEMENTOR = "Ищущий";
NAME_TOTERNOVIZE = "Мертвый послушник";
NAME_ANTIPALDIN = "Предводитель орков";
NAME_SCHIFFSWACHE = "Корабельный стражник";
NAME_FLUECHTLING = "Беглец";
DIALOG_ENDE = "КОНЕЦ";
DIALOG_BACK = "НАЗАД";
DIALOG_TRADE = "(купить)";
DIALOG_PICKPOCKET = "(украсть)";
NAME_RING = "Кольцо";
NAME_AMULETT = "Амулет";
NAME_TRANK = "Зелье";
NAME_RUNE = "Руна";
NAME_SPRUCHROLLE = "Свиток";
NAME_BEUTEL = "Кожаный кошелек";
NAME_BAG = "Мешок";
NAME_CURRENCY = "Золото: ";
PRINT_TRADE_NOT_ENOUGH_GOLD = "У вас недостаточно золота для покупки этого предмета.";
NAME_VALUE = "Цена:";
NAME_MAG_CIRCLE = "Круг:";
NAME_MANAKOSTEN = "Расход маны:";
NAME_MANAKOSTENMAX = "Расход маны (макс.):";
NAME_MANAPERSEC = "Маны в секунду:";
NAME_DURATION = "Длительность (минут):";
NAME_SEC_DURATION = "Длительность (секунд):";
NAME_MANA_NEEDED = "Необходимо маны:";
NAME_STR_NEEDED = "Необходима сила:";
NAME_DEX_NEEDED = "Необходима ловкость:";
NAME_DAM_EDGE = "Урон оружием:";
NAME_DAM_POINT = "Урон стрелами:";
NAME_DAM_FIRE = "Урон огнем:";
NAME_DAM_MAGIC = "Урон магией:";
NAME_DAM_FLY = "Урон ветром:";
NAME_DAMAGE = "Урон:";
NAME_DAMAGE_MAX = "Максимальный урон:";
NAME_PERMANA = " (на ед. маны)";
NAME_DAMAGEPERSEC = "Урон в секунду:";
NAME_PROT_EDGE = "Защита от оружия:";
NAME_PROT_POINT = "Защита от стрел:";
NAME_PROT_FIRE = "Защита от огня:";
NAME_PROT_MAGIC = "Защита от магии:";
NAME_BONUS_HP = "Прибавка к здоровью:";
NAME_BONUS_MANA = "Прибавка к мане:";
NAME_BONUS_HPMAX = "Прибавка к макс. здоровью:";
NAME_BONUS_MANAMAX = "Прибавка к макс. мане:";
NAME_BONUS_DEX = "Прибавка к ловкости:";
NAME_BONUS_STR = "Прибавка к силе:";
NAME_ONEHANDED = "Одноручное оружие";
NAME_TWOHANDED = "Двуручное оружие";
NAME_HEALINGPERMANA = "Лечение на ед. маны:";
NAME_HEALINGPERCAST = "Лечение:";
NAME_ITMW_1H_COMMON_01 = "Простой кованый меч";
NAME_ITMW_1H_SPECIAL_01 = "Длинный рудный меч";
NAME_ITMW_2H_SPECIAL_01 = "Двуручный рудный меч";
NAME_ITMW_1H_SPECIAL_02 = "Полуторный рудный меч";
NAME_ITMW_2H_SPECIAL_02 = "Тяжелый двуручный рудный меч";
NAME_ITMW_1H_SPECIAL_03 = "Рудный боевой клинок";
NAME_ITMW_2H_SPECIAL_03 = "Тяжелый рудный боевой клинок";
NAME_ITMW_1H_SPECIAL_04 = "Рудный клинок 'Убийца драконов'";
NAME_ITMW_2H_SPECIAL_04 = "Большой рудный клинок 'Убийца драконов'";
PRINT_GOLDGEGEBEN = " золотых отдано";
PRINT_ITEMGEGEBEN = " отдано";
PRINT_ITEMSGEGEBEN = " предметов отдано";
PRINT_GOLDERHALTEN = " золотых получено";
PRINT_ITEMERHALTEN = " получено";
PRINT_ITEMSERHALTEN = " предметов получено";
PRINT_KOSTEN = " (";
PRINT_LP = " очков обучения)";
PRINT_2LP = " очка обучения)";
PRINT_1LP = " очко обучения)";
PRINT_NOTENOUGHLEARNPOINTS = "Недостаточно очков обучения!";
PRINT_NOLEARNOVERPERSONALMAX = "Максимум этого учителя - ";
PRINT_LEARNSTR = "Сила + ";
PRINT_LEARNDEX = "Ловкость + ";
PRINT_LEARNMANA_MAX = "Макс. мана + ";
PRINT_LEARNHITPOINTS_MAX = "Макс. здоровье + ";
PRINT_LEARNLP = "Очки обучения + ";
PRINT_LEARNCIRCLE_1 = "Изучено: 1-й круг магии";
PRINT_LEARNCIRCLE_2 = "Изучено: 2-й круг магии";
PRINT_LEARNCIRCLE_3 = "Изучено: 3-й круг магии";
PRINT_LEARNCIRCLE_4 = "Изучено: 4-й круг магии";
PRINT_LEARNCIRCLE_5 = "Изучено: 5-й круг магии";
PRINT_LEARNCIRCLE_6 = "Изучено: 6-й круг магии";
PRINT_LEARN1H = "Улучшено: Сражение одноручным оружием";
PRINT_LEARN1H_AND_2H = "Улучшено: Сражение одноручным и двуручным оружием";
PRINT_LEARN2H = "Улучшено: Сражение двуручным оружием";
PRINT_LEARN2H_AND_1H = "Улучшено: Сражение двуручным и одноручным оружием";
PRINT_LEARNBOW = "Улучшено: Меткость стрельбы из лука";
PRINT_LEARNBOW_AND_CROSSBOW = "Улучшено: Меткость стрельбы из лука и арбалета";
PRINT_LEARNCROSSBOW = "Улучшено: Меткость стрельбы из арбалета";
PRINT_LEARNCROSSBOW_AND_BOW = "Улучшено: Меткость стрельбы из арбалета и лука";
PRINT_LEARNPICKLOCK = "Изучено: Владение отмычками";
PRINT_LEARNSNEAK = "Изучено: Искусство красться";
PRINT_LEARNACROBAT = "Изучено: Акробатика";
PRINT_LEARNPICKPOCKET = "Изучено: Искусство карманного воровства";
PRINT_LEARNSMITH = "Изучено: Искусство изготовления оружия";
PRINT_LEARNRUNES = "Изучено: Искусство создания рун";
PRINT_LEARNALCHEMY = "Изучено: Искусство приготовления зелий";
PRINT_LEARNALCHEMYINNOSEYE = "Изучено: Как заряжать Глаз Инноса";
PRINT_LEARNTAKEANIMALTROPHY = "Изучено: Трофеи животных";
PRINT_LEARNPALTELEPORTSECRET = "Изучено: Создание руны-телепорта";
PRINT_LEARNSTR1 = "Сила + 1";
PRINT_LEARNSTR5 = "Сила + 5";
PRINT_LEARNSTR10 = "Сила + 10";
PRINT_LEARNSTR20 = "Сила + 20";
PRINT_LEARNDEX1 = "Ловкость + 1";
PRINT_LEARNDEX5 = "Ловкость + 5";
PRINT_LEARNDEX10 = "Ловкость + 10";
PRINT_LEARNDEX20 = "Ловкость + 20";
PRINT_LEARNMANA1 = "Мана + 1";
PRINT_LEARNMANA5 = "Мана + 5";
PRINT_LEARNMANA10 = "Мана + 10";
PRINT_LEARNMANA20 = "Мана + 20";
PRINT_LEARN1H1 = "Одноручное оружие + 1";
PRINT_LEARN1H5 = "Одноручное оружие + 5";
PRINT_LEARN1H10 = "Одноручное оружие + 10";
PRINT_LEARN1H20 = "Одноручное оружие + 20";
PRINT_LEARN2H1 = "Двуручное оружие + 1";
PRINT_LEARN2H5 = "Двуручное оружие + 5";
PRINT_LEARN2H10 = "Двуручное оружие + 10";
PRINT_LEARN2H20 = "Двуручное оружие + 20";
PRINT_LEARNBOW1 = "Лук + 1";
PRINT_LEARNBOW5 = "Лук + 5";
PRINT_LEARNBOW10 = "Лук + 10";
PRINT_LEARNBOW20 = "Лук + 20";
PRINT_LEARNCROSSBOW1 = "Арбалет + 1";
PRINT_LEARNCROSSBOW5 = "Арбалет + 5";
PRINT_LEARNCROSSBOW10 = "Арбалет + 10";
PRINT_LEARNCROSSBOW20 = "Арбалет + 20";
PRINT_SLEEPOVER = "Вы хорошо выспались и отдохнули!";
PRINT_SLEEPOVEROBSESSED = "Кошмары помешали вам отдохнуть!";
PRINT_SMITHSUCCESS = "Оружие готово!";
PRINT_RUNESUCCESS = "Руна создана!";
PRINT_ALCHEMYSUCCESS = "Зелье готово!";
PRINT_ALCHEMYSUCCESSINNOSEYE = "Глаз Инноса пульсирует энергией!";
PRINT_PRODITEMSMISSING = "Недостаточно ингредиентов!";
PRINT_TABAKSUCCESS = "Создан новый табак!";
PRINT_JOINTSUCCESS = "Косяк из болотной травы готов!";
PRINT_NOINNOSTEARS = "Вам не хватает 'Слез Инноса'.";
PRINT_KEYMISSING = "Мне никогда не открыть это без правильного ключа!";
PRINT_PICKLOCKMISSING = "Здесь бы пригодилась отмычка!";
PRINT_PICKLOCK_OR_KEYMISSING = "Хм... у меня нет отмычки или ключа.";
PRINT_NEVEROPEN = "Я никогда не смогу открыть этот замок!";
PRINT_TOOFAR_AWAY = "Слишком далеко.";
PRINT_WRONGSIDE = "Не с той стороны.";
PRINT_MISSINGITEM = "И как я это сделаю?";
PRINT_ANOTHERUSER = "Уже используется.";
PRINT_NOPICKLOCKTALENT = "Я не умею открывать замки отмычкой.";
PRINT_NOTHINGTOGET = "Из этого не выйдет ничего хорошего...";
PRINT_NOTHINGTOGET02 = "Там ничего нет...";
PRINT_NOTHINGTOGET03 = "Нечего взять...";
PRINT_BLESSSTR = "Иннос слышит тебя и дарует: Сила + ";
PRINT_BLESSDEX = "Иннос слышит тебя и дарует: Ловкость + ";
PRINT_BLESSMANA_MAX = "Иннос слышит тебя и дарует: Макс. мана + ";
PRINT_BLESSHITPOINTS_MAX = "Иннос слышит тебя и дарует: Макс. здоровье + ";
PRINT_BLESSMANA = "Иннос слышит тебя и очищает твой дух.";
PRINT_BLESSHITPOINTS = "Иннос слышит тебя и дарует тебе исцеление.";
PRINT_BLESSMANA_HIT = "Иннос слышит тебя, и ты чувствуешь себя так, как будто родился заново.";
PRINT_BLESSNONE = "Иннос благодарит тебя за твои молитвы.";
PRINT_NOTENOUGHGOLD = "Недостаточно золота.";
BLESS_SWORD = "Освятить меч (5000 золотых)";
BLESS_SWORD2 = "Освятить меч (Слезы Инноса)";
PRAY_PALADIN1 = "... Иннос, распространи свою длань над слугами своими ...";
PRAY_PALADIN2 = "... благослови их своим огнем и даруй им силу ...";
PRAY_PALADIN3 = "... чтобы они мужественно сражались с твоим именем на устах ...";
PRAY_PALADIN4 = "... до победы или смерти, согласно воле твоей.";
PRINT_FULLYHEALED = "Полностью исцелен!";
PRINT_EAT1 = "Вы чувствуете себя освеженным.";
PRINT_EAT2 = "Сочная и свежая пища.";
PRINT_EAT3 = "Вы чувствуете, как силы наполняют вас!";
PRINT_READASTRONOMY = "Чувство божественного просвещения наполняет вас.";
PRINT_GORNSTREASURE = "Получено 100 золотых.";
PRINT_KEROLOTHSGELDBEUTEL = "Получено 300 золотых.";
PRINT_MALETHBANDITSGOLD = "Получено 300 золотых.";
PRINT_DIEGOSTREASURE = "Получено 2000 золотых.";
PRINT_IRDORATHBOOKDOESNTOPEN = "Эту книгу невозможно открыть.";
PRINT_IRDORATHBOOKHIDDENKEY = "В переплете этой книги спрятан ключ!";
PRINT_FISHLETTER = "В этой рыбе спрятана записка.";
PRINT_INNOSEYEGIVEN = "Глаз Инноса отдан";
PRINT_INNOSEYEGET = "Получен Глаз Инноса";
PRINT_GOTFOURITEMS = "Получено 4 предмета";
PRINT_STR1 = "Сила + 1";
PRINT_MANA10 = "Мана + 10";
PRINT_DEX2 = "Ловкость + 2";
PRINT_ORCELITERINGEQUIP = "Вы чувствуете слабость.";
PRINT_SCISOBSESSED = "Вы чувствуете удушье!";
PRINT_CLEARSCOBSESSION = "Вы чувствуете себя освобожденным!";
PRINT_NUMBERLEFT = " осталось";
PRINT_NOVIZENLEFT = " послушников осталось";
PRINT_DRAGKILLCOUNT = "Враг повержен. На этот раз я не буду гнить под камнями. Пришло время возвращаться на корабль.";
PRINT_SMITH_1H_SPECIAL_01 = " (1 кусок руды)";
PRINT_SMITH_2H_SPECIAL_01 = " (2 куска руды)";
PRINT_SMITH_1H_SPECIAL_02 = " (2 куска руды)";
PRINT_SMITH_2H_SPECIAL_02 = " (3 куска руды)";
PRINT_SMITH_1H_SPECIAL_03 = " (3 куска руды)";
PRINT_SMITH_2H_SPECIAL_03 = " (4 куска руды)";
PRINT_SMITH_1H_SPECIAL_04 = " (4 куска руды, 5 ед. драконьей крови)";
PRINT_SMITH_2H_SPECIAL_04 = " (5 кусков руды, 5 ед. драконьей крови)";
NAME_MAGESCROLL = "Свиток";
PRINT_FOUNDRING = "Найдено кольцо";
PRINT_FOUNDAMULETT = "Найден амулет";
PRINT_FOUNDSCROLL = "Найден свиток с заклинанием";
PRINT_FOUNDPOTION = "Найдено зелье";
PRINT_FOUNDGOLD10 = "Найдено 10 золотых";
PRINT_FOUNDGOLD25 = "Найдено 25 золотых";
PRINT_FOUNDGOLD50 = "Найдено 50 золотых";
PRINT_FOUNDGOLD100 = "Найдено 100 золотых";
PRINT_FOUNDGOLD1000 = "Найдено 1000 золотых";
PRINT_FOUNDRUNEBLANK = "Найдена руна";
PRINT_FOUNDORENUGGET = "Найден кусок руды";
PRINT_FOUNDLOCKPICK = "Найдена отмычка";
PRINT_HANNASBEUTEL = "Маленький ключик и несколько отмычек...";
PRINT_GOTPLANTS = "Найдены травы";
PRINT_NOSWEEPING = "Чтобы обыскать все эти комнаты потребуется вечность!";
PRINT_MANDIBLES = "Этот секрет не дает никакого эффекта.";
PRINT_BLOODFLY = "На вкус горький и ядовитый.";
PRINT_XPGAINED = "Опыт + ";
PRINT_LEVELUP = "Повышение уровня!";
PRINT_NEWLOGENTRY = "Новая запись в дневнике";
PRINT_TELEPORTTOOFARAWAY = "Слишком далеко";
PRINT_BIFFSANTEIL = "Доля Биффа: ";
PRINT_BIFFGOLD = " золотых";
TEXT_INNOSEYE_SETTING_BROKEN = "Оправа этого амулета повреждена.";
TEXT_INNOSEYE_SETTING_REPAIRED = "Оправа этого амулета в целости и сохранности.";
TEXT_INNOSEYE_GEM = "Драгоценный камень тускл и безжизнен.";
PICKPOCKET_20 = "(нет ничего проще, чем украсть его кошелек)";
PICKPOCKET_40 = "(украсть его кошелек будет довольно просто)";
PICKPOCKET_60 = "(пытаться украсть его кошелек довольно рискованно)";
PICKPOCKET_80 = "(украсть его кошелек будет довольно трудно)";
PICKPOCKET_100 = "(украсть его кошелек будет чертовски трудно)";
PICKPOCKET_120 = "(украсть его кошелек практически невозможно)";
PICKPOCKET_20_FEMALE = "(нет ничего проще, чем украсть ее кошелек)";
PICKPOCKET_40_FEMALE = "(украсть ее кошелек будет довольно просто)";
PICKPOCKET_60_FEMALE = "(пытаться украсть ее кошелек довольно рискованно)";
PICKPOCKET_80_FEMALE = "(украсть ее кошелек будет довольно трудно)";
PICKPOCKET_100_FEMALE = "(украсть ее кошелек будет чертовски трудно)";
PICKPOCKET_120_FEMALE = "(украсть ее кошелек практически невозможно)";

PRINT_POCKET_25 = "Внутри позванивает несколько монет.";
PRINT_POCKET_300 = "Этот кошелек набит монетами.";
PRINT_POCKET_MIS = "На мешочке прикреплен ярлык";



PRINT_PICKLOCK_SUCCESS = "Похоже, я на верном пути.";
PRINT_PICKLOCK_UNLOCK = "Замок открыт.";
PRINT_PICKLOCK_FAILURE = "Черт... Попробуем еще раз.";
PRINT_PICKLOCK_BROKEN = "Отмычка сломалась.";
PRINT_HITPOINTS_MISSING = "Недостаточно здоровья: ";
PRINT_HITPOINTS_MAX_MISSING = "Недостаточно макс. здоровья: ";
PRINT_MANA_MISSING = "Недостаточно маны: ";
PRINT_MANA_MAX_MISSING = "Недостаточно макс. маны: ";
PRINT_STRENGTH_MISSING = "Недостаточно силы: ";
PRINT_DEXTERITY_MISSING = "Недостаточно ловкости: ";
PRINT_MAGCIRCLES_MISSING = "Слишком низкий магический круг для использования этой руны.";
PRINT_MAGCIRCLES_LOW = "Не изучен необходимый Круг магии.";
_STR_MESSAGE_INTERACT_NO_KEY = "Нет отмычки или подходящего ключа.";
_STR_MESSAGE_TRADE_FAILURE = "Ваши товары недостаточно ценные.";
STR_INFO_TRADE_ACCEPT = "Принять";
STR_INFO_TRADE_RESET = "Отклонить";
STR_INFO_TRADE_EXIT = "НАЗАД";
MENU_TEXT_NEEDS_APPLY = "Нажмите ENTER для активации!";
MENU_TEXT_NEEDS_RESTART = "Некоторые настройки вступят в силу после перезапуска игры.";
KAPWECHSEL_1 = "Глава 1";
KAPWECHSEL_1_TEXT = "Угроза";
KAPWECHSEL_2 = "Глава 2";
KAPWECHSEL_2_TEXT = "Возвращение в колонию";
KAPWECHSEL_3 = "Глава 3";
KAPWECHSEL_3_TEXT = "Глаз Инноса";
KAPWECHSEL_4 = "Глава 4";
KAPWECHSEL_4_TEXT = "Охота на драконов";
KAPWECHSEL_5 = "Глава 5";
KAPWECHSEL_5_TEXT = "Отплытие";
KAPWECHSEL_6 = "Глава 6";
KAPWECHSEL_6_TEXT = "Чертоги Ирдората";
KAPITELANFANG = "НАЧАТЬ ГЛАВУ";

PRINT_BOOKSTANDRUNES1 = "Чтобы создать руну, всегда необходим КАЖДЫЙ из вышеперечисленных ингредиентов.";
PRINT_BOOKSTANDRUNES2 = "Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.";
PRINT_BOOKSTANDRUNES3 = "Только при выполнении этих условий он может приступить к работе за рунным столом.";

};