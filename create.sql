CREATE TABLE t_burnoutinhos_notification (
    id_notif       NUMBER(10) NOT NULL,
    updated_at     TIMESTAMP NOT NULL,
    message_notif  VARCHAR2(250) NOT NULL,
    created_at     TIMESTAMP,
    id_user        NUMBER(10) NOT NULL
);


ALTER TABLE t_burnoutinhos_notification ADD CONSTRAINT t_burnoutinhos_notification_pk PRIMARY KEY ( id_notif );

CREATE TABLE t_burnoutinhos_suggestion (
    id_suggestion    NUMBER(10) NOT NULL,
    suggestion_desc  VARCHAR2(250) NOT NULL,
    created_at       TIMESTAMP NOT NULL,
    id_todo          NUMBER(10) NOT NULL
);

ALTER TABLE t_burnoutinhos_suggestion ADD CONSTRAINT t_burnoutinhos_suggestion_pk PRIMARY KEY ( id_suggestion );

CREATE TABLE t_burnoutinhos_timeblock (
    id_timebk     NUMBER(10) NOT NULL,
    name_timebk   VARCHAR2(150) NOT NULL,
    time_count    NUMBER(15, 3) NOT NULL,
    max_timebk    NUMBER(15, 3) NOT NULL,
    start_timebk  NUMBER(15, 3) NOT NULL,
    created_at    TIMESTAMP NOT NULL,
    type_timebk   VARCHAR2(150) NOT NULL,
    id_user       NUMBER(10) NOT NULL,
    type_timer    VARCHAR2(150) NOT NULL,
    id_todo       NUMBER(10) NOT NULL
);

ALTER TABLE t_burnoutinhos_timeblock ADD CONSTRAINT t_burnoutinhos_timeblock_pk PRIMARY KEY ( id_timebk );

CREATE TABLE t_burnoutinhos_todo (
    id_todo       NUMBER(10) NOT NULL,
    name_todo     VARCHAR2(150) NOT NULL,
    start_todo    DATE NOT NULL,
    end_todo      DATE NOT NULL,
    created_at    TIMESTAMP NOT NULL,
    updated_at    TIMESTAMP NOT NULL,
    description   VARCHAR2(2000),
    is_completed  CHAR(1) NOT NULL,
    id_user       NUMBER(10) NOT NULL
);

ALTER TABLE t_burnoutinhos_todo ADD CONSTRAINT t_burnoutinhos_todo_pk PRIMARY KEY ( id_todo );

CREATE TABLE t_burnoutinhos_user (
    id_user        NUMBER(10) NOT NULL,
    name_user      VARCHAR2(150) NOT NULL,
    email_user     VARCHAR2(150) NOT NULL,
    language       CHAR(5) NOT NULL,
    profile_image  VARCHAR2(250) NOT NULL,
    password       VARCHAR2(8) NOT NULL
);

ALTER TABLE t_burnoutinhos_user ADD CONSTRAINT t_burnoutinhos_user_pk PRIMARY KEY ( id_user );

 
ALTER TABLE t_burnoutinhos_notification
    ADD CONSTRAINT fk_notification_user FOREIGN KEY ( id_user )
        REFERENCES t_burnoutinhos_user ( id_user );
 
ALTER TABLE t_burnoutinhos_suggestion
    ADD CONSTRAINT fk_suggestion_todo FOREIGN KEY ( id_todo )
        REFERENCES t_burnoutinhos_todo ( id_todo );
 
ALTER TABLE t_burnoutinhos_timeblock
    ADD CONSTRAINT fk_timeblock_todo FOREIGN KEY ( id_todo )
        REFERENCES t_burnoutinhos_todo ( id_todo );

ALTER TABLE t_burnoutinhos_timeblock
    ADD CONSTRAINT fk_timeblock_user FOREIGN KEY ( id_user )
        REFERENCES t_burnoutinhos_user ( id_user );
 
ALTER TABLE t_burnoutinhos_todo
    ADD CONSTRAINT fk_todo_user FOREIGN KEY ( id_user )
        REFERENCES t_burnoutinhos_user ( id_user );

