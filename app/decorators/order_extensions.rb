module OrderExtensions
  def payment_methods(options)
    { 'external' =>
      { 'source' => 'http://localhost:3000/payments',
        'target' => 'id',
        'prompt' => 'name'
      }
    }
  end
end
