# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    gist_question_service = GistQuestionService.new(@test_passage.current_question)

    # result is a Struct with :url, :gist_hash and :success
    result = gist_question_service.call

    flash_options = if result.success
                      new_gist = current_user.gists.build(question: @test_passage.current_question,
                                                          link: result.html_url,
                                                          gist_hash: result.gist_hash)
                      new_gist.save

                      { notice: t('.success', link: helpers.gist_link(result.html_url)) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end
end
