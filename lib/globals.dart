library my_prj.globals;

class PessoaFisica {
  final int id;
  final String nomeCompleto;
  final bool situacao;
  final String data;
  final String email;
  final double saldo;
  final String nomeUsuario;
  final String senha;
  final int quantidadePontos;
  final String data_nascimento;
  final String tipoConta;
  final List premioPessoa;

  PessoaFisica({
    this.id,
    this.nomeCompleto,
    this.situacao,
    this.data,
    this.email,
    this.saldo,
    this.nomeUsuario,
    this.senha,
    this.quantidadePontos,
    this.data_nascimento,
    this.tipoConta,
    this.premioPessoa
  });
}

class Movimentacao {
  final int id;
  final String nome;
  final String descricao;
  final String data;
  final String tipoMovimentacao;
  final double valor;
  final int recorrencia;
  final int categoria;
  final int pessoaFisica;

  Movimentacao({
    this.id,
    this.nome,
    this.descricao,
    this.data,
    this.tipoMovimentacao,
    this.valor,
    this.recorrencia,
    this.categoria,
    this.pessoaFisica,
  });
}

PessoaFisica globalPessoaFisica;
List<Movimentacao> globalMovimentacoes = new List<Movimentacao>();