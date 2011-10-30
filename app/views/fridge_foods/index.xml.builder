xml.instruct!
xml.fridge_foods do
  xml.good do
    @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor > 3}.each do |f|
      xml.food do
        xml.desc f.desc
        xml.user_id f.user_id
        xml.expiration f.expiration
      end
    end
  end
  xml.near do
    @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor < 3}.each do |f|
      xml.food do 
        xml.desc f.desc
        xml.user_id f.user_id
        xml.expiration f.expiration
      end
    end
  end
  @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor > 3}.each do |f|
    xml.good do
      xml.desc f.desc
      xml.user_id f.user_id
      xml.expiration f.expiration
    end
  end
end
