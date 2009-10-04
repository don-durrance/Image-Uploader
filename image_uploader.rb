
# This class was automatically generated from XRC source. It is not
# recommended that this file is edited directly; instead, inherit from
# this class and extend its behaviour there.  
#
# Source file: image_uploader.xrc 
# Generated at: Sun Oct 04 13:43:41 +0400 2009

class SettingsBase < Wx::Dialog
	
	attr_reader :m_statictext22, :image_dir, :browse, :m_statictext211,
              :shrink_width, :m_statictext2111, :thumb_width
	
	def initialize(parent = nil)
		super()
		xml = Wx::XmlResource.get
		xml.flags = 2 # Wx::XRC_NO_SUBCLASSING
		xml.init_all_handlers
		xml.load("image_uploader.xrc")
		xml.load_dialog_subclass(self, parent, "Settings")

		finder = lambda do | x | 
			int_id = Wx::xrcid(x)
			begin
				Wx::Window.find_window_by_id(int_id, self) || int_id
			# Temporary hack to work around regression in 1.9.2; remove
			# begin/rescue clause in later versions
			rescue RuntimeError
				int_id
			end
		end
		
		@m_statictext22 = finder.call("m_staticText22")
		@image_dir = finder.call("image_dir")
		@browse = finder.call("browse")
		@m_statictext211 = finder.call("m_staticText211")
		@shrink_width = finder.call("shrink_width")
		@m_statictext2111 = finder.call("m_staticText2111")
		@thumb_width = finder.call("thumb_width")
		if self.class.method_defined? "on_init"
			self.on_init()
		end
	end
end



# This class was automatically generated from XRC source. It is not
# recommended that this file is edited directly; instead, inherit from
# this class and extend its behaviour there.  
#
# Source file: image_uploader.xrc 
# Generated at: Sun Oct 04 13:43:41 +0400 2009

class AddServerBase < Wx::Dialog
	
	attr_reader :m_statictext18, :profile_name, :help, :m_statictext181,
              :server_name, :m_statictext18132, :login_type,
              :m_statictext181321, :port, :m_statictext1812,
              :username, :m_statictext18121, :password,
              :remember_password, :m_statictext18131, :public_url,
              :m_statictext1813, :root_folder, :test_settings
	
	def initialize(parent = nil)
		super()
		xml = Wx::XmlResource.get
		xml.flags = 2 # Wx::XRC_NO_SUBCLASSING
		xml.init_all_handlers
		xml.load("image_uploader.xrc")
		xml.load_dialog_subclass(self, parent, "AddServer")

		finder = lambda do | x | 
			int_id = Wx::xrcid(x)
			begin
				Wx::Window.find_window_by_id(int_id, self) || int_id
			# Temporary hack to work around regression in 1.9.2; remove
			# begin/rescue clause in later versions
			rescue RuntimeError
				int_id
			end
		end
		
		@m_statictext18 = finder.call("m_staticText18")
		@profile_name = finder.call("profile_name")
		@help = finder.call("help")
		@m_statictext181 = finder.call("m_staticText181")
		@server_name = finder.call("server_name")
		@m_statictext18132 = finder.call("m_staticText18132")
		@login_type = finder.call("login_type")
		@m_statictext181321 = finder.call("m_staticText181321")
		@port = finder.call("port")
		@m_statictext1812 = finder.call("m_staticText1812")
		@username = finder.call("username")
		@m_statictext18121 = finder.call("m_staticText18121")
		@password = finder.call("password")
		@remember_password = finder.call("remember_password")
		@m_statictext18131 = finder.call("m_staticText18131")
		@public_url = finder.call("public_url")
		@m_statictext1813 = finder.call("m_staticText1813")
		@root_folder = finder.call("root_folder")
		@test_settings = finder.call("test_settings")
		if self.class.method_defined? "on_init"
			self.on_init()
		end
	end
end



# This class was automatically generated from XRC source. It is not
# recommended that this file is edited directly; instead, inherit from
# this class and extend its behaviour there.  
#
# Source file: image_uploader.xrc 
# Generated at: Sun Oct 04 13:43:41 +0400 2009

class ServerHelpBase < Wx::Dialog
	
	attr_reader :help
	
	def initialize(parent = nil)
		super()
		xml = Wx::XmlResource.get
		xml.flags = 2 # Wx::XRC_NO_SUBCLASSING
		xml.init_all_handlers
		xml.load("image_uploader.xrc")
		xml.load_dialog_subclass(self, parent, "server_help")

		finder = lambda do | x | 
			int_id = Wx::xrcid(x)
			begin
				Wx::Window.find_window_by_id(int_id, self) || int_id
			# Temporary hack to work around regression in 1.9.2; remove
			# begin/rescue clause in later versions
			rescue RuntimeError
				int_id
			end
		end
		
		@help = finder.call("help")
		if self.class.method_defined? "on_init"
			self.on_init()
		end
	end
end



# This class was automatically generated from XRC source. It is not
# recommended that this file is edited directly; instead, inherit from
# this class and extend its behaviour there.  
#
# Source file: image_uploader.xrc 
# Generated at: Sun Oct 04 13:43:41 +0400 2009

class MainWindowBase < Wx::Frame
	
	attr_reader :m_mainmenu, :m_filemenu, :m_open, :m_quit, :m_options,
              :settings, :m_helpmenu, :m_about, :m_notebook2,
              :m_panel3, :server_static_text, :m_choice5, :target_dir,
              :m_combobox1, :add_server, :upload, :m_staticline1,
              :m_statictext24, :image, :browse, :image_panel,
              :code_explanation, :code, :statusbar
	
	def initialize(parent = nil)
		super()
		xml = Wx::XmlResource.get
		xml.flags = 2 # Wx::XRC_NO_SUBCLASSING
		xml.init_all_handlers
		xml.load("image_uploader.xrc")
		xml.load_frame_subclass(self, parent, "MainWindowBase")

		finder = lambda do | x | 
			int_id = Wx::xrcid(x)
			begin
				Wx::Window.find_window_by_id(int_id, self) || int_id
			# Temporary hack to work around regression in 1.9.2; remove
			# begin/rescue clause in later versions
			rescue RuntimeError
				int_id
			end
		end
		
		@m_mainmenu = finder.call("m_mainmenu")
		@m_filemenu = finder.call("m_filemenu")
		@m_open = finder.call("m_open")
		@m_quit = finder.call("m_quit")
		@m_options = finder.call("m_options")
		@settings = finder.call("settings")
		@m_helpmenu = finder.call("m_helpmenu")
		@m_about = finder.call("m_about")
		@m_notebook2 = finder.call("m_notebook2")
		@m_panel3 = finder.call("m_panel3")
		@server_static_text = finder.call("server_static_text")
		@m_choice5 = finder.call("m_choice5")
		@target_dir = finder.call("target_dir")
		@m_combobox1 = finder.call("m_comboBox1")
		@add_server = finder.call("add_server")
		@upload = finder.call("upload")
		@m_staticline1 = finder.call("m_staticline1")
		@m_statictext24 = finder.call("m_staticText24")
		@image = finder.call("image")
		@browse = finder.call("browse")
		@image_panel = finder.call("image_panel")
		@code_explanation = finder.call("code_explanation")
		@code = finder.call("code")
		@statusbar = finder.call("statusbar")
		if self.class.method_defined? "on_init"
			self.on_init()
		end
	end
end


