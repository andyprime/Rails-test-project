require 'test_helper'

#
# Note - some of these are a little light, I replace prototype with jquery
# and as a result it seems assert_select_rjs doesn't work quite right
#

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
    @bad_contact = contacts(:missing_fname)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
    assert_select ".row", 14
  end

  test "should create contact" do
    assert_difference('Contact.count', 1) do
      post :create, :contact => @contact.attributes, :format => 'js'
      assert_match /text\/javascript/, @response.headers['Content-Type']
    end

    assert_no_difference('Contact.count') do
      post :create, :contact => @bad_contact.attributes, :format => 'js'
    end
    
    # irrelevant assert due to ajaxyness
    #assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, :id => @contact.to_param, :format => 'js'
    end
    
    assert_match /text\/javascript/, @response.headers['Content-Type']
    
  end
  
  test "should search contacts" do
  	get :search, {:filter => 'Joe', :format => 'js'}
  	contacts = assigns(:contacts)
  	assert contacts.count == 8, "Looking for 8 results, found #{contacts.count}"
  	assert_match /text\/javascript/, @response.headers['Content-Type']
  	  	
  	get :search, {:filter => 'zxczxczxczxc', :format => 'js'}
  	contacts = assigns(:contacts)
  	assert contacts.count == 0, "Looking for 0 results, found #{contacts.count}"
  	
  	get :search, {:filter => 'i', :format => 'js'}
  	contacts = assigns(:contacts)
  	assert contacts.count == 12, "Looking for 12 results, found #{contacts.count}"
  	
  	get :search, {:filter => 'Ben', :format => 'js'}
  	contacts = assigns(:contacts)
  	assert contacts.count == 1, "Looking for 1 results, found #{contacts.count}"
  end
  
  
  
  
  # unused actions
  #test "should show contact" do
  #  get :show, :id => @contact.to_param
  #  assert_response :success
  #end
  
  #test "should get new" do
  #  get :new
  #  assert_response :success
  #end

  #test "should get edit" do
  #  get :edit, :id => @contact.to_param
  #  assert_response :success
  #end

  #test "should update contact" do
  #  put :update, :id => @contact.to_param, :contact => @contact.attributes
  #  assert_redirected_to contact_path(assigns(:contact))
  #end
end
