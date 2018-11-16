require 'open-uri'
require 'net/http'
namespace :teleplay do
	desc ""
	task :get_from_aiqiyi => :environment do
		Video.teleplay.destroy_all
		30.times do |index|
			doc = Nokogiri::HTML(open("https://list.iqiyi.com/www/2/-------------24-#{index + 1}-1-iqiyi--.html"), nil, 'utf-8')
			doc.css("ul.site-piclist li").each do |dom|
				begin
					info_params =
					{ title: dom.css("div.site-piclist_info a")[0].content,
						intro: nil,
						duration: deal_string(dom.css("span.icon-vInfo")[0].content),
						score: nil,
						url: dom.css("div.site-piclist_pic a")[0].values[11],
						img_url: "https:" + dom.css("div.site-piclist_pic img")[0].attributes["src"].value,
						actors: get_actors(dom.css("div.site-piclist_info a")),
						source: :iqiyi
					}
					p dom.css("div.site-piclist_pic a")[0].values[11]
					p index
			    Video.teleplay.create(info_params) unless Video.teleplay.where(title: info_params[:title]).present?
				rescue Exception => e
					p e
					next
				end
			end
	  end
    get_episode
	end
end

def get_episode
  Video.teleplay.each do |teleplay|
  	doc = Nokogiri::HTML(open(teleplay.url), nil, 'utf-8')
  	doc.css("ul.site-piclist li").each do |dom|
			begin
				info_params =
				{
					intro: deal_string(doc.css("p.site-piclist_info_describe")[0].try(:content)),
					duration: deal_string(dom.css("span.mod-listTitle_right")[0].content),
					name: deal_string(dom.css("p.site-piclist_info_title a")[0].content),
					url: dom.css("div.site-piclist_pic a")[0].values[1],
					img_url: dom.css("div.site-piclist_pic img")[0].attributes["src"].value
				}
		    teleplay.episodes.create(info_params) unless teleplay.episodes.where(name: info_params[:name]).present?
			rescue Exception => e
				p e
				next
			end
  	end
  end
end

def get_actors(dom)
	return [] unless dom
	dom.map {|item| item.values[3] }[1..-1]
end

def deal_string(string)
	return nil unless string
	string.gsub(/\r\n/, "").strip
end