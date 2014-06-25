require 'active_support/all'

def get_date
"30/Nov/2009 16:29".to_datetime
end

def difference
@date = DateTime.parse('jun 26 2014')


@date_parsed = @date.to_s
@date_parsed[10..13] = " "
@date_parsed[16..-1] = ""
@parsed = Time.parse(@date_parsed)


@difference = @parsed - Time.now
@minutes = @difference / 60
end