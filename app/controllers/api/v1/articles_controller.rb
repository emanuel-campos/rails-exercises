module Api
	module V1
		class ArticlesController < ApplicationController
			# listar todos os artigos
			def index
				articles = Article.order('created_at DESC')
				render json: {status: 'success', message: 'artigos carregados', data: articles}, status: :ok
			end

			#detalhe do artigo passando ID
			def show
				article = Article.find(params[:id])
				render json: {status: 'success', message: 'artigo carregado', data: article}, status: :ok
			end
			
			#adicionar novo artigo
			def create
				article = Article.new(article_params)
				if article.save
					render json: {status: 'success', message: 'artigo adicionado', data: article}, status: :ok
				else
					render json: {status: 'error', message: 'artigo não salvo', data: article.erros}, status: :unprocessable_entity
				end
			end
			
			#paramentros aceitos
			def article_params
				params.permit(:title, :body)
			end
		end
	end
end