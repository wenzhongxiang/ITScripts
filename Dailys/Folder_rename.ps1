# ����Powershellִ�в���Ϊ Remotesigned
Set-ExecutionPolicy Remotesigned
# ����Ҫ���ļ����Ƶ��ļ���·��
$FolderPath = 'D:\testname'
# ����Ҫ����������ַ�����
$Newname = 'az_az'
# �����ֽ׶��й����ַ�����,����.txt����.mp4,������Ҫ�滻���ַ�������
$Oldname = 'Azure_test'
# ���������滻����
dir $FolderPath -Include "*.*" -Recurse | ForEach-Object{Rename-Item $_.FullName $_.FullName.Replace($Oldname,$Newname)}
# ִ��������󣬻ָ�Powershellִ�в���Ϊ Restricted
Set-ExecutionPolicy Restricted