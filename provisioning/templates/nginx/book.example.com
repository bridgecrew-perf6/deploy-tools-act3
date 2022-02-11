server {
         listen 80;
         root /var/www/book.example.com;
         index index.php index.html index.htm index.nginx-debian.html;
         server_name book.example.com;

         location / {
                 try_files $uri $uri/ =404;
         }

         location ~ \.php$ {
                 include snippets/fastcgi-php.conf;
                 fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
         }

         location ~ /\.ht {
                 deny all;
         }
}