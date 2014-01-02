require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  setup do
    @loan = loan(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post :create, loan: { borrow_date: @loan.borrow_date, loa_id: @loan.loa_id, med_id: @loan.med_id, return_date: @loan.return_date, sup_return_date: @loan.sup_return_date, wis_id: @loan.wis_id }
    end

    assert_redirected_to loan_path(assigns(:loan))
  end

  test "should show loan" do
    get :show, id: @loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan
    assert_response :success
  end

  test "should update loan" do
    patch :update, id: @loan, loan: { borrow_date: @loan.borrow_date, loa_id: @loan.loa_id, med_id: @loan.med_id, return_date: @loan.return_date, sup_return_date: @loan.sup_return_date, wis_id: @loan.wis_id }
    assert_redirected_to loan_path(assigns(:loan))
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete :destroy, id: @loan
    end

    assert_redirected_to loans_path
  end
end
