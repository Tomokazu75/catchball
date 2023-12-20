1000.times do |n|
  Post.create!(
    # n + 1で数字が重複しないようにする
    body: "ultra_test#{n + 1}",
    user_id: 1,
    genre: "Soccer",
    start_time: DateTime.now,
    location: "新宿公園"
  )
end
