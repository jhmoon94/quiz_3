module Fog
  module Vsphere
    class Compute
      class Folders < Fog::Collection
        model Fog::Vsphere::Compute::Folder
        attr_accessor :datacenter, :type, :path

        def all(filters = {})
          requires :datacenter
          requires :type
          load service.list_folders(filters.merge(datacenter: datacenter, type: type, path: path))
        end

        def get(id)
          requires :datacenter
          new service.get_folder(id, datacenter, type)
        end
      end
    end
  end
end
