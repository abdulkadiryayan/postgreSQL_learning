create table kullanici(
    kullanici_id int primary key,
    kullanici_NickName varchar,
    kullanici_dogumtarihi int,
    kullanici_mail varchar,
    kullanıcı_sifre varchar
);

create table oyun(
    oyun_id int primary key,
	kullanici_id int references kullanici(kullanici_id),
    oyun_adı varchar,
    oyun_firması varchar,
    oyun_türü varchar,
    oyun_fiyatı int,
    oyun_puanı int,
    oyun_indirmeSayısı int,
    oyun_haberid int

);
create table kampanya(
    kampanya_id int primary key,
    oyun_id int references oyun(oyun_id) ,
    kampanya_adı varchar,
    kampanya_yeniFiyat int,
    kampanya_baslamaTarihi varchar,
    kampanya_bitisTarihi varchar,
    kampanya_indirimYüzdesi int,
    kampanya_oyunTürü varchar

);
create table puan(
    puan_id int primary key,
    oyun_id int references oyun(oyun_id), 
    puan_ortalama int,
    puan_üyeId int, 
    puan_yorum varchar

);
create table envanter(
    envanter_id int primary key,
    oyun_id int references oyun(oyun_id),
    envanter_esyaid int,
    envanter_esyaAdı varchar,
    envanter_esyaFiyati int,
    envanter_esyaGorunus varchar

);
create table sistemGereksinimleri(
    sistem_id int primary key,
    oyun_id int references oyun(oyun_id),
    sistem_ram int,
    sistem_islemci varchar,
    sistem_isletimSistemi varchar,
    sistem_ekranKartı varchar,
    sistem_depolama int,
    oyun_DirectX int

);
create table firma(
    firma_id int primary key,
    oyun_id int references oyun(oyun_id),
    firma_adi varchar,
    firma_website varchar,
    firma_telefon int,
    firma_mail varchar

);
create table haber(
    haber_id int primary key,
	firma_id int references firma(firma_id),
    haber_baslık varchar,
    haber_konu varchar,
    haber_firmaid int
);

create table kütüphane(
	kütüphane_id int primary key,
	kullanici_id int references kullanici(kullanici_id),
    kütüphane_oyunAdı varchar,
    kütüphane_oyunId int,
    kütüphane_oyunGüncellik varchar

);

create table arkadasListesi (
	
    liste_id int primary key,
	kullanici_id int references kullanici(kullanici_id),
    liste_arkadasKodum int,
    liste_banListesi varchar

);

create table cüzdan (
	
    cüzdan_id int primary key,
	kullanici_id int references kullanici(kullanici_id),
    cüzdan_bakiye int,
    cüzdan_satınAlmaGecmisi varchar,
    cüzdan_yuklemeYontemi varchar

);
insert into kullanici (kullanici_id,  kullanici_NickName,  kullanici_dogumtarihi, kullanici_mail ,  kullanıcı_sifre )

		values                7 (451, 'NoONe',2001,'celalbiniici@gmail.com','celal123456789'),
   				(452, 'Crose',1998,'kadiryayan@gmail.com','kadirfff7'),
   				(453, 'ksamysr',1995,'ksamysr@gmail.com','ksmyssrrsr'),
   				(454, 'mrtkrt',1990,'mrtkrt@gmail.com','1345687987'),
   				(455, 'luster',1980,'lluster_30@gmail.com','1234551980');




insert into  oyun (oyun_id, oyun_adı, oyun_firması, oyun_türü, oyun_fiyatı, oyun_puanı, oyun_indirmeSayısı, oyun_haberid)
	values                 (106, 'csgo', 'valve', 'FPS', 90, 20, 40, 800),
		              (101, 'valorant', 'riot', 'FPS', 70, 30, 30, 801),
			(102, 'lol', 'riot', 'MOBA', 30, 40, 60, 802),  
			(103, 'pubg', 'tencent', 'FPS', 40, 60, 70, 803), 
			(104, 'dota', 'valve', 'MOBA', 50, 90, 80, 804);
			

  
 insert into kampanya (kampanya_id, oyun_id, kampanya_adı, kampanya_yeniFiyat, kampanya_baslamaTarihi, kampanya_bitisTarihi, kampanya_indirimYüzdesi, kampanya_oyunTürü)  
 		values                 (200,106,'kıs indirimi', 45, '11.10.2021', '11.11.2021', 50, 'FPS'  ),
				(201,101,'kıs indirimi', 28, '11.10.2021', '11.11.2021', 60, 'FPS'  ),
				(202,102,'kıs indirimi', 21, '11.10.2021', '11.11.2021', 30, 'MOBA'  ),
				(203,103,'kıs indirimi', 20, '11.10.2021', '11.11.2021', 50, 'FPS'  ),
				(204,104,'kıs indirimi', 10, '11.10.2021', '11.11.2021', 90, 'MOBA'  );
				
  



insert into puan (puan_id, oyun_id, puan_ortalama, puan_üyeId, puan_yorum)
			values                 (300, 106, 20, 310, 'olumlu'),
					(301, 101, 30, 311, 'olumsuz'),
					(302, 102, 40, 312, 'olumlu'),
					(303, 103, 50, 313, 'olumsuz'),
					(304, 104, 60, 314, 'olumlu');


insert into envanter (envanter_id, oyun_id, envanter_esyaid, envanter_esyaAdı, envanter_esyaFiyati, envanter_esyaGorunus)
	
			values                 (500,106,550, 'dragon lore', 1000, 'factory new'),
				 	(501,101,551, 'howl', 2500, 'battle scarred'),
					(502,102,552, 'gungnir', 2000, 'field tested'),
					(503,103,553, 'bold', 3000, 'well worn'),
					(504,104,554, 'arcana', 500, 'field tested');





insert into sistemGereksinimleri (sistem_id, oyun_id, sistem_ram, sistem_islemci, sistem_isletimSistemi, sistem_ekranKartı, sistem_depolama, oyun_DirectX)
	
			values                 (600,106,16,'i7', 'windows', 'rtx2060', 20, 12),
					(601,101,16,'i7', 'windows', 'rtx2070', 40, 12),
					(602,102,16,'i7', 'windows', 'rtx2080', 60, 12),
					(603,103,16,'i7', 'windows', 'rtx3060', 70, 12),
					(604,104,16,'i7', 'windows', 'rtx3070', 10, 12);



 insert into firma (firma_id, oyun_id, firma_adi, firma_website, firma_telefon, firma_mail)
	
			values	              (700,106,'valve', 'valve.com', 4441444, 'valve@hotmail.com'),
					(701,101,'riot', 'riotgames.com', 4441666, 'riotgames@hotmail.com'),
					(702,102,'riot', 'riotgames.com', 4441666, 'riotgames@hotmail.com'),
					(703,103,'tencent', 'tencent.com', 4441555, 'tencent@hotmail.com'),
					(704,104,'valve', 'valve.com', 4441444, 'valve@hotmail.com');
	  

 
  insert into haber(haber_id, haber_baslık, haber_konu, haber_firmaid)
	  
	  		values                  (800,'new dlc', 'operasyon', 700),
					(801,'silah', 'yeni silah çeşidi', 701),
					(802,'kahraman', 'yeni kahraman eklendi', 702),
	  				(803,'paket','silah paketi',703),
					(804,'kostüm','kostüm paketi',704);
 

 
  insert into kütüphane(kütüphane_id ,kullanici_id, kütüphane_oyunAdı, kütüphane_oyunId, kütüphane_oyunGüncellik)
	  
	  values                (900,451,'csgo',106,'güncel'),
	  		 (901,452,'valorant',101,'güncel'),
	  		 (902,453,'lol',102,'güncel değil'),
	 		 (903,454,'pubg',103,'güncel'),
	 		 (904,455,'dota',104,'güncel değil');  
 
 

					
 
 insert into arkadasListesi (liste_id, kullanici_id, liste_arkadasKodum, liste_banListesi)
	
	  values 	              (1101,451,23546,'12 kişi'),
	  			(1102,452,25467,'24 kişi '),
				(1103,453,55435,'78 kişi'),
	  			(1104,454,54834,'618 kişi'),
				(1105,455,87696,'158 kişi');
 

 
 insert into cüzdan(cüzdan_id, kullanici_id, cüzdan_bakiye, cüzdan_satınAlmaGecmisi, cüzdan_yuklemeYontemi)
	  
	  		values                 (1000,451,250,'3 oyun satın aldı', 'steam wallet code'),
					(1001,452,450,'12 oyun satın aldı', 'kredi kanvanrtı'),
					(1002,453,100,'1 oyun satın aldı', 'mobil ödeme'),
					(1003,454,600,'21 oyun satın aldı', 'steam wallet code'),
					(1004,455,530,'13 oyun satın aldı', 'mobil ödeme');
