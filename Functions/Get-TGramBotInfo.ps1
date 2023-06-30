function Get-TGramBotInfo {
    param (
        [Parameter(
            Mandatory = $True,
            HelpMessage = "ApiKey from your BOT"
        )][string] $BotApiKey,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "ChatID of telegram (Channel, Bot, etc.)"
        )][string] $ChatID
    )
    

    begin {

        $params = @{
    
            Uri = "https://api.telegram.org/bot${BotApiKey}/getme"

            Headers = @{
                Accept = "application/json"
                ContentType = "application/x-www-form-urlencoded"
            } 
        
            Method = "POST"
        }
    }


    process {

        try {   
            $Result = (Invoke-RestMethod @params).Result
        }
        catch {
            Throw $_ ; 
        }

    }


    end {
        return $Result
    }
}