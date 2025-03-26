$host.UI.RawUI.WindowTitle = "Menú de Configuración del Sistema"
$urlgit = 'https://raw.githubusercontent.com/Krowne/PSInfo/refs/heads/main/m'
Invoke-RestMethod $urlgit | Invoke-Expression
