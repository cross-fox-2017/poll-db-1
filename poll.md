<!-- Release 1  -->

<!-- 1. Hitung jumlah vote untuk Sen. Olympia Snowe yang memiliki id 524. -->
1. SELECT COUNT(politician_id) FROM votes WHERE politician_id = 524;

<!-- 2. Sekarang lakukan JOIN tanpa menggunakan id `524`. Query kedua tabel votes dan congress_members. -->
2. SELECT congress_members.* , votes.* FROM congress_members,votes WHERE votes.politician_id = congress_members.id AND congress_members.name = 'Sen. Olympia Snowe' ;
<!-- 3. Sekarang gimana dengan representative Erik Paulsen? Berapa banyak vote yang dia dapatkan? -->
3. SELECT COUNT(politician_id) FROM votes WHERE politician_id = (SELECT id FROM congress_members WHERE name='Rep. Erik Paulsen')

<!-- 4. Buatlah daftar peserta Congress yang mendapatkan vote terbanyak. Jangan sertakan field `created_at` dan `updated_at`. -->
4. SELECT congress_members.id , congress_members.name,congress_members.party ,congress_members.location ,congress_members.grade_1996,congress_members.grade_current,congress_members.years_in_congress,congress_members.dw1_score  ,COUNT(votes.id) FROM votes JOIN congress_members ON congress_members.id = votes.politician_id GROUP BY congress_members.id ORDER BY COUNT(votes.id) desc LIMIT 3;
<!-- 5. Sekarang buatlah sebuah daftar semua anggota Congress yang setidaknya mendapatkan beberapa vote dalam urutan dari yang paling sedikit. Dan juga jangan sertakan field-field yang memiliki tipe date. -->
5. SELECT congress_members.id , congress_members.name,congress_members.party ,congress_members.location ,congress_members.grade_1996,congress_members.grade_current,congress_members.years_in_congress,congress_members.dw1_score  ,COUNT(votes.id) FROM votes JOIN congress_members ON congress_members.id = votes.politician_id GROUP BY congress_members.id ORDER BY COUNT(votes.id) asc LIMIT 3;
<!-- Release 2  -->

<!-- 1. Siapa anggota Congress yang mendapatkan vote terbanyak? List nama mereka dan jumlah vote-nya. Siapa saja yang memilih politisi tersebut? List nama mereka, dan jenis kelamin mereka. -->

<!-- 2. Berapa banyak vote yang diterima anggota Congress yang memiliki grade di bawah 9 (gunakan field `grade_current`)? Ambil nama, lokasi, grade_current dan jumlah vote. -->
SELECT congress_members.id , congress_members.name,congress_members.location ,congress_members.grade_current ,COUNT(votes.id) FROM votes JOIN congress_members ON congress_members.id = votes.politician_id WHERE congress_members.grade_current < 9 GROUP BY congress_members.id
<!-- 3. Apa saja 10 negara bagian yang memiliki voters terbanyak? List semua orang yang melakukan vote di negara bagian yang paling populer. (Akan menjadi daftar yang panjang, kamu bisa gunakan hasil dari query pertama untuk menyederhanakan query berikut ini.) -->

<!-- 4. List orang-orang yang vote lebih dari dua kali. Harusnya mereka hanya bisa vote untuk posisi Senator dan satu lagi untuk wakil. Wow, kita dapat si tukang curang! Segera laporkan ke KPK!! -->

<!-- 5. Apakah ada orang yang melakukan vote kepada politisi yang sama dua kali? Siapa namanya dan siapa nama politisinya? -->
