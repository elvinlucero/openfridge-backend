xml.instruct!
xml.fridge_foods do
  xml.good do
    @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor > 3}.each do |f|
      xml.food do
        xml.id f.id
        xml.desc f.desc
        xml.user_id f.user_id
        xml.expiration f.expiration
      end
    end
  end
  xml.near do
    @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor < 3 && (f.expiration - Date.current()).floor >= 0 }.each do |f|
      xml.food do 
        xml.id f.id
        xml.desc f.desc
        xml.user_id f.user_id
        xml.expiration f.expiration
      end
    end
  end
  xml.expired do
    @fridge_foods.find_all{|f| f.expiration != nil && (f.expiration - Date.current()).floor < 0}.each do |f|
      xml.food do
        xml.id f.id
        xml.desc f.desc
        xml.user_id f.user_id
        xml.expiration f.expiration
      end
    end
  end
end
