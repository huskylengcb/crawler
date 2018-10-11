require 'open-uri'
require 'net/http'
namespace :cartoon do
	desc ""
	task :get_from_aiqiyi => :environment do
		Video.cartoon.destroy_all
		30.times do |index|
			doc = Nokogiri::HTML(open("http://list.iqiyi.com/www/4/-------------4-#{index + 1}-1-iqiyi--.html"), nil, 'utf-8')
			doc.css("ul.site-piclist li").each do |dom|
				begin
					info_params =
					{ title: dom.css("div.site-piclist_info a")[0].content,
						intro: deal_string(dom.css("div.role_info")[0].content),
						score: nil,
						duration: deal_string(dom.css("span.icon-vInfo")[0].content),
						img_url: "https:" + dom.css("div.site-piclist_pic img")[0].attributes["src"].value,
						source: :iqiyi
					}
			    Video.cartoon.create(info_params) unless Video.cartoon.where(title: info_params[:title]).present?
				rescue Exception => e
					p e
					next
				end
			end
	  end
	end
end

def deal_string(string)
	return nil unless string
	string.gsub(/\r\n/, "").strip
end



