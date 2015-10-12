require 'clockwork'
include Clockwork
ENV['TZ']='Asia/Tokyo'

every(1.day, 'CaptureStream.job', at:'10:30' ) do
    Dir.chdir("./home/ubuntu/workspace/"){
      puts `ruby CaptureStream.rb`
    }
end

#開始
# $ clockworkd -c clock.rb --log start

#停止
# $ ps -x | grep clock
# $ kill [プロセスID]

# http://qiita.com/ogomr/items/27e9fc7af5b978b5ced6