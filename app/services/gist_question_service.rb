# frozen_string_literal: true

class GistQuestionService
  Result = Struct.new(:html_url, :gist_hash, :success)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.GITHUB_TOKEN)
  end

  # returns a Struct with :url, :gist_hash and :success
  def call
    created_gist = @client.create_gist(gist_params)
    success = created_gist.html_url.present? ? true : false

    Result.new(created_gist.html_url, created_gist.id, success)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question.gist_params.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end
end
