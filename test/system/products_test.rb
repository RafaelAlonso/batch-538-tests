require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # exercise
    visit '/'
    
    # verify
    assert_selector "h1", text: "Toppest products"
    assert_selector ".card-product", count: Product.count
  end

  test "creating a new product" do
    # ================== exercise ==================
    # fazer login com usuario
    login_as users(:marcelinho)

    # entrar na página de new product
    visit new_product_url

    # preencher o formulário (com name & tagline)
    fill_in "product_name", with: "Fantoche do Marcelinho Hipster"
    fill_in "product_tagline", with: "Deixa eu arrumar meu cabeliiiiinho"

    # enviar o formulário
    click_on 'Create Product'

    # ================== verify ====================
    # verificar se caí na tela de home
    assert_equal root_path, page.current_path

    # verificar se meu produto está na tela
    assert_selector "h2", text: "Fantoche do Marcelinho Hipster"
    assert_selector "p", text: "Deixa eu arrumar meu cabeliiiiinho"
  end

  test "creating a new product without a name" do
    # ================== exercise ==================
    # fazer login com usuario
    login_as users(:marcelinho)

    # entrar na página de new product
    visit new_product_url

    # preencher o formulário (com apenas tagline)
    fill_in "product_tagline", with: "Deixa eu arrumar meu cabeliiiiinho"

    # enviar o formulário
    click_on 'Create Product'

    # ================== verify ====================
    # verificar se caí na tela de home
    # assert_equal root_path, page.current_path

    # verificar se meu produto está na tela
    assert_text "Name can't be blank"
  end
end
