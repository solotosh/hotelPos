<?php
namespace Php;
require_once __DIR__.'/Helper.php'; //Include helper
class FileWrite 
{ 

    // Function to write the database config file
    function databaseConfig($path = null, $data = []) 
    {
        if (file_exists($path['template_path'])) {
            // Open the file
            $database_file = file_get_contents($path['template_path']);

            //set new database configuration
            $new  = str_replace("{HOSTNAME}",$data['hostname'],$database_file);
            $new  = str_replace("{USERNAME}",$data['username'],$new);
            $new  = str_replace("{PASSWORD}",$data['password'],$new);
            $new  = str_replace("{DATABASE}",$data['database'],$new);

            // Write the new database.php file
            $handle = fopen($path['output_path'],'w+');

            // Chmod the file, in case the user forgot
            @chmod($path['output_path'],0777);

            // Verify file permissions
            if (is_writable($path['output_path'])) {
                // Write the file
                if (fwrite($handle,$new)) {
                    return true;
                } else {
                //file not write
                    return false;
                }
            } else {
                //file is not writeable
                return false;
            }
        } else {
            //file is not exists
            return false;
        }
    }


    // Function to set the base url of config file
    public function baseUrl($config_file = null)
    { 
        if (file_exists($config_file)) {
            // get file data
            $config_data = file_get_contents($config_file);

            //replace string
			/*$replace  =  '$https = false;';
			$replace .= "\r\n";
			$replace.=  'if (isset($_SERVER["HTTPS"]) && ($_SERVER["HTTPS"] == "on" || $_SERVER["HTTPS"] == 1) || isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] == "https") {$protocol = "https://";}';
            $replace .= "\r\n";
			$replace.=  'else {$protocol = "http://";}';
			$replace .= "\r\n";
			$replace .= '$dirname = rtrim(dirname($_SERVER["SCRIPT_NAME"]), "/")."/";';
			$replace .= "\r\n";
			$replace .= '$root=$protocol.$_SERVER["HTTP_HOST"].$dirname;';
			$replace .= "\r\n";*/
			$replace=  '$config["base_url"] = $root;';
            //set a flag
            $flag     = '$config["base_url"] = $root; ';

            //Find string 
            $pattern = '/[^\n]*base_url[^\n]*/';
            $matches = array();
            preg_match($pattern, $config_data, $matches);

            //if $matches[0] is not empty
            if (!empty($matches[0])) {
                //check config data is not matche with flag data
                if ($matches[0]!=$flag) {
                    //set $matches[0] as $original data  
                    $original = $matches[0];

                    //set output file mode  
                    @chmod($config_file,0777);  

                    //Replace file with new string 
                    $new  = str_replace($original,$replace,$config_data); 

                    // Write the new config.php file
                    $handle = fopen($config_file,'w+');

                    // Chmod the file, in case the user forgot
                    @chmod($config_file,0777);

                    //Verify file permission
                    if (is_writable($config_file)) {

                        //file write
                        if (fwrite($handle,$new)) {
                            return true;
                        } else {
                            //file is not write
                            return false;
                        } 
                    } else {
                        //file is not writeable
                        return false;
                    }
                } else {
                    //$config_data is match with $flag data
                    return true;
                }
            } else {
                //if $matches[0] is empty
                return false;
            }
        } else {
            //if $config_file is not exists
            return false;
        }      
    }


    //create .env file
    public function createEnvFile(){
        //check flag directory is exists
        if (is_dir('flag/')) {
            //create a env file in flag directory
            file_put_contents('flag/env', date('d-m-Y h:i:s a'));
        }

        if (!file_exists("./../env")) {
            
            //create a env file in root directory
            file_put_contents('./../env', date('d-m-Y h:i:s a'));

        }
    }

}
