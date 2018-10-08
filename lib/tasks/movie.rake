require 'open-uri'
require 'net/http'
namespace :movie do
	desc ""
	task :get_from_aiqiyi => :environment do
		30.times do |index|
			# byebug
			# uri = URI("https://list.iqiyi.com/www/1/-------------11-#{index + 1}-1-iqiyi--.html")
			# http = Net::HTTP.new(uri.host, uri.port)
			# headers = {
			# 	"Referer": uri.host,
   #      "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36"
			# }
   #    doc = http.get(uri, headers)
   #    doc = Nokogiri::HTML(doc.body)
			doc = Nokogiri::HTML(open("https://list.iqiyi.com/www/1/-------------11-#{index + 1}-1-iqiyi--.html"), nil, 'utf-8')
			doc.css("ul.site-piclist li").each do |dom|
				begin
					info_params =
					{ title: dom.css("div.site-piclist_info a")[0].content,
						intro: nil,
						score: dom.css("div.site-piclist_info span.score")[0].content,
						url: dom.css("div.site-piclist_pic a")[0].values[11],
						img_url: "https:" + dom.css("div.site-piclist_pic img")[0].attributes["src"].value,
						actors: get_actors(dom.css("div.site-piclist_info a")),
						source: :iqiyi
					}
			    Movie.create(info_params) unless Movie.where(title: info_params[:title]).present?
				rescue Exception => e
					p e
					next
				end
			end
	  end
	end
end

def get_actors(dom)
	return [] unless dom
	dom.map {|item| item.values[3] }[1..-1]
end

#     req = urllib.request.Request(url=url,headers=headers)#这里要注意，必须使用url=url，headers=headers的格式，否则回报错，无法连接字符
    
# response = urllib.request.urlopen(req)#注意，这里要用req，不然就被添加useragent

