function Get-TGramBotUserProfilePhotos {
    param (
        [Parameter(
            Mandatory = $True,
            HelpMessage = "ApiKey from your BOT"
        )][string] $BotApiKey,
        [Parameter(
            Mandatory = $False,
            HelpMessage = "ChatID of telegram (Channel, Bot, etc.)"
        )][string] $UserID
    )
    

    begin {

        $params = @{
    
            Uri = "https://api.telegram.org/bot${BotApiKey}/getUserProfilePhotos"

            Headers = @{
                Accept = "application/json"
                ContentType = "application/x-www-form-urlencoded"
            } 
        
            Body = @{
                user_id = $UserID
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