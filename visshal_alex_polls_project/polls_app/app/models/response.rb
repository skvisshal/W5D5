class Response < ApplicationRecord

    belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

    belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

    has_one :question,
    through: :answer_choice,
    source: :question

    validate :not_duplicate_response, unless: -> {answer_choice.nil?}
   #validate :no_creator_response, unless: -> {question.poll_id == poll.id && poll.author_id == respondent.id}

    def not_duplicate_response
       raise "duplicate response" if sibling_responses.exists?(user_id: self.user_id)
    end

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end
end