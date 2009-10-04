# TODO: Generate a non-intrusive warning in the GUI if the images dir 
# doesn't exist and prompt to select a new one when trying to save / upload

require 'rubygems'
require 'net/ftp'
require 'uri'
require 'fileutils'
require 'ftools'
require 'RMagick'
require 'wx'
require 'image_uploader'
require 'yaml'


#include Magick
include Wx
CONFIG_FILE = 'settings.yaml'
SERVERS_FILE = 'servers.yaml'

class System
	def self.initialize
		puts "initializing"
		if !File.exist?(CONFIG_FILE) then
			puts "Creating new config file.." #DEBUG
			settings = { :shrink_width => 500, :thumb_width => 300, :image_dir => 'converted_images', :onscreen_width => 300}
			System.store_settings(settings)
		end
	end

	def self.store_settings(settings, file = CONFIG_FILE)
		if File.exist?(file)
			old_settings = self.get_settings(file)
			settings = old_settings.merge(settings)
		end
		serialized = settings.to_yaml
		File.open(file, 'w') {|f| f.write(serialized) }
	end

	# store_object expects a YAML array of objects
	def self.store_object(object, file)
		if File.exist?(file)
			objects = self.get_objects(file)
			objects = objects.push(object)
			#settings = old_settings.merge(settings)
		else
			objects = Array.new
			objects[0] = object
		end
		serialized = objects.to_yaml
		File.open(file, 'w') {|f| f.write(serialized) }
	end

	def self.get_objects(file)
		self.get_settings(file)
	end

	def self.get_settings(file = CONFIG_FILE)
		if File.exist?(file)
			File.open(file, 'r') do |f|
				@serialized = f.read
				YAML::load(@serialized)
			end
		end
	end

	def self.settings?
		self.get_settings
	end

end

# Server class is incomplete! 
class Server 
	attr_accessor :profile_name, :server_name, :username, :public_url, 
		:root_folder, :password, :login_type, :port

	def initialize(profile_name, server_name, username, public_url, 
								 root_folder, password=NIL, login_type='ftp', port=22)
		@profile_name, @server_name, @username, @public_url, @root_folder, @password, @login_type, @port = profile_name, server_name, username, public_url, root_folder, password, login_type, port 
	end


	def self.list
		if File.exist?(SERVERS_FILE) 
			System.get_settings(SERVERS_FILE)
		else
			nil
		end
	end 

	def save
		System.store_object(self, SERVERS_FILE)
	end

end

class Settings < SettingsBase
	def initialize
		super
		settings = System.settings?
		@shrink_width.change_value(settings[:shrink_width].to_s)
		@thumb_width.change_value(settings[:thumb_width].to_s)
		@image_dir.change_value(settings[:image_dir].to_s)
		evt_button(ID_SAVE) { onSave }
		evt_button(browse) { onDirOpen }
	end

	def onSave
		puts "SAVE!!" #DEBUG
		settings = { :shrink_width => @shrink_width.get_value.to_i, 
			:thumb_width => @thumb_width.get_value.to_i, 
			:image_dir => @image_dir.get_value }
		
		if System.store_settings(settings) 
			puts "Successfully saved!" #DEBUG
			close(TRUE)
		else
			puts "Failed to save." #DEBUG
		end
	end

	def onDirOpen
		dialog = DirDialog.new(
			self,
			"Choose a folder to store converted images..."
		) 
		if dialog.show_modal() == ID_OK
			@image_dir.change_value(dialog.get_path())
		end
	end

end

class ServerHelp < ServerHelpBase
	def initialize
		super
		@help.load_file('help/add_server.html')
	end
end

class AddServer < AddServerBase
	def initialize
		super
		evt_button(help) { onHelp }
		evt_button(ID_SAVE) {onSave}
		
	end

	def onSave
		server = Server.new(@profile_name.get_value,
		@server_name.get_value,
#		:login_type => @login_type.get_value,
		@username.get_value,
		#@password.get_value,
		#@remember_password.get_value,
		@public_url.get_value,
		@root_folder.get_value)
    if server.save then close(TRUE) end
	end

	def onHelp
		@help = ServerHelp.new.show
	end

end

class MyBitmap < Wx::Bitmap
  def save
    orig_filename = File.basename(self.image_load_path, ".jpg")
    new_filename = ORIG_FILENAME + "_web.jpg"
    thumb_FILENAME = ORIG_FILENAME + "_thumb.jpg"
  end

public
  def original_path=(p)
    @original_path = p
  end

  def original_path
    @original_path
  end


end


class MainWindow < MainWindowBase
	def initialize
		super
		if ARGV[0] 
			if File.exist?(ARGV[0])
				@image.set_value(ARGV[0])
				@bitmap = load_bitmap(ARGV.first)
			end
		end
		evt_menu(m_quit) { onQuit }
		evt_button(upload) { onUpload }
		evt_menu(settings) { onSettings }
		evt_button(add_server) { onAddServer }
		evt_button(browse) { onBrowse }
		evt_paint do onPaint end
		@statusbar.set_status_text('Image Uploader ready')
	end 

	def onBrowse
		dialog = FileDialog.new(
			self,
			"Choose an image to upload..."
		) 
		if dialog.show_modal() == ID_OK
			@image.set_value(dialog.get_path())
			@bitmap = load_bitmap(dialog.get_path())
		end
	end

	def set_status(text)
		@statusbar.set_status_text(text)
	end

	def onPaint
		if @bitmap 
			@image_panel.paint do |dc|
				#dc.clear
				dc.draw_bitmap(@bitmap, 0, 0, false)
			end
		end
	end

	def onAddServer
		server = AddServer.new.show
	end

	def onQuit
		close(TRUE)
		exit
	end

	def onUpload
		puts "Upload has yet to be implemented.."#DEBUG
	end

	def onSettings
		settings = Settings.new.show
	end

	# Load bitmap for display in the program
	def load_bitmap(path)
		#		orig_image = Magick::ImageList.new(path)
		thumbnail = Magick::ImageList.new(path).resize_to_fit(System.settings?[:onscreen_width])
		wx_img = Wx::Image.new(thumbnail.columns, thumbnail.rows)
		wx_img.set_data(thumbnail.to_blob {
			self.format = "RGB"
			self.depth = 8
		})
		bitmap = MyBitmap.new(wx_img)
		bitmap.original_path = path
		bitmap
	end

end


	Wx::App.run do
	System.initialize

	MainWindow.new.show
end
