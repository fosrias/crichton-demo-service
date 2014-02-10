class PaymentsController < ApplicationController
  respond_to :json
  def index
    payments = [{id: 1, name: 'VISA'},
     {id: 2, name: 'MasterCard'},
     {id: 3, name: 'AmEx'},
     {id: 4, name: 'Check'},
     {id: 5, name: 'PayPal'},
     {id: 6, name: 'Discover'},
     {id: 7, name: 'BillMeLater'}]
    respond_with(payments)
  end
end
