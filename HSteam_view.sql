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