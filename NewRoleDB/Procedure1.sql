CREATE PROCEDURE [dbo].[UpdateAuditScript]
	-- Add the parameters for the stored procedure here
	@guid uniqueidentifier,
	@Scriptpath VARCHAR(100),
	@Filename VARCHAR(100),
	@DBServerName VARCHAR(100),
	@DBName VARCHAR(100)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		IF NOT EXISTS(SELECT GuidId from dbo.Audit WHERE GuidId=@guid)
		BEGIN 
		DECLARE @STR VARCHAR(1000)
		--DECLARE @DBName VARCHAR(100)
		DECLARE	@return_value int

		--SET @DBName = (select DB_NAME())
		

		SET @STR =  'sqlcmd -S ' + RTRIM(LTRIM(@DBServerName)) + ' -d  ' + RTRIM(LTRIM(@DBName)) + ' -i ' + '"' + RTRIM(LTRIM(@Scriptpath)) + RTRIM(LTRIM(@Filename))+ '"'

			EXEC @return_value = xp_cmdshell @STR

			IF @return_value = 0
				BEGIN
					INSERT INTO Audit (GuidId,CreatedBy,CreatedDate)
					VALUES (@guid,USER_NAME(),GETDATE())
					PRINT 'Script executed'
				END
			ELSE
			PRINT "Error while executing script in xp_cmdshell for - ,  "+@STR

		END 
		
		ELSE 
		
		PRINT 'Script already executed'

    -- Insert statements for procedure here
	
END
GO