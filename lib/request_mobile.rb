module RequestMobile

  # "ordered" hash
  MOBILE_USER_AGENTS = [
    {:iphone         => 'i(phone|pod|pad)'},
    {:android        => 'android'},
    {:opera_mini     => 'opera mini'},
    {:blackberry     => 'blackberry'},
    {:palm           => 'palm os|palm|avantgo|plucker|xiino|blazer|elaine|pre/\d'},
    {:sidekick       => 'hiptop'},
    {:windows_mobile => 'windows ce; ppc;|windows ce; smartphone;|windows ce; iemobile'},
    {:symbian        => 'symbian'},
    {:wii            => 'wii'},
    {:playstation    => 'playstation'},
    {:other          => 'up.browser|up.link|mmp|smartphone|midp|wap|vodafone|o2|pocket|kindle|mobile|pda|psp|treo'}
  ]

  def mobile?
    MOBILE_USER_AGENTS.each do |row|
      category, pattern = row.keys.first, row.values.first
      return category if self.headers['HTTP_USER_AGENT'] =~ %r(#{pattern})i
    end
    false
  end

end
