$IRCServer = 'irc.root-me.org'
[int]$IRCPort = 6667
$BotName = 'candy'
$Channel = '#root-me_challenge'
  

try
{
	Write-Host "Connecting to $remoteHost on port $port ... " -NoNewLine
	try
	{
		$socket = New-Object System.Net.Sockets.TcpClient( $IRCServer, $IRCPort )
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
            $encoding.GetString( $buffer, 0, $read )
            
			Write-Host  $encoding.GetString( $buffer, 0, $read )

            $writer.WriteLine("NICK CJKJKJKJKJK")
            $writer.WriteLine("USER CJKJKJKJKJK 0 * :CJKJKJKJKJK")
            #$writer.WriteLine("PING 909090")
Write-Host "command? "
            $thisCommand = Read-Host
            $writer.WriteLine($thisCommand)
 
} 
		}
#$command = ($aaa -split " ")[4]
		$writer.WriteLine( $command )

		$writer.Flush( )
}

finally
{
	if( $writer ) {	$writer.Close( )	}
	if( $stream ) {	$stream.Close( )	}
} 
