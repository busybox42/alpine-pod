#!/usr/bin/env ruby

def start_pod
	File.open('/var/log/apline_pod.log', 'a') { |l|
		l.puts "#{Time.now} - Starting Alpine pod.\n"
	}
	File.write('/var/run/start_pod', 'TRUE')
	r = File.read("/var/run/start_pod")
	if r == "TRUE"
		sleep(5)
	elsif r == "FALSE"
		system('wall System will shutdown in 30 seconds!!!')
		sleep(30)
		exit
	else
		system('wall Incorrect state of /var/run/start_pod!!!  This message will repeat every 30 seconds.')
		sleep(30)
	end

end

start_pod
