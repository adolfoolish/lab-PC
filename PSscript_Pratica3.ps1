#Luis Adolfo Gonzalez Cerda

function Get-IPGateaway {
    Get-NetIPConfiguration -InterfaceAlias Wi-Fi
    Write-Host 'NOTA: La direccion IP esta marcada por IPv4Address y la puerta es IPv4DefaultGateaway' -ForegroundColor green
    break
}

function Get-TCPProcesses{
    Get-NetTCPConnection | Format-Table RemoteAddress,State
    $processes = Get-NetTCPConnection | Select-Object LocalPort
    foreach($process in $processes){
        $count += 1
    }
    Write-Host "Tienes "$count " procesos en total." -ForegroundColor Green
    Write-Host " "
    break
}

$opc1 = 1
$opc0 = 0

Clear-Host

while ($opc = 1){
    
    Write-Host "¿Que quieres hacer?
    (1) Ver IP y puerta de conexion
    (2) Ver conexiones TCP y cantidad de procesos
    (3) Salir"

    $opc0 = Read-Host

    switch ($opc0){
         1{
            Get-IPGateaway
            break
        }2{
            Get-TCPProcesses
            break
        }3{
            exit
        }default{
            Write-Host "Opcion no valida, intentalo de nuevo" -ForegroundColor red
        }
    }
}
