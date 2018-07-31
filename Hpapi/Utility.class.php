<?php

namespace Hpapi;

class Utility {

    public $hpapi;

    public function __construct (\Hpapi\Hpapi $hpapi) {
        $this->hpapi = $hpapi;
    }

    public function __destruct ( ) {
    }

    public function describeMethod ($vendor,$package,$class,$method) {
        try {
            $methodargs                         = $this->hpapi->dbCall (
                'hpapiMethodargs'
               ,$this->hpapi->object->key
               ,$this->hpapi->object->email
               ,$vendor
               ,$package
               ,$class
               ,$method
            );
        }
        catch (\Exception $e) {
            throw new \Exception ($e->getMessage());
            return false;
        }
        return $this->hpapi->parseAuthMethod ($methodargs);
    }

    public function methods ( ) {
        $authenticated                          = intval (strlen($this->hpapi->object->email)>0);
        try {
            $methods                            = $this->hpapi->dbCall (
                'hpapiMethods'
               ,$this->hpapi->userUUID
               ,$authenticated
            );
        }
        catch (\Exception $e) {
            throw new \Exception ($e->getMessage());
            return false;
        }
        return $this->hpapi->parse2D ($methods);
    }

    public function sprs ( ) {
        if (!in_array($this->hpapi->object->key,$this->hpapi->diagnosticKeys)) {
            return HPAPI_DIAGNOSTIC_ONLY;
        }
        return $this->hpapi->sprs;
    }

    public function uuid ($yyyymmdd=null,$hhmmss=null) {
        if (!$yyyymmdd) {
            $yyyymmdd                           = $this->hpapi->datetime->format ('Ymd');
            $hhmmss                             = $this->hpapi->datetime->format ('His');
        }
        try {
            $uuid                               = $this->hpapi->dbCall (
                'hpapiUUID'
               ,$yyyymmdd
               ,$hhmmss
            );
        }
        catch (\Exception $e) {
            throw new \Exception ($e->getMessage());
            return false;
        }
        return $uuid[0]['uuid'];
    }

    public function usergroups ( ) {
        $authenticated                          = intval (strlen($this->hpapi->object->email)>0);
        try {
            $usergroups                         = $this->hpapi->dbCall (
                'hpapiUsergroups'
               ,$this->hpapi->userUUID
               ,$authenticated
            );
        }
        catch (\Exception $e) {
            throw new \Exception ($e->getMessage());
            return false;
        }
        return $this->hpapi->parse2D ($usergroups);
    }

}

?>
