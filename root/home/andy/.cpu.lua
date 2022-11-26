function conky_mycpus()
        local file = io.popen("grep -c processor /proc/cpuinfo")
        local numcpus = file:read("*n")
        file:close()
        listcpus = ""
        for i = 1,numcpus
        do listcpus = listcpus.."${cpubar cpu"..tostring(i).."}\n"
         -- do listcpus = listcpus.."${offset 0}Core "..tostring(i).." ${color ff8300}${cpubar cpu"..tostring(i).." 6}${color FFFDE2}\n"
         -- do  listcpus = listcpus.."${cpu cpu"..tostring(i).."} "
        end

        return listcpus
end
