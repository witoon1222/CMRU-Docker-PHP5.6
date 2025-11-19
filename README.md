Docker นี้ประกอบไปด้วย  


-Apache2  
-PHP5.6  
-MariaDB  
-phpMyAdmin  

Build Docker  


ใช้คำสั่ง docker compose up -d --build  

แก้ไขรหัสผ่านของ SSH   


ค้นหาบรรทัดนี้  
RUN useradd -m -u 0 -o -s /bin/bash john \ <----- เปลี่ยนจาก john เป็น User ที่ต้องการ && mkdir -p /var/www/.ssh  
&& chown -R john:john /var/www/.ssh <----- เปลี่ยนจาก john:john เป็น User ที่ต้องการ  
RUN echo 'john:test1234' | chpasswd <----- เปลี่ยนจาก john เป็น User ที่ต้องการ : รหัสผ่านที่ต้องการ  

การเปลี่ยนชื่อ Container  


แก้ไขไฟล์ docker-compose.yml  
เปลี่ยนเป็นชื่อที่ต้องการ container_name: xxxx  

Apache Service  


ports:  
"5000:80" <----- เปลี่ยน 81:80 ตัวอย่างหากต้องการให้รัน Port 81 ให้เปลี่ยนเลขข้างหน้าเป็น 81  

การเปลี่ยนพอร์ท Database  


MariaDB Service  
ports:  
"3306:3306" <----- เปลี่ยน 3307:3306 หากต้องการให้รัน Port 3307 ให้เปลี่ยนเลขข้างหน้าเป็น 3307  


การเปลี่ยนพอร์ท phpMyAdmin  

การเปลี่ยน Port ของ phpMyAdmin  
phpMyAdmin  
ports:  
"8080:80" <----- เปลี่ยน 8801:80 หากต้องการให้รัน Port 8801 ให้เปลี่ยนเลขข้างหน้าเป็น 8801  

การเปลี่ยนพอร์ท SFTP/SSH  
SFTP/SSH Service  
ports:  
"2222:2222" <----- เปลี่ยน 2223:2222 หากต้องการให้รัน Port 2223 ให้เปลี่ยนเลขข้างหน้าเป็น 2223  
