# octopress-upptime

Octopress (Jekyll) plugin to show [Upptime](https://upptime.js.org/) information.

## Requirement

Prepare [Upptime](https://upptime.js.org/) monitoring repository for the site.

## Installation

* Plugin:
    * Copy **plugins/upptime.rb** to your **plugins** directory.
* HTML:
    * Copy **source/_includes/custom/asides/upptime.html** to your **source/_includes/custom/asides/**.
    * Or you can put HTML sources in **upptime.html** anywhere you like.

## Usage

Add following configurations in your **_config.yml**:


```
# Your site's name in your upptime.
upptime_name: rcmdnk-blog
# Your upptime's repository.
upptime_url: https://rcmdnk.github.io/upptime
# Your upptime's repository.
upptime_repo: rcmdnk/upptime
# Show graph or not.
upptime_graph: true
# Show response time for each duration or not.
upptime_response: false
upptime_response_day: false
upptime_response_week: true
upptime_response_month: false
upptime_response_year: true
# Show uptime for each duration or not.
upptime_uptime: false
upptime_uptime_day: false
upptime_uptime_week: true
upptime_uptime_month: false
upptime_uptime_year: true
```
