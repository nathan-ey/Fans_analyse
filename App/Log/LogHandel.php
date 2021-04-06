<?php

namespace App\Log;

use EasySwoole\Log\LoggerInterface;
use EasySwoole\ORM\DbManager;
use EasySwoole\ORM\Exception\Exception;
use EasySwoole\Pool\Exception\PoolEmpty;

class LogHandel implements LoggerInterface
{

    private $logDir;

    function __construct(string $logDir = null)
    {
        if (empty($logDir)) {
            $logDir = getcwd();
        }
        $this->logDir = EASYSWOOLE_ROOT . "/Log/";

    }

    function log(?string $msg, int $logLevel = self::LOG_LEVEL_INFO, string $category = 'debug'): string
    {
        $date = date('Y-m-d H:i:s');
        $category = date('Y-m-d');
        $levelStr = $this->levelMap($logLevel);
        $filePath = $this->logDir . "/log_{$category}.log";
        $str = "自定义日志:[{$date}][{$category}][{$levelStr}] : [{$msg}]\n";
        file_put_contents($filePath, "{$str}", FILE_APPEND | LOCK_EX);
        return $str;
    }

    function console(?string $msg, int $logLevel = self::LOG_LEVEL_INFO, string $category = 'console')
    {
        $date = date('Y-m-d H:i:s');
        $levelStr = $this->levelMap($logLevel);
        $temp = "自定义日志:[{$date}][{$category}][{$levelStr}]:[{$msg}]\n";
        fwrite(STDOUT, $temp);
    }

    private function levelMap(int $level)
    {
        switch ($level) {
            case self::LOG_LEVEL_INFO:
                return 'info';
            case self::LOG_LEVEL_NOTICE:
                return 'notice';
            case self::LOG_LEVEL_WARNING:
                return 'warning';
            case self::LOG_LEVEL_ERROR:
                return 'error';
            default:
                return 'unknown';
        }
    }
}