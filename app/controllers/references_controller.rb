class ReferencesController < ApplicationController
   def show
     @reference = Reference.find(params[:id])
   end

   def new
     @reference = Reference.new
   end

   def create
     @reference = Reference.new(reference_params)
     if @reference.save
       flash[:notice] = "Reference successfully added"
       respond_to do |format| # respond_to should be yellow
         format.html {redirect_to '/'}
         format.js

       end
     else
       render :new  # render should be yellow
     end
   end

   def edit
     @reference = Reference.find(params[:id])
   end

   def update
     @reference = Reference.find(params[:id])
     if @reference.update(reference_params)
       flash[:notice] = "Reference successfully updated"
       redirect_to home_path
     else
       render :new
     end
   end

   def destroy
     @reference = Reference.find(params[:id])
     @reference.destroy
     flash[:notice] = "Reference successfully deleted"
     redirect_to home_path
   end

   private

   def reference_params
     params.require(:reference).permit(:name, :company, :email, :phone)
   end
 end
