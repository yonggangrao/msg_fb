<?php
/*
*     author: rainbird <chinakapalink@gmail.com>
*         date:2010-02-26
*     system:ubuntu9.10
*    php cli:5.2.10
*gsm modem:WAVECOM MODEM
*/
include "php_serial.class.php";

//����php�������ڵ���
$serial = new phpSerial;

//����USB gas modem
$serial->deviceSet("/dev/ttyUSB0");
$serial->deviceOpen();

//Ҫ���͵��ֻ���:1531170xxxx
$phone_sendto = InvertNumbers('861531170xxxx');
//Ҫ���͵Ķ���:I am rainbird,i love �й�
$message = hex2str('I am rainbird,i love �й�');
$mess = "11000D91".$phone_sendto."000800".sprintf("%02X",strlen($message)/2).$message;
$serial->sendMessage("at+cmgf=0".chr(13));
$serial->sendMessage("at+cmgs=".sprintf("%d",strlen($mess)/2).chr(13));
//���Ӷ������ĺ���
$serial->sendMessage('00'.$mess.chr(26));
//�Ӷ������ĺ���
//$phone_center = InvertNumbers('8613800100500');
//$mess_ll = "0891".$phone_center.$mess;
//$serial->sendMessage($mess_ll.chr(26));

//�����˾͹ص�,��ʼ���պ�ϰ��
$serial->deviceClose();

//��utf8�Ķ���ת��ucs2��ʽ
function hex2str($str) {
        $hexstring=iconv("UTF-8", "UCS-2", $str);
        $str = '';
        for($i=0; $i<strlen($hexstring)/2; $i++){
                $str .= sprintf("%02X",ord(substr($hexstring,$i*2+1,1)));
                $str .= sprintf("%02X",ord(substr($hexstring,$i*2,1)));
        }
        return $str;
}
//�ֻ��ŷ�ת,pdu��ʽҪ��
function InvertNumbers($msisdn) {
        $len = strlen($msisdn);
        if ( 0 != fmod($len, 2) ) {
                $msisdn .= "F";
                $len = $len + 1;
        }

        for ($i=0; $i<$len; $i+=2) {
                $t = $msisdn[$i];
                $msisdn[$i] = $msisdn[$i+1];
                $msisdn[$i+1] = $t;
        }
        return $msisdn;
}
?>