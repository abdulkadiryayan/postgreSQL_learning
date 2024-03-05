/* musteri tablosu murat yücedağın postgresql videolarından.
postgresql de dvdrental dan da sorgu yaptım customer actor film gibi.
oyun cüzdan vs de benim steam veritabanımdan sorgular.

*/
-- ahmet arifin pdf lerdeki ornek verileri
create table ogrenci(
		ogrenci_no int primary key not null,
		isim varchar not null,
		kullanici_adi varchar not null,
		yas int not null,
		ortalama numeric not null
);

insert into ogrenci(ogrenci_no, isim, kullanici_adi, yas, ortalama)
values  (17532, 'Eymen', 'Eymen234', 19, 3.2),
		(16458, 'Hayri', 'Hayri95', 19, 3.8),
		(17327, 'Mustafa', 'm.4417', 18, 5),
		(17111, 'Mehmet', 'Mhmt4456', 20, 4),
		(17123, 'Arif', 'Arf2332', 24, 3.2),
		(17236, 'Cemil', 'Cm3418', 18, 3.9),
		(17355,'Leyla','lyl34',25,4),
		(17346,'Zeynep','zynp32',22,4.3);
		
create table dersler(
		ogrenci_no int references ogrenci(ogrenci_no),
		ders_kodu varchar not null,
		ders_kredi int not null,
		ders_notu numeric not null
);

insert into dersler(ogrenci_no, ders_kodu, ders_kredi, ders_notu)
values  (17532, 'BL44', 4, 85),
		(17327, 'MK25', 3, 73),
		(17532, 'BL13', 3, 94),
		(17236, 'T121', 2, 45),
		(17123, 'KM32', 1, 52 ),
		(16458, 'BL13', 3, 53 ),
		(17123, 'BL44', 4, 75),
		(16458, 'TR4', 2, 65 );
		
--Veritabanı oluşturma
CREATE DATABASE veritabaniAdi;

--veri tabani silme 
DROP DATABASE veritabaniAdi;


--tablo olusturma
CREATE TABLE oyun(
	oyun_id int not null primary key,
	oyun_adi varchar(30) not null,
	oyun_eklenmeTarihi(30) not null,
	sistem_id int references sistem(sistem_id),
	oyun_sistemGereksinimler varchar(100) not null
);

--tabloya tekli veri ekleme
insert into oyun(oyun_id, oyun_adi, oyun_eklenmeTarihi, oyun_sistemGereksinimleri)
values(111,'csgo','10.09.1999','i7 10. nesil rtx2060 16gb ram')

--tabloya veri ekleme(çoklu)
insert into oyun(oyun_id, oyun_adi, oyun_eklenmeTarihi, oyun_sistemGereksinimleri)
values(111,'csgo','10.09.1999','i7 10. nesil rtx2060 16gb ram'),
(112,'csgo1','10.09.1999','i7 10. nesil rtx2060 16gb ram'),
(113,'csgo2','10.09.1999','i7 10. nesil rtx2060 16gb ram');

--tablonun tamamını yazdırma
select * from oyun     -- *(yıldız) ingilizcede all anlamına gelir.


--tablonun istenilen sütunlarını yazdırma
select oyun_id, oyun_adi from oyun


--where kullanımı(dvdrental veritabanına göre yazdım)
--customer tablosundaki store_id'si 1 olan ve firstname'si Mary olanı yazdırır.
-- sonra ise last_name'si de Ely olanları yazdır.
select * from customer 
where store_id = 1 and first_name = 'Mary' or last_name = 'Ely'

--where kullanımı(ogrenci tablosundan)
select * from ogrenci
where (yas > 18 and yas < 24) and not (ortalama < 3.5)


-- order by kullanımı (ASC artan) (DESC Azalan)
-- film tablosundaki rental_rate i küçükten büyüğe sıraladı.
-- karakteri a dan z ye sayıları 0 dan 9 a sıralar.
select * from film
order by rental_rate ASC;


-- distinct (bir den fazla aynı nitelik olan tablodaki nitelikleri birer tane yazdırır.)
-- film tablosundaki rental_rate sütunundaki aynı değere sahip nitelikleri birer tane yazdır.
-- rental_rate sütunun küçükten büyüğe sıraladı.
select distinct rental_rate from film
order by rental_rate ASC;


-- tablo silme (DROP)
DROP TABLE film --film tablosu silindi.

-- delete komutu ile tablodan veri silme.
-- DELETE from TABLO_ADI
-- where silinecek_ozellik = silinecek rakam yada karakter.
DELETE FROM film
where film.replacement_cost = 15.99


-- ortalama alma avg(average)
-- rental_rate'in ortalamasını aldı.
select avg(rental_rate) from film

-- SUM kullanımı (sum: tablodaki tüm verileri toplar)
-- musteri tablosunun bakiye niteliğindeki tüm verileri toplar.
select sum(bakiye from musteri)
-- 2.örnek
select sum(bakiye from musteri) where sehir = 'ankara'

-- LİMİT KULLANIMI
-- kütüphane_oyunid'nin ilk 3 satırını küçükten büyüğe sıralar.
select kütüphane_oyunid from kütüphane order by kütüphane_oyunid limit 3;

-- OFFSET KULLANIMI
--kütüphane_oyunid'yi küçükten büyüğe yazdır. 3 satırı atla 4. satırdan	itibaren sadece 2 satır yazdır.
select kütüphane_oyunid from kütüphane order by kütüphane_oyunid offset 3 rows fetch next 2 rows only;

-- dersler tablosunun ilk 2 satırı yazdırmaz 3. satırdan itibaren 3 satır yazdırır.
select * from dersler
LIMIT 3 OFFSET 2;

-- LİKE kullanımı
-- içinde büyük 'Z' olan verilerin hepsini yazdırır.
select title from film
where title like '%Z%'

-- '%en%' içinde en olan kelimeleri yazdırır.
-- 'Z%' ismi büyük Z ile başlayanları yazdırır.
-- 'Zo%' ismi Zo ile başlayanları yazdırır.
-- '%z' sonu z ile bitenleri yazdırır.
-- valorant için alt tre ile '_' =   '___or___'   
-- csgo için '_sg_'  : 2. ve 3. harfi sg olanı ve toplamda da 4 harfli olan karakterleri yazdırır.

-- not like kullanımı
-- içinde büyük 'Z' olan veriler hariç diğer tüm verileri yazdırır.
select title from film
where title not like '%Z%'

-- IN KULLANIMI
- kütüphane_oyungüncellik sütunundaki içinde güncel olanları yazdır.
select * from kütüphane where kütüphane_oyungüncellik in ('güncel');


-- BETWEEN kullanımı
-- oyunid'si 105 den büyük 110 küçük olanları yazdırır.(105 ve 110 dahil)
select * from kütüphane where kütüphane_oyunid between 105 and 110;


-- UPDATE kullanımı
-- sistemgereksinimleri'ne git sistem_ram'i 32 yap (kimin ramini 32 yapıcam?)
-- where ile belirtmezsem herkesin kini 32 yapar. Ama bu şekilde oyun_id'si 101
-- olanı değiştir dersek sadece istenilen değeri değiştirir.
update sistemgereksinimleri set sistem_ram = 32 where oyun_id = 101

-- musteri tablosundaki musteri adı hasan olanın bakyesini 5200 yaptı.
update musteri set bakiye = 5200 where musteri_ad = 'hasan'


-- COUNT kullanımı  --(count : saymak,kaçtane gibi)
-- sistemgereksinimleri tablosundaki ram'i 16 dan fazla olan
-- kaç tane nitelik varsa onu yazdır.
select count(*) from sistemgereksinimleri
where sistem_ram > 16

select count(*) from sistemgereksinimleri
where sistem_isletimsistemi = 'windows' and sistem_ram > 16
 

-- MAX ve MİN kullanımı
-- istenilen tablodaki min ve max değeri bulma yarar.
-- aşağıdaki max ve min değerdeki değerleri yazdırır.
select min(cüzdan_bakiye), max(cüzdan_bakiye) from cüzdan

-- birde böyle gösterimi var.
select * from oyun
where oyun_fiyatı = (select max (oyun_fiyatı) from oyun)

-- ortalaması en düşük olan öğrencinin ortalamasını 1 arttırır.
UPDATE ogrenci SET ortalama = ortalama + 1 
WHERE ortalama = (select min(ortalama) from ogrenci );

-- max değer eksi min değeri yazdırır.
select max(cüzdan_bakiye) - min(cüzdan_bakiye) from cüzdan

-- cüzdan bakiyesi max olana git ve cüzdan_yuklemeyontemi mobil ödeme olanın max bakiyesi olanı yazdır.
select max(cüzdan_bakiye) from cüzdan where cüzdan_yuklemeyontemi = 'mobil ödeme'

-- GRUPLANDIRMA (GROUP BY)
-- ram boyutlarına göre kaçar tane olduklarını yazdırır.
select sistem_ram, count(*) as ram from sistemgereksinimleri group by sistem_ram 

-- sistem_rami getir sistemgereksinimleri'ndeki aynı değere sahip olanları tek olarak göster.
select sistem_ram from sistemgereksinimleri GROUP BY sistem_ram

-- her bir sistem_ram'den kaçar tane olduğunu count olarak yazdırır.
select sistem_ram, count(*) from sistemgereksinimleri group by sistem_ram

-- as kullanarak kaçar tane olduğunu gösteren tablonun ismini değiştirebiliriz.
select sistem_ram, count(*) as sayiları from sistemgereksinimleri group by sistem_ram

-- verdiğimiz sayilar isimli tabloyuda order by ile sıraladım.
select sistem_ram, count(*) as sayilar from sistemgereksinimleri group by sistem_ram order by sayilar asc

-- Sistemgereksinimleri tablosundaki sistem_ram'lerden her ram gb çeşidini birer tane yazdırıp sutün haline getirir. 
-- Sonrasında ise yanına depoToplam diye bir sutün daha açıp orayada her ram gb çeşitinden kaçar tane sistem_depolama boyutu varsa 
-- onları da toplayıp ram grubu ile eşleştirir. 
select sistem_ram, sum(sistem_depolama) as depoToplam from sistemgereksinimleri group by sistem_ram order by sistem_ram

-- Sistemgereksinimleri tablosundaki sistem_ram'lerden her ram gb çeşidini birer tane yazdırıp sutün haline getirir. 
-- Sonrasında ise yanına depoToplam diye bir sutün daha açıp orayada her ram gb çeşitinden kaçar tane sistem_depolama boyutu varsa 
-- onları toplayıp ortalamasını ram grubu ile eşleştirir. 
select sistem_ram, avg(sistem_depolama) as depoOrtalama from sistemgereksinimleri group by sistem_ram order by depoOrtalama desc

-- HAVİNG kullanımı 
-- WHERE komutu gruplama fonksiyonları ile kullanılmadığından aynı görevi yapan having komutu GROUP BY ile kullanılır.
select sistem_ram, count(*) from sistemgereksinimleri group by sistem_ram having sistem_ram > 16 and sistem_ram < 32 --between sistem_ram 16 and 32


-- ogrenci ve dersler tablosundaki ogrencino'ları eşleşenleri yazdırır.
select * from dersler, ogrenci
where ogrenci.ogrencino = dersler.ogrencino


--  GENEL SORGU
-- mustafanın aldığı derslerden kredisi 4 ten küçük olanlar.
-- d ve o kısaltmalı sorgu
select * from dersler d 
where d.ogrencino = 
(select ogrencino from ogrenci o
where o.isim = 'Mustafa')
and d.derskredi<4;

-- kısaltmasız sorgu
select * from dersler
where ogrencino = (select ogrencino from ogrenci where isim = 'Mustafa') 
and derskredi < 4;


	--------------------------------
	gecici


-- ornek sorgular
/*select * from film 
where rental_rate > 4.5 and not rental_duration = 3
order by rental_rate desc,rental_duration
limit 1;*/
/*
SELECT yas, COUNT(*) as ogrenci_sayisi
FROM ogrenci
WHERE yas > (SELECT MIN(yas) FROM ogrenci)
GROUP BY yas
ORDER BY yas ASC;

select ders_kredi, count(ders_kredi) as krediler from dersler
group by ders_kredi
order by  ders_kredi desc 
limit 1 offset 0;

select ogrenci_no, count(ogrenci_no) as kacnotuvar, round(avg(ders_notu),2) from dersler
group  by ogrenci_no;

-- CROSS JOIN  iki veya daha fazla tablonun bir şart belirtilmeden kartezyen çarpımını gerçekleştirir.
select  from ogrenci cross join dersler

-- inner join iki tablonun belirlenen şartı sağlayan bütün satırları yazdırır.
select * from ogrenci o inner join dersler d
on o.ogrenci_no = d.ogrenci_no;

-- ogrenci ve dersler tablosundaki ogrenci no lar eşleşenlerin ogrenci no isim k.adi yas ve ders notunu yazdrır.
select o.ogrenci_no, o.isim, o.kullanici_adi, o.yas, d.ders_notu  from dersler d inner join ogrenci o 
on d.ogrenci_no = o.ogrenci_no;

-- left (outer)join soldaki tablo aynen yazılır. Sağdaki tablo ise sadece belirtilen şartlara uyanlar yazdırılır. Uymayanlar ise null yazdırır.
select * from ogrenci o left join dersler d on o.ogrenci_no = d.ogrenci_no;

--right outer join sağdaki tablo aynen yazılır. Soldaki ise belirtilen şarta uymayanlara null değer atanır.
select * from dersler d right outer join ogrenci o on o.ogrenci_no = d.ogrenci_no;

-- sağdaki ve soldaki tablodan birer tane yazdırır.Belirtilen şarta uymayan değerler yerine null yazdırılır.
select * from dersler d full join ogrenci o on o.ogrenci_no = d.ogrenci_no;
select * from ogrenci o full outer join dersler d on d.ogrenci_no = o.ogrenci_no;
*/





/*
select * from ogrenci
select * from dersler
select * from dersler, ogrenci
*/



select yas , count(yas) as yasss from ogrenci
group by yas
having yas > 18
order by yas; 

select yas , count(yas) as yasss from ogrenci
where yas > 18
group by yas
having yas = 20
order by yas; 




/*
--dvd rental veri tabanındaki verilere göre. En çok filmde oynayan 3 aktörün tüm bilgilerini aktör adına göre azalan bir şekilde yaz
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.film_id) as film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name
ORDER BY film_count DESC, actor.first_name DESC
LIMIT 3; 

select * from actor

--dvd rental veri tabanında bulunan filmleri kategoriye göre gruplayan ve film sayısı en fazla olan 3 kategoriyi film sayısına göre azalan bir biçimde sıralayan kodu yaz
SELECT category.name, COUNT(film_category.film_id) as film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY film_count DESC
LIMIT 3; */




--örnek fonksiyon ve cascade

CREATE OR REPLACE FUNCTION indirim_yap()
RETURNS VOID AS
$$
BEGIN
select indirim_yap();
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.10) WHERE oyun_firması = 'valve';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.15) WHERE oyun_firması = 'tencent games';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.05) WHERE oyun_firması = 'ubisoft';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.20) WHERE oyun_firması = '8floor';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.25) WHERE oyun_firması = 'electronic arts';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.15) WHERE oyun_firması = 'rockstar games';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.30) WHERE oyun_firması = 'facepunsh studios';
    UPDATE oyun SET indirimli_fiyat = oyun_fiyatı - (oyun_fiyatı * 0.10) WHERE oyun_firması = 'activision';
END;
$$
LANGUAGE plpgsql;



ALTER TABLE oyun ADD COLUMN indirimli_fiyat FLOAT;


SELECT oyun_adi, oyun_fiyatı,oyun_firması, indirimli_fiyat from oyun


--CASCADE

create table satis(
	satis_id int not null primary key,
	envanter_id int references envanter(envanter_id) on delete cascade,
	urun_adi varchar(50) not null,
	satin_alma_tarihi varchar(50) not null,
	satma_tarihi varchar(50) 
);
delete from envanter where envanter_id = 41;
delete from envanter where envanter_id = 44;
delete from envanter where envanter_id = 45;
delete from envanter where envanter_id = 48;

select * from satis
select * from envanter




---------

-- ornek trigger
CREATE OR REPLACE FUNCTION yeni_kullanici_ekleme()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO cuzdan (kullanici_id, bakiye_bilgisi, kart_bilgisi, alım_satim_gecmisi, para_yukleme)
    VALUES (NEW.kullanici_id, 100, 0, 'Yeni kullanıcı eklendi', 100);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER yeni_kullanici_trigger
AFTER INSERT ON kullanici
FOR EACH ROW
EXECUTE FUNCTION yeni_kullanici_ekleme();


--Tetiklemek için örnek veri ekleme

insert into kullanici(kullanici_id, kullanici_ismi, kullanici_sifresi, mail_adresi, kullanici_tc)
values (201, 'yeni_kullanici201', 'sifre1234', 'yeni_kullanici201@gmail.com', 1234);


-----

-- ornek view ve ornekler
-- view

CREATE VIEW kullanici_harcama_detay_view AS 
SELECT k.kullanici_id, k.kullanici_ismi, e.urun_adi, s.satin_alma_tarihi, s.satma_tarihi, e.urun_fiyati
FROM kullanici k
JOIN satis s ON k.kullanici_id = s.kullanici_id
JOIN envanter e ON s.urun_adi = e.urun_adi;



-- view için üç tane örnek



--Toplam Harcamaları Görüntüleme:

SELECT kullanici_id, kullanici_ismi, SUM(urun_fiyati) AS toplam_harcama
FROM kullanici_harcama_detay_view
GROUP BY kullanici_id, kullanici_ismi;


--En Pahalı Ürünü Satın Alan Kullanıcıyı Bulma:

SELECT kullanici_id, kullanici_ismi, urun_adi, urun_fiyati
FROM kullanici_harcama_detay_view
ORDER BY urun_fiyati DESC
LIMIT 1;


--Belirli Bir Ürünün Toplam Satış Fiyatını Görüntüleme:

SELECT urun_adi, SUM(urun_fiyati) AS toplam_satis_fiyati
FROM kullanici_harcama_detay_view
WHERE urun_adi = 'Silah'
GROUP BY urun_adi;




	
