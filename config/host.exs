import Config
alias Clock.LEDAdapter

led_adapter = 
  if Mix.env == :test do
    LEDAdapter.Test
  else
    LEDAdapter.Dev
  end

config :clock, 
  pins: %{0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 =>5}, 
  led_adapter: led_adapter
