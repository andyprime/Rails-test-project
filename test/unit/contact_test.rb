require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "first name required" do
  	#check when entire object is empty
  	contact1 = Contact.new
  	assert !contact1.save
  	
    # check when only first name is missing
  	contact2 = contacts(:missing_fname)
  	assert !contact2.save
  	
  	# check when first name is provided
  	contact3 = contacts(:one)
  	assert contact3.save, "Saves when first name is provided"
  end
  
  test "first name should be at least 2 characters" do
  	contact1 = contacts(:short_fname)
  	assert !contact1.save, "Save when first name is only one character long"
  end
  
  test "last name required" do
    #check when entire object is empty
  	contact1 = Contact.new
  	assert !contact1.save
  	
    # check when only last name is missing
  	contact2 = contacts(:missing_lname)
  	assert !contact2.save
  	
  	# check when last name is provided
  	contact3 = contacts(:one)
  	assert contact3.save, "Saves when last name is provided"
  end
  
  test "last name should be at least 2 characters" do
  	contact1 = contacts(:short_lname)
  	assert !contact1.save, "Save when last name is only one character long"
  end
  
  test "address required" do
  	#check when entire object is empty
  	contact1 = Contact.new
  	assert !contact1.save
  	
    # check when only last name is missing
  	contact2 = contacts(:missing_lname)
  	assert !contact2.save
  	
  	# check when last name is provided
  	contact3 = contacts(:one)
  	assert contact3.save, "Saves when last name is provided"
  end
  
  test "email required" do
  	#check when entire object is empty
  	contact1 = Contact.new
  	assert !contact1.save
  	
    # check when only email is missing
  	contact2 = contacts(:missing_email)
  	assert !contact2.save
  	
  	# check when email is provided
  	contact3 = contacts(:one)
  	assert contact3.save, "Saves when email is provided"
  end
  
  test "email must be formatted correctly" do
  	contact1 = contacts(:unformatted_email)
  	assert !contact1.save
  end
  
  test "phone number must be formatted correctly if supplied" do
  	# should save fine when not supplied
  	contact1 = contacts(:missing_phone)
  	assert contact1.save
  	
  	# check when supplied incorrectly
  	contact2 = contacts(:unformatted_phone1)
  	assert !contact2.save
  	contact3 = contacts(:unformatted_phone2)
  	assert !contact3.save  	
  	
  	# check when supplied correctly in a few formats
  	contact4 = contacts(:one)
  	assert contact4.save
  	contact5 = contacts(:two)
  	assert contact5.save
  	contact6 = contacts(:three)
  	assert contact6.save
  	contact7 = contacts(:four)
  	assert contact7.save
  end
  
end
