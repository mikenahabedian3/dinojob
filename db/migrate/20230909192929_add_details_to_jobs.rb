class AddDetailsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :location, :string
    add_column :jobs, :via, :string
    # Remove the line that adds the description column
    add_column :jobs, :job_highlights, :json
    add_column :jobs, :thumbnail, :string
    add_column :jobs, :extensions, :json
    add_column :jobs, :detected_extensions, :json
    add_column :jobs, :job_id, :string
  end
end
