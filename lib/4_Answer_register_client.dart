//Abaixo está a proposta de modelo lógico para o banco de dados que atende os requisitos fornecidos para o cadastro de clientes com múltiplos telefones, tipos de telefone e estados.

//Modelo Lógico das Tabelas:
// Tabela Clientes

// id_cliente (PK)
// razao_social (nome ou razão social do cliente)
// id_estado (FK para a tabela Estados)
// Tabela Telefones

// id_telefone (PK)
// numero_telefone (número do telefone)
// id_cliente (FK para a tabela Clientes)
// id_tipo_telefone (FK para a tabela Tipos_Telefone)
// Tabela Tipos_Telefone

// id_tipo_telefone (PK)
// descricao (descrição do tipo de telefone, ex.: "comercial", "residencial", "celular")
// Tabela Estados

// id_estado (PK)
// nome_estado (nome completo do estado)
// uf_estado (abreviação do estado, ex.: "SP")

// Diagrama Relacional 
// Clientes                 Telefones                   Tipos_Telefone           Estados
// +-------------+         +-------------+             +----------------+       +------------+
// | id_cliente  |<--------| id_cliente  |             | id_tipo_telefone|       | id_estado  |
// | razao_social|         | numero_telefone |         | descricao       |       | nome_estado|
// | id_estado   |-------->| id_tipo_telefone|-------->|                |       | uf_estado  |
// +-------------+         +-------------+             +----------------+       +------------+
//                      PK: id_telefone           FK: id_tipo_telefone         PK: id_estado
//                      FK: id_cliente            PK: id_tipo_telefone         PK: id_estado
//                      FK: id_tipo_telefone


//Consulta SQL
// SELECT 
//     c.id_cliente,
//     c.razao_social,
//     t.numero_telefone
// FROM 
//     Clientes c
// JOIN 
//     Telefones t ON c.id_cliente = t.id_cliente
// JOIN 
//     Estados e ON c.id_estado = e.id_estado
// WHERE 
//     e.uf_estado = 'SP';
//Descrição
// A consulta faz o JOIN entre as tabelas Clientes, 
// Telefones e Estados para buscar as informações de clientes e seus telefones, 
// filtrando apenas os clientes que estão no estado de São Paulo (uf_estado = 'SP').
// Ela retorna o id_cliente (código), razao_social (nome ou razão social) e o numero_telefone dos clientes.

// Modelo Lógico do Banco de Dados
// Com base nos requisitos fornecidos, o modelo lógico do banco de dados consiste em quatro tabelas principais:

// Cliente
// Telefone
// TipoTelefone
// Estado

// Abaixo estão as tabelas detalhadas com seus respectivos campos, 
// chaves primárias (PK) e chaves estrangeiras (FK), além dos relacionamentos entre elas.

// Tabela: Cliente
// Campo                Tipo                    Descrição           
// +-------------+     +-------------+         +----------------+       
// | id_cliente  |     | INT  |                | Chave primária (PK)|      
// | razao_social|     | VARCHAR(100) |        | Nome ou razão social do cliente   |      
// | cod_estado  |     | CHAR(2)|              | Código do estado (FK para Estado) |       
// +-------------+     +-------------+         +----------------+      
// PK: id_cliente
// FK: cod_estado (referencia Estado.cod_estado)


// Tabela: Telefone
// Campo                Tipo                    Descrição           
// +-------------+     +-------------+         +----------------+       
// | id_telefone |     | INT  |                | Chave primária (PK)|      
// | numero_telefone | | VARCHAR(20) |         | Número do telefone|      
// | id_cliente  |     | INT|                  | Chave estrangeira (FK) para Cliente |       
// | id_tipo     |     | INT|                  | Chave estrangeira (FK) para TipoTelefone |       
// +-------------+     +-------------+         +----------------+      

// PK: id_telefone
// FKs:
// id_cliente (referencia Cliente.id_cliente)
// id_tipo (referencia TipoTelefone.id_tipo)

// Tabela: TipoTelefone
// Campo                Tipo                    Descrição           
// +-------------+     +-------------+         +----------------+       
// | id_tipo     |     | INT  |                | Chave primária (PK)|      
// | tipo_nome   |     | VARCHAR(50) |         | Nome do tipo de telefone|             
// +-------------+     +-------------+         +----------------+     
// PK: id_tipo


// Tabela: Estado
// Campo                Tipo                    Descrição           
// +-------------+     +-------------+         +----------------+       
// | cod_estado  |     | CHAR(2)  |            | Código do estado (PK)|      
// | nome_estado |     | VARCHAR(50) |         | Nome do estado|             
// +-------------+     +-------------+         +----------------+     
// PK: cod_estado


// Relacionamentos Entre as Tabelas
// Cliente ↔ Estado

// Relacionamento: Muitos-para-Um (M
// )
// Detalhe: Cada cliente está associado a um estado. Um estado pode ter vários clientes.
// Chave Estrangeira: Cliente.cod_estado referencia Estado.cod_estado
// Cliente ↔ Telefone

// Relacionamento: Um-para-Muitos (1
// )
// Detalhe: Um cliente pode ter vários telefones. Cada telefone pertence a um cliente.
// Chave Estrangeira: Telefone.id_cliente referencia Cliente.id_cliente
// Telefone ↔ TipoTelefone

// Relacionamento: Muitos-para-Um (M
// )
// Detalhe: Cada telefone tem um tipo. Um tipo de telefone pode ser associado a vários telefones.
// Chave Estrangeira: Telefone.id_tipo referencia TipoTelefone.id_tipo

// Consulta em SQL 
// SELECT
//     c.id_cliente AS codigo,
//     c.razao_social,
//     t.numero_telefone
// FROM
//     Cliente c
// INNER JOIN
//     Telefone t ON c.id_cliente = t.id_cliente
// WHERE
//     c.cod_estado = 'SP';
