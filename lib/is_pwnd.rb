def is_pwnd? address, addresses
  search = "#{address}"
  if addresses.include?(search)
    true
  else
    false
  end
end