1.把这个网站放在php的根目录即可。
2.安装数据库：导入  tiankong_mfk.sql 即可。
3.添加定时任务。
在ubuntu下，使用  crontab -e (可以使用select-editor可以选择默认编辑器),添加下面三句即可。
* * * * * curl http://domain.com:port/messagefk/inc/autoSendMsg.php 
* * * * * curl http://domain.com:port/messagefk/inc/autoEvaluation.php
* * * * * curl http://domain.com:port/messagefk/inc/autoWarn.php

使用 sudo service cron restart 重启定时服务。

(site:tiankonguse.com 定时)


* * * * * curl http://localhost/mysite/messagefk/inc/autoSendMsg.php 
* * * * * curl http://localhost/mysite/messagefk/inc/autoEvaluation.php
* * * * * curl http://localhost/mysite/messagefk/inc/autoWarn.php



