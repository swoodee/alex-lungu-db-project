-- 13 TRIGGERS

CREATE OR REPLACE FUNCTION log_changes_func()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO log_table (user_id, operation, log_time)
    VALUES (NEW.id, 'INSERT', NOW());
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO log_table (user_id, operation, log_time)
    VALUES (NEW.id, 'UPDATE', NOW());
  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO log_table (user_id, operation, log_time)
    VALUES (OLD.id, 'DELETE', NOW());
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_changes
AFTER INSERT OR UPDATE OR DELETE
ON carte
FOR EACH ROW
EXECUTE FUNCTION log_changes_func();