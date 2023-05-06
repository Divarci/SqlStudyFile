USE [ProductChase]
GO

/****** Object:  Trigger [dbo].[BALANCEMAKER]    Script Date: 07/05/2023 00:12:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[BALANCEMAKER]
ON [dbo].[TBLMOVEMENT]
AFTER UPDATE
AS
BEGIN
	-- Güncelleme yapılacak müşterinin ID'sini al
    DECLARE @client_id INT
    SELECT @client_id = CLIENT FROM INSERTED

	DECLARE @client_idold INT
    SELECT @client_idold = CLIENT FROM DELETED
    
    -- Yapılan satışların toplam fiyatını al
    DECLARE @total_price DECIMAL(18,2)
    SELECT @total_price = SUM(COST) FROM TBLMOVEMENT WHERE CLIENT = @client_id

	DECLARE @total_price_old DECIMAL(18,2)
    SELECT @total_price_old = SUM(COST) FROM TBLMOVEMENT WHERE CLIENT = @client_idold
    
	IF (@client_id = @client_idold)

    -- Müşterinin balance sütununu güncelle
    UPDATE TBLCLIENTS
    SET CLIENTBALANCE = @total_price
    WHERE CLIENTID = @client_id

	IF (@client_id != @client_idold)
	
	UPDATE TBLCLIENTS
    SET CLIENTBALANCE = @total_price
    WHERE CLIENTID = @client_id
	UPDATE TBLCLIENTS
    SET CLIENTBALANCE = @total_price_old
    WHERE CLIENTID = @client_idold
END;
GO

ALTER TABLE [dbo].[TBLMOVEMENT] ENABLE TRIGGER [BALANCEMAKER]
GO


