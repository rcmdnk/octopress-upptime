require "json"
require 'open-uri'

module Jekyll
  class UpptimeGenerator < Generator
    safe :true
    priority :lower

    # Get Upptime information

    def generate(site)
      repo = (site.config.key?("upptime_repo")) ?  site.config["upptime_repo"] : ""
      return if not repo
      url = "https://raw.githubusercontent.com/#{repo}/master/history/summary.json"

      begin
        begin
          URI.open(url) do |f|
            site.config["upptime"] = JSON.parse(f.read)[0]
          end
          if not (site.config.key?("upptime_url"))
            site.config["upptime_url"] = "#{site.config["url"]}/#{repo.split('/')[1]}"
          end
          if not site.config["upptime_url"].start_with?("http")
            site.config["upptime_url"] = "#{site.config["url"].split(":")[0]}://#{site.config["upptime_url"]}"
          end
          site.config["upptime_history"] = "#{site.config["upptime_url"]}/history/#{site.config["upptime_name"]}"
          site.config["upptime_graph"] = "//github.com/#{site.config["upptime_repo"]}/raw/master/graphs/#{site.config["upptime_name"]}/response-time-week.png"
          site.config["upptime_img"] = "//img.shields.io/endpoint?url=https://raw.githubusercontent.com/#{site.config["upptime_repo"]}/master/api/#{site.config["upptime_name"]}"
        rescue Exception => e
          puts e.message
          puts e.backtrace
          site.config["upptime"] = {}
        end
      end

    end
  end
end
