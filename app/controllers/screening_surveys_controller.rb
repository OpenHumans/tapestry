class ScreeningSurveysController < ApplicationController
  skip_before_filter :ensure_enrolled
  before_filter :redirect_to_enrollment_steps_if_screening_surveys_complete, :only => :index
  before_filter :fetch_or_create_response

  def model_name
    "ScreeningSurveyResponse"
  end

  def update
    if @screening_survey_response.update_attributes(params[:screening_survey_response])
      if current_user.has_completed?('screening_surveys')
        step = EnrollmentStep.find_by_keyword('screening_surveys')
        current_user.log('Completed Eligibility Questionnaire',step)
        flash[:notice] = 'You have completed the eligibility questionnaire.  Please continue to the questionnaire results.'
      else
        # People who submit partial results to the eligibility questionnaire, before completing it even once
        flash[:notice] = 'Your eligibility questionnaire answers have been updated.'
      end
      redirect_to root_path
    else
      render :action => 'show'
    end
  end

  def results
    @passed = @screening_survey_response.passed?
    @screening_survey_response.complete_results_enrollment_step_if_passed
  end

  protected

  def fetch_or_create_response
    @screening_survey_response = current_user.screening_survey_response ||
                                 ScreeningSurveyResponse.new(:user => current_user)
  end

  def redirect_to_enrollment_steps_if_screening_surveys_complete
    if current_user.has_completed?('screening_surveys')
      flash[:notice] = 'You have completed the eligibility questionnaire.  Please continue to the questionnaire results.'
      redirect_to root_path
    end
  end
end
