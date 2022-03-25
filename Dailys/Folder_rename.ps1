# 更改Powershell执行策略为 Remotesigned
Set-ExecutionPolicy Remotesigned
# 定义要改文件名称的文件夹路径
$FolderPath = 'D:\testname'
# 定义要重命名后的字符名称
$Newname = 'az_az'
# 定义现阶段有规律字符名称,类似.txt或者.mp4,或者需要替换的字符串内容
$Oldname = 'Azure_test'
# 进行批量替换操作
dir $FolderPath -Include "*.*" -Recurse | ForEach-Object{Rename-Item $_.FullName $_.FullName.Replace($Oldname,$Newname)}
# 执行完命令后，恢复Powershell执行策略为 Restricted
Set-ExecutionPolicy Restricted