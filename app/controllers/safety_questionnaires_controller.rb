class SafetyQuestionnairesController < ApplicationController
  skip_before_filter :ensure_active, :only => [ :new, :create, :require ]
  skip_before_filter :ensure_recent_safety_questionnaire
  skip_before_filter :ensure_dataset_release

  def require
    # This is just a sanity check; unenrolled users accessing this view would otherwise
    # get a rails error.
    if not current_user.enrolled then
      redirect_to root_url
    end
  end

  def index
    @safety_questionnaires = current_user.safety_questionnaires.sort { |x,y| y.datetime <=> x.datetime }
  end

  def new
    @safety_questionnaire = SafetyQuestionnaire.new()
  end

  def show
    # find_by_id returns nil when the record does not exist; find throws an ActiveRecord::RecordNotFound
    @safety_questionnaire = SafetyQuestionnaire.find_by_id(params[:id])
    if @safety_questionnaire.nil? or (!current_user.is_admin? && @safety_questionnaire.user != current_user) then
      flash[:error] = 'Invalid id'
      redirect_to root_url
    end
  end

  def create
    @safety_questionnaire = SafetyQuestionnaire.new(params[:safety_questionnaire])
    @safety_questionnaire.user = current_user
    @safety_questionnaire.datetime = Time.now()
    if @safety_questionnaire.save
      flash[:notice] = 'Safety Questionnaire answers successfully saved.'
      @safety_questionnaire.user.auto_reactivate_if_possible
      if @safety_questionnaire.has_changes
        UserMailer.safety_questionnaire_staff_notification(current_user,@safety_questionnaire).deliver
      end
      redirect_back_or_default(root_url)
    else
      render :action => 'new'
    end
  end

end
