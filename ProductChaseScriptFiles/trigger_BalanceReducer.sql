USE [ProductChase]
GO

/****** Object:  Trigger [dbo].[BALANCEREDUCER]    Script Date: 07/05/2023 00:13:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[BALANCEREDUCER]
ON [dbo].[TBLMOVEMENT]
AFTER DELETE
AS
BEGIN
	-- Güncelleme yapılacak müşterinin ID'sini al
    DECLARE @client_id INT
    SELECT @client_id = CLIENT FROM DELETED
    
    -- Yapılan satışların toplam fiyatını al
    DECLARE @total_price DECIMAL(18,2)
	SELECT @total_price = SUM(COST) FROM TBLMOVEMENT WHERE CLIENT = @client_id
    
    -- Müşterinin balance sütununu güncelle
    UPDATE TBLCLIENTS
    SET CLIENTBALANCE = @total_price
    WHERE CLIENTID = @client_id
END;
GO

ALTER TABLE [dbo].[TBLMOVEMENT] ENABLE TRIGGER [BALANCEREDUCER]
GO


