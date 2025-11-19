<?php
/* Servers configuration */
$i = 0;

/* Server: MariaDB */
$i++;
$cfg['Servers'][$i]['host'] = 'mariadb'; // ใช้ service name ในเครือข่าย Docker
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'YOUR-PASSWORD';
$cfg['Servers'][$i]['auth_type'] = 'cookie'; // ใช้การล็อกอินแบบ Cookie
$cfg['Servers'][$i]['hide_db'] = '^(information_schema|performance_schema|mysql)$';

$cfg['PmaAbsoluteUri'] = '/phpmyadmin/';
/* End of servers configuration */
$cfg['Servers'][$i]['hide_db'] = '^(information_schema)$';
$cfg['Servers'][$i]['hide_db'] = '^(performance_schema|mysql)$';