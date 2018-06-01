$remoteHost = "35.157.111.68"
[int] $port = 10106   

try
{
	Write-Host "Connecting to $remoteHost on port $port ... " -NoNewLine
	try
	{
		$socket = New-Object System.Net.Sockets.TcpClient( $remoteHost, $port )
		Write-Host -ForegroundColor Green "OK"
	}
	catch
	{
		Write-Host -ForegroundColor Red "failed"
		exit -1
	}

	$stream = $socket.GetStream( )
	$writer = New-Object System.IO.StreamWriter( $stream )
	$buffer = New-Object System.Byte[] 1024
	$encoding = New-Object System.Text.AsciiEncoding

	while( $true )
	{
		start-sleep -m 300
		while( $stream.DataAvailable )
		{
			$read = $stream.Read( $buffer, 0, 1024 )
            ($aaa =  ($encoding.GetString( $buffer, 0, $read )))
            if ((($aaa.TrimEnd() -split " ") -ge 4) -and ($aaa -notcontains $null)){
			Write-Host  ($aaa.TrimEnd() -split " ")[4]
$command = ($aaa.TrimEnd() -split " ")[4]
} 
		}
#$command = ($aaa -split " ")[4]
		$writer.WriteLine( $command )

		$writer.Flush( )
}
}
finally
{
	if( $writer ) {	$writer.Close( )	}
	if( $stream ) {	$stream.Close( )	}
} 
