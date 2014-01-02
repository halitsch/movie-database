json.array!(@loans) do |loan|
  json.extract! loan, :id, :loa_id, :borrow_date, :sup_return_date, :return_date, :wis_id, :med_id
  json.url loan_url(loan, format: :json)
end
