Pod::Spec.new do |s|

# Root specification
  s.name                  = 'PayCardsNoAcquiring'
  s.version               = '1.0'
  s.author                = { 'Mobile Money Solutions Oy' => 'support@pay.cards' }
  s.license               = 'https://pay.cards/pages/terms.html'
  s.homepage              = 'https://pay.cards/'
  s.source                = { :git => 'https://github.com/paycardssdk/PayCardsNoAcquiring.git', :branch => 'master' }
  s.summary               = 'Recognition only'
  s.description           = <<-DESC
                          Pay.Cards is a development tool (SDK) that enables your mobile App scan the bank card data with a phone camera. This is why your customers would love making orders with your App, as it will make their payment process simple and comfortable as never before. The option without acquiring will suit you if your mobile app needs only to get a card number from Pay.Cards. For example in case you are not charging from bank card and plan to use your own gateways for transactions.
                          DESC
  s.documentation_url     = 'https://pay.cards/pages/api_ios_acquiring.html'

# Platform
  s.platform              = :ios, '8.0'

# Build settings
  s.requires_arc            = true
  s.frameworks              = 'CoreMedia', 'AVFoundation'
  s.pod_target_xcconfig     = { 'OTHER_LDFLAGS' => '-ObjC', 'OTHER_LDFLAGS' => '-lC++' }

# File patterns
  s.ios.vendored_frameworks = 'PayCardsNoAcquiring/PayCardsNoAcquiring.framework'
  s.ios.resource            = 'PayCardsNoAcquiring/CRNResources.bundle'
  
end
