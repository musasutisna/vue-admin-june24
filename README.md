<h1 align="center">Vue Admin June24</h1>

<p>
  Template untuk membangun aplikasi admin yang sudah dilengkapi dengan berbagai fitur dan dikembangkan menggunakan vue versi 3.
</p>

## Simple deployment in local
> Untuk mempermudah deployment di lokal komputer tanpa menggunakan docker compose silahkan jalankan shell script berikut

### install.sh
`untuk melakukan build dan juga create container`
### start.sh
`untuk melakukan start container yang telah dibuat`
### stop.sh
`untuk melakukan stop container yang sedang berjalan`
### uninstall.sh
`untuk melakukan remove image dan container yang telah di build/create sebelumnya`

## Vue Environment
Untuk melakukan pengaturan environment vue dapat dilakukan dengan memperbaharui pada file .env.example yang nantinya ketika dijalankan menggunakan docker maka file tersebut akan dicopy menjadi .env yang akan diakses ketika proses build, sedangkan untuk proses development dapat dilakukan copy secara manual.

| Name | Default value | Description |
|:--|:--|:--|
| VITE_VERSION | beta.1.0.0 | Versi dari aplikasi yang akan di deploy |
| VITE_BASEURL | http://localhost:5714 | Base url dimana frontend di deploy |

## Configuration Build
| Option | Value |
|:--|:--|
| tag | vue-admin-june24 |

## Configuration Create

| Option | Value |
|:--|:--|
| name | vue-admin-june24 |
| IMAGE | vue-admin-june24 |
