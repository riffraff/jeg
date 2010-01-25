require 'test/unit'
require 'rubygems'
require 'json'
abort("jeg is not in path") if %x{jeg -h}.empty?

class T < Test::Unit::TestCase
  examples = File.readlines('jeg').grep(/jeg .*=>/)
  examples.each_with_index do |line,idx|
    define_method("test_#{idx}")  do
      #p line
      cmd, exp = line.scan(%r-(.*?)=>(.*)-)[0] 
      json, pipe = cmd.split('|')
      res = %x{echo '#{json}' | #{pipe}}
      #print 'json:'+json, 'pipe:'+pipe, 'exp:'+exp, 'res:'+res, "\n"
      if pipe =~ /-f json/
        assert_equal JSON.parse(exp.strip), JSON.parse(res.strip),"#{json} failed with cmd #{cmd}"
      elsif pipe =~ /-f ruby/
        assert_equal eval(exp.strip), eval(res.strip),"#{json} failed with cmd #{cmd}"
      else
        assert_equal exp.strip, res.strip,"#{json} failed with cmd #{cmd}"
      end
    end
  end
end

