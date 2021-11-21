class HomeController < ApplicationController
  
  def index
    require 'net/http'
    require 'json'
    # Para obtener las noticias
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=ES'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

     # Para obtener los precios
    @precios_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,FTH,XRP,BCH,FOS,LTC,ADA,XLM,MIOTA,USDT,TRX&tsyms=EUR'
    @precios_uri = URI(@precios_url)
    @precios_response = Net::HTTP.get(@precios_uri)
    @precios = JSON.parse(@precios_response)
    
  end

  def precios

    require 'net/http'
    require 'json'

    @simbolo = params[:sym]
    if @simbolo
      @simbolo = @simbolo.upcase
      
      # Para obtener los precios
      @cuota_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms='+@simbolo+'&tsyms=EUR'
      @cuota_uri = URI(@cuota_url)
      @cuota_response = Net::HTTP.get(@cuota_uri)
      @cuota = JSON.parse(@cuota_response)
    end

  end
  
end
