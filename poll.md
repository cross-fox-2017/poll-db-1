<!-- Release 1  -->

<!-- 1. Hitung jumlah vote untuk Sen. Olympia Snowe yang memiliki id 524. -->

select count(id) from votes where politician_id = 524

<!-- 2. Sekarang lakukan JOIN kedua tabel votes dan congress_members untuk politician yang memiliki nama 'Sen. Olympia Snowe' tanpa menggunakan id `524`. -->

select * from congress_members
left join votes on congress_members.id = votes.politician_id
where congress_members.name = "Sen. Olympia Snowe"

<!-- 3. Sekarang gimana dengan representative Erik Paulsen? Berapa banyak vote yang dia dapatkan? -->

select count(votes.id) from votes,
(select congress_members.id as id_Erik from congress_members where congress_members.name = "Rep. Erik Paulsen")
where votes.politician_id = id_Erik

<!-- 4. Buatlah 3 daftar peserta Congress yang mendapatkan vote terbanyak. Jangan sertakan field `created_at` dan `updated_at`. -->

select congress_members.id, congress_members.name, congress_members.party, congress_members.location, congress_members.grade_1996, congress_members.grade_current, congress_members.years_in_congress, congress_members.dw1_score, sub.vote from congress_members,
(select count(id) as vote, politician_id from votes group by politician_id) as sub
where congress_members.id = sub.politician_id order by vote desc limit 3

<!-- 5. Sekarang buatlah 3 daftar semua anggota Congress yang  mendapatkan beberapa vote dalam urutan dari yang paling sedikit. Dan juga jangan sertakan field-field yang memiliki tipe date. -->

select congress_members.id, congress_members.name, congress_members.party, congress_members.location, congress_members.grade_1996, congress_members.grade_current, congress_members.years_in_congress, congress_members.dw1_score, sub.vote from congress_members,
(select count(id) as vote, politician_id from votes group by politician_id) as sub
where congress_members.id = sub.politician_id order by vote asc limit 3 
