function Get-TGramBotFile {
    param (
        [Parameter(
            Mandatory = $True,
            HelpMessage = "ApiKey from your BOT"
        )][string] $BotApiKey,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "ChatID of telegram (Channel, Bot, etc.)"
        )][string] $FileID,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "If parameter exists donwload"
        )][switch] $Donwload
    )
    

    begin {

        $params = @{
    
            Uri = "https://api.telegram.org/bot${BotApiKey}/getFile"

            Headers = @{
                Accept = "application/json"
                ContentType = "application/x-www-form-urlencoded"
            } 
        
            Body = @{
                file_id  = $FileID
            }

            Method = "POST"
        }
    }


    process {

        try {   
            $Result = (Invoke-RestMethod @params).Result
            if($Donwload){
                $Result = Invoke-WebRequest -Uri "https://api.telegram.org/file/bot${BotApiKey}/$($Result.File_Path)" -OutFile "./file.png"
            }
        }
        catch {
            Throw $_ ; 
        }

    }


    end {
        return $Result
    }
}