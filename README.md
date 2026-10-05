# Klinik ichki operatsion platformasi (MVP + integratsiyaga tayyor arxitektura)

Ushbu repository klinika ichki jarayonlari uchun tor doiradagi, lekin kelajakdagi katta tibbiy platformaga ulanishga tayyor bo'lgan yechimning boshlang'ich bazasini beradi.

## Qamrov (hozirgi bosqich)
- Dorilar va reagentlar kirim/chiqimi
- Palata/to'shak bo'yicha bemor hisoboti
- Hamshira tomonidan sarf kiritish va avtomatik ombor yechimi
- Muddati yaqin/kam qolgan mahsulotlar ogohlantirishlari
- Rollarga asoslangan boshqaruv va hisobotlar
- Bemor tarix qog'ozi uchun yig'iladigan ma'lumotlar

## Kelajakdagi integratsiya yo'nalishlari
- Face ID / Touch ID autentifikatsiya
- Medtexnika qurilmalaridan telemetriya importi
- Laboratoriya va tashqi billing tizimlari bilan API integratsiya
- Cloud document storage va arxiv

## Tuzilma
- `docs/roles-workflow.md` — rollar, vakolatlar, jarayonlar
- `docs/database-schema.sql` — PostgreSQL bazaviy sxema
- `docs/api-spec.yaml` — REST API spetsifikatsiyasi (OpenAPI 3.1)
- `docs/frontend-pages.md` — frontend sahifalar va UX oqimi
- `backend/app/main.py` — FastAPI starter backend
- `frontend/index.html` — UI wireframe/prototip (dark/light rejim, dashboard bloklari)

## Backendni ishga tushirish
```bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8000
```

## Frontend prototipni ochish
`frontend/index.html` faylini brauzerda oching.

## Muhim eslatma
Bu bosqichda loyiha "foundation" holatda: ma'lumotlar modeli, API konturi va UI oqimi tayyorlangan. Ishlab chiqarishga chiqarishdan oldin autentifikatsiya, audit log, testlar, migratsiya va xavfsizlik qatlamlari chuqurlashtiriladi.
