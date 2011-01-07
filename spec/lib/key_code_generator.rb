class KeyCodeGenerator
  def self.generate
    keys_hash = {}
    key_codes = []
    permitted_keys = ('a'..'z').to_a + (0..9).to_a - [0,1,2,'o','l','z']
    while key_codes.length < 5000
      str = ""
      6.times do
        str << permitted_keys[rand(30)]
      end
      if keys_hash[str].blank?
        keys_hash[str] = 1
        key_codes << str
      end
    end
    key_codes
  end
end
