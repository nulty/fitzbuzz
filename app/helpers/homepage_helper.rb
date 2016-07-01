module HomepageHelper
  def page_options
    Array.new(4) do |i|
      Array.new(2) { (i * 25) + 25 }
    end
  end

  def per_page_pref
    session.fetch('per_page') { 100 }
  end
end
