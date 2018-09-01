def measure(n=1, &prc)
	start_time = Time.now
  n.times {prc.call}
  finished_time = Time.now
  elapsed_time = finished_time - start_time
	# finished_time = Time.now
	# elapsed_time = finished_time - start_time
  average_time = (finished_time - start_time) / n
end
