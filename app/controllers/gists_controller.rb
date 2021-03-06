# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success
                      new_gist = current_user.gists.build(question: @test_passage.current_question,
                                                          link: result.html_url,
                                                          gist_hash: result.gist_hash)
                      new_gist.save

                      { notice: t('.success_html', link: result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end
end
