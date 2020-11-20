# DicodingIosExpert

this app is  submission to Dicoding IOS Expert and the architechture using MVVM with Clean Architecture. There are 3 main layers, Presentation, Domain, and Data layers.


- Presentation. Contains the Views and ViewModels. The Presentation layer depends only on the Domain layer.

- Domain. Contains the Models (entities) and UseCases. The UseCase depends on what we need and might not include all repositories. 

- Data. Contains the Repositories. The Repository is what we need to communicate with ReST API or local persistent data (Realm). And The Data layer depends only on the Domain Layer. I was modified the example to match my coding style.


video documentation 
[![Watch the video](https://github.com/helloail/DicodingIosExpert/blob/main/ScreenShoot/dicodingexpert.mp4)

## Harap diperhatikan!

Bagi teman-teman yang masih mengikuti kelas dari dicoding. Silahkan gunakan source ini sebagai bahan referensi, tapi TIDAK untuk disalin secara utuh tanpa tau cara implementasinya.

Ayolah kawan.. Kalian sudah bayar mahal untuk ikut kelas ini, kalian harus dapat ilmunya. Percuma kalian dapat sertifikat dari dicoding kalau di kemudian hari kalian tidak mendapatkan ilmunya dari sini.

Semangat kawan.. Perjalanan masih panjang. Lakukan yang terbaik yang kalian bisa. Silahkan tanya saya jika ada yang kurang dimengerti. Kalau saya bisa bantu, pasti saya dampingi.

Mari kita maju bersama-sama..
