module API
  class RecomendationsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

    def create
      @recomendation = Recomendation.new(recomendation_params)
      if @recomendation.save
        render :json => {:success => true, :recomendation_id => @recomendation.id}, status: :ok
      else
        render :json => {:success => false}, status: :unprocessable_entity
      end
    end

    private
      def recomendation_params
        params.require(:recomendation).permit(:user_id,:tema,:seccion,
          :recomendacion,:titulo,:trigger,:efecto,:accion,:mitigacion,:imagen)
      end
  end
end
