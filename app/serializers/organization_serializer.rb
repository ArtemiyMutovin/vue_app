class OrganizationSerializer < Blueprinter::Base
  identifier :id

  fields :name, :org_type, :inn, :ogrn
end
