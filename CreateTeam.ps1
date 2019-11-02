# https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
Connect-PnPOnline -Scopes "Group.ReadWrite.All"
$accesstoken = Get-PnPAccessToken
$createteam = @'
{
    "template@odata.bind": "https://graph.microsoft.com/beta/teamsTemplates('standard')",
    "visibility": "Private",
    "displayName": "Microsoft Ignite",
    "description": "This is a Microsoft Team to get all the latest Microsoft Ignite info!",
    "channels": [
        {
            "displayName": "Microsoft 365 Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft 365 Blog"
        },
        {
            "displayName": "Microsoft Forms Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft Forms Blog"
        },
        {
            "displayName": "Microsoft OneDrive Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft OneDrive Blog"
        },
        {
            "displayName": "Microsoft Search Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft Search Blog"
        }, 
        {
            "displayName": "Microsoft SharePoint Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft SharePoint Blog"
        },
        {
            "displayName": "Microsoft SharePoint Developers Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft SharePoint Developer Blog"
        },
        {
            "displayName": "Microsoft Stream Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft Stream Blog"
        },
        {
            "displayName": "Microsoft Teams Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft Teams Blog"
        },
        {
            "displayName": "Microsoft Teams Events Blog",
            "isFavoriteByDefault": true,
            "description" : "Microsoft Teams Events Blog"
        },
        {
            "displayName": "Office 365 Blog",
            "isFavoriteByDefault": true,
            "description" : "Office 365 Blog"
        },
        {
            "displayName": "Planner Blog",
            "isFavoriteByDefault": true,
            "description" : "Planner Blog"
        },
        {
            "displayName": "Project Blog",
            "isFavoriteByDefault": true,
            "description" : "Project Blog"
        },
        {
            "displayName": "Yammer Blog",
            "isFavoriteByDefault": true,
            "description" : "Yammer Blog"
        }
    ]
        
}
'@
 
$createteamuri = "https://graph.microsoft.com/beta/teams"
Invoke-RestMethod -Uri $createteamuri -Body $createteam -ContentType "application/json" -Headers @{Authorization = "Bearer $accesstoken"} -Method POST