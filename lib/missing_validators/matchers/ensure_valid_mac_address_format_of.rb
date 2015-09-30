RSpec::Matchers.define :ensure_valid_mac_address_format_of do |attribute|
  root = 'missing_validators.matchers.ensure_valid_mac_address_format_of'

  match do |model|
    model.send("#{attribute}=", 'invalid.mac.address')
    model.valid?

    if model.errors.to_hash.key?(attribute)
      model.errors[attribute].include?(I18n.t('errors.messages.mac_address'))
    end
  end

  failure_message do |model|
    I18n.t("#{root}.failure_message_for_should", model: model.class)
  end

  failure_message_when_negated do |model|
    I18n.t("#{root}.failure_message_for_should_not", model: model.class)
  end
end
