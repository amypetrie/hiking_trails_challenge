class HikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :vote_count

end
