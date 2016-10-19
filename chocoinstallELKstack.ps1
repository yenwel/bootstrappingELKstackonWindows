
#http://logz.io/blog/installing-the-elk-stack-on-windows/
#http://brewhouse.io/blog/2014/11/04/big-data-with-elk-stack.html

$Policy = "Unrestricted"
If ((get-ExecutionPolicy) -ne $Policy) {
  Write-Host "Script Execution is disabled. Enabling it now"
  Set-ExecutionPolicy $Policy -Force
  Write-Host "Please Re-Run this script in a new powershell enviroment"
  Exit
}
if (Get-Command "choco" -errorAction SilentlyContinue)
{
    "choco exists"
}
else
{
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}
if((Get-Childitem env:JAVA_HOME).Value -match 'Java\\jdk1.8.')
{
    Write-Output "We have Java Development Kit 8 installed"
}
else
{
    choco install jdk8 -y
    Write-Output "Java Development Kit 8 was installed, you need to set JAVA_HOME variable"
}
choco install elasticsearch -y -Force
choco install logstash -y -Force
choco install kibana -y -Force
