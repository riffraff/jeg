require 'test/unit'
require 'rubygems'
require 'json'
require 'open3'

abort("jeg is not in path") if %x{jeg -h}.empty?

class T < Test::Unit::TestCase
  jeg_file=%x(which jeg).chomp
  examples = File.readlines(jeg_file).grep(/jeg .*=>/)
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

  def test_pretty_print
    out =%x' echo {} | jeg -p '
    assert_equal out, "{\n}\n"
  end


  def test_with_trailing_pipe
    Open3.popen3('jeg -a key | head -n 1') do |stdin, stdout, stderr|
      4.times do |i|
        stdin.puts '{"key":"value"}'
        stdin.flush
      end
      stdin.close
      assert_equal "value\n", stdout.read
      assert_equal "", stderr.read
    end
  end
  def test_with_trailing_pipe_sudden_close
    Open3.popen3('jeg -a key') do |stdin, stdout, stderr|
      stdout.close
      4.times do |i|
        stdin.puts '{"key":"value"}'
        stdin.flush
      end
      stdin.close
      assert_equal "", stderr.read
    end
  end
end

