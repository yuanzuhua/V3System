--DELETE WAMS_FULFILLMENT_DETAIL WHERE vPOID IN (SELECT Id FROM WAMS_PURCHASE_ORDER WHERE dCreated < '2015-01-01' AND vPOStatus='Complete')
--DELETE WAMS_PO_DETAILS WHERE vPOID IN (SELECT Id FROM WAMS_PURCHASE_ORDER WHERE dCreated < '2015-01-01' AND vPOStatus='Complete')
--DELETE WAMS_PURCHASE_ORDER WHERE dCreated < '2015-01-01' AND vPOStatus='Complete'
--DELETE WAMS_REQUISITION_DETAILS WHERE dCreated < '2015-01-01'
--DELETE WAMS_REQUISITION_MASTER WHERE dCreated < '2015-01-01'
--DELETE WAMS_RETURN_LIST WHERE dCreated < '2015-01-01'
--DELETE WAMS_ASSIGNNING_STOCKS WHERE dCreated < '2015-01-01'
--DELETE WAMS_STOCK_MANAGEMENT_QUANTITY WHERE dDate < '2015-01-01'
DELETE WAMS_HISTORY_LOG WHERE dDate < DATEADD(DAY, -30, GETDATE())
DELETE WAMS_STOCK_LOG WHERE dDate < DATEADD(DAY, -30, GETDATE())
--SELECT * FROM WAMS_REPORT WHERE dDate < DATEADD(DAY, -30, GETDATE())
DELETE FROM WAMS_REPORT_DETAILS WHERE dDateAssign < DATEADD(DAY, -30, GETDATE())
-- Check again
--SELECT * FROM WAMS_FULFILLMENT_DETAIL (NOLOCK)