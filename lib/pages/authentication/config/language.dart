class LoginFreshWords {
  String loginWith;
  String login;
  String exploreApp;
  String notAccount;
  String signUp;
  String textLoading;
  String hintLoginUser;
  String hintRecoverEmail;
  String hintLoginPassword;
  String hintSignUpRepeatPassword;
  String hintName;
  String hintSurname;

  String recoverPassword;

  String messageRecoverPassword;

  LoginFreshWords(
      {this.hintName = 'Nome',
      this.hintSurname = 'Usuário',
      this.hintSignUpRepeatPassword = 'Repetir senha',
      this.hintLoginPassword = 'Senha',
      this.recoverPassword = 'Recuperar Senha',
      this.messageRecoverPassword =
          'Para redefinir sua senha, entre com o e-mail utilizado no cadastro da sua conta.' +
              'Um e-mail será enviado para esse endereço, com as instruções sobre como restabelecer seu acesso.',
      this.hintLoginUser = 'Usuário',
        this.hintRecoverEmail = 'Email',
      this.login = 'Entrar',
      this.notAccount = 'Não tem uma conta?',
      this.signUp = 'Criar Conta',
      this.textLoading = 'Aguarde...'});
}
