CREATE TRIGGER trg_CheckPasswordLength
ON User_Account
AFTER INSERT, UPDATE
AS
BEGIN
    -- Declare variable to store the affected Account_id
    DECLARE @AffectedAccountId INT;

    -- Check if any inserted or updated row has a password length less than 8
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE LEN(UserPassword) < 8
    )
    BEGIN
        -- Get the affected Account_id before rollback
        SELECT @AffectedAccountId = Account_id
        FROM INSERTED;

        -- Rollback the transaction
        ROLLBACK TRANSACTION;

        -- Decrement the Account_id
        IF @AffectedAccountId IS NOT NULL
        BEGIN
            DECLARE @NewAccountID INT;
            SET @NewAccountID = @AffectedAccountId - 1;

            -- Update the identity seed to the new Account_id value
            DBCC CHECKIDENT ('User_Account', RESEED, @NewAccountID);
        END

        -- Raise error
        RAISERROR('Password must be 8 digits.', 16, 1);
        RETURN;
    END;
END;

create trigger review_rating_trigger
on Reviews
after insert, update
as
begin
	declare @rating int;
	select @rating = Rating from inserted;
	if @rating < 1 or @rating > 5
	begin
		rollback transaction;
		raiserror('Rating must be between 1 and 5.', 16, 1);
	end;
end;

