require 'wiringpi'

class TelegraphSounder
  SOUNDER_PIN = 1
  DELAY = 0.05

  def self.test
    puts "setting high"
    _wiring.write(SOUNDER_PIN, HIGH)
    sleep 5
    puts "setting low"
    _wiring.write(SOUNDER_PIN, LOW)
  end

  def self.say(str)
    _wiring.write(SOUNDER_PIN, LOW)

    str.split('').each do |char|
      say_char(char)
    end
  end

  def self.say_char(char)
    case char
    when ".": _on(1)
    when "-": _on(3)
    when " ": _off(1)
    end
  end


  def self._off(t)
    sleep(t * DELAY)
  end

  def self._on(t)
    _wiring.write(SOUNDER_PIN, HIGH)
    sleep(t * DELAY)
    _wiring.write(SOUNDER_PIN, LOW)
  end

  def self._wiring
    return @wiring if @wiring
    @wiring = WiringPi::GPIO.new
    @wiring.mode(SOUNDER_PIN, OUTPUT)
    @wiring
  end
end
