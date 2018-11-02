<?php
define('ROOT',__DIR__);

$system_path = ROOT.DIRECTORY_SEPARATOR.'vendor'.DIRECTORY_SEPARATOR.'codeigniter'.DIRECTORY_SEPARATOR.'framework'.DIRECTORY_SEPARATOR.'system'.DIRECTORY_SEPARATOR;
$application_folder = ROOT.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR;

require(ROOT.DIRECTORY_SEPARATOR.'Bootstrap.php');
Bootstrap::run();