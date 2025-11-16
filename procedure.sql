CREATE OR REPLACE PROCEDURE prc_insert_user (
    p_id_user       IN NUMBER,
    p_name_user     IN VARCHAR2,
    p_email_user    IN VARCHAR2,
    p_language      IN CHAR,
    p_profile_image IN VARCHAR2
) AS
BEGIN
    INSERT INTO t_burnoutinhos_user (
        id_user,
        name_user,
        email_user,
        language,
        profile_image 
    ) VALUES (
        p_id_user,
        p_name_user,
        p_email_user,
        p_language,
        p_profile_image 
    );
END;
/

begin
    prc_insert_user( 1, 'Pedro Ki','pedroki@gmail.com', 'PT-BR', 'default_profile.png');

    prc_insert_user (2, 'Gabriel Nunes', 'gabriel.nunes@gmail.com', 'EN-US', 'avatar2.png');

    prc_insert_user(3, 'Mariana Silva', 'mariana.silva@gmail.com', 'PT-BR', 'avatar3.png');

    prc_insert_user(4, 'Pedro Andrade', 'pedro.andrade@gmail.com', 'ES-ES', 'avatar4.png');

    prc_insert_user(5, 'Pedro Albuquerque', 'albupedro@gmail.com', 'FR-FR', 'avatar5.png');

    prc_insert_user(6, 'Lucas Pereira', 'lucas.pereira@gmail.com', 'PT-BR', 'profile_lucas.png');

    prc_insert_user(7, 'Sofia Martins', 'sofia.martins@gmail.com', 'EN-US', 'sofia_avatar.png');

    prc_insert_user(8, 'Ricardo Almeida', 'ricardo.almeida@gmail.com', 'PT-PT', 'ricardo_pic.jpg');
    
    prc_insert_user (9, 'Beatriz Ramos', 'beatriz.ramos@gmail.com', 'IT-IT', 'beatriz_img.png');

    prc_insert_user(10, 'Fernando Oliveira', 'fernando.oliveira@gmail.com', 'DE-DE', 'fernando_profile.jpg');

end;
/

select * from t_burnoutinhos_user;


CREATE OR REPLACE PROCEDURE prc_insert_notification (
    p_id_notif      IN NUMBER,
    p_updated_at    IN TIMESTAMP,
    p_message_notif IN VARCHAR2,
    p_created_at    IN TIMESTAMP,
    p_id_user       IN NUMBER
) AS
BEGIN
    INSERT INTO t_burnoutinhos_notification (
        id_notif,
        updated_at,
        message_notif,
        created_at,
        id_user
    ) VALUES (
        p_id_notif,
        p_updated_at,
        p_message_notif,
        p_created_at,
        p_id_user
    );
END;
/

begin
    prc_insert_notification(1, to_timestamp('14:30:00', 'HH24:MI:SS'), 
    'Lembrete: Não esqueça de fazer uma pausa entre uma tarefa e outra, o descanso também é importante', 
    to_timestamp('14:00:00', 'HH24:MI:SS'), 1);

    prc_insert_notification (2, TO_TIMESTAMP('15:10:00', 'HH24:MI:SS'),
    'Você está indo muito bem! Lembre-se de registrar seu progresso diário.',
    TO_TIMESTAMP('15:05:00', 'HH24:MI:SS'), 2);

    prc_insert_notification(3, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'),
    'É hora de revisar suas prioridades do dia para manter o foco.',
    TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), 3);

    prc_insert_notification(4, TO_TIMESTAMP('11:20:00', 'HH24:MI:SS'),
    'Não esqueça de se hidratar! Levante e beba água.',
    TO_TIMESTAMP('11:10:00', 'HH24:MI:SS'), 4);

    prc_insert_notification(5, TO_TIMESTAMP('16:55:00', 'HH24:MI:SS'),
    'Você tem uma tarefa pendente que ainda não foi iniciada.',
    TO_TIMESTAMP('16:40:00', 'HH24:MI:SS'), 5);

    prc_insert_notification(6, TO_TIMESTAMP('10:05:00', 'HH24:MI:SS'),
    'Lembrete: faça um alongamento rápido para aliviar o estresse.',
    TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), 6);
    
    prc_insert_notification(7, TO_TIMESTAMP('13:40:00', 'HH24:MI:SS'),
    'Ótimo trabalho! Sua produtividade está alta hoje.',
    TO_TIMESTAMP('13:20:00', 'HH24:MI:SS'), 7);
    
    prc_insert_notification(8, TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'),
    'Lembrete: revise suas tarefas antes de encerrar o dia.',
    TO_TIMESTAMP('17:50:00', 'HH24:MI:SS'), 8);


    prc_insert_notification (9, TO_TIMESTAMP('08:20:00', 'HH24:MI:SS'),
    'Bom dia! Separe alguns minutos para planejar sua manhã.',
    TO_TIMESTAMP('08:00:00', 'HH24:MI:SS'), 9);

    prc_insert_notification (10, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'),
    'Lembrete: faça uma pausa para o almoço e recarregue as energias.',
    TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 10);

end;
/

select * from t_burnoutinhos_notification;

CREATE OR REPLACE PROCEDURE prc_insert_todo (
    p_id_todo      IN NUMBER,
    p_name_todo    IN VARCHAR2,
    p_start_todo   IN DATE,
    p_end_todo     IN DATE,
    p_created_at   IN TIMESTAMP,
    p_updated_at   IN TIMESTAMP,
    p_is_completed IN CHAR,
    p_id_user      IN NUMBER
) AS
BEGIN
    INSERT INTO t_burnoutinhos_todo (
        id_todo,
        name_todo,
        start_todo,
        end_todo,
        created_at,
        updated_at,
        is_completed,
        id_user
    ) VALUES (
        p_id_todo,
        p_name_todo,
        p_start_todo,
        p_end_todo,
        p_created_at,
        p_updated_at,
        p_is_completed,
        p_id_user
    );
END;
/


begin 
    prc_insert_todo(1, 'Estudar SQL', DATE '2025-01-10', DATE '2025-01-10', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 1);
    prc_insert_todo(2, 'Treinar Python', DATE '2025-01-11', DATE '2025-01-11', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 2);
    prc_insert_todo(3, 'Reunião com equipe', DATE '2025-01-12', DATE '2025-01-12', SYSTIMESTAMP, SYSTIMESTAMP, 'S', 3);
    prc_insert_todo(4, 'Criar dashboard no Power BI', DATE '2025-01-13', DATE '2025-01-14', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 4);
    prc_insert_todo(5, 'Ler artigo sobre Big Data', DATE '2025-01-15', DATE '2025-01-15', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 5);
    prc_insert_todo(6, 'Organizar tarefas da semana', DATE '2025-01-09', DATE '2025-01-09', SYSTIMESTAMP, SYSTIMESTAMP, 'S', 6);
    prc_insert_todo(7, 'Praticar exercícios', DATE '2025-01-10', DATE '2025-01-10', SYSTIMESTAMP, SYSTIMESTAMP, 'S', 7);
    prc_insert_todo(8, 'Criar rotina de estudos', DATE '2025-01-11', DATE '2025-01-12', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 8);
    prc_insert_todo(9, 'Trabalhar no projeto pessoal', DATE '2025-01-14', DATE '2025-01-15', SYSTIMESTAMP, SYSTIMESTAMP, 'N', 9);
    prc_insert_todo(10, 'Revisar código', DATE '2025-01-12', DATE '2025-01-12', SYSTIMESTAMP, SYSTIMESTAMP, 'S', 10);

end;
/