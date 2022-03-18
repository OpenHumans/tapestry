# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20220205094800) do

  create_table "absolute_pitch_survey_family_histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "relation"
    t.string   "plays_instrument"
    t.string   "has_absolute_pitch"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "absolute_pitch_survey_family_history_versions", :force => true do |t|
    t.integer  "absolute_pitch_survey_family_history_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "relation"
    t.string   "plays_instrument"
    t.string   "has_absolute_pitch"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "absolute_pitch_survey_family_history_versions", ["absolute_pitch_survey_family_history_id"], :name => "index_absolute_pitch_survey_family_history_versions_on_absolute"

  create_table "allergies", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "severity"
    t.string   "codes"
    t.string   "status"
    t.integer  "allergy_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "allergies", ["allergy_description_id"], :name => "index_allergies_on_allergy_description_id"
  add_index "allergies", ["ccr_id"], :name => "index_allergies_on_ccr_id"

  create_table "allergy_description_versions", :force => true do |t|
    t.integer  "allergy_description_id"
    t.integer  "lock_version"
    t.string   "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "allergy_description_versions", ["allergy_description_id"], :name => "index_allergy_description_versions_on_allergy_description_id"

  create_table "allergy_descriptions", :force => true do |t|
    t.string   "description",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "allergy_descriptions", ["description"], :name => "index_allergy_descriptions_on_description", :unique => true

  create_table "allergy_versions", :force => true do |t|
    t.integer  "allergy_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "severity"
    t.string   "codes"
    t.string   "status"
    t.integer  "allergy_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "allergy_versions", ["allergy_id"], :name => "index_allergy_versions_on_allergy_id"

  create_table "answer_option_versions", :force => true do |t|
    t.integer  "answer_option_id"
    t.integer  "lock_version"
    t.integer  "exam_question_id"
    t.text     "answer"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "answer_option_versions", ["answer_option_id"], :name => "index_answer_option_versions_on_answer_option_id"

  create_table "answer_options", :force => true do |t|
    t.integer  "exam_question_id"
    t.text     "answer"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "answer_options", ["exam_question_id"], :name => "index_answer_options_on_exam_question_id"

  create_table "arvados_job_versions", :force => true do |t|
    t.integer  "arvados_job_id"
    t.integer  "version"
    t.string   "uuid"
    t.text     "oncomplete"
    t.text     "onerror"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arvados_job_versions", ["arvados_job_id"], :name => "index_arvados_job_versions_on_arvados_job_id"

  create_table "arvados_jobs", :force => true do |t|
    t.string   "uuid"
    t.text     "oncomplete"
    t.text     "onerror"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  create_table "baseline_traits_survey_versions", :force => true do |t|
    t.integer  "baseline_traits_survey_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "sex"
    t.boolean  "health_insurance",             :default => false
    t.boolean  "health_or_medical_conditions", :default => false
    t.boolean  "prescriptions_in_last_year",   :default => false
    t.boolean  "allergies",                    :default => false
    t.boolean  "asian",                        :default => false
    t.boolean  "black",                        :default => false
    t.boolean  "hispanic",                     :default => false
    t.boolean  "native",                       :default => false
    t.boolean  "pacific",                      :default => false
    t.boolean  "white",                        :default => false
    t.string   "birth_year"
    t.boolean  "citizen",                      :default => false
    t.string   "birth_country"
    t.string   "paternal_grandfather_born_in"
    t.string   "paternal_grandmother_born_in"
    t.string   "maternal_grandfather_born_in"
    t.string   "maternal_grandmother_born_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "baseline_traits_survey_versions", ["baseline_traits_survey_id"], :name => "index_baseline_traits_survey_versions_on_baseline_traits_survey"

  create_table "baseline_traits_surveys", :force => true do |t|
    t.integer  "user_id"
    t.string   "sex"
    t.boolean  "health_insurance",             :default => false, :null => false
    t.boolean  "health_or_medical_conditions", :default => false, :null => false
    t.boolean  "prescriptions_in_last_year",   :default => false, :null => false
    t.boolean  "allergies",                    :default => false, :null => false
    t.boolean  "asian",                        :default => false, :null => false
    t.boolean  "black",                        :default => false, :null => false
    t.boolean  "hispanic",                     :default => false, :null => false
    t.boolean  "native",                       :default => false, :null => false
    t.boolean  "pacific",                      :default => false, :null => false
    t.boolean  "white",                        :default => false, :null => false
    t.string   "birth_year"
    t.boolean  "citizen",                      :default => false, :null => false
    t.string   "birth_country"
    t.string   "paternal_grandfather_born_in"
    t.string   "paternal_grandmother_born_in"
    t.string   "maternal_grandfather_born_in"
    t.string   "maternal_grandmother_born_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "bulk_message_recipient_versions", :force => true do |t|
    t.integer  "bulk_message_recipient_id"
    t.integer  "lock_version"
    t.integer  "bulk_message_id"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bulk_message_recipient_versions", ["bulk_message_recipient_id"], :name => "index_bulk_message_recipient_versions_on_bulk_message_recipient"

  create_table "bulk_message_recipients", :force => true do |t|
    t.integer  "bulk_message_id"
    t.integer  "user_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "bulk_message_recipients", ["bulk_message_id"], :name => "index_bulk_message_recipients_on_bulk_message_id"
  add_index "bulk_message_recipients", ["user_id"], :name => "index_bulk_message_recipients_on_user_id"

  create_table "bulk_message_versions", :force => true do |t|
    t.integer  "bulk_message_id"
    t.integer  "lock_version"
    t.string   "subject"
    t.text     "body"
    t.boolean  "sent",            :default => false
    t.datetime "sent_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "tested",          :default => false
    t.datetime "tested_at"
  end

  add_index "bulk_message_versions", ["bulk_message_id"], :name => "index_bulk_message_versions_on_bulk_message_id"

  create_table "bulk_messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.boolean  "sent",         :default => false
    t.datetime "sent_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.boolean  "tested",       :default => false
    t.datetime "tested_at"
  end

  create_table "ccr_versions", :force => true do |t|
    t.integer  "ccr_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "ccr_versions", ["ccr_id"], :name => "index_ccr_versions_on_ccr_id"

  create_table "ccrs", :force => true do |t|
    t.integer  "user_id"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.string   "origin"
  end

  create_table "condition_description_versions", :force => true do |t|
    t.integer  "condition_description_id"
    t.integer  "lock_version"
    t.string   "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "condition_description_versions", ["condition_description_id"], :name => "index_condition_description_versions_on_condition_description_i"

  create_table "condition_descriptions", :force => true do |t|
    t.string   "description",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "condition_descriptions", ["description"], :name => "index_condition_descriptions_on_description", :unique => true

  create_table "condition_versions", :force => true do |t|
    t.integer  "condition_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "codes"
    t.string   "status"
    t.integer  "condition_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "condition_versions", ["condition_id"], :name => "index_condition_versions_on_condition_id"

  create_table "conditions", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "codes"
    t.string   "status"
    t.integer  "condition_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "conditions", ["ccr_id"], :name => "index_conditions_on_ccr_id"
  add_index "conditions", ["condition_description_id"], :name => "index_conditions_on_condition_description_id"

  create_table "content_area_versions", :force => true do |t|
    t.integer  "content_area_id"
    t.integer  "lock_version"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordinal"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "content_area_versions", ["content_area_id"], :name => "index_content_area_versions_on_content_area_id"

  create_table "content_areas", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordinal"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "dataset_report_versions", :force => true do |t|
    t.integer  "dataset_report_id"
    t.integer  "lock_version"
    t.integer  "dataset_id"
    t.integer  "user_file_id"
    t.string   "title"
    t.string   "display_url"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dataset_report_versions", ["dataset_report_id"], :name => "index_dataset_report_versions_on_dataset_report_id"

  create_table "dataset_reports", :force => true do |t|
    t.integer  "dataset_id"
    t.integer  "user_file_id"
    t.string   "title"
    t.string   "display_url"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "dataset_versions", :force => true do |t|
    t.integer  "dataset_id"
    t.integer  "version"
    t.integer  "participant_id"
    t.string   "human_id"
    t.string   "sha1"
    t.string   "location"
    t.string   "build"
    t.string   "name"
    t.text     "researcher_notes"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "released_to_participant",               :default => false
    t.string   "locator",                               :default => ""
    t.datetime "sent_notification_at"
    t.datetime "seen_by_participant_at"
    t.datetime "published_at"
    t.integer  "sample_id"
    t.string   "status_url"
    t.string   "download_url"
    t.text     "processing_status"
    t.boolean  "processing_stopped",                    :default => true,  :null => false
    t.integer  "data_size",                :limit => 8
    t.text     "report_metadata"
    t.datetime "published_anonymously_at"
    t.string   "path_in_manifest"
    t.integer  "index_in_manifest"
  end

  add_index "dataset_versions", ["dataset_id"], :name => "index_dataset_versions_on_dataset_id"

  create_table "datasets", :force => true do |t|
    t.integer  "participant_id"
    t.string   "human_id"
    t.string   "sha1"
    t.string   "location"
    t.string   "build"
    t.string   "name"
    t.text     "researcher_notes"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "released_to_participant",               :default => false
    t.string   "locator",                               :default => ""
    t.datetime "sent_notification_at"
    t.datetime "seen_by_participant_at"
    t.datetime "published_at"
    t.integer  "sample_id"
    t.string   "status_url"
    t.string   "download_url"
    t.text     "processing_status"
    t.boolean  "processing_stopped",                    :default => true,  :null => false
    t.integer  "data_size",                :limit => 8
    t.text     "report_metadata"
    t.datetime "published_anonymously_at"
    t.string   "path_in_manifest"
    t.integer  "index_in_manifest"
  end

  add_index "datasets", ["participant_id"], :name => "index_datasets_on_participant_id"
  add_index "datasets", ["sha1"], :name => "index_datasets_on_sha1"

  create_table "demographic_versions", :force => true do |t|
    t.integer  "demographic_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "dob"
    t.string   "gender"
    t.integer  "weight_oz",      :limit => 8
    t.integer  "height_in",      :limit => 8
    t.string   "blood_type"
    t.string   "race"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "demographic_versions", ["demographic_id"], :name => "index_demographic_versions_on_demographic_id"

  create_table "demographics", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "dob"
    t.string   "gender"
    t.decimal  "weight_oz",    :precision => 10, :scale => 0
    t.decimal  "height_in",    :precision => 10, :scale => 0
    t.string   "blood_type"
    t.string   "race"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "device_type_versions", :force => true do |t|
    t.integer  "device_type_id"
    t.integer  "lock_version"
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "device_type_versions", ["device_type_id"], :name => "index_device_type_versions_on_device_type_id"

  create_table "device_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "distinctive_trait_versions", :force => true do |t|
    t.integer  "distinctive_trait_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "distinctive_trait_versions", ["distinctive_trait_id"], :name => "index_distinctive_trait_versions_on_distinctive_trait_id"

  create_table "distinctive_traits", :force => true do |t|
    t.string   "name"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "document_versions", :force => true do |t|
    t.integer  "document_id"
    t.integer  "lock_version"
    t.string   "keyword"
    t.integer  "user_id"
    t.string   "version"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "document_versions", ["document_id"], :name => "index_document_versions_on_document_id"

  create_table "documents", :force => true do |t|
    t.string   "keyword"
    t.integer  "user_id"
    t.string   "version"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "enrollment_step_completion_versions", :force => true do |t|
    t.integer  "enrollment_step_completion_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "enrollment_step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "enrollment_step_completion_versions", ["enrollment_step_completion_id"], :name => "index_enrollment_step_completion_versions_on_enrollment_step_co"

  create_table "enrollment_step_completions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "enrollment_step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "enrollment_step_completions", ["enrollment_step_id"], :name => "index_enrollment_step_completions_on_enrollment_step_id"
  add_index "enrollment_step_completions", ["user_id"], :name => "index_enrollment_step_completions_on_user_id"

  create_table "enrollment_step_versions", :force => true do |t|
    t.integer  "enrollment_step_id"
    t.integer  "lock_version"
    t.string   "keyword"
    t.integer  "ordinal"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phase"
    t.string   "duration"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "enrollment_step_versions", ["enrollment_step_id"], :name => "index_enrollment_step_versions_on_enrollment_step_id"

  create_table "enrollment_steps", :force => true do |t|
    t.string   "keyword"
    t.integer  "ordinal"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phase"
    t.string   "duration"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "exam_questions", :force => true do |t|
    t.integer  "exam_version_id"
    t.string   "kind"
    t.integer  "ordinal"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_questions", ["exam_version_id"], :name => "index_exam_questions_on_exam_version_id"

  create_table "exam_responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exam_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "original_user_id"
  end

  add_index "exam_responses", ["exam_version_id"], :name => "index_exam_responses_on_exam_version_id"
  add_index "exam_responses", ["original_user_id"], :name => "index_exam_responses_on_original_user_id"
  add_index "exam_responses", ["user_id"], :name => "index_exam_responses_on_user_id"

  create_table "exam_versions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.integer  "version"
    t.boolean  "published",   :default => false, :null => false
    t.integer  "ordinal"
  end

  add_index "exam_versions", ["exam_id"], :name => "index_exam_versions_on_exam_id"

  create_table "exams", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "content_area_id"
  end

  add_index "exams", ["content_area_id"], :name => "index_exams_on_content_area_id"

  create_table "external_blog_posts", :force => true do |t|
    t.string   "feed_url"
    t.datetime "retrieved_at"
    t.datetime "posted_at"
    t.string   "post_url"
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "external_blog_posts", ["feed_url", "post_url"], :name => "index_external_blog_posts_on_feed_url_and_post_url", :unique => true

  create_table "family_relation_versions", :force => true do |t|
    t.integer  "family_relation_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "relative_id"
    t.string   "relation"
    t.boolean  "is_confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "family_relation_versions", ["family_relation_id"], :name => "index_family_relation_versions_on_family_relation_id"

  create_table "family_relations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "relative_id"
    t.string   "relation"
    t.boolean  "is_confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "family_survey_response_versions", :force => true do |t|
    t.integer  "family_survey_response_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "birth_year"
    t.string   "relatives_interested_in_pgp"
    t.string   "monozygotic_twin"
    t.string   "child_situation"
    t.integer  "youngest_child_birth_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "family_survey_response_versions", ["family_survey_response_id"], :name => "index_family_survey_response_versions_on_family_survey_response"

  create_table "family_survey_responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "birth_year"
    t.string   "relatives_interested_in_pgp"
    t.string   "monozygotic_twin"
    t.string   "child_situation"
    t.integer  "youngest_child_birth_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "family_survey_responses", ["user_id"], :name => "index_family_survey_responses_on_user_id"

  create_table "google_spreadsheet_rows", :force => true do |t|
    t.integer  "google_spreadsheet_id"
    t.integer  "row_number"
    t.text     "row_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "google_spreadsheet_rows", ["google_spreadsheet_id", "row_number"], :name => "index_google_spreadsheet_rows_on_spreadsheet_and_row_number", :unique => true

  create_table "google_spreadsheet_versions", :force => true do |t|
    t.integer  "google_spreadsheet_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "oauth_service_id"
    t.string   "name"
    t.text     "description"
    t.string   "gdocs_url"
    t.string   "rowtarget_type"
    t.string   "rowtarget_id_attribute"
    t.string   "rowtarget_data_attribute"
    t.integer  "row_id_column"
    t.integer  "auto_update_interval"
    t.boolean  "is_auto_update_enabled"
    t.datetime "last_downloaded_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "header_row"
  end

  add_index "google_spreadsheet_versions", ["google_spreadsheet_id"], :name => "index_google_spreadsheet_versions_on_google_spreadsheet_id"

  create_table "google_spreadsheets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "oauth_service_id"
    t.string   "name"
    t.text     "description"
    t.string   "gdocs_url"
    t.string   "rowtarget_type"
    t.string   "rowtarget_id_attribute"
    t.string   "rowtarget_data_attribute"
    t.integer  "row_id_column"
    t.integer  "auto_update_interval"
    t.boolean  "is_auto_update_enabled"
    t.datetime "last_downloaded_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.text     "header_row"
  end

  create_table "google_survey_answer_versions", :force => true do |t|
    t.integer  "google_survey_answer_id"
    t.integer  "lock_version"
    t.integer  "google_survey_id"
    t.integer  "column"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nonce_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "google_survey_answer_versions", ["google_survey_answer_id"], :name => "index_google_survey_answer_versions_on_google_survey_answer_id"

  create_table "google_survey_answers", :force => true do |t|
    t.integer  "google_survey_id"
    t.integer  "column"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nonce_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "google_survey_answers", ["nonce_id"], :name => "index_google_survey_answers_on_nonce_id"

  create_table "google_survey_bypass", :force => true do |t|
    t.integer  "user_id"
    t.integer  "google_survey_id"
    t.string   "token"
    t.datetime "used"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "google_survey_bypass_versions", :force => true do |t|
    t.integer  "google_survey_bypass_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "google_survey_id"
    t.string   "token"
    t.datetime "used"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "google_survey_bypass_versions", ["google_survey_bypass_id"], :name => "index_google_survey_bypass_versions_on_google_survey_bypass_id"

  create_table "google_survey_bypasses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "google_survey_id"
    t.string   "token"
    t.datetime "used"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "google_survey_question_versions", :force => true do |t|
    t.integer  "google_survey_question_id"
    t.integer  "lock_version"
    t.integer  "google_survey_id"
    t.integer  "column"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_hidden"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "google_survey_question_versions", ["google_survey_question_id"], :name => "index_google_survey_question_versions_on_google_survey_question"

  create_table "google_survey_questions", :force => true do |t|
    t.integer  "google_survey_id"
    t.integer  "column"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_hidden"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "google_survey_reminder_versions", :force => true do |t|
    t.integer  "google_survey_reminder_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "google_survey_id"
    t.integer  "frequency",                 :default => 0
    t.datetime "last_sent"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "google_survey_reminder_versions", ["google_survey_reminder_id"], :name => "index_google_survey_reminder_versions_on_google_survey_reminder"

  create_table "google_survey_reminders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "google_survey_id"
    t.integer  "frequency",        :default => 0
    t.datetime "last_sent"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "google_survey_versions", :force => true do |t|
    t.integer  "google_survey_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "oauth_service_id"
    t.string   "spreadsheet_key"
    t.string   "userid_hash_secret"
    t.integer  "userid_populate_entry"
    t.integer  "userid_response_column"
    t.datetime "last_downloaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "form_url"
    t.boolean  "open"
    t.text     "description"
    t.boolean  "is_result_public",         :default => true
    t.boolean  "is_listed",                :default => true
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.string   "reminder_email_subject"
    t.text     "reminder_email_body"
    t.string   "reminder_email_frequency"
    t.string   "bypass_field_title"
  end

  add_index "google_survey_versions", ["google_survey_id"], :name => "index_google_survey_versions_on_google_survey_id"

  create_table "google_surveys", :force => true do |t|
    t.integer  "user_id"
    t.integer  "oauth_service_id"
    t.string   "spreadsheet_key"
    t.string   "userid_hash_secret"
    t.integer  "userid_populate_entry"
    t.integer  "userid_response_column"
    t.datetime "last_downloaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "form_url"
    t.boolean  "open"
    t.text     "description"
    t.boolean  "is_result_public",         :default => true
    t.boolean  "is_listed",                :default => true
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.string   "reminder_email_subject"
    t.text     "reminder_email_body"
    t.string   "reminder_email_frequency"
    t.string   "bypass_field_title"
  end

  create_table "immunization_name_versions", :force => true do |t|
    t.integer  "immunization_name_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "immunization_name_versions", ["immunization_name_id"], :name => "index_immunization_name_versions_on_immunization_name_id"

  create_table "immunization_names", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "immunization_names", ["name"], :name => "index_immunization_names_on_name", :unique => true

  create_table "immunization_versions", :force => true do |t|
    t.integer  "immunization_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.integer  "immunization_name_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "immunization_versions", ["immunization_id"], :name => "index_immunization_versions_on_immunization_id"

  create_table "immunizations", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.integer  "immunization_name_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "immunizations", ["ccr_id"], :name => "index_immunizations_on_ccr_id"
  add_index "immunizations", ["immunization_name_id"], :name => "index_immunizations_on_immunization_name_id"

  create_table "informed_consent_response_versions", :force => true do |t|
    t.integer  "informed_consent_response_id"
    t.integer  "lock_version"
    t.integer  "twin",                         :limit => 1
    t.integer  "biopsy",                       :limit => 1
    t.integer  "recontact",                    :limit => 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "informed_consent_response_versions", ["informed_consent_response_id"], :name => "index_informed_consent_response_versions_on_informed_consent_re"

  create_table "informed_consent_responses", :force => true do |t|
    t.integer  "twin",          :limit => 1
    t.integer  "biopsy",        :limit => 1
    t.integer  "recontact",     :limit => 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.text     "other_answers"
  end

  create_table "international_participant_versions", :force => true do |t|
    t.integer  "international_participant_id"
    t.integer  "lock_version"
    t.string   "email"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "international_participant_versions", ["international_participant_id"], :name => "index_international_participant_versions_on_international_parti"

  create_table "international_participants", :force => true do |t|
    t.string   "email"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "invited_email_versions", :force => true do |t|
    t.integer  "invited_email_id"
    t.integer  "lock_version"
    t.string   "email"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "invited_email_versions", ["invited_email_id"], :name => "index_invited_email_versions_on_invited_email_id"

  create_table "invited_emails", :force => true do |t|
    t.string   "email"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "kit_design_sample_versions", :force => true do |t|
    t.integer  "kit_design_sample_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "kit_design_id"
    t.string   "tissue"
    t.string   "device"
    t.text     "description"
    t.string   "target_amount"
    t.string   "unit"
    t.integer  "sort_order"
    t.boolean  "frozen"
    t.text     "errata"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kit_design_sample_versions", ["kit_design_sample_id"], :name => "index_kit_design_sample_versions_on_kit_design_sample_id"

  create_table "kit_design_samples", :force => true do |t|
    t.string   "name"
    t.integer  "kit_design_id"
    t.string   "tissue"
    t.string   "device"
    t.text     "description"
    t.string   "target_amount"
    t.string   "unit"
    t.integer  "sort_order"
    t.boolean  "frozen"
    t.text     "errata"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "kit_design_versions", :force => true do |t|
    t.integer  "kit_design_id"
    t.integer  "lock_version"
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "study_id"
    t.boolean  "frozen"
    t.text     "errata"
    t.string   "instructions_file_name"
    t.string   "instructions_content_type"
    t.integer  "instructions_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "kit_design_versions", ["kit_design_id"], :name => "index_kit_design_versions_on_kit_design_id"

  create_table "kit_designs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "study_id"
    t.boolean  "frozen",                    :default => false
    t.text     "errata"
    t.string   "instructions_file_name"
    t.string   "instructions_content_type"
    t.integer  "instructions_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "kit_log_versions", :force => true do |t|
    t.integer  "kit_log_id"
    t.integer  "lock_version"
    t.integer  "kit_id"
    t.integer  "actor_id"
    t.text     "comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "controlling_user_id"
  end

  add_index "kit_log_versions", ["kit_log_id"], :name => "index_kit_log_versions_on_kit_log_id"

  create_table "kit_logs", :force => true do |t|
    t.integer  "kit_id"
    t.integer  "actor_id"
    t.text     "comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.integer  "controlling_user_id"
  end

  create_table "kit_versions", :force => true do |t|
    t.integer  "kit_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "crc_id"
    t.integer  "study_id"
    t.integer  "kit_design_id"
    t.integer  "participant_id"
    t.integer  "owner_id"
    t.integer  "originator_id"
    t.integer  "shipper_id"
    t.datetime "last_mailed"
    t.datetime "last_received"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "lost_at"
  end

  add_index "kit_versions", ["kit_id"], :name => "index_kit_versions_on_kit_id"

  create_table "kits", :force => true do |t|
    t.string   "name"
    t.integer  "crc_id"
    t.integer  "study_id"
    t.integer  "kit_design_id"
    t.integer  "participant_id"
    t.integer  "owner_id"
    t.integer  "originator_id"
    t.integer  "shipper_id"
    t.datetime "last_mailed"
    t.datetime "last_received"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.datetime "lost_at"
  end

  add_index "kits", ["crc_id"], :name => "index_kits_on_crc_id", :unique => true
  add_index "kits", ["name"], :name => "index_kits_on_name", :unique => true
  add_index "kits", ["url_code"], :name => "index_kits_on_url_code", :unique => true

  create_table "lab_test_result_description_versions", :force => true do |t|
    t.integer  "lab_test_result_description_id"
    t.integer  "lock_version"
    t.string   "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "lab_test_result_description_versions", ["lab_test_result_description_id"], :name => "index_lab_test_result_description_versions_on_lab_test_result_d"

  create_table "lab_test_result_descriptions", :force => true do |t|
    t.string   "description",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "lab_test_result_descriptions", ["description"], :name => "index_lab_test_result_descriptions_on_description", :unique => true

  create_table "lab_test_result_versions", :force => true do |t|
    t.integer  "lab_test_result_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.string   "value"
    t.string   "units"
    t.integer  "lab_test_result_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "lab_test_result_versions", ["lab_test_result_id"], :name => "index_lab_test_result_versions_on_lab_test_result_id"

  create_table "lab_test_results", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.string   "value"
    t.string   "units"
    t.integer  "lab_test_result_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "lab_test_results", ["ccr_id"], :name => "index_lab_test_results_on_ccr_id"
  add_index "lab_test_results", ["lab_test_result_description_id"], :name => "index_lab_test_results_on_lab_test_result_description_id"

  create_table "mailing_list_subscription_versions", :force => true do |t|
    t.integer  "mailing_list_subscription_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "mailing_list_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "mailing_list_subscription_versions", ["mailing_list_subscription_id"], :name => "index_mailing_list_subscription_versions_on_mailing_list_subscr"

  create_table "mailing_list_subscriptions", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "mailing_list_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "mailing_list_subscriptions", ["user_id", "mailing_list_id"], :name => "index_mailing_list_subscriptions_on_user_id_and_mailing_list_id", :unique => true

  create_table "mailing_list_versions", :force => true do |t|
    t.integer  "mailing_list_id"
    t.integer  "lock_version"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "mailing_list_versions", ["mailing_list_id"], :name => "index_mailing_list_versions_on_mailing_list_id"

  create_table "mailing_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "medication_name_versions", :force => true do |t|
    t.integer  "medication_name_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "medication_name_versions", ["medication_name_id"], :name => "index_medication_name_versions_on_medication_name_id"

  create_table "medication_names", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "medication_names", ["name"], :name => "index_medication_names_on_name", :unique => true

  create_table "medication_versions", :force => true do |t|
    t.integer  "medication_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "codes"
    t.string   "strength"
    t.string   "dose"
    t.string   "frequency"
    t.string   "route"
    t.string   "route_codes"
    t.string   "status"
    t.integer  "medication_name_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.boolean  "is_refill"
    t.string   "author_name"
  end

  add_index "medication_versions", ["medication_id"], :name => "index_medication_versions_on_medication_id"

  create_table "medications", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "codes"
    t.string   "strength"
    t.string   "dose"
    t.string   "frequency"
    t.string   "route"
    t.string   "route_codes"
    t.string   "status"
    t.integer  "medication_name_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.boolean  "is_refill"
    t.string   "author_name"
  end

  add_index "medications", ["ccr_id"], :name => "index_medications_on_ccr_id"
  add_index "medications", ["medication_name_id"], :name => "index_medications_on_medication_name_id"

  create_table "named_proxies", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.boolean  "bad_email",    :default => false
  end

  create_table "named_proxy_versions", :force => true do |t|
    t.integer  "named_proxy_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.boolean  "bad_email"
  end

  add_index "named_proxy_versions", ["named_proxy_id"], :name => "index_named_proxy_versions_on_named_proxy_id"

  create_table "next_hexes", :force => true do |t|
    t.string   "hex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nonce_versions", :force => true do |t|
    t.integer  "nonce_id"
    t.integer  "lock_version"
    t.integer  "owner_id"
    t.string   "nonce"
    t.datetime "created_at"
    t.datetime "used_at"
    t.datetime "updated_at"
    t.string   "owner_class"
    t.integer  "target_id"
    t.string   "target_class"
    t.datetime "deleted"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "nonce_versions", ["nonce_id"], :name => "index_nonce_versions_on_nonce_id"

  create_table "nonces", :force => true do |t|
    t.integer  "owner_id"
    t.string   "nonce"
    t.datetime "created_at"
    t.datetime "used_at"
    t.datetime "updated_at"
    t.string   "owner_class"
    t.integer  "target_id"
    t.string   "target_class"
    t.datetime "deleted"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "nonces", ["nonce"], :name => "index_nonces_on_nonce"

  create_table "oauth_services", :force => true do |t|
    t.string   "name"
    t.string   "scope"
    t.string   "consumerkey"
    t.text     "privatekey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth2_service_type"
    t.string   "oauth2_key"
    t.text     "oauth2_secret"
    t.string   "endpoint_url"
    t.string   "callback_url"
  end

  create_table "oauth_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "oauth_service_id"
    t.string   "requesttoken"
    t.string   "accesstoken"
    t.string   "nonce"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "oauth2_token_hash"
  end

  create_table "permission_versions", :force => true do |t|
    t.integer  "permission_id"
    t.integer  "lock_version"
    t.integer  "granted_by_id"
    t.integer  "granted_to_id"
    t.string   "name"
    t.string   "description"
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permission_versions", ["permission_id"], :name => "index_permission_versions_on_permission_id"

  create_table "permissions", :force => true do |t|
    t.integer  "granted_by_id"
    t.integer  "granted_to_id"
    t.string   "name"
    t.string   "description"
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "phase_completions", :force => true do |t|
    t.string   "phase"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phase_completions", ["user_id"], :name => "index_phase_completions_on_user_id"

  create_table "plate_layout_masks", :force => true do |t|
    t.string   "name"
    t.integer  "xmodulus"
    t.integer  "ymodulus"
    t.integer  "xtarget"
    t.integer  "ytarget"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plate_layout_masks", ["xmodulus", "ymodulus", "xtarget", "ytarget"], :name => "plate_layout_masks_on_modulus_and_target", :unique => true

  create_table "plate_layout_position_versions", :force => true do |t|
    t.integer  "plate_layout_position_id"
    t.integer  "lock_version"
    t.integer  "plate_layout_id"
    t.integer  "xpos"
    t.integer  "ypos"
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plate_layout_position_versions", ["plate_layout_position_id"], :name => "index_plate_layout_position_versions_on_plate_layout_position_i"

  create_table "plate_layout_positions", :force => true do |t|
    t.integer  "plate_layout_id"
    t.integer  "xpos"
    t.integer  "ypos"
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "plate_layout_positions", ["plate_layout_id", "name"], :name => "index_plate_layout_positions_on_plate_layout_id_and_name", :unique => true
  add_index "plate_layout_positions", ["plate_layout_id", "xpos", "ypos"], :name => "index_plate_layout_positions_on_plate_layout_id_xpos_ypos", :unique => true

  create_table "plate_layout_versions", :force => true do |t|
    t.integer  "plate_layout_id"
    t.integer  "lock_version"
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plate_layout_versions", ["plate_layout_id"], :name => "index_plate_layout_versions_on_plate_layout_id"

  create_table "plate_layouts", :force => true do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "plate_sample_versions", :force => true do |t|
    t.integer  "plate_sample_id"
    t.integer  "lock_version"
    t.integer  "plate_id"
    t.integer  "plate_layout_position_id"
    t.integer  "sample_id"
    t.boolean  "is_unusable"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plate_sample_versions", ["plate_sample_id"], :name => "index_plate_sample_versions_on_plate_sample_id"

  create_table "plate_samples", :force => true do |t|
    t.integer  "plate_id"
    t.integer  "plate_layout_position_id"
    t.integer  "sample_id"
    t.boolean  "is_unusable"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "plate_samples", ["plate_id", "plate_layout_position_id"], :name => "index_plate_samples_on_plate_id_and_plate_layout_position_id", :unique => true

  create_table "plate_versions", :force => true do |t|
    t.integer  "plate_id"
    t.integer  "lock_version"
    t.integer  "crc_id"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "plate_layout_id"
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "derived_from_plate_id"
  end

  add_index "plate_versions", ["plate_id"], :name => "index_plate_versions_on_plate_id"

  create_table "plates", :force => true do |t|
    t.integer  "crc_id"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "plate_layout_id"
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.integer  "derived_from_plate_id"
  end

  add_index "plates", ["crc_id"], :name => "index_plates_on_crc_id", :unique => true
  add_index "plates", ["derived_from_plate_id"], :name => "index_plates_on_derived_from_plate_id"
  add_index "plates", ["url_code"], :name => "index_plates_on_url_code", :unique => true

  create_table "privacy_survey_response_versions", :force => true do |t|
    t.integer  "privacy_survey_response_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "worrisome_information_comfort_level"
    t.string   "information_disclosure_comfort_level"
    t.string   "past_genetic_test_participation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "privacy_survey_response_versions", ["privacy_survey_response_id"], :name => "index_privacy_survey_response_versions_on_privacy_survey_respon"

  create_table "privacy_survey_responses", :force => true do |t|
    t.integer  "user_id"
    t.string   "worrisome_information_comfort_level"
    t.string   "information_disclosure_comfort_level"
    t.string   "past_genetic_test_participation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "privacy_survey_responses", ["user_id"], :name => "index_privacy_survey_responses_on_user_id"

  create_table "procedure_description_versions", :force => true do |t|
    t.integer  "procedure_description_id"
    t.integer  "lock_version"
    t.string   "description"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "procedure_description_versions", ["procedure_description_id"], :name => "index_procedure_description_versions_on_procedure_description_i"

  create_table "procedure_descriptions", :force => true do |t|
    t.string   "description",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "procedure_descriptions", ["description"], :name => "index_procedure_descriptions_on_description", :unique => true

  create_table "procedure_versions", :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "lock_version"
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.integer  "procedure_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "procedure_versions", ["procedure_id"], :name => "index_procedure_versions_on_procedure_id"

  create_table "procedures", :force => true do |t|
    t.integer  "ccr_id"
    t.date     "start_date"
    t.string   "codes"
    t.integer  "procedure_description_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "procedures", ["ccr_id"], :name => "index_procedures_on_ccr_id"
  add_index "procedures", ["procedure_description_id"], :name => "index_procedures_on_procedure_description_id"

  create_table "question_response_versions", :force => true do |t|
    t.integer  "question_response_id"
    t.integer  "lock_version"
    t.integer  "exam_response_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_question_id"
    t.boolean  "correct",              :default => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "question_response_versions", ["question_response_id"], :name => "index_question_response_versions_on_question_response_id"

  create_table "question_responses", :force => true do |t|
    t.integer  "exam_response_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_question_id"
    t.boolean  "correct",          :default => false, :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "question_responses", ["correct"], :name => "index_question_responses_on_correct"
  add_index "question_responses", ["exam_question_id"], :name => "index_question_responses_on_exam_question_id"
  add_index "question_responses", ["exam_response_id"], :name => "index_question_responses_on_exam_response_id"

  create_table "removal_request_versions", :force => true do |t|
    t.integer  "removal_request_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.text     "items_to_remove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remove_data",        :default => false
    t.boolean  "destroy_samples",    :default => false
    t.integer  "fulfilled_by"
    t.datetime "fulfilled_at"
    t.text     "admin_notes"
    t.datetime "deleted_at"
  end

  add_index "removal_request_versions", ["removal_request_id"], :name => "index_removal_request_versions_on_removal_request_id"

  create_table "removal_requests", :force => true do |t|
    t.integer  "user_id"
    t.text     "items_to_remove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remove_data",     :default => false
    t.boolean  "destroy_samples", :default => false
    t.integer  "fulfilled_by"
    t.datetime "fulfilled_at"
    t.text     "admin_notes"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "report_versions", :force => true do |t|
    t.integer  "report_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "name"
    t.string   "rtype"
    t.datetime "requested"
    t.datetime "created"
    t.string   "path"
    t.string   "status"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_versions", ["report_id"], :name => "index_report_versions_on_report_id"

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "rtype"
    t.datetime "requested"
    t.datetime "created"
    t.string   "path"
    t.string   "status"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "reports", ["created"], :name => "index_reports_on_created"

  create_table "residency_survey_response_versions", :force => true do |t|
    t.integer  "residency_survey_response_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.boolean  "resident"
    t.string   "country"
    t.string   "zip"
    t.boolean  "can_travel_to_pgphq"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "residency_survey_response_versions", ["residency_survey_response_id"], :name => "index_residency_survey_response_versions_on_residency_survey_re"

  create_table "residency_survey_responses", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "resident"
    t.string   "country"
    t.string   "zip"
    t.boolean  "can_travel_to_pgphq"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "residency_survey_responses", ["user_id"], :name => "index_residency_survey_responses_on_user_id"

  create_table "safety_questionnaire_versions", :force => true do |t|
    t.integer  "safety_questionnaire_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.datetime "datetime"
    t.boolean  "has_changes"
    t.text     "events"
    t.text     "reactions"
    t.text     "contact"
    t.text     "healthcare"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "safety_questionnaire_versions", ["safety_questionnaire_id"], :name => "index_safety_questionnaire_versions_on_safety_questionnaire_id"

  create_table "safety_questionnaires", :force => true do |t|
    t.integer  "user_id"
    t.datetime "datetime"
    t.boolean  "has_changes"
    t.text     "events"
    t.text     "reactions"
    t.text     "contact"
    t.text     "healthcare"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "sample_log_versions", :force => true do |t|
    t.integer  "sample_log_id"
    t.integer  "lock_version"
    t.integer  "sample_id"
    t.integer  "actor_id"
    t.text     "comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "controlling_user_id"
  end

  add_index "sample_log_versions", ["sample_log_id"], :name => "index_sample_log_versions_on_sample_log_id"

  create_table "sample_logs", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "actor_id"
    t.text     "comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.integer  "controlling_user_id"
  end

  create_table "sample_origin_versions", :force => true do |t|
    t.integer  "sample_origin_id"
    t.integer  "lock_version"
    t.integer  "parent_sample_id"
    t.integer  "child_sample_id"
    t.string   "derivation_method"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sample_origin_versions", ["sample_origin_id"], :name => "index_sample_origin_versions_on_sample_origin_id"

  create_table "sample_origins", :force => true do |t|
    t.integer  "parent_sample_id"
    t.integer  "child_sample_id"
    t.string   "derivation_method"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "sample_origins", ["child_sample_id"], :name => "index_sample_origins_on_child_sample_id"
  add_index "sample_origins", ["parent_sample_id"], :name => "index_sample_origins_on_parent_sample_id"

  create_table "sample_type_versions", :force => true do |t|
    t.integer  "sample_type_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "tissue_type_id"
    t.integer  "device_type_id"
    t.text     "description"
    t.string   "target_amount"
    t.integer  "unit_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sample_type_versions", ["sample_type_id"], :name => "index_sample_type_versions_on_sample_type_id"

  create_table "sample_types", :force => true do |t|
    t.string   "name"
    t.integer  "tissue_type_id"
    t.integer  "device_type_id"
    t.text     "description"
    t.string   "target_amount"
    t.integer  "unit_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "sample_versions", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "crc_id"
    t.integer  "study_id"
    t.integer  "kit_id"
    t.integer  "participant_id"
    t.integer  "original_kit_design_sample_id"
    t.integer  "kit_design_sample_id"
    t.datetime "when_originated"
    t.integer  "owner_id"
    t.datetime "last_mailed"
    t.datetime "last_received"
    t.string   "participant_note"
    t.string   "researcher_note"
    t.string   "concentration"
    t.string   "amount"
    t.string   "unit"
    t.string   "material"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "qc_result"
  end

  add_index "sample_versions", ["sample_id"], :name => "index_sample_versions_on_sample_id"

  create_table "samples", :force => true do |t|
    t.string   "name"
    t.integer  "crc_id"
    t.integer  "study_id"
    t.integer  "kit_id"
    t.integer  "participant_id"
    t.integer  "original_kit_design_sample_id"
    t.integer  "kit_design_sample_id"
    t.datetime "when_originated"
    t.integer  "owner_id"
    t.datetime "last_mailed"
    t.datetime "last_received"
    t.string   "participant_note"
    t.string   "researcher_note"
    t.string   "concentration"
    t.string   "amount"
    t.string   "unit"
    t.string   "material"
    t.string   "url_code"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.datetime "is_destroyed"
    t.text     "qc_result"
  end

  add_index "samples", ["crc_id"], :name => "index_samples_on_crc_id", :unique => true
  add_index "samples", ["url_code"], :name => "index_samples_on_url_code", :unique => true

  create_table "screening_survey_response_versions", :force => true do |t|
    t.integer  "screening_survey_response_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.boolean  "citizen_or_resident"
    t.boolean  "age_majority"
    t.string   "monozygotic_twin"
    t.string   "worrisome_information_comfort_level"
    t.string   "information_disclosure_comfort_level"
    t.string   "past_genetic_test_participation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "screening_survey_response_versions", ["screening_survey_response_id"], :name => "index_screening_survey_response_versions_on_screening_survey_re"

  create_table "screening_survey_responses", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "citizen_or_resident"
    t.boolean  "age_majority"
    t.string   "monozygotic_twin"
    t.string   "worrisome_information_comfort_level"
    t.string   "information_disclosure_comfort_level"
    t.string   "past_genetic_test_participation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.string   "twin_name"
    t.string   "twin_email"
  end

  create_table "selection_versions", :force => true do |t|
    t.integer  "selection_id"
    t.integer  "lock_version"
    t.text     "spec",         :limit => 2147483647
    t.text     "targets",      :limit => 2147483647
    t.string   "target_type"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unguessable"
  end

  add_index "selection_versions", ["selection_id"], :name => "index_selection_versions_on_selection_id"

  create_table "selections", :force => true do |t|
    t.text     "spec",         :limit => 2147483647
    t.text     "targets",      :limit => 2147483647
    t.string   "target_type"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.string   "unguessable"
  end

  create_table "shipping_address_versions", :force => true do |t|
    t.integer  "shipping_address_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  add_index "shipping_address_versions", ["shipping_address_id"], :name => "index_shipping_address_versions_on_shipping_address_id"

  create_table "shipping_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "spreadsheet_importer_versions", :force => true do |t|
    t.integer  "spreadsheet_importer_id"
    t.integer  "lock_version"
    t.integer  "spreadsheet_id"
    t.integer  "oauth_service_id"
    t.string   "gdocs_url"
    t.integer  "traitwise_survey_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "versioned_type"
  end

  add_index "spreadsheet_importer_versions", ["spreadsheet_importer_id"], :name => "index_spreadsheet_importer_versions_on_spreadsheet_importer_id"

  create_table "spreadsheet_importers", :force => true do |t|
    t.integer  "spreadsheet_id"
    t.string   "type"
    t.integer  "oauth_service_id"
    t.string   "gdocs_url"
    t.integer  "traitwise_survey_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "spreadsheet_row_versions", :force => true do |t|
    t.integer  "spreadsheet_row_id"
    t.integer  "lock_version"
    t.integer  "spreadsheet_id"
    t.integer  "row_number"
    t.text     "row_data"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "row_target_type"
    t.integer  "row_target_id"
  end

  add_index "spreadsheet_row_versions", ["spreadsheet_row_id"], :name => "index_spreadsheet_row_versions_on_spreadsheet_row_id"

  create_table "spreadsheet_rows", :force => true do |t|
    t.integer  "spreadsheet_id"
    t.integer  "row_number"
    t.text     "row_data"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.string   "row_target_type"
    t.integer  "row_target_id"
  end

  create_table "spreadsheet_versions", :force => true do |t|
    t.integer  "spreadsheet_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "rowtarget_type"
    t.string   "rowtarget_id_attribute"
    t.string   "rowtarget_data_attribute"
    t.integer  "row_id_column"
    t.text     "header_row"
    t.integer  "auto_update_interval"
    t.boolean  "is_auto_update_enabled"
    t.datetime "last_downloaded_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spreadsheet_versions", ["spreadsheet_id"], :name => "index_spreadsheet_versions_on_spreadsheet_id"

  create_table "spreadsheets", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "rowtarget_type"
    t.string   "rowtarget_id_attribute"
    t.string   "rowtarget_data_attribute"
    t.integer  "row_id_column"
    t.text     "header_row"
    t.integer  "auto_update_interval"
    t.boolean  "is_auto_update_enabled"
    t.datetime "last_downloaded_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.text     "participant_description"
    t.text     "researcher_description"
    t.integer  "researcher_id"
    t.integer  "irb_associate_id"
    t.boolean  "requested",                           :default => false
    t.boolean  "approved",                            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.boolean  "open",                                :default => false
    t.datetime "date_approved"
    t.datetime "date_opened"
    t.boolean  "shipping_address_required",           :default => true
    t.boolean  "phone_number_required",               :default => false
    t.string   "participation_url"
    t.integer  "days_before_unreturned_kit_reminder", :default => 21
    t.boolean  "auto_accept",                         :default => false
  end

  create_table "study_guide_page_versions", :force => true do |t|
    t.integer  "study_guide_page_id"
    t.integer  "lock_version"
    t.integer  "exam_version_id"
    t.integer  "ordinal"
    t.text     "contents"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_guide_page_versions", ["study_guide_page_id"], :name => "index_study_guide_page_versions_on_study_guide_page_id"

  create_table "study_guide_pages", :force => true do |t|
    t.integer  "exam_version_id"
    t.integer  "ordinal"
    t.text     "contents"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.string   "title"
  end

  create_table "study_participant_versions", :force => true do |t|
    t.integer  "study_participant_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "study_id"
    t.integer  "status",               :default => 0
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "kit_last_sent_at"
  end

  add_index "study_participant_versions", ["study_participant_id"], :name => "index_study_participant_versions_on_study_participant_id"

  create_table "study_participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "study_id"
    t.integer  "status",           :default => 0
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.datetime "kit_last_sent_at"
  end

  add_index "study_participants", ["user_id", "study_id"], :name => "index_study_participants_on_user_id_and_study_id", :unique => true

  create_table "study_versions", :force => true do |t|
    t.integer  "study_id"
    t.integer  "lock_version"
    t.string   "name"
    t.text     "participant_description"
    t.text     "researcher_description"
    t.integer  "researcher_id"
    t.integer  "irb_associate_id"
    t.boolean  "requested"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.boolean  "open",                                :default => false
    t.boolean  "shipping_address_required"
    t.boolean  "phone_number_required"
    t.string   "participation_url"
    t.integer  "days_before_unreturned_kit_reminder", :default => 21
  end

  add_index "study_versions", ["study_id"], :name => "index_study_versions_on_study_id"

  create_table "survey_answer_choice_versions", :force => true do |t|
    t.integer  "survey_answer_choice_id"
    t.integer  "lock_version"
    t.integer  "survey_question_id"
    t.string   "text"
    t.string   "value"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "survey_answer_choice_versions", ["survey_answer_choice_id"], :name => "index_survey_answer_choice_versions_on_survey_answer_choice_id"

  create_table "survey_answer_choices", :force => true do |t|
    t.integer  "survey_question_id"
    t.string   "text"
    t.string   "value"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "survey_answer_choices", ["survey_question_id"], :name => "index_survey_answer_choices_on_survey_question_id"

  create_table "survey_answer_versions", :force => true do |t|
    t.integer  "survey_answer_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "survey_question_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "survey_answer_versions", ["survey_answer_id"], :name => "index_survey_answer_versions_on_survey_answer_id"

  create_table "survey_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_question_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "survey_answers", ["survey_question_id"], :name => "index_survey_answers_on_survey_question_id"
  add_index "survey_answers", ["user_id"], :name => "index_survey_answers_on_user_id"

  create_table "survey_question_versions", :force => true do |t|
    t.integer  "survey_question_id"
    t.integer  "lock_version"
    t.integer  "survey_section_id"
    t.string   "text"
    t.string   "note"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_required"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "survey_question_versions", ["survey_question_id"], :name => "index_survey_question_versions_on_survey_question_id"

  create_table "survey_questions", :force => true do |t|
    t.integer  "survey_section_id"
    t.string   "text"
    t.string   "note"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_required"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "survey_questions", ["survey_section_id"], :name => "index_survey_questions_on_survey_section_id"

  create_table "survey_section_versions", :force => true do |t|
    t.integer  "survey_section_id"
    t.integer  "lock_version"
    t.integer  "survey_id"
    t.string   "name"
    t.string   "heading"
    t.integer  "previous_section_id"
    t.integer  "next_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "survey_section_versions", ["survey_section_id"], :name => "index_survey_section_versions_on_survey_section_id"

  create_table "survey_sections", :force => true do |t|
    t.integer  "survey_id"
    t.string   "name"
    t.string   "heading"
    t.integer  "previous_section_id"
    t.integer  "next_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  add_index "survey_sections", ["survey_id"], :name => "index_survey_sections_on_survey_id"

  create_table "survey_versions", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "lock_version"
    t.string   "name"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "survey_versions", ["survey_id"], :name => "index_survey_versions_on_survey_id"

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "tissue_type_versions", :force => true do |t|
    t.integer  "tissue_type_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tissue_type_versions", ["tissue_type_id"], :name => "index_tissue_type_versions_on_tissue_type_id"

  create_table "tissue_types", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "traitwise_survey_versions", :force => true do |t|
    t.integer  "traitwise_survey_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "tags"
    t.string   "name"
    t.boolean  "open"
    t.text     "description"
    t.boolean  "is_result_public"
    t.boolean  "is_listed"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traitwise_survey_versions", ["traitwise_survey_id"], :name => "index_traitwise_survey_versions_on_traitwise_survey_id"

  create_table "traitwise_surveys", :force => true do |t|
    t.integer  "user_id"
    t.string   "tags"
    t.string   "name"
    t.boolean  "open"
    t.text     "description"
    t.boolean  "is_result_public"
    t.boolean  "is_listed"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "unit_versions", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unit_versions", ["unit_id"], :name => "index_unit_versions_on_unit_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  create_table "unused_kit_name_versions", :force => true do |t|
    t.integer  "unused_kit_name_id"
    t.integer  "lock_version"
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unused_kit_name_versions", ["unused_kit_name_id"], :name => "index_unused_kit_name_versions_on_unused_kit_name_id"

  create_table "unused_kit_names", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
  end

  add_index "unused_kit_names", ["name"], :name => "index_unused_kit_names_on_name", :unique => true

  create_table "user_file_versions", :force => true do |t|
    t.integer  "user_file_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "name"
    t.string   "data_type"
    t.date     "date"
    t.text     "description"
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size",         :limit => 8
    t.datetime "dataset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.string   "status_url"
    t.text     "processing_status"
    t.boolean  "processing_stopped",                              :default => false, :null => false
    t.string   "locator"
    t.string   "report_url"
    t.text     "report_metadata"
    t.string   "longupload_fingerprint"
    t.string   "longupload_file_name"
    t.integer  "longupload_size",           :limit => 8
    t.integer  "longupload_bytes_received", :limit => 8
    t.text     "warehouse_blocks",          :limit => 2147483647
    t.string   "path_in_manifest"
    t.integer  "index_in_manifest"
  end

  add_index "user_file_versions", ["user_file_id"], :name => "index_genetic_data_versions_on_genetic_data_id"

  create_table "user_files", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",                                                               :null => false
    t.string   "data_type",                                                          :null => false
    t.date     "date"
    t.text     "description",                                                        :null => false
    t.string   "dataset_file_name"
    t.string   "dataset_content_type"
    t.integer  "dataset_file_size",         :limit => 8
    t.datetime "dataset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.boolean  "upload_tos_consent"
    t.string   "status_url"
    t.text     "processing_status"
    t.boolean  "processing_stopped",                              :default => false, :null => false
    t.string   "locator"
    t.string   "report_url"
    t.text     "report_metadata"
    t.string   "longupload_fingerprint"
    t.string   "longupload_file_name"
    t.integer  "longupload_size",           :limit => 8
    t.integer  "longupload_bytes_received", :limit => 8
    t.text     "warehouse_blocks",          :limit => 2147483647
    t.string   "path_in_manifest"
    t.integer  "index_in_manifest"
  end

  create_table "user_log_versions", :force => true do |t|
    t.integer  "user_log_id"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.integer  "enrollment_step_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "origin"
    t.string   "user_comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "controlling_user_id"
    t.text     "info"
  end

  add_index "user_log_versions", ["user_log_id"], :name => "index_user_log_versions_on_user_log_id"

  create_table "user_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "enrollment_step_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "origin"
    t.string   "user_comment"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.integer  "controlling_user_id"
    t.text     "info"
  end

  create_table "user_versions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lock_version"
    t.string   "email",                            :limit => 100
    t.string   "crypted_password",                 :limit => 40
    t.string   "salt",                             :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",                   :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",                  :limit => 40
    t.datetime "activated_at"
    t.boolean  "is_admin"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phr_file_name"
    t.string   "phr_content_type"
    t.integer  "phr_file_size"
    t.datetime "phr_updated_at"
    t.integer  "pledge"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "enrollment_essay"
    t.string   "phr_profile_name"
    t.boolean  "has_sequence",                                    :default => false
    t.string   "has_sequence_explanation"
    t.text     "family_members_passed_exam"
    t.string   "security_question"
    t.string   "security_answer"
    t.string   "eligibility_survey_version"
    t.datetime "enrolled"
    t.string   "authsub_token"
    t.string   "hex",                                             :default => ""
    t.string   "exam_version"
    t.datetime "enrollment_accepted"
    t.string   "consent_version"
    t.boolean  "is_test",                                         :default => false
    t.string   "has_family_members_enrolled"
    t.string   "pgp_id"
    t.datetime "absolute_pitch_survey_completion"
    t.boolean  "researcher",                                      :default => false
    t.string   "researcher_affiliation",                          :default => ""
    t.boolean  "researcher_onirb",                                :default => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.datetime "deactivated_at"
    t.datetime "suspended_at"
    t.boolean  "can_reactivate_self"
    t.string   "phone_number"
    t.boolean  "deceased"
    t.boolean  "real_name_public"
    t.string   "cause_of_death"
    t.boolean  "bad_email"
  end

  add_index "user_versions", ["user_id"], :name => "index_user_versions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                            :limit => 100
    t.string   "crypted_password",                 :limit => 40
    t.string   "salt",                             :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",                   :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",                  :limit => 40
    t.datetime "activated_at"
    t.boolean  "is_admin"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phr_file_name"
    t.string   "phr_content_type"
    t.integer  "phr_file_size"
    t.datetime "phr_updated_at"
    t.integer  "pledge"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "enrollment_essay"
    t.string   "phr_profile_name"
    t.boolean  "has_sequence",                                    :default => false, :null => false
    t.string   "has_sequence_explanation"
    t.text     "family_members_passed_exam"
    t.string   "security_question"
    t.string   "security_answer"
    t.string   "eligibility_survey_version"
    t.datetime "enrolled"
    t.string   "authsub_token"
    t.string   "hex",                                             :default => ""
    t.string   "exam_version"
    t.datetime "enrollment_accepted"
    t.string   "consent_version"
    t.boolean  "is_test",                                         :default => false
    t.string   "has_family_members_enrolled"
    t.integer  "pgp_id"
    t.datetime "absolute_pitch_survey_completion"
    t.boolean  "researcher",                                      :default => false
    t.string   "researcher_affiliation",                          :default => ""
    t.boolean  "researcher_onirb",                                :default => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
    t.datetime "deactivated_at"
    t.datetime "suspended_at"
    t.boolean  "can_reactivate_self"
    t.string   "phone_number"
    t.boolean  "deceased"
    t.boolean  "real_name_public",                                :default => false
    t.string   "cause_of_death"
    t.boolean  "bad_email",                                       :default => false
  end

  create_table "waitlist_versions", :force => true do |t|
    t.integer  "waitlist_id"
    t.integer  "lock_version"
    t.string   "reason"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "resubmitted_at"
    t.string   "phase",          :default => "preenroll"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
  end

  add_index "waitlist_versions", ["waitlist_id"], :name => "index_waitlist_versions_on_waitlist_id"

  create_table "waitlists", :force => true do |t|
    t.string   "reason"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "resubmitted_at"
    t.string   "phase",          :default => "preenroll", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "deleted_at"
    t.integer  "lock_version"
  end

  create_table "withdrawal_comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
