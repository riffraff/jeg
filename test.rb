require 'test/unit'
require 'rubygems'
require 'json'
class T < Test::Unit::TestCase
  def test_samples
    examples = File.readlines('jeg').grep(/jeg .*=>/)
    examples.each do |line|
      #p line
      cmd, exp = line.split('=>') 
      json, pipe = cmd.split('|')
      res = %x{echo '#{json}' | #{pipe}}
      #print 'json:'+json, 'pipe:'+pipe, 'exp:'+exp, 'res:'+res, "\n"
      assert_equal JSON.parse(exp.strip), JSON.parse(res.strip),"#{json} failed"
    end
  end
end

