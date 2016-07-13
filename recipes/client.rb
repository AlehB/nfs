package 'nfs-utils'
package 'nfs-utils-lib'

execute "run startup scripts" do
  command <<-EOH
    chkconfig nfs on
    service rpcbind start
    service nfs start
  EOH
end

mount '/var/www/wordpress/' do
  device '192.168.100.30:/var/www/wordpress/'
  options 'rw'
end
