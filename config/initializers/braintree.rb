Braintree::Configuration.environment = Rails.application.secrets.BRAINTREE_ENV
Braintree::Configuration.merchant_id = Rails.application.secrets.BRAINTREE_MERCHANT_ID
Braintree::Configuration.public_key = Rails.application.secrets.BRAINTREE_PUBLIC_KEY
Braintree::Configuration.private_key = Rails.application.secrets.BRAINTREE_PRIVATE_KEY