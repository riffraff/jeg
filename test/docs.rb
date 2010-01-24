require 'test/unit'
require 'rubygems'
require 'json'
class T < Test::Unit::TestCase
  def test_samples
    examples = File.readlines('jeg').grep(/jeg .*=>/)
    examples.each do |line|
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

