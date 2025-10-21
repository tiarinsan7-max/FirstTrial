```markdown
# BRAND MANAGEMENT - Expo + TypeScript + Supabase

Singkat: aplikasi manajemen program (brands & programs) untuk publish. Expo + Supabase backend.

Fitur utama
- Kanban / Table toggle
- Dashboard total reward per brand
- CRUD programs
- Filter by brand, search by Type Program
- CSV import / export
- Auto-generate Program ID
- Progress bar (Target vs Achievement, Time gone)
- Kalkulasi reward otomatis
- Akses dibatasi maksimal 3 user (cek di Supabase)
- Cloud storage: Supabase (table `programs`, `brands`, `users_metadata`)

Tech
- Expo (React Native)
- TypeScript
- @supabase/supabase-js
- papaparse
- expo-document-picker, expo-file-system, expo-sharing
- React Navigation

Quick start
1. Clone:
   git clone <repo>
   cd <repo>

2. Install deps:
   npm install

3. Supabase setup:
   - Buat project di https://supabase.com
   - Buat table `programs` (see `supabase_schema.sql` in repo) and `brands` (or let app seed default brands).
   - Ambil SUPABASE_URL and SUPABASE_ANON_KEY
   - Copy file `src/config.example.ts` → `src/config.ts` dan isikan kunci Supabase.

4. Run:
   expo start --tunnel
   - Buka di Expo Go; apabila menggunakan device yang sama, gunakan tunnel URL manual.

5. Build / Publish
   - Ikuti EAS / Expo docs. Pastikan environment variables diset via secrets (EAS).

Notes penting
- Akses maksimal 3 user di-enforce client-side sebelum pendaftaran (recommended: tambahkan server-side policy di Supabase untuk produksi).
- File CSV: import expects header sesuai model (see Program fields in src/types.ts).
- Untuk produksi, jangan commit src/config.ts yang berisi kunci.

If you want a full EAS + GitHub Actions pipeline scaffold, tell me and I’ll add GitHub workflow and eas.json.

```

Penutup — catatan operasi & rekomendasi (jadi to the point)

Proses deploy: gunakan EAS + secrets untuk memasukkan SUPABASE_ANON_KEY dengan aman.
Pembatasan 3 user: implementasi production-grade harus dilakukan via Supabase RLS or server-side function. Dalam scaffold ini Anda perlu menambahkan middleware sign-up check: panggil supabase.from("users_metadata").select() sebelum allow sign up dan blok pendaftaran bila count >=3. Untuk keamanan, pindahkan check itu ke serverless function.
Testing & QA: tambahkan unit tests (Jest) dan e2e jika perlu.