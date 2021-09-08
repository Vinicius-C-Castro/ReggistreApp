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
          'Para recuperar a senha entre com um email, ' +
              'você receberá um email para poder atualizar sua senha.',
      this.hintLoginUser = 'Usuário',
        this.hintRecoverEmail = 'Email',
      this.login = 'Login',
      this.notAccount = 'Não tem uma conta?',
      this.signUp = 'Criar Conta',
      this.textLoading = 'Aguarde...'});
}
