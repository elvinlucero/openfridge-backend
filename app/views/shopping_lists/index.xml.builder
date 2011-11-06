xml.instruct!
xml.shopping_lists do
  xml.good do
    @shopping_lists.each do |f|
      xml.food do
        xml.desc f.desc
        xml.user_id f.user_id
      end
    end
  end
end
