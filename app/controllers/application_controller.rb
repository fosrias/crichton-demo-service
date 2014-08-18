require 'sample_errors'

class ApplicationController < ActionController::Base
  protect_from_forgery

  ERROR_CAUSE = { ActionController::UnpermittedParameters => :unprocessable_entity, ActiveRecord::RecordNotFound => :not_found }

  rescue_from "StandardError" do |e|
    error_cause ||= ERROR_CAUSE[e.exception.class] || :unprocessable_entity
    errors = Sample_errors.new({
      title: e.message,
      details: '',
      error_code: error_cause,
      http_status: Rack::Utils.status_code(error_cause),
      stack_trace: e.backtrace.first,
      controller: self
    })

    respond_to do |format|
      format.html { render text: errors.to_media_type(:xhtml, { semantics: :styled_microdata }), status: error_cause }
      format.hale_json { render text: errors.to_media_type(:hale_json), status: error_cause }
    end
  end
end
