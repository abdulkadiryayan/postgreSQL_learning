create table kullanici(
	kullanici_id int not null primary key,
	kullanici_ismi varchar(50) not null,
	kullanici_sifresi varchar(50) not null,
	mail_adresi varchar(50) not null,
	kullanici_tc int not null
);


insert into kullanici(kullanici_id, kullanici_ismi, kullanici_sifresi, mail_adresi,kullanici_tc)
values  		(1, 'hilem','34SH7', 'hilemerdem@gmail.com', 12346598901),
		(2, 'abdulkadir','offf34', 'abdulkadir12@gmail.com', 50683744230),
		(3, 'simge','6ER56gd', 'simgeaktass@gmail.com', 68394567291),
		(4, 'eda' ,'35NMH25', 'edagülll3@gmail.com', 21436709087),
		(5, 'ahmet','hnryn4', 'ahmetgür@gmail.com', 48792421093),
		(6, 'burak','1234grc', 'burakyilmazz@hotmail.com', 5982145670),
		(7, 'kasım','ksmysr4', 'kasımysrn@gmail.com', 24084756647),
		(8, 'mehmet','mh25th','mehmetsinek25@hotmail.com',24516709085),
		(9, 'hayri', 'hyrk3457', 'hayriii4@icloud.com', 56238976022),
		(10, 'rumeysa', 'ryms61tr', 'rumeysayldrm@gmail.com', 12613934604);
----------------------------------------------------------------------------------------------
create table oyun(
	oyun_id int not null primary key,
	oyun_adi varchar(50) not null,
	oyun_fiyati float not null,
	oyun_firmasi varchar(100) not null,
	oyun_cikis_tarihi varchar(200) not null	
);

insert into oyun(oyun_id, oyun_adi, oyun_fiyati, oyun_firmasi, oyun_cikis_tarihi)
values		 (11, 'Counter-Strike 2', 199.99, 'valve', '21 Ağustos 2012'),
		(12, 'Dota 2', 349.90, 'valve', '9 Temmuz 2013'),
		(13, 'PUBG', 150, 'tencent games', '21 Aralık 2017'),  
		(14, 'Artifact', 449.99, 'valve', '15 Eylül 2022'),    
		(15, 'Tom Clancys Rainbow Six Siege', 249.9, 'ubisoft', '1 Aralık 2015'), 
		(16, 'Business Tour', 0, '8floor', '27 Temmuz 2017'),    
		(17, 'Apex Legends', 0, 'electronic arts', '5 Kasım 2020'),   
		(18, 'Grand Theft Auto V', 900, 'rockstar games', '14 Nisan 2015'),   
		(19, 'Rust', 1199.99, 'facepunsh studios', '8 Şubat 2018'),     
		(20, 'Call of Duty', 1999.9, 'activision', '28 Ekim 2022');    
----------------------------------------------------------------------------------------------
create table firma(
	firma_id int not null primary key,
	firma_adi varchar(50) not null,
	firma_mail_adresi varchar(100) not null
);

insert into firma(firma_id, firma_adi, firma_mail_adresi)
values  		(21, 'Valve', ' valve@software.com'),
		(22, 'Tencent games', 'PUBGMOBILE_CS@tencentgames.com'),
		(23, 'Ubisoft', 'ubisoft@software.com'),
		(24, '8floor', '8floor@gmail.com'),
		(25, 'Electronic Arts', 'electronicarts@gmail.com'),
		(26, 'Rockstar Games', 'contacts@rockstargames.com'),
		(27, 'Facepunsh Studios', 'facepunshstudios@software.com'),
		(28, 'Activision', 'CallofDuty@activision.com'),
		(29, 'Capcom', 'contacts@capcom.com'),
		(30, 'Mimimi games', 'mimimigames@software.com');
----------------------------------------------------------------------------------------------
create table haber(
	haber_id int not null primary key,
	haber_adi varchar(100) not null,
	haber_konusu varchar(200) not null
);

insert into haber(haber_id, haber_adi, haber_konusu)
values  		(31, 'Counter-Strike 2 silah', 'Yeni silah piyasaya çıktı.'),
		(32, 'Dota 2 yeni kahraman', 'Oyuna yeni kahraman eklendi.'),
		(33, 'PUBG yeni kıyafet ', 'Oyuna güncel kıyafetler geldi.'),
		(34, 'Artifact kartları', 'Kartlar en güncel görünümüne ulaştı.'),
		(35, 'Tom Clancys Rainbow Six Siege e karakter', 'Karakter eklendi.'),
		(36, 'Business Tour zar', 'Zar görünümü güncellendi.'),
		(37, 'Apex Legends hata', 'Yaşanan hatalar düzeltildi.'),
		(38, 'Grand Theft Auto V harita', 'Yeni harita eklendi.'),
		(39, 'Rust bıçak', 'Bıçaklar güncellendi.'),
		(40, 'Call of Duty görüntü hataları', 'Yaşanan görüntü hataları düzeltildi.');
----------------------------------------------------------------------------------------------
create table envanter(
	envanter_id int not null primary key,
	urun_adi varchar(100) not null,
	urun_fiyati float not null,
	urun_ozelligi varchar(100) not null	
);

insert into envanter(envanter_id, urun_adi, urun_fiyati, urun_ozelligi)
values  		(41, 'Bıçak', 59.99, 'Keskinliği arttırılmış bıçak.'),
		(42, 'Silah', 120, 'Hassasiyeti yüksel silah.'),
		(43, 'Kask', 299.90, 'Koruma gücü yüksek kask.'),
		(44, 'Yelek', 199.99, 'Görüntüsü güzel ve koruması yüksek yelek.'),
		(45, 'El bombası', 75, 'Ekstra yükseğe fırlatılabilen en bombası.'),
		(46, 'Kıyafet', 350, 'Karakterlere uygun kıyafet.'),
		(47, 'Çanta', 99.9, 'Ürün koyma kapasitesi yüksek çanta.'),
		(48, 'Pusula', 449.9, 'Işıklı pusula.'),
		(49, 'Harita', 50, 'Ekstra büyütülmüş harita.'),
		(50, 'Kostüm(skin)', 560, 'Kahramanın dış görünüşünü değiştirir ve yetenek efekti ekler.');
----------------------------------------------------------------------------------------------
create table satis(
	satis_id int not null primary key,
	urun_adi varchar(50) not null,
	satin_alma_tarihi varchar(50) not null,
	satma_tarihi varchar(50) 
);

insert into satis(satis_id,urun_adi, satin_alma_tarihi, satma_tarihi)
values  		(51,'Bıçak', '10 Aralık 2019',''),
		(52,'Silah', '8 Şubat 2018', '22 Mart 2018'),
		(53,'Kask', '1 Ocak 2022', '3 Ocak 2022'),
		(54,'Yelek', '22 Ağustos 2022', ''),
		(55,'El bombası', '29 Mart 2017', ''),
		(56,'Kıyafet', '15 Nisan 2023', '20 Nisan 2023'),
		(57,'Çanta', '2 Temmuz 2018', '12 Ağustos 2019'),
		(58,'Pusula', '17 Kasım 2022', ''),
		(59, 'Harita', '5 Ekim 2019', '6 Ekim 2019'),
		(60, 'Kostüm', '25 Haziran 2017', '25 Haziran 2019');
----------------------------------------------------------------------------------------------
create table cuzdan(
	cuzdan_id int not null primary key,
	kullanici_id int references kullanici(kullanici_id),
	bakiye_bilgisi float  not null,
	kart_bilgisi int not null,
	alım_satim_gecmisi varchar(100) not null,
	para_yukleme float 
);

insert into cuzdan(cuzdan_id, kullanici_id, bakiye_bilgisi, kart_bilgisi, alım_satim_gecmisi,para_yukleme)
values  		(61, 1, 100, 4824, 'Para giriş çıkışı olmadı',0),
		(62, 2, 120, 3367, 'Para yüklendi', 120),
		(63, 3, 299.90, 1280, 'Para yüklendi', 299.90),
		(64, 4, 500,  4423, 'Para giriş çıkışı olmadı',0),
		(65, 5, 10, 9880, 'Para giriş çıkışı olmadı',0),
		(66, 6, 350, 1844, 'Para yüklendi', 350),
		(67, 7, 99.9, 4804, 'Para yüklendi', 99.9),
		(68, 8, 200, 2535, 'Para giriş çıkışı olmadı',0),
		(69, 9, 50, 4625, 'Para yüklendi', 50),
		(70, 10, 560, 2409, 'Para yüklendi', 560);
----------------------------------------------------------------------------------------------
create table rutbe(
	rutbe_id int not null primary key,
	rutbe_seviyesi varchar(255)
);

insert into rutbe (rutbe_id, rutbe_seviyesi)
values  		(71, 'Geçirilen süreye göre = 1, Kazandığı birinciliklere göre = 3'),
		(72,'Geçirilen süreye göre = 7, Kazandığı birinciliklere göre = 5'),
		(73,'Geçirilen süreye göre = 3, Kazandığı birinciliklere göre = 2'),
		(74,'Geçirilen süreye göre = 8, Kazandığı birinciliklere göre = 4'),
		(75,'Geçirilen süreye göre = 9, Kazandığı birinciliklere göre = 7'),
		(76,'Geçirilen süreye göre = 1, Kazandığı birinciliklere göre = 1'),
		(77,'Geçirilen süreye göre = 2, Kazandığı birinciliklere göre = 1'),
		(78,'Geçirilen süreye göre = 4, Kazandığı birinciliklere göre = 2'),
		(79,'Geçirilen süreye göre = 10, Kazandığı birinciliklere göre = 9'),
		(80,'Geçirilen süreye göre = 6, Kazandığı birinciliklere göre = 3');
----------------------------------------------------------------------------------------------
create table topluluk(
	topluluk_id int not null primary key,
	kapasite_sayisi int not null,
	topluluk_sayisi int not null,
	uyelik_numarasi int not null
);

insert into topluluk(topluluk_id, kapasite_sayisi, topluluk_sayisi, uyelik_numarasi)
values  		(81, 4500, 5, 128),
		(82, 7000, 12, 344),
		(83, 3800, 3, 125),
		(84, 12500, 20, 80),
		(85, 800, 1, 284),
		(86, 5500, 7, 187),
		(87, 6900, 10, 590),
		(88, 2500, 2, 270),
		(89, 9990, 9, 97),
		(90, 4200, 4, 367);
----------------------------------------------------------------------------------------------
create table kutuphane(
	kutuphane_id int not null primary key,
	oyun_id int references oyun(oyun_id),
	kullanici_giris varchar(100) not null,
	kullanicinin_sahip_oldugu_oyun_sayisi int not null
);

insert into kutuphane(kutuphane_id, oyun_id, kullanici_giris,kullanicinin_sahip_oldugu_oyun_sayisi )
values  		(91, 11, '34SH7', 5),
		(92, 12, 'offf34', 7),
		(93, 13, '6ER56gd' , 2),
		(94, 14,'35NMH25' , 12),
		(95, 15,'hnryn4' , 21),
		(96, 16,'1234grc', 18),
		(97, 17,'ksmysr4' , 6),
		(98, 18,'mh25th' , 15),
		(99, 19,'hyrk3457' , 29),
		(100, 20,'ryms61tr' , 1);


-----------------------------------------------------------------------


create table cıkarır (
	oyun_id int references oyun(oyun_id),
	haber_id int references haber(haber_id)
);

insert into cıkarır(oyun_id, haber_id)
values  (11,31),
		(12,32),
		(13,33),
		(14,34),
		(15,35),
		(16,36),
		(17,37),
		(18,38),
		(19,39),
		(20,40);
		
**********************************************************************************************

create table yayınlar (
		haber_id int references haber(haber_id),
		firma_id int references firma(firma_id)
);

insert into yayınlar(haber_id, firma_id)
values  (31,21),
		(32,22),
		(33,23),
		(34,24),
		(35,25),
		(36,26),
		(37,27),
		(38,28),
		(39,29),
		(40,30);
	
**********************************************************************************************

create table uyedir (
		kullanici_id int references kullanici(kullanici_id),
		topluluk_id int references topluluk(topluluk_id)
);

insert into uyedir (kullanici_id, topluluk_id)
values  (1,81),
		(2,82),
		(3,83),
		(4,84),
		(5,85),
		(6,86),
		(7,87),
		(8,88),
		(9,89),
		(10,90);

**********************************************************************************************

create table bulunur (
		kutuphane_id int references kutuphane(kutuphane_id),
		oyun_id int references oyun(oyun_id)
);

insert into bulunur (kutuphane_id , oyun_id)
values  (91,11),
		(92,12),
		(93,13),
		(94,14),
		(95,15),
		(96,16),
		(97,17),
		(98,18),
		(99,19),
		(100,20);
