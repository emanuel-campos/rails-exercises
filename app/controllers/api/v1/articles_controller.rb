module Api
	module V1
		class ArticlesController < ApplicationController
			# listar todos os artigos
			def index
				articles = Article.order('created_at DESC');
				render json: {status: 'success', message: 'artigos carregados', data: articles}, status: :ok
			end
			#detalhe do artigo passando ID
			def show
				article = Article.find(params[:id]);
				render json: {status: 'success', message: 'artigo carregado', data: article}, status: :ok
			end
		end
	end
end