# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  budget     :integer
#  billable   :boolean          default(FALSE)
#  client_id  :integer
#  archived   :boolean          default(FALSE), not null
#  billable   :boolean          default(FALSE)
#

class Project < ActiveRecord::Base
  include Sluggable

  audited allow_mass_assignment: true

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validate do |project|
    ClientBillableValidator.new(project).validate
  end

  has_many :entries
  has_many :users, -> { uniq }, through: :entries
  has_many :categories, -> { uniq }, through: :entries
  has_many :tags, -> { uniq }, through: :entries
  belongs_to :client, touch: true

  scope :by_last_updated, -> { order("updated_at DESC") }
  scope :by_name, -> { order("lower(name)") }

  scope :are_archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }
  scope :billable, -> { where(billable: true) }

  after_update :set_entries_billed_to_false

  def sorted_categories
    categories.sort_by do |category|
      EntryStats.new(entries, category).percentage_for_subject
    end.reverse
  end

  def set_entries_billed_to_false
    entries.each { |entry| entry.update_attribute(:billed, billable ? false : nil) }
  end

  def label
    name
  end

  def budget_status
    budget - entries.sum(:hours) if budget
  end

  private

  def slug_source
    name
  end

  class ClientBillableValidator
    def initialize(project)
      @project = project
    end

    def validate
      if (@project.billable && !@project.client)
        @project.errors[:client] << I18n.t("project.errors.client_missing")
      end
    end
  end
end
