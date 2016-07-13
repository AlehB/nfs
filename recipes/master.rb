
package 'nfs-utils'
package 'nfs-utils-lib'

execute "run startup scripts" do
  command <<-EOH
    chkconfig nfs on
    service rpcbind start
    service nfs start
  EOH
end

template "/etc/exports" do
  source "exports.erb"
end

execute "export directory" do
  command 'exportfs -a'
end