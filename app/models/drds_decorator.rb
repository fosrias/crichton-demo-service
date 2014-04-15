module DrdsDecorator
  def location_options(options)
    #{ 'external' =>
    #      { 'source' => 'https://references-sandbox.imedidata.net/v1/phases',
    #        'target' => 'target',
    #        'prompt' => 'prompt'
    #      }
    #}
    {'list' => ['programmable', 'self-navigation'] }
    #
    #{'hash' => {'1' => 'user1', '2' => 'user2'}}
    #
  end
end