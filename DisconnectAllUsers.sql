Use Master
Go

Declare @dbname sysname

Set @dbname = 'NES'

Declare @spid int
Select @spid = min(spid) from master.dbo.sysprocesses
where dbid = db_id(@dbname)
While @spid Is Not Null
Begin
        Execute ('Kill ' + @spid)
        Select @spid = min(spid) from master.dbo.sysprocesses
        where dbid = db_id(@dbname) and spid > @spid
End
