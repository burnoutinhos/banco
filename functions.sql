CREATE OR REPLACE PACKAGE pkg_user_json AS
    FUNCTION user_to_json(
        p_id_user IN t_burnoutinhos_user.id_user%TYPE
    ) RETURN CLOB;
END pkg_user_json;
/

CREATE OR REPLACE PACKAGE BODY pkg_user_json AS

    FUNCTION user_to_json(
        p_id_user IN t_burnoutinhos_user.id_user%TYPE
    ) RETURN CLOB
    IS
        v_json   CLOB;
        v_id     t_burnoutinhos_user.id_user%TYPE;
        v_name   t_burnoutinhos_user.name_user%TYPE;
        v_email  t_burnoutinhos_user.email_user%TYPE;
        v_lang   t_burnoutinhos_user.language%TYPE;
        v_image  t_burnoutinhos_user.profile_image%TYPE;
    BEGIN
        SELECT id_user, name_user, email_user, language, profile_image INTO v_id, v_name, v_email, v_lang, v_image
        FROM t_burnoutinhos_user WHERE id_user = p_id_user;

        v_json := '{' ||
                    '"id_user": '        || COALESCE(TO_CHAR(v_id), 'null') || ',' ||
                    '"name_user": "'     || COALESCE(REPLACE(v_name, '"', '\"'), '') || '",' ||
                    '"email_user": "'    || COALESCE(REPLACE(v_email, '"', '\"'), '') || '",' ||
                    '"language": "'      || COALESCE(REPLACE(v_lang, '"', '\"'), '') || '",' ||
                    '"profile_image": "' || COALESCE(REPLACE(v_image, '"', '\"'), '') || '"' ||
                  '}';

        RETURN v_json;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN '{"erro":"Usuário não encontrado"}';

        WHEN OTHERS THEN
            RETURN '{"erro":"Falha ao gerar JSON: ' ||
                     REPLACE(SQLERRM, '"', '\"') || '"}';
    END user_to_json;

END pkg_user_json;
/

DECLARE
    v_json CLOB;
BEGIN
    v_json := pkg_user_json.user_to_json(10);
    DBMS_OUTPUT.put_line(v_json);
END;
/

CREATE OR REPLACE PACKAGE pkg_validacoes IS

  FUNCTION valida_email_user (
    p_email IN t_burnoutinhos_user.email_user%TYPE
  )
  RETURN NUMBER;

END pkg_validacoes;
/

CREATE OR REPLACE PACKAGE BODY pkg_validacoes IS

  FUNCTION valida_email_user (
    p_email IN t_burnoutinhos_user.email_user%TYPE
  )
  RETURN NUMBER
  IS
    v_resultado NUMBER := 0;
    v_regex VARCHAR2(250) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$';

  BEGIN
    IF p_email IS NOT NULL AND REGEXP_LIKE(p_email, v_regex) THEN
      v_resultado := 1;
      DBMS_OUTPUT.PUT_LINE('Seu email foi inserido com sucesso!');
    ELSE
      RAISE_APPLICATION_ERROR(-20002, 'Ocorreu um erro! Por favor, digite um email válido.');
    END IF;

    RETURN v_resultado;

  EXCEPTION
    WHEN VALUE_ERROR THEN
      RETURN 0;

    WHEN NO_DATA_FOUND THEN
      RETURN 0;
  END valida_email_user;

END pkg_validacoes;
/

DECLARE
  x NUMBER;
BEGIN
  x := pkg_validacoes.valida_email_user('pedroki@gmail.com');
  DBMS_OUTPUT.PUT_LINE(x);
END;
/