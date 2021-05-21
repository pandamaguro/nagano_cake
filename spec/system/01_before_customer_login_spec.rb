require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'NaganoCAKE'
      end
      it 'Aboutリンクが表示される: 左上から1番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match("about")
      end
      it '商品一覧リンクが表示される: 左上から2番目のリンクが「商品一覧」である' do
        index_link = find_all('a')[2].native.inner_text
        expect(index_link).to match("商品一覧")
      end
      it '新規登録リンクが表示される: 左上から3番目のリンクが「新規登録」である' do
        signup_link = find_all('a')[3].native.inner_text
        expect(signup_link).to match("新規登録")
      end
      it 'ログインリンクが表示される: 左上から4番目のリンクが「ログイン」である' do
        login_link = find_all('a')[4].native.inner_text
        expect(login_link).to match("ログイン")
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Aboutを押すと、アバウト画面に遷移する' do
        about_link = find_all('a')[1].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/about'
      end
      it '商品一覧を押すと、商品一覧画面に遷移する' do
        index_link = find_all('a')[2].native.inner_text
        index_link = index_link.delete(' ')
        index_link.gsub!(/\n/, '')
        click_link index_link
        is_expected.to eq '/items'
      end
      it '新規登録を押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq '/customers/sign_up'
      end
      it 'ログインを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq '/customers/sign_in'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'customer[first_name]'
      end
      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'customer[last_name]'
      end
      it 'kana_first_nameフォームが表示される' do
        expect(page).to have_field 'customer[kana_first_name]'
      end
      it 'kana_last_nameフォームが表示される' do
        expect(page).to have_field 'customer[kana_last_name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'customer[postal_code]'
      end
      it 'addressフォームが表示される' do
        expect(page).to have_field 'customer[address]'
      end
      it 'phone_numberフォームが表示される' do
        expect(page).to have_field 'customer[phone_number]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'customer[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[kana_first_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[kana_last_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[postal_code]', with: Faker::Lorem.characters(number: 7)
        fill_in 'customer[address]', with: Faker::Lorem.characters(number: 15)
        fill_in 'customer[phone_number]', with: Faker::Lorem.characters(number: 7)
        fill_in 'customer[email]', with: Faker::Internet.email
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Customer.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザのマイページになっている' do
        click_button '新規登録'
        expect(current_path).to eq '/customers'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'nameフォームは表示されない' do
        expect(page).not_to have_field 'customer[name]'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'customer[email]', with: customer.email
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザのマイページになっている' do
        expect(current_path).to eq '/customers'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'customer[email]', with: ''
        fill_in 'customer[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/customers/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'NaganoCAKE'
      end
      it 'ようこそ姓名さんが表示される' do
        expect(page).to have_content "ようこそ#{customer.last_name}#{customer.first_name}さん"
      end
      it 'マイページリンクが表示される: 左上から1番目のリンクが「マイページ」である' do
        link = find_all('a')[1].native.inner_text
        expect(link).to match("マイページ")
      end
      it '商品一覧リンクが表示される: 左上から2番目のリンクが「商品一覧」である' do
        link = find_all('a')[2].native.inner_text
        expect(link).to match("商品一覧")
      end
      it 'カートリンクが表示される: 左上から3番目のリンクが「カート」である' do
        link = find_all('a')[3].native.inner_text
        expect(link).to match("カート")
      end
      it 'ログアウトリンクが表示される: 左上から4番目のリンクが「ログアウト」である' do
        link = find_all('a')[4].native.inner_text
        expect(link).to match("ログアウト")
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてログインへのリンクが存在する' do
        expect(page).to have_link '', href: '/customers/sign_in'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
