function Send-TGramBotMessage {
    param (
        [Parameter(
            Mandatory = $True,
            HelpMessage = "ApiKey from your BOT"
        )][string] $BotApiKey,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "ChatID of telegram (Channel, Bot, etc.)"
        )][string] $ChatID,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "Message to send in chat"
        )][string] $Message
    )
    

    begin {

        $params = @{
    
            Uri = "https://api.telegram.org/bot${BotApiKey}/sendMessage"

            Headers = @{
                Accept = "application/json"
                ContentType = "application/x-www-form-urlencoded"
            } 
        
            Body = @{
                chat_id = $ChatID
                text = $Message
            }

            Method = "POST"
        }
    }


    process {

        try {   
            $Result = (Invoke-RestMethod @params)
        }
        catch {
            Throw $_ ; 
        }

    }


    end {
        return $Result
    }
}