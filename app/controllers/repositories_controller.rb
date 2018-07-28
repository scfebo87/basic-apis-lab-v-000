class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get ('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = 'd451b1d5dc85f7ddb401'

      req.params['client_secret'] = '3f86147807007ea772ff84bf26f1b6bf9fbb46a1'
      req.params['q'] = params[:query]
    end
   body = JSON.parse(@resp.body)
   @results = body['items']
  render 'search'
  end
end
