require 'digest'

def is_pwnd? address, addresses
  search = Digest::SHA256.hexdigest "#{address}"
  if addresses.include?(search)
    true
  else
    false
  end
end