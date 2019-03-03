module Format
  def time_to_i(hour, min)
    Time.find_zone('Pacific Time (US & Canada)')
      .local(2000, 1, 1, hour, min, 0, 0).to_i
  end
end
