
package 'nfs-utils'
package 'nfs-utils-lib'

execute "run startup scripts" do
  command <<-EOH
    chkconfig nfs on
    service rpcbind start
    service nfs start
  EOH
end

execute "mount share" do
  command 'mount 192.168.100.30:/var/www/wordpress/ /var/www/wordpress/'
end