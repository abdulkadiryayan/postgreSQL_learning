/* musteri tablosu murat yücedağın postgresql videolarından.
postgresql de dvdrental dan da sorgu yaptım customer actor film gibi.
oyun cüzdan vs de benim steam veritabanımdan sorgular.

*/

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
--kütüphane_oyunid'yi küçükten büyüğe yazdır. 3 satırı alta 4. satırdan	itibaren sadece 2 satır yazdır.
select kütüphane_oyunid from kütüphane order by kütüphane_oyunid offset 3 rows fetch next 2 rows only;

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
