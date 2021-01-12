class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction)}
    validates :non_clickbait?

    # def non_clickbait?
    #     if title: "True Facts"

    #     end
    # end

    def non_clickbait?
        unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top[0-9]") || !title.include?("Guess")
            errors.add(:title, "must be clickbait")
        end
    end
end

    


# let(:non_clickbait) { Post.new(valid_attrs.merge(title: "True Facts")) }