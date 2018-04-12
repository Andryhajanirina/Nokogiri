require 'nokogiri'
require 'open-uri'


#Get all email of townhal from its webpage
def get_the_email_of_a_townhal_from_its_webpage
    emails = ""
    tab_url = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
    tab_url.each do |url_commune|
        pages = Nokogiri::HTML(open(url_commune))
        email = pages.css(".txt-primary")[3].text.split(" ")
        email = email[2]
        emails += email
    end
    return emails
end

#Get all email of townhal from all webpage
def get_the_email_of_a_townhal_from_all_webpage
    emails = []
    url_commune = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
    url_commune.each do |url|
        pages = Nokogiri::HTML(open(url))
        email = pages.css(".txt-primary")[3].text.split(" ")
        email = email[2]
        emails << email
    end
    return emails
end

#Get all name of val d'Oise  townhalls
def get_the_name_of_val_doise_townhalls(url)
    page = Nokogiri::HTML(open(url))
    commune = []
    news_links = page.css("a").select{|link| link['class'] == "lientxt"}
    news_links.each do |communes|
        commune << communes.text
    end
    return commune
end

#Get all urls of Val d'Oise townhall
def get_all_the_urls_of_val_doise_townhalls(url)
    page = Nokogiri::HTML(open(url))
    urls = []
    source = "http://annuaire-des-mairies.com/"
    news_links = page.css("a").select{|link| link['class'] == "lientxt"}
    news_links.each do |link|
        lien = link['href']
        nv_link = lien.byteslice(2,lien.length)
        nv_link =  source + nv_link
        urls << nv_link
    end
    return urls
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

nom_commune = get_the_name_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
email_commune = get_the_email_of_a_townhal_from_all_webpage

tab_my_hash = []

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