class Branch < ActiveRecord::Base
  
  self.primary_key = :BranchID
  self.table_name = "GLBranches"
  
end
