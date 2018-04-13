require 'nokogiri'
require 'open-uri'
require 'restclient'

#Récupère les titres du tableau OK
def get_titre(url)
    tab_titre = []
    page = Nokogiri::HTML(open(url))
    match_titre = page.css("th").select{|title| title['aria-controls'] == "currencies-all"}
    match_titre.each do |titre|
        tab_titre << titre.text
    end
    return tab_titre
end

# puts get_titre('AllCryptocurrencies_CoinMarketCap.html')

#===================================================

#Récupère le numéro de classement OK
def get_sorting(url)
    tab_sorting = []
    page = Nokogiri::HTML(open(url))
    match_sorting = page.css("td").select{|sorting| sorting['class'] == "text-center sorting_1"}
    match_sorting.each do |classement|
        tab_sorting << classement.text
    end
    return tab_sorting
end

# puts get_sorting('AllCryptocurrencies_CoinMarketCap.html')

#==================================================

#Récupère le currenccy name OK
def get_currency_name(url)
    tab_currency_name = []
    page = Nokogiri::HTML(open(url))
    match_currency_name = page.css("a").select{|currency| currency['class'] == "currency-name-container"}
    match_currency_name.each do |c_name|
        tab_currency_name << c_name.text
    end
    return tab_currency_name
end

# puts get_currency_name('AllCryptocurrencies_CoinMarketCap.html')

#==================================================

#Récupère le symbol OK
def get_symbol(url)
    tab_symbol = []
    page = Nokogiri::HTML(open(url))
    match_symbol = page.css("td").select{|symbol| symbol['class'] == "text-left col-symbol"}
    match_symbol.each do |symbole|
        tab_symbol << symbole.text
    end
    return tab_symbol
end

# puts get_symbol('AllCryptocurrencies_CoinMarketCap.html')

#==================================================

#Récupère le market cap OK
def get_market_cap(url)
    tab_market_cap = []
    page = Nokogiri::HTML(open(url))
    match_market_cap = page.css("td").select{|m_cap| m_cap['class'] == "no-wrap market-cap text-right"}
    match_market_cap.each do |market_cap|
        tab_market_cap << market_cap.text
    end
    return tab_market_cap
end

# puts get_market_cap('AllCryptocurrencies_CoinMarketCap.html')

#==================================================

#Récupère le Prix OK
def get_price(url)
    tab_price = []
    page = Nokogiri::HTML(open(url))
    match_price = page.css("a").select{|prix| prix['class'] == "price"}
    match_price.each do |price|
        tab_price << price.text
    end
    return tab_price
end

# puts get_price('AllCryptocurrencies_CoinMarketCap.html') OK

#==================================================

#Récupère le Circulating Supply OK
def get_circulating_supplay(url)
    tab_circulating_supplay = []
    page = Nokogiri::HTML(open(url))
    match_circulating_supplay = page.css("td").select{|circ_supp| circ_supp['class'] == "no-wrap text-right circulating-supply"}
    match_circulating_supplay.each do |circulating_supplay|
        tab_circulating_supplay << circulating_supplay.text
    end
    return tab_circulating_supplay
end


#==================================================

#Récupère le Volume OK
def get_volume(url)
    tab_volume = []
    page = Nokogiri::HTML(open(url))
    match_volume = page.css("a").select{|vol| vol['class'] == "volume"}
    match_volume.each do |volume|
        tab_volume << volume.text
    end
    return tab_volume
end


#===============================================

#Récupère le %1h OK
def get_percent_change1(url)
    tab_percent_change1 = []
    page = Nokogiri::HTML(open(url))
    match_percent_change = page.css("td").select{|p_change| p_change["data-timespan"] == "1h"}
    match_percent_change.each do |percent|
        tab_percent_change1 << percent.text
    end
    return tab_percent_change1
end


#===============================================

#Récupère le %24h OK
def get_percent_change24(url)
    tab_percent_change24 = []
    page = Nokogiri::HTML(open(url))
    match_percent_change = page.css("td").select{|p_change| p_change["data-timespan"] == "24h"}
    match_percent_change.each do |percent|
        tab_percent_change24 << percent.text
    end
    return tab_percent_change24
end


#===============================================

#Récupère le %7d OK
    match_percent_change = page.css("td").select{|p_change| p_change["data-timespan"] == "7d"}
    match_percent_change.each do |percent|
        tab_percent_change7d << percent.text
    end
    return tab_percent_change7d
end

url_coin_market = "AllCryptocurrencies_CoinMarketCap.html"


titre = get_titre(url_coin_market)
sorting = get_sorting(url_coin_market)
currrency_name = get_currency_name(url_coin_market)
symbol = get_symbol(url_coin_market)
market_cap = get_market_cap(url_coin_market)
price = get_price(url_coin_market)
circulating_supply = get_circulating_supplay(url_coin_market)
volume = get_volume(url_coin_market)
percent_1h = get_percent_change1(url_coin_market)
percent_24h = get_percent_change24(url_coin_market)
percent_7d = get_percent_change7d(url_coin_market)

tab_mtab_my_hash = []

c = nom_commune.length

#Creating the hash to receive the email of each townhall
for i in 0...c
    my_hash = {
        name: "",
        email: ""
    }
    my_hash[:name] = nom_commune[i]
    my_hash[:email] = email_commune[i]
    tab_my_hash << my_hash
end

puts tab_my_hash