class CurrencyInformersController < ApplicationController
  include Currencies

  def index
    load_currencies

    @currencies = Currency.all
  end
end
