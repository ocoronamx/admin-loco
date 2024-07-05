namespace :tools do

  # app:start

  # Make new shared directory and fix permissions
  def self.mkdir_shared(*dir_paths)
    dir_paths.each do |path|
      command %[mkdir -p "#{fetch(:shared_path)}/#{path}"]
      command %[chmod g+rx,u+rwx "#{fetch(:shared_path)}/#{path}"]
    end
  end

  # Touch new shared file
  def self.touch_shared(*file_paths)
    file_paths.each do |path|
      command %[touch "#{fetch(:shared_path)}/#{path}"]
    end
  end

end

