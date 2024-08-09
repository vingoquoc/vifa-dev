- Thay đổi tệp hosts trên macOS:
    + sudo nano /private/etc/hosts
    + 127.0.0.1 testappmina.com

- cmd
    + docker-compose down 
    + docker-compose build
    + docker-compose up -d
- tree:
    my-app/
    ├─ docker-compose.yml
    ├─ app/
    ├─ data/
    ├─ config/
    │  ├─ caddy/
    │  │  ├─ Caddyfile
    │  ├─ php/
    │  │  ├─ Dockerfile

- laravel 

    + Run git clone 'link projer github'
    + Run composer install - npm install 
    + Run cp .env.example .env or copy .env.example .env
    + Run php artisan key:generate
    + Run php artisan migrate
    + Run php artisan db:seed
    + Run php artisan serve
- Mysql
    + mysql -u root -p
    + check user: SELECT User, Host FROM mysql.user;
    + CREATE USER 'viuser'@'localhost' IDENTIFIED BY 'Vivi@viravel2024';
    + GRANT ALL PRIVILEGES ON * . * TO 'viuser'@'localhost';
    + FLUSH PRIVILEGES;


    GRANT ALL ON laravel.* TO 'viuser'@'%' IDENTIFIED BY 'vivi';
    DB_CONNECTION=mysql
