prompts = Hash.new
group = ''
IO.readlines('prompts.txt').reject(&:empty?).each_with_index do |line, index|
  if line.start_with? '-'
    group = line.strip
    #puts "new '#{group}'"
    prompts[group] = Array.new
  else
    #puts "add to '#{group}'"
    #puts "items so far: #{prompts[group]}"
    prompts[group] << line
  end
end
#puts prompts
pick_group_index = Random.new.rand(prompts.keys.size - 1)
picked_group = prompts.keys[pick_group_index]
picked_entries = prompts[picked_group]
entry = picked_entries[Random.new.rand(picked_entries.size - 1)]
#puts "Prompt for Today"
puts
puts "#{picked_group.slice(1, picked_group.size-1)}"
puts "#{entry}"
