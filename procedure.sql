CREATE OR REPLACE PACKAGE pkg_dml_burnoutinhos IS

  PROCEDURE prc_insert_user (
      p_id_user       IN NUMBER,
      p_name_user     IN VARCHAR2,
      p_email_user    IN VARCHAR2,
      p_language      IN CHAR,
      p_profile_image IN VARCHAR2,
      p_password      IN VARCHAR2
  );

  
  PROCEDURE prc_insert_notification (
      p_id_notif      IN NUMBER,
      p_updated_at    IN TIMESTAMP,
      p_message_notif IN VARCHAR2,
      p_created_at    IN TIMESTAMP,
      p_id_user       IN NUMBER
  );

  
  PROCEDURE prc_insert_todo (
      p_id_todo      IN NUMBER,
      p_name_todo    IN VARCHAR2,
      p_start_todo   IN DATE,
      p_end_todo     IN DATE,
      p_created_at   IN TIMESTAMP,
      p_updated_at   IN TIMESTAMP,
      p_description  IN VARCHAR2,
      p_is_completed IN CHAR,
      p_id_user      IN NUMBER
  );
  
  
  PROCEDURE prc_insert_suggestion (
      p_id_suggestion IN NUMBER,
      p_suggestion_desc IN VARCHAR2,
      p_created_at    IN TIMESTAMP,
      p_id_todo       IN NUMBER
  );

  
  PROCEDURE prc_insert_timeblock (
      p_id_timebk    IN NUMBER,
      p_name_timebk  IN VARCHAR2,
      p_time_count   IN NUMBER,
      p_max_timebk   IN NUMBER,
      p_start_timebk IN NUMBER,
      p_created_at   IN TIMESTAMP,
      p_type_timebk  IN VARCHAR2,
      p_id_user      IN NUMBER,
      p_type_timer   IN VARCHAR2,
      p_id_todo      IN NUMBER
  );

END pkg_dml_burnoutinhos;
/

CREATE OR REPLACE PACKAGE BODY pkg_dml_burnoutinhos IS
  PROCEDURE prc_insert_user (
      p_id_user       IN NUMBER,
      p_name_user     IN VARCHAR2,
      p_email_user    IN VARCHAR2,
      p_language      IN CHAR,
      p_profile_image IN VARCHAR2,
      p_password      IN VARCHAR2

  ) AS
  BEGIN
      INSERT INTO t_burnoutinhos_user (
          id_user, name_user, email_user, language, profile_image, password
      ) VALUES (
          p_id_user, p_name_user, p_email_user, p_language, p_profile_image, p_password
      );
  END prc_insert_user;


  PROCEDURE prc_insert_notification (
      p_id_notif      IN NUMBER,
      p_updated_at    IN TIMESTAMP,
      p_message_notif IN VARCHAR2,
      p_created_at    IN TIMESTAMP,
      p_id_user       IN NUMBER
  ) AS
  BEGIN
      INSERT INTO t_burnoutinhos_notification (
          id_notif, updated_at, message_notif, created_at, id_user
      ) VALUES (
          p_id_notif, p_updated_at, p_message_notif, p_created_at, p_id_user
      );
  END prc_insert_notification;


  PROCEDURE prc_insert_todo (
      p_id_todo      IN NUMBER,
      p_name_todo    IN VARCHAR2,
      p_start_todo   IN DATE,
      p_end_todo     IN DATE,
      p_created_at   IN TIMESTAMP,
      p_updated_at   IN TIMESTAMP,
      p_description  IN VARCHAR2,
      p_is_completed IN CHAR,
      p_id_user      IN NUMBER
  ) AS
  BEGIN
      INSERT INTO t_burnoutinhos_todo (
          id_todo, name_todo, start_todo, end_todo, created_at, updated_at, description, is_completed, id_user
      ) VALUES (
          p_id_todo, p_name_todo, p_start_todo, p_end_todo, p_created_at, p_updated_at, p_description, p_is_completed, p_id_user
      );
  END prc_insert_todo;


  PROCEDURE prc_insert_suggestion (
      p_id_suggestion IN NUMBER,
      p_suggestion_desc IN VARCHAR2,
      p_created_at    IN TIMESTAMP,
      p_id_todo       IN NUMBER
  ) AS
  BEGIN
      INSERT INTO t_burnoutinhos_suggestion (
          id_suggestion, suggestion_desc, created_at, id_todo
      ) VALUES (
          p_id_suggestion, p_suggestion_desc, p_created_at, p_id_todo
      );
  END prc_insert_suggestion;


  PROCEDURE prc_insert_timeblock (
      p_id_timebk    IN NUMBER,
      p_name_timebk  IN VARCHAR2,
      p_time_count   IN NUMBER,
      p_max_timebk   IN NUMBER,
      p_start_timebk IN NUMBER,
      p_created_at   IN TIMESTAMP,
      p_type_timebk  IN VARCHAR2,
      p_id_user      IN NUMBER,
      p_type_timer   IN VARCHAR2,
      p_id_todo      IN NUMBER
  ) AS
  BEGIN
      INSERT INTO t_burnoutinhos_timeblock (
          id_timebk, name_timebk, time_count, max_timebk, start_timebk, created_at, type_timebk, id_user, type_timer, id_todo
      ) VALUES (
          p_id_timebk, p_name_timebk, p_time_count, p_max_timebk, p_start_timebk, p_created_at, p_type_timebk, p_id_user, p_type_timer, p_id_todo
      );
  END prc_insert_timeblock;

END pkg_dml_burnoutinhos;
/

BEGIN
    pkg_dml_burnoutinhos.prc_insert_user( 1, 'Pedro Ki', 'pedroki@gmail.com', 'PT-BR', 'default_profile.png', 'senha001');
    pkg_dml_burnoutinhos.prc_insert_user( 2, 'Gabriel Nunes', 'gabriel.nunes@gmail.com', 'EN-US', 'avatar2.png', 'senha002');
    pkg_dml_burnoutinhos.prc_insert_user( 3, 'Mariana Silva', 'mariana.silva@gmail.com', 'PT-BR', 'avatar3.png', 'senha003');
    pkg_dml_burnoutinhos.prc_insert_user( 4, 'Pedro Andrade', 'pedro.andrade@gmail.com', 'ES-ES', 'avatar4.png', 'senha004');
    pkg_dml_burnoutinhos.prc_insert_user( 5, 'Pedro Albuquerque', 'albupedro@gmail.com', 'FR-FR', 'avatar5.png', 'senha005');
    pkg_dml_burnoutinhos.prc_insert_user( 6, 'Lucas Pereira', 'lucas.pereira@gmail.com', 'PT-BR', 'profile_lucas.png', 'senha006');
    pkg_dml_burnoutinhos.prc_insert_user( 7, 'Sofia Martins', 'sofia.martins@gmail.com', 'EN-US', 'sofia_avatar.png', 'senha007');
    pkg_dml_burnoutinhos.prc_insert_user( 8, 'Ricardo Almeida', 'ricardo.almeida@gmail.com', 'PT-PT', 'ricardo_pic.jpg', 'senha008');
    pkg_dml_burnoutinhos.prc_insert_user( 9, 'Beatriz Ramos', 'beatriz.ramos@gmail.com', 'IT-IT', 'beatriz_img.png', 'senha009');
    pkg_dml_burnoutinhos.prc_insert_user( 10, 'Fernando Oliveira', 'fernando.oliveira@gmail.com', 'DE-DE', 'fernando_profile.jpg', 'senha010');


    pkg_dml_burnoutinhos.prc_insert_notification(1, to_timestamp('14:30:00', 'HH24:MI:SS'), 'Lembrete: Não esqueça de fazer uma pausa entre uma tarefa e outra, o descanso também é importante', to_timestamp('14:00:00', 'HH24:MI:SS'), 1);
    pkg_dml_burnoutinhos.prc_insert_notification(2, TO_TIMESTAMP('15:10:00', 'HH24:MI:SS'), 'Você está indo muito bem! Lembre-se de registrar seu progresso diário.', TO_TIMESTAMP('15:05:00', 'HH24:MI:SS'), 2);
    pkg_dml_burnoutinhos.prc_insert_notification(3, TO_TIMESTAMP('09:45:00', 'HH24:MI:SS'), 'É hora de revisar suas prioridades do dia para manter o foco.', TO_TIMESTAMP('09:30:00', 'HH24:MI:SS'), 3);
    pkg_dml_burnoutinhos.prc_insert_notification(4, TO_TIMESTAMP('11:20:00', 'HH24:MI:SS'), 'Não esqueça de se hidratar! Levante e beba água.', TO_TIMESTAMP('11:10:00', 'HH24:MI:SS'), 4);
    pkg_dml_burnoutinhos.prc_insert_notification(5, TO_TIMESTAMP('16:55:00', 'HH24:MI:SS'), 'Você tem uma tarefa pendente que ainda não foi iniciada.', TO_TIMESTAMP('16:40:00', 'HH24:MI:SS'), 5);
    pkg_dml_burnoutinhos.prc_insert_notification(6, TO_TIMESTAMP('10:05:00', 'HH24:MI:SS'), 'Lembrete: faça um alongamento rápido para aliviar o estresse.', TO_TIMESTAMP('10:00:00', 'HH24:MI:SS'), 6);
    pkg_dml_burnoutinhos.prc_insert_notification(7, TO_TIMESTAMP('13:40:00', 'HH24:MI:SS'), 'Ótimo trabalho! Sua produtividade está alta hoje.', TO_TIMESTAMP('13:20:00', 'HH24:MI:SS'), 7);
    pkg_dml_burnoutinhos.prc_insert_notification(8, TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), 'Lembrete: revise suas tarefas antes de encerrar o dia.', TO_TIMESTAMP('17:50:00', 'HH24:MI:SS'), 8);
    pkg_dml_burnoutinhos.prc_insert_notification(9, TO_TIMESTAMP('08:20:00', 'HH24:MI:SS'), 'Bom dia! Separe alguns minutos para planejar sua manhã.', TO_TIMESTAMP('08:00:00', 'HH24:MI:SS'), 9);
    pkg_dml_burnoutinhos.prc_insert_notification(10, TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 'Lembrete: faça uma pausa para o almoço e recarregue as energias.', TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 10);


    pkg_dml_burnoutinhos.prc_insert_todo(1, 'Estudar SQL', TO_TIMESTAMP('2025-01-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-10 07:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-10 09:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Revisar conceitos básicos e treinar queries.', 'N', 1);
    pkg_dml_burnoutinhos.prc_insert_todo(2, 'Treinar Python', TO_TIMESTAMP('2025-01-11 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-11 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-11 11:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Praticar listas, dicionários e funções.', 'N', 2);
    pkg_dml_burnoutinhos.prc_insert_todo(3, 'Reunião com equipe', TO_TIMESTAMP('2025-01-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-12 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-12 13:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-12 15:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Definir metas semanais e revisar progresso.', 'S', 3);
    pkg_dml_burnoutinhos.prc_insert_todo(4, 'Criar dashboard no Power BI', TO_TIMESTAMP('2025-01-13 09:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-13 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-13 12:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Montar visualização de métricas de performance.', 'N', 4);
    pkg_dml_burnoutinhos.prc_insert_todo(5, 'Ler artigo sobre Big Data', TO_TIMESTAMP('2025-01-14 16:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-14 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-14 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-14 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Estudar conceitos de arquitetura distribuída.', 'N', 5);
    pkg_dml_burnoutinhos.prc_insert_todo(6, 'Organizar tarefas da semana', TO_TIMESTAMP('2025-01-15 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 08:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 07:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Planejar prioridades e agendar entregas.', 'S', 6);
    pkg_dml_burnoutinhos.prc_insert_todo(7, 'Praticar exercícios', TO_TIMESTAMP('2025-01-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-16 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-16 17:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-16 19:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Treino funcional para melhorar resistência.', 'S', 7);
    pkg_dml_burnoutinhos.prc_insert_todo(8, 'Criar rotina de estudos', TO_TIMESTAMP('2025-01-17 13:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-17 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-17 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-17 14:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Organizar cronograma mensal de aprendizagem.', 'N', 8);
    pkg_dml_burnoutinhos.prc_insert_todo(9, 'Trabalhar no projeto pessoal', TO_TIMESTAMP('2025-01-18 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-18 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-18 19:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-18 22:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Desenvolver funcionalidades pendentes.', 'N', 9);
    pkg_dml_burnoutinhos.prc_insert_todo(10, 'Revisar código', TO_TIMESTAMP('2025-01-19 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-19 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-19 10:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-19 12:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Refatorar trechos antigos e melhorar performance.', 'S', 10);


    pkg_dml_burnoutinhos.prc_insert_suggestion(1, 'Adicionar mais detalhes ao estudo de SQL.', TO_TIMESTAMP('2025-01-10 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
    pkg_dml_burnoutinhos.prc_insert_suggestion(2, 'Criar pequenos scripts para praticar Python.', TO_TIMESTAMP('2025-01-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
    pkg_dml_burnoutinhos.prc_insert_suggestion(3, 'Registrar pautas importantes da reunião.', TO_TIMESTAMP('2025-01-12 15:40:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
    pkg_dml_burnoutinhos.prc_insert_suggestion(4, 'Adicionar segmentação no dashboard.', TO_TIMESTAMP('2025-01-13 12:10:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
    pkg_dml_burnoutinhos.prc_insert_suggestion(5, 'Pesquisar autores recomendados sobre Big Data.', TO_TIMESTAMP('2025-01-14 17:20:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
    pkg_dml_burnoutinhos.prc_insert_suggestion(6, 'Criar checklist semanal de tarefas.', TO_TIMESTAMP('2025-01-15 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), 6);
    pkg_dml_burnoutinhos.prc_insert_suggestion(7, 'Incluir alongamentos antes dos exercícios.', TO_TIMESTAMP('2025-01-16 19:10:00', 'YYYY-MM-DD HH24:MI:SS'), 7);
    pkg_dml_burnoutinhos.prc_insert_suggestion(8, 'Organizar rotina de estudos por prioridades.', TO_TIMESTAMP('2025-01-17 14:40:00', 'YYYY-MM-DD HH24:MI:SS'), 8);
    pkg_dml_burnoutinhos.prc_insert_suggestion(9, 'Criar milestones para o projeto pessoal.', TO_TIMESTAMP('2025-01-18 22:15:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
    pkg_dml_burnoutinhos.prc_insert_suggestion(10, 'Utilizar ferramentas de lint no código.', TO_TIMESTAMP('2025-01-19 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 10);


    pkg_dml_burnoutinhos.prc_insert_timeblock(1, 'Foco SQL', 25, 50, 0, TO_TIMESTAMP('2025-01-10 08:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 1, 'POMODORO', 1);
    pkg_dml_burnoutinhos.prc_insert_timeblock(2, 'Python Prática', 15, 45, 0, TO_TIMESTAMP('2025-01-11 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 2, 'COUNTDOWN', 2);
    pkg_dml_burnoutinhos.prc_insert_timeblock(3, 'Reunião : Intervalo', 5, 15, 0, TO_TIMESTAMP('2025-01-12 15:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'BREAK', 3, 'STOPWATCH', 3);
    pkg_dml_burnoutinhos.prc_insert_timeblock(4, 'Dashboard Power BI', 40, 60, 0, TO_TIMESTAMP('2025-01-13 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 4, 'POMODORO', 4);
    pkg_dml_burnoutinhos.prc_insert_timeblock(5, 'Leitura Big Data', 20, 30, 0, TO_TIMESTAMP('2025-01-14 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 5, 'COUNTDOWN', 5);
    pkg_dml_burnoutinhos.prc_insert_timeblock(6, 'Planejamento semanal', 10, 25, 0, TO_TIMESTAMP('2025-01-15 07:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 6, 'STOPWATCH', 6);
    pkg_dml_burnoutinhos.prc_insert_timeblock(7, 'Exercícios : Aquecimento', 8, 15, 0, TO_TIMESTAMP('2025-01-16 18:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'BREAK', 7, 'COUNTDOWN', 7);
    pkg_dml_burnoutinhos.prc_insert_timeblock(8, 'Rotina de Estudos', 30, 50, 0, TO_TIMESTAMP('2025-01-17 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 8, 'POMODORO', 8);
    pkg_dml_burnoutinhos.prc_insert_timeblock(9, 'Projeto Pessoal : Sprint', 45, 90, 0, TO_TIMESTAMP('2025-01-18 20:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 9, 'STOPWATCH', 9);
    pkg_dml_burnoutinhos.prc_insert_timeblock(10, 'Revisão de Código : Foco', 25, 40, 0, TO_TIMESTAMP('2025-01-19 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'FOCUS', 10, 'POMODORO', 10);

  COMMIT;
END;
/