--TRIGGER
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