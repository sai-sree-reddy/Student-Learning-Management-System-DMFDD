USE DMDDPROJECT
Go
SELECT * FROM Category
GO
GO
CREATE TRIGGER CHANGECATEGORYNAME1 ON Category
FOR INSERT
AS
BEGIN 
    UPDATE Category
    set CategoryDescription = 'Artificial Intelligence Methods' where CategoryID = 'AI'
	UPDATE Category
    set CategoryDescription = 'BigData Analytics Tools' where CategoryID = 'BDA'
END
GO

INSERT INTO Category Values ('HSL', 'Human Services Tools')
