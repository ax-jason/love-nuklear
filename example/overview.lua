-- An overview of most of the supported widgets.

local checkA = {value = false}
local checkB = {value = true}
local radio = {value = 'A'}
local selectA = {value = false}
local selectB = {value = true}
local slider = {value = 0.2}
local progress = {value = 1}
local colorPicker = {value = '#ff0000'}
local property = {value = 6}
local editValue, editValue2 = {value = 'Edit text'}, {value = 'Edit text'}
local comboA = {value = 1, items = {'A', 'B', 'C'}}

return function (ui)
	local has_active_edit
	local function edit(a, b)
		local state = ui:edit(a, b)

		local active = (state == "activated" or state == "active") and true
		if(b.active ~= active) then
			if(active) then -- just activated
				--print("activated", b )
			else -- just deactivated
				--print("deactivated", b)
			end
			b.active = active
		end
		if(active) then
			has_active_edit =  true
		end
		--[[if(state == "activated") then
			love.keyboard.setTextInput(true)
			print(state, b , editValue.state, editValue2.state)
		elseif(state == "deactivated") then
			love.keyboard.setTextInput(false)
			print(state, b , editValue.state, editValue2.state)
		end]]
	end
	has_active_edit = false
	if ui:windowBegin('Overview', 100, 100, 600, 450, 'border', 'movable', 'title') then
		ui:menubarBegin()
		ui:layoutRow('dynamic', 30, 1)
		if ui:menuBegin('Menu', nil, 120, 90) then
			ui:layoutRow('dynamic', 40, 1)
			ui:menuItem('Item A')
			ui:menuItem('Item B')
			ui:menuItem('Item C')
			ui:menuEnd()
		end
		ui:menubarEnd()
		ui:layoutRow('dynamic', 375, 3)
		if ui:groupBegin('Group 1', 'border') then
			ui:layoutRow('dynamic', 30, 1)
			ui:label('Left label')
			ui:label('Centered label', 'centered')
			ui:label('Right label', 'right')
			ui:label('Colored label', 'left', '#ff0000')
			if ui:treePush('tab', 'Tree Tab') then
				if ui:treePush('node', 'Tree Node 1') then
					ui:label('Label 1')
					ui:treePop()
				end
				if ui:treePush('node', 'Tree Node 2') then
					ui:label('Label 2')
					ui:treePop()
				end
				ui:treePop()
			end
			ui:spacing(1)
			if ui:button('Button') then
				print('button pressed!')
			end
			ui:spacing(1)
			ui:checkbox('Checkbox A', checkA)
			ui:checkbox('Checkbox B', checkB)
			ui:groupEnd()
		end
		if ui:groupBegin('Group 2', 'border') then
			ui:layoutRow('dynamic', 30, 1)
			ui:label('Radio buttons:')
			ui:layoutRow('dynamic', 30, 3)
			ui:radio('A', radio)
			ui:radio('B', radio)
			ui:radio('C', radio)
			ui:layoutRow('dynamic', 30, 1)
			ui:selectable('Selectable A', selectA)
			ui:selectable('Selectable B', selectB)
			ui:layoutRow('dynamic', 30, {.35, .65})
			ui:label('Slider:')
			ui:slider(0, slider, 1, 0.05)
			ui:label('Progress:')
			ui:progress(progress, 10, true)
			ui:layoutRow('dynamic', 30, 2)
			ui:spacing(2)
			ui:label('Color picker:')
			ui:button(nil, colorPicker.value)
			ui:layoutRow('dynamic', 90, 1)
			ui:colorPicker(colorPicker)
			ui:groupEnd()
		end
		if ui:groupBegin('Group 3', 'border') then
			ui:layoutRow('dynamic', 30, 1)
			ui:property('Property', 0, property, 10, 0.25, 0.05)
			ui:spacing(1)
			ui:label('Edit:')
			ui:layoutRow('dynamic', 90, 1)
			edit('box', editValue)

			ui:layoutRow('dynamic', 40, 1)
			edit('box', editValue2)

			ui:layoutRow('dynamic', 5, 1)
			ui:spacing(1)
			ui:layoutRow('dynamic', 30, 1)
			ui:label('Combobox:')
			ui:combobox(comboA, comboA.items)
			ui:layoutRow('dynamic', 5, 1)
			ui:spacing(1)
			ui:layoutRow('dynamic', 30, 1)
			if ui:widgetIsHovered() then
				ui:tooltip('Test tooltip')
			end
			local x, y, w, h = ui:widgetBounds()
			if ui:contextualBegin(100, 100, x, y, w, h) then
				ui:layoutRow('dynamic', 30, 1)
				ui:contextualItem('Item A')
				ui:contextualItem('Item B')
				ui:contextualEnd()
			end
			ui:label('Contextual (Right click me)')
			ui:groupEnd()
		end
	end
	ui:windowEnd()
	local function setTextInput(enable, ...)
		if(love.keyboard.hasTextInput() ~= enable) then
			print("setTextInput", enable)
			love.keyboard.setTextInput(enable)
		end
	end

	setTextInput(has_active_edit)

end
