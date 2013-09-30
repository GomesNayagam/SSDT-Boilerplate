/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/



SET NOCOUNT ON  
EXEC master.dbo.sp_configure 'show advanced options', 1 
RECONFIGURE 
EXEC master.dbo.sp_configure 'xp_cmdshell', 1 
RECONFIGURE

exec dbo.UpdateAuditScript  'B9B538F3-787D-4A91-9ED7-25C54593B6E9', [$(Scriptpath)],'Script3.sql',[$(DBServerName)], [$(DatabaseName)]
--exec dbo.UpdateAuditScript  'C0242A92-44FF-4CB5-A2DA-4BA786497F3F', [$(Scriptpath)],'Script1.sql',[$(DBServerName)], [$(DatabaseName)]
--exec dbo.UpdateAuditScript  'B4DB0048-88AB-4A05-B7BE-84C635D39C9B', [$(Scriptpath)],'Script2.sql',[$(DBServerName)], [$(DatabaseName)]
--:r .\Scripts\Script1.sql
--:r .\Scripts\Script2.sql
