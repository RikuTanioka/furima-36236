require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end    
    it "emailに@が含まれていなければ登録できない" do
      @user.email = 'carlosgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが6文字以上でないと登録できない" do
      @user.password = 'ofjgo'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordがpassword_confirmationが同じでないと登録できない" do
      @user.password_confirmation = 'biug'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "name_surが空だと登録できない" do
      @user.name_sur = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name sur can't be blank")
    end   
    it "name_firstが空だと登録できない" do
      @user.name_first = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name first can't be blank")
    end   
    it "name_sur_pronが空だと登録できない" do
      @user.name_sur_pron = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name sur pron can't be blank")
    end   
    it "name_first_pronが空だと登録できない" do
      @user.name_first_pron = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name first pron can't be blank")
    end   
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end   
    it "name_surが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.name_sur = 'a'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name sur is invalid. Input full-width characters.")
    end   
    it "name_firstが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.name_first = 'a'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name first is invalid. Input full-width characters.")
    end   
    it "name_sur_pronが全角（カタカナ）でないと登録できない" do
      @user.name_sur_pron = 'a'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name sur pron is invalid. Input full-width katakana characters.")
    end   
    it "name_first_pronが全角（カタカナ）でないと登録できない" do
      @user.name_first_pron = 'a'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Name first pron is invalid. Input full-width katakana characters.")
    end   
  end
end
