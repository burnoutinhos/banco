CREATE TABLE t_burnoutinhos_log (
    id_log          NUMBER(10) NOT NULL,
    table_name      VARCHAR2(50) NOT NULL,
    operation_type  CHAR(1) NOT NULL, 
    record_id       VARCHAR2(50),     
    changed_by      VARCHAR2(100) DEFAULT USER NOT NULL,
    changed_on      TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    old_value       CLOB,             
    new_value       CLOB              
);

ALTER TABLE t_burnoutinhos_log ADD CONSTRAINT t_burnoutinhos_log_pk PRIMARY KEY ( id_log );

CREATE SEQUENCE seq_burnoutinhos_log START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_notification START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_suggestion START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_timeblock START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_todo START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_user START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_notif_audit
BEFORE INSERT OR UPDATE OR DELETE ON t_burnoutinhos_notification
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.id_notif := seq_notification.NEXTVAL;
        :NEW.created_at := CURRENT_TIMESTAMP;
    END IF;
    
    IF INSERTING OR UPDATING THEN
        :NEW.updated_at := CURRENT_TIMESTAMP;
    END IF;

    IF INSERTING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_NOTIFICATION', 'I', :NEW.id_notif, 'Nova linha inserida');
    ELSIF UPDATING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_NOTIFICATION', 'U', :NEW.id_notif, 
                'Mensagem Antiga: ' || :OLD.message_notif, 'Mensagem Nova: ' || :NEW.message_notif);
    ELSIF DELETING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_NOTIFICATION', 'D', :OLD.id_notif, 
                'Linha deletada, Mensagem: ' || :OLD.message_notif);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_suggestion_audit
BEFORE INSERT OR UPDATE OR DELETE ON t_burnoutinhos_suggestion
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.id_suggestion := seq_suggestion.NEXTVAL;
        :NEW.created_at := CURRENT_TIMESTAMP;
    END IF;
    
    IF INSERTING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_SUGGESTION', 'I', :NEW.id_suggestion, 'Nova sugestão inserida');
    ELSIF UPDATING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_SUGGESTION', 'U', :NEW.id_suggestion, 
                'Antiga Desc: ' || :OLD.suggestion_desc, 'Nova Desc: ' || :NEW.suggestion_desc);
    ELSIF DELETING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_SUGGESTION', 'D', :OLD.id_suggestion, 
                'Sugestão deletada: ' || :OLD.suggestion_desc);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_timeblock_audit
BEFORE INSERT OR UPDATE OR DELETE ON t_burnoutinhos_timeblock
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.id_timebk := seq_timeblock.NEXTVAL;
        :NEW.created_at := CURRENT_TIMESTAMP;
    END IF;
    
    IF INSERTING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TIMEBLOCK', 'I', :NEW.id_timebk, 'Novo Timeblock inserido: ' || :NEW.name_timebk);
    ELSIF UPDATING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TIMEBLOCK', 'U', :NEW.id_timebk, 
                'Tempo Antigo: ' || :OLD.time_count, 'Tempo Novo: ' || :NEW.time_count);
    ELSIF DELETING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TIMEBLOCK', 'D', :OLD.id_timebk, 
                'Timeblock deletado: ' || :OLD.name_timebk);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_todo_audit
BEFORE INSERT OR UPDATE OR DELETE ON t_burnoutinhos_todo
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.id_todo := seq_todo.NEXTVAL;
        :NEW.created_at := CURRENT_TIMESTAMP;
    END IF;
    
    IF INSERTING OR UPDATING THEN
        :NEW.updated_at := CURRENT_TIMESTAMP;
    END IF;

    IF INSERTING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TODO', 'I', :NEW.id_todo, 'Nova tarefa: ' || :NEW.name_todo);
    ELSIF UPDATING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TODO', 'U', :NEW.id_todo, 
                'Status Antigo: ' || :OLD.is_completed, 'Status Novo: ' || :NEW.is_completed);
    ELSIF DELETING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_TODO', 'D', :OLD.id_todo, 
                'Tarefa deletada: ' || :OLD.name_todo);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_user_audit
BEFORE INSERT OR UPDATE OR DELETE ON t_burnoutinhos_user
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.id_user := seq_user.NEXTVAL;
    END IF;
    
    IF INSERTING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_USER', 'I', :NEW.id_user, 
                'Novo usuário: ' || :NEW.name_user || ' | Email: ' || :NEW.email_user);
    
    ELSIF UPDATING THEN

        IF :OLD.name_user != :NEW.name_user THEN
            INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
            VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_USER', 'U', :NEW.id_user, 
                    'Nome Antigo: ' || :OLD.name_user, 'Nome Novo: ' || :NEW.name_user);
        END IF;

        IF :OLD.email_user != :NEW.email_user THEN
            INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value, new_value)
            VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_USER', 'U', :NEW.id_user, 
                    'Email Antigo: ' || :OLD.email_user, 'Email Novo: ' || :NEW.email_user);
        END IF;
        
        
        IF :OLD.password != :NEW.password THEN
            INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, new_value)
            VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_USER', 'U', :NEW.id_user, 
                    'Senha atualizada (Valor não logado por segurança).');
        END IF;

    ELSIF DELETING THEN
        INSERT INTO t_burnoutinhos_log (id_log, table_name, operation_type, record_id, old_value)
        VALUES (seq_burnoutinhos_log.NEXTVAL, 'T_BURNOUTINHOS_USER', 'D', :OLD.id_user, 
                'Usuário deletado: ' || :OLD.name_user || ' | Email: ' || :OLD.email_user);
    END IF;
END;
/

