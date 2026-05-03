# Rollar, bo'ysunuv va ish oqimi

## 1) Rollar
- BOSHLIQ
- MENEJER
- BOSH_SHIFOKOR
- SHIFOKOR
- BOSH_HAMSHIRA
- HAMSHIRA
- XOJALIK_BEKASI
- KICHIK_HAMSHIRA
- APTEKACHI
- SANITARKA

## 2) Vertikal bo'ysunuv
- Bosh hamshira -> Bosh shifokorga hisobot beradi.
- Hamshira va Xojalik bekasi -> Bosh hamshiraga hisobot beradi.
- Kichik hamshira -> Xojalik bekasiga hisobot beradi.

## 3) Asosiy jarayonlar

### 3.1 Bemorni joylashtirish
1. Menejer/Bosh hamshira palata va to'shak raqamini biriktiradi.
2. Kelgan sana va ketgan sana intervali belgilanadi.
3. Bemorga klinik ID biriktiriladi.

### 3.2 Sarf kiritish (hamshira tomonidan)
1. Hamshira bemor ID yoki FISH bo'yicha kartani ochadi.
2. Sarflangan dori/ampula/bint/spirt va boshqa vositalarni kiritadi.
3. Tasdiqlash tugmasini bosadi.
4. Tizim avtomatik:
   - Ombordan qoldiqni kamaytiradi.
   - Sarfni patient encounterga bog'laydi.
   - Sanitarka uchun chiqindi yig'ish notifikatsiyasini yaratadi.

### 3.3 Ombor va dorixona
1. Aptekachi kirim partiyalarini narx va yaroqlilik bilan kiritadi.
2. Narx tafovuti bo'lsa menejer tasdiqlaydi.
3. Narx o'zgarish tarixi alohida jurnalda saqlanadi.

### 3.4 Ogohlantirishlar
- Kam qoldiq (min threshold)
- 30 kun ichida muddati tugaydigan mahsulotlar
- Bildirishnoma oluvchilar: Aptekachi, Menejer, Bosh hamshira, Hamshira

### 3.5 Hisobotlar
- Kunlik/oylik/yillik sarf va summa
- Bo'lim/palata/tashxis kesimida diagrammalar
- PDF/Word eksport

### 3.6 Bemor tarix qog'ozi
- Anketa, analiz, muolaja, qaysi xodim qaragani, pullik/bepul xizmatlar
- Klinika logotipli shablon asosida bosmaga tayyor chiqish

## 4) Ruxsatlar (qisqa RBAC)
- BOSHLIQ: barcha hisobotlarni ko'rish
- MENEJER: ombor, narx, hisobot, tasdiqlar
- BOSH_SHIFOKOR: klinik va statistik ko'rinish
- SHIFOKOR: bemor klinik ma'lumotlari
- BOSH_HAMSHIRA: hamshiralik sarfi nazorati
- HAMSHIRA: sarf kiritish, bemor parvarish yozuvlari
- XOJALIK_BEKASI: xo'jalik vositalari, kichik hamshira nazorati
- KICHIK_HAMSHIRA: birlamchi xizmat qaydlari
- APTEKACHI: kirim, partiya, yaroqlilik
- SANITARKA: chiqindi/utilizatsiya tasklari
