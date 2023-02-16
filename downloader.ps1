$ProgramName = "Putty"
$FileName = "Putty.msi"
$FileDirectory = "C:\\PowerShell\\" + $FileName
$DownloadFile = "https://onedrive.live.com/download?cid=9D084A2264BDF6AB&resid=9D084A2264BDF6AB%2129642&authkey=ALc-l6pG-z7tnDI"

#Criar uma Função para armezenar essas variaveis da notificação.

[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $true
#
$notify.showballoontip(10,'Aviso', $ProgramName+' está sendo baixado',[system.windows.forms.tooltipicon]::None)
powershell –c “(new-object System.Net.WebClient).DownloadFile(’$DownloadFile’,’$FileDirectory’)”
#Colocar o If Else se o arquivo existe ou não para apresentar mensagem de erro.
$notify.showballoontip(10,'Aviso', $ProgramName+' está sendo instalado',[system.windows.forms.tooltipicon]::None)
#Instalar o MSI
$Fileinstall = "/I C:\\PowerShell\\" + $FileName + " /quiet"
Start-Process msiexec.exe -Wait -ArgumentList $Fileinstall
#Mensagem de foi um sucesso a instalação, lembrar e colocar o If Else aqui tambem.
$notify.showballoontip(10,'Aviso', $ProgramName+' foi instalado com sucesso!',[system.windows.forms.tooltipicon]::None)


exit
    