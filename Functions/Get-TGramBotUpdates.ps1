function Get-TGramBotUpdates {
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
    
            Uri = "https://api.telegram.org/bot${BotApiKey}/getUpdates"

            Headers = @{
                Accept = "application/json"
                ContentType = "application/x-www-form-urlencoded"
            } 
        
            Body = @{
                chat_id = $ChatID
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