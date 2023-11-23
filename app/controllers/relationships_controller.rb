class RelationshipsController < ApplicationController
  def index
    matching_relationships = Relationship.all

    @list_of_relationships = matching_relationships.order({ :created_at => :desc })

    render({ :template => "relationships/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_relationships = Relationship.where({ :id => the_id })

    @the_relationship = matching_relationships.at(0)

    render({ :template => "relationships/show" })
  end

  def create
    the_relationship = Relationship.new
    the_relationship.sender_id = params.fetch("query_sender_id")
    the_relationship.reciever_id = params.fetch("query_reciever_id")
    the_relationship.request_status = params.fetch("query_request_status")

    if the_relationship.valid?
      the_relationship.save
      redirect_to("/relationships", { :notice => "Relationship created successfully." })
    else
      redirect_to("/relationships", { :alert => the_relationship.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_relationship = Relationship.where({ :id => the_id }).at(0)

    the_relationship.sender_id = params.fetch("query_sender_id")
    the_relationship.reciever_id = params.fetch("query_reciever_id")
    the_relationship.request_status = params.fetch("query_request_status")

    if the_relationship.valid?
      the_relationship.save
      redirect_to("/relationships/#{the_relationship.id}", { :notice => "Relationship updated successfully."} )
    else
      redirect_to("/relationships/#{the_relationship.id}", { :alert => the_relationship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_relationship = Relationship.where({ :id => the_id }).at(0)

    the_relationship.destroy

    redirect_to("/relationships", { :notice => "Relationship deleted successfully."} )
  end
end
