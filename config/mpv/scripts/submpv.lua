-- submpv lua script
-- ===================|

-- note to escape path for winodws (c:\\users\\user\\...)
local python_path = '/usr/bin/python' -- path to python bin
local scripts_path = '/home/asifakonjee/.config/mpv/scripts' -- path to scripts folder 
local submpv_path = ''..scripts_path..'/submpv/submpv.py' -- don't change this one
local utils = require 'mp.utils'

-- Log function: log to both terminal and MPV OSD (On-Screen Display)
function log(string,secs)
	secs = secs or 2.5
	mp.msg.warn(string)
	mp.osd_message(string,secs)
end

-- download/load function
function submpv()
	log('search for arabic subtitle!')

	--get directory and filename
	local directory,filename = utils.split_path(mp.get_property('path'))
    local table = { args = { python_path } }
    local a = table.args

	a[#a + 1] = submpv_path
	a[#a + 1] = '-d'
	a[#a + 1] = directory
	a[#a + 1] = filename --> submpv command ends with the movie/tvshow name/filename

	-- run command and capture stdout
	local result = utils.subprocess(table)

	if string.find(result.stdout, 'done') then
		log('Arabic subtitles ready!')
		-- to make sure all downloaded subtitle loaded
		mp.set_property('sub-auto', 'all')
		mp.commandv('rescan_external_files','reselect')
	else
		log('Arabic subtitles not found!')
	end
end
mp.add_key_binding(nil,'submpv',submpv)
