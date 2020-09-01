CREATE TRIGGER check_update
    BEFORE INSERT OR UPDATE ON countries
    FOR EACH ROW
    EXECUTE PROCEDURE set_insertion();