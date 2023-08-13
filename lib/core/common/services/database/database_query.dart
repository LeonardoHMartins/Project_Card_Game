import 'package:sqflite/sqflite.dart';

class DatabaseQuery {
  final Transaction transaction;
  DatabaseQuery(this.transaction);

/* -------------------------------------------------------------------------- */
/*                         Informações dos Usuários                           */
/* -------------------------------------------------------------------------- */
  Future<void> createUserTable() async {
    /* ----------------------- Tabela de Usuários --------------------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS usuario (
          uuid_usuario TEXT PRIMARY KEY,
          id INTEGER NOT NULL,
          nome TEXT NOT NULL,
          nome_exibicao TEXT NOT NULL,
          matricula TEXT NOT NULL,
          email TEXT NULL,
          senha TEXT NULL,
          foto TEXT NULL,
          data_inicio TEXT NOT NULL,
          ultimo_acesso_data TEXT NULL,
          ultimo_acesso_quantidade INTEGER NULL,
          setor_alocado_id INTEGER NOT NULL,
          setor_alocado_nome TEXT NOT NULL,
          setor_alocado_nome_hierarquico TEXT NOT NULL,
          nivel_id INTEGER NOT NULL,
          nivel_nome TEXT NOT NULL,
          nivel_meta TEXT NOT NULL,
          nivel_quantidade INTEGER NOT NULL
        );
      ''');
  }

  /* -------------------------------------------------------------------------- */
  /*                     Tabelas referente ao módulo Observar                   */
  /* -------------------------------------------------------------------------- */
  Future<void> createObservarModuleConfigTable() async {
    /* ------------ Configuração e parâmetros permitidos dentro do módulo Observar para cada usuário -------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS observar_module_config (
        uuid_usuario TEXT PRIMARY KEY,
        observar_id TEXT NOT NULL,
        observar_nome TEXT NOT NULL,
        observar_acesso INTEGER NOT NULL,
        observar_dispensado_meta INTEGER NOT NULL,
        permissao_ausencia_nova INTEGER NOT NULL,
        permissao_ausencia_minha INTEGER NOT NULL,
        permissao_ausencia_aprovar INTEGER NOT NULL,
        permissao_observacao_nova INTEGER NOT NULL,
        permissao_observacao_minha INTEGER NOT NULL
      );
      ''');

    /* -------------------- Tabela de setores que o usuário tem permissão de apontar ----------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS observar_setores_lancamento (
        uuid_usuario TEXT NOT NULL,
				id INTEGER,
				nome TEXT NOT NULL,
				nome_hierarquico TEXT NOT NULL,
        PRIMARY KEY (uuid_usuario, id)
      );
      ''');

    /* ------------ Tabela de funcionarios que o usuário tem permissão de apontar -------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS observar_usuarios_lancamento (
        uuid_usuario TEXT NOT NULL,
				id INTEGER,
				nome TEXT NOT NULL,
				nome_exibicao TEXT NOT NULL,
        setor_alocado_id INTEGER NOT NULL,
        setor_alocado_nome TEXT NOT NULL,
        setor_alocado_nome_hierarquico TEXT NOT NULL,
        PRIMARY KEY (uuid_usuario, id)
      );
      ''');
  }

  /* -------------------------------------------------------------------------- */
  /*           Tabelas referente às configurações globais da empresa            */
  /* -------------------------------------------------------------------------- */

  /* ------------ Permissões e configurações do módulo Observar --------------- */
  Future<void> createGlobalConfigTable() async {
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS global_config (
        uuid_usuario TEXT PRIMARY KEY,
        permissao_desvio_igual INTEGER NOT NULL,
        permissao_multiplo_desvio INTEGER NOT NULL,
        permissao_comportamento_adequado INTEGER NOT NULL,
        permissao_desvio_comportamental INTEGER NOT NULL,
        limite_comportamento_adequado INTEGER NOT NULL
      );
      ''');

    /* ------------ Tipos de desvios do módulo Observar --------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS desvios (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL,
        nome_hierarquico TEXT NOT NULL
      );
      ''');

    /* ------------ Tipos de observação do módulo Observar --------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS tipo_observacao (
        id TEXT PRIMARY KEY,
        alias TEXT NOT NULL,
        nome TEXT NOT NULL
      );
      ''');

    /* ------------ Motivos Alegados do módulo Observar --------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS motivo_alegado (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL
      );
      ''');

    /* ------------ Tipos de ausência do módulo Observar --------------- */
    await transaction.execute('''
      CREATE TABLE IF NOT EXISTS motivo_ausencia (
        id INTEGER PRIMARY KEY,
        nome TEXT NOT NULL
      );
      ''');
  }

  /* -------------------------------------------------------------------------- */
  /*           Tabelas referente aos dados dos registros de Observar            */
  /* -------------------------------------------------------------------------- */

  /* --------------------- Registros do módulo Observar ----------------------- */
  Future<void> createObservarDataTable() async {
    await transaction.execute('''
        CREATE TABLE IF NOT EXISTS registros_observar (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          uuid TEXT,
          usuario_id INT(11) NOT NULL,
          numero TEXT,
          local TEXT,
          data TEXT,
          tipo TEXT,
          observacaoSugestao TEXT,

          observador_id INT(11),
          observador_nome TEXT,
          observador_nome_exibicao TEXT,
          observador_setor_alocado_id INT(11),
          observador_setor_alocado_nome TEXT,
          observador_setor_alocado_nome_hierarquico TEXT,

          setor_id INT(11),
          setor_nome TEXT,
          setor_nome_hierarquico TEXT,

          observado_tipo TEXT,
          observado_colaborador_id INT(11),
          observado_colaborador_nome TEXT,
          observado_colaborador_nome_exibicao TEXT,
          observado_setor_alocado_id INT(11),
          observado_setor_alocado_nome TEXT,
          observado_setor_alocado_nome_hierarquico TEXT,

          log_cadastro_data TEXT NOT NULL,
          log_cadastro_usuario_id INT(11) NOT NULL,
          sincronizado INT(1) NOT NULL
        )
        ''');

    await transaction.execute('''
        CREATE TABLE IF NOT EXISTS registros_observar_tipo_desvio (
          observar_uuid TEXT NOT NULL,

          tipo_desvio_id INT(11) NOT NULL,
          tipo_desvio_nome TEXT NOT NULL,

          motivo_alegado_id INT(11) NOT NULL,
          motivo_alegado_nome TEXT NOT NULL,

          PRIMARY KEY (observar_uuid, tipo_desvio_id, motivo_alegado_id)
        )
        ''');
  }
}
