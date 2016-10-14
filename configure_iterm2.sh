#!/bin/bash
# Author Ryan Nolette
# Date Modified 06/26/2016
#This script is used to configure a fresh mac install to ready to use state
#Installing Binaries with homebrew
#Installing Apps with homebrew cask
#############################################

#create directory for iterm2 logs to go to
mkdir "/Users/$username/Google Drive"
mkdir "/Users/$username/Google Drive/terminalSessions"

#configure iterm2

/bin/cat << EOM > /Users/$username/Library/Preferences/com.googlecode.iterm2.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>AboutToPasteTabsWithCancel</key>
	<true/>
	<key>AboutToPasteTabsWithCancel_selection</key>
	<integer>0</integer>
	<key>AppleAntiAliasingThreshold</key>
	<integer>1</integer>
	<key>AppleScrollAnimationEnabled</key>
	<integer>0</integer>
	<key>AppleSmoothFixedFontsSizeThreshold</key>
	<integer>1</integer>
	<key>ConvertDosNewlines</key>
	<false/>
	<key>Default Bookmark Guid</key>
	<string>542AF26B-8748-49D8-A192-9EB6307D14CC</string>
	<key>EscapeShellCharsWithBackslash</key>
	<false/>
	<key>LoadPrefsFromCustomFolder</key>
	<true/>
	<key>NSNavLastRootDirectory</key>
	<string>~/Google Drive</string>
	<key>NSNavPanelExpandedSizeForOpenMode</key>
	<string>{712, 459}</string>
	<key>NSNavPanelExpandedSizeForSaveMode</key>
	<string>{712, 521}</string>
	<key>NSQuotedKeystrokeBinding</key>
	<string></string>
	<key>NSRepeatCountBinding</key>
	<string></string>
	<key>NSScrollAnimationEnabled</key>
	<false/>
	<key>NSScrollViewShouldScrollUnderTitlebar</key>
	<false/>
	<key>NSTableView Columns KeyBingingTable</key>
	<array>
		<data>
		BAtzdHJlYW10eXBlZIHoA4QBQISEhAhOU1N0cmluZwGEhAhOU09iamVjdACF
		hAErATCG
		</data>
		<string>198</string>
		<data>
		BAtzdHJlYW10eXBlZIHoA4QBQISEhAhOU1N0cmluZwGEhAhOU09iamVjdACF
		hAErATGG
		</data>
		<string>307</string>
	</array>
	<key>NSTableView Hidden Columns KeyBingingTable</key>
	<array/>
	<key>NSTableView Sort Ordering KeyBingingTable</key>
	<array/>
	<key>NSWindow Frame SharedPreferences</key>
	<string>806 360 796 473 0 0 1680 1027 </string>
	<key>NSWindow Frame iTerm Window 0</key>
	<string>861 564 585 452 0 0 1680 1027 </string>
	<key>New Bookmarks</key>
	<array>
		<dict>
			<key>ASCII Anti Aliased</key>
			<true/>
			<key>Ambiguous Double Width</key>
			<false/>
			<key>Ansi 0 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0</string>
				<key>Red Component</key>
				<string>0</string>
			</dict>
			<key>Ansi 1 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0</string>
				<key>Red Component</key>
				<string>0.8</string>
			</dict>
			<key>Ansi 10 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.2039216</string>
				<key>Green Component</key>
				<string>0.8862745</string>
				<key>Red Component</key>
				<string>0.5411764999999999</string>
			</dict>
			<key>Ansi 11 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.3098039</string>
				<key>Green Component</key>
				<string>0.9137255</string>
				<key>Red Component</key>
				<string>0.9882353</string>
			</dict>
			<key>Ansi 12 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.8117647</string>
				<key>Green Component</key>
				<string>0.6235294</string>
				<key>Red Component</key>
				<string>0.4470588</string>
			</dict>
			<key>Ansi 13 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.6588235</string>
				<key>Green Component</key>
				<string>0.4980392</string>
				<key>Red Component</key>
				<string>0.6784314</string>
			</dict>
			<key>Ansi 14 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.8862745</string>
				<key>Green Component</key>
				<string>0.8862745</string>
				<key>Red Component</key>
				<string>0.2039216</string>
			</dict>
			<key>Ansi 15 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.9254902</string>
				<key>Green Component</key>
				<string>0.9333333</string>
				<key>Red Component</key>
				<string>0.9333333</string>
			</dict>
			<key>Ansi 2 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.02352941</string>
				<key>Green Component</key>
				<string>0.6039215999999999</string>
				<key>Red Component</key>
				<string>0.3058824</string>
			</dict>
			<key>Ansi 3 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0.627451</string>
				<key>Red Component</key>
				<string>0.7686275</string>
			</dict>
			<key>Ansi 4 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.6431373</string>
				<key>Green Component</key>
				<string>0.3960784</string>
				<key>Red Component</key>
				<string>0.2039216</string>
			</dict>
			<key>Ansi 5 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.4823529</string>
				<key>Green Component</key>
				<string>0.3137255</string>
				<key>Red Component</key>
				<string>0.4588235</string>
			</dict>
			<key>Ansi 6 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.6039215999999999</string>
				<key>Green Component</key>
				<string>0.5960785</string>
				<key>Red Component</key>
				<string>0.02352941</string>
			</dict>
			<key>Ansi 7 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.8117647</string>
				<key>Green Component</key>
				<string>0.8431373</string>
				<key>Red Component</key>
				<string>0.827451</string>
			</dict>
			<key>Ansi 8 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.3254902</string>
				<key>Green Component</key>
				<string>0.3411765</string>
				<key>Red Component</key>
				<string>0.3333333</string>
			</dict>
			<key>Ansi 9 Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0.1607843</string>
				<key>Green Component</key>
				<string>0.1607843</string>
				<key>Red Component</key>
				<string>0.9372549</string>
			</dict>
			<key>Automatically Log</key>
			<true/>
			<key>BM Growl</key>
			<true/>
			<key>Background Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0</string>
				<key>Red Component</key>
				<string>0</string>
			</dict>
			<key>Background Image Location</key>
			<string></string>
			<key>Badge Color</key>
			<dict>
				<key>Alpha Component</key>
				<real>0.5</real>
				<key>Blue Component</key>
				<real>0.0</real>
				<key>Color Space</key>
				<string>Calibrated</string>
				<key>Green Component</key>
				<real>0.0</real>
				<key>Red Component</key>
				<real>1</real>
			</dict>
			<key>Blinking Cursor</key>
			<true/>
			<key>Blur</key>
			<false/>
			<key>Bold Color</key>
			<dict>
				<key>Blue Component</key>
				<string>1</string>
				<key>Green Component</key>
				<string>1</string>
				<key>Red Component</key>
				<string>1</string>
			</dict>
			<key>Character Encoding</key>
			<integer>4</integer>
			<key>Close Sessions On End</key>
			<true/>
			<key>Columns</key>
			<integer>80</integer>
			<key>Command</key>
			<string></string>
			<key>Cursor Color</key>
			<dict>
				<key>Blue Component</key>
				<string>1</string>
				<key>Green Component</key>
				<string>1</string>
				<key>Red Component</key>
				<string>1</string>
			</dict>
			<key>Cursor Guide Color</key>
			<dict>
				<key>Alpha Component</key>
				<real>0.25</real>
				<key>Blue Component</key>
				<real>1</real>
				<key>Color Space</key>
				<string>Calibrated</string>
				<key>Green Component</key>
				<real>0.91000000000000003</real>
				<key>Red Component</key>
				<real>0.65000000000000002</real>
			</dict>
			<key>Cursor Text Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0</string>
				<key>Red Component</key>
				<string>0</string>
			</dict>
			<key>Custom Command</key>
			<string>No</string>
			<key>Custom Directory</key>
			<string>No</string>
			<key>Default Bookmark</key>
			<string>No</string>
			<key>Description</key>
			<string>Default</string>
			<key>Disable Window Resizing</key>
			<true/>
			<key>Flashing Bell</key>
			<false/>
			<key>Foreground Color</key>
			<dict>
				<key>Blue Component</key>
				<string>1</string>
				<key>Green Component</key>
				<string>1</string>
				<key>Red Component</key>
				<string>1</string>
			</dict>
			<key>Guid</key>
			<string>542AF26B-8748-49D8-A192-9EB6307D14CC</string>
			<key>Horizontal Spacing</key>
			<real>1</real>
			<key>Idle Code</key>
			<integer>0</integer>
			<key>Jobs to Ignore</key>
			<array>
				<string>rlogin</string>
				<string>ssh</string>
				<string>slogin</string>
				<string>telnet</string>
			</array>
			<key>Keyboard Map</key>
			<dict>
				<key>0x2d-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1f</string>
				</dict>
				<key>0x32-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x00</string>
				</dict>
				<key>0x33-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1b</string>
				</dict>
				<key>0x34-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1c</string>
				</dict>
				<key>0x35-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1d</string>
				</dict>
				<key>0x36-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1e</string>
				</dict>
				<key>0x37-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1f</string>
				</dict>
				<key>0x38-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x7f</string>
				</dict>
				<key>0xf700-0x220000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2A</string>
				</dict>
				<key>0xf700-0x240000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5A</string>
				</dict>
				<key>0xf700-0x260000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;6A</string>
				</dict>
				<key>0xf700-0x280000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1b 0x1b 0x5b 0x41</string>
				</dict>
				<key>0xf701-0x220000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2B</string>
				</dict>
				<key>0xf701-0x240000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5B</string>
				</dict>
				<key>0xf701-0x260000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;6B</string>
				</dict>
				<key>0xf701-0x280000</key>
				<dict>
					<key>Action</key>
					<integer>11</integer>
					<key>Text</key>
					<string>0x1b 0x1b 0x5b 0x42</string>
				</dict>
				<key>0xf702-0x220000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2D</string>
				</dict>
				<key>0xf702-0x240000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5D</string>
				</dict>
				<key>0xf702-0x260000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;6D</string>
				</dict>
				<key>0xf702-0x280000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>b</string>
				</dict>
				<key>0xf703-0x220000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2C</string>
				</dict>
				<key>0xf703-0x240000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5C</string>
				</dict>
				<key>0xf703-0x260000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;6C</string>
				</dict>
				<key>0xf703-0x280000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>f</string>
				</dict>
				<key>0xf704-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2P</string>
				</dict>
				<key>0xf705-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2Q</string>
				</dict>
				<key>0xf706-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2R</string>
				</dict>
				<key>0xf707-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2S</string>
				</dict>
				<key>0xf708-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[15;2~</string>
				</dict>
				<key>0xf709-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[17;2~</string>
				</dict>
				<key>0xf70a-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[18;2~</string>
				</dict>
				<key>0xf70b-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[19;2~</string>
				</dict>
				<key>0xf70c-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[20;2~</string>
				</dict>
				<key>0xf70d-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[21;2~</string>
				</dict>
				<key>0xf70e-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[23;2~</string>
				</dict>
				<key>0xf70f-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[24;2~</string>
				</dict>
				<key>0xf729-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2H</string>
				</dict>
				<key>0xf729-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5H</string>
				</dict>
				<key>0xf72b-0x20000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;2F</string>
				</dict>
				<key>0xf72b-0x40000</key>
				<dict>
					<key>Action</key>
					<integer>10</integer>
					<key>Text</key>
					<string>[1;5F</string>
				</dict>
			</dict>
			<key>Link Color</key>
			<dict>
				<key>Alpha Component</key>
				<real>1</real>
				<key>Blue Component</key>
				<real>0.67800000000000005</real>
				<key>Color Space</key>
				<string>Calibrated</string>
				<key>Green Component</key>
				<real>0.27000000000000002</real>
				<key>Red Component</key>
				<real>0.023</real>
			</dict>
			<key>Log Directory</key>
			<string>/Users/$username/Google Drive/terminalSessions</string>
			<key>Mouse Reporting</key>
			<true/>
			<key>Name</key>
			<string>Default</string>
			<key>Non Ascii Font</key>
			<string>Monaco 12</string>
			<key>Non-ASCII Anti Aliased</key>
			<true/>
			<key>Normal Font</key>
			<string>MesloLGMDZ-RegularForPowerline 12</string>
			<key>Option Key Sends</key>
			<integer>0</integer>
			<key>Prompt Before Closing 2</key>
			<false/>
			<key>Right Option Key Sends</key>
			<integer>0</integer>
			<key>Rows</key>
			<integer>25</integer>
			<key>Screen</key>
			<integer>-1</integer>
			<key>Scrollback Lines</key>
			<integer>1000</integer>
			<key>Scrollback With Status Bar</key>
			<true/>
			<key>Selected Text Color</key>
			<dict>
				<key>Blue Component</key>
				<string>0</string>
				<key>Green Component</key>
				<string>0</string>
				<key>Red Component</key>
				<string>0</string>
			</dict>
			<key>Selection Color</key>
			<dict>
				<key>Blue Component</key>
				<string>1</string>
				<key>Green Component</key>
				<string>0.8353</string>
				<key>Red Component</key>
				<string>0.7098</string>
			</dict>
			<key>Send Code When Idle</key>
			<false/>
			<key>Shortcut</key>
			<string></string>
			<key>Silence Bell</key>
			<false/>
			<key>Sync Title</key>
			<false/>
			<key>Tags</key>
			<array/>
			<key>Terminal Type</key>
			<string>xterm-256color</string>
			<key>Transparency</key>
			<real>0.0</real>
			<key>Unlimited Scrollback</key>
			<true/>
			<key>Use Bold Font</key>
			<true/>
			<key>Use Bright Bold</key>
			<true/>
			<key>Use Italic Font</key>
			<true/>
			<key>Use Non-ASCII Font</key>
			<false/>
			<key>Vertical Spacing</key>
			<real>1</real>
			<key>Visual Bell</key>
			<true/>
			<key>Window Type</key>
			<integer>0</integer>
			<key>Working Directory</key>
			<string>/Users/$username</string>
		</dict>
	</array>
	<key>NoSyncDoNotWarnBeforeMultilinePaste</key>
	<true/>
	<key>NoSyncDoNotWarnBeforeMultilinePaste_selection</key>
	<integer>0</integer>
	<key>NoSyncInstallationId</key>
	<string>A5A72D10-BF5E-4974-8081-4F763B955D13</string>
	<key>NoSyncPermissionToShowTip</key>
	<false/>
	<key>NoSyncTimeOfFirstLaunchOfVersionWithTip</key>
	<real>493321341.726735</real>
	<key>PasteSpecialChunkDelay</key>
	<real>0.01</real>
	<key>PasteSpecialChunkSize</key>
	<integer>1024</integer>
	<key>PasteSpecialRegex</key>
	<string></string>
	<key>PasteSpecialSubstitution</key>
	<string></string>
	<key>PasteSpecialUseRegexSubstitution</key>
	<false/>
	<key>PointerActions</key>
	<dict>
		<key>Button,1,1,,</key>
		<dict>
			<key>Action</key>
			<string>kContextMenuPointerAction</string>
		</dict>
		<key>Button,2,1,,</key>
		<dict>
			<key>Action</key>
			<string>kPasteFromSelectionPointerAction</string>
		</dict>
		<key>Gesture,ThreeFingerSwipeDown,,</key>
		<dict>
			<key>Action</key>
			<string>kPrevWindowPointerAction</string>
		</dict>
		<key>Gesture,ThreeFingerSwipeLeft,,</key>
		<dict>
			<key>Action</key>
			<string>kPrevTabPointerAction</string>
		</dict>
		<key>Gesture,ThreeFingerSwipeRight,,</key>
		<dict>
			<key>Action</key>
			<string>kNextTabPointerAction</string>
		</dict>
		<key>Gesture,ThreeFingerSwipeUp,,</key>
		<dict>
			<key>Action</key>
			<string>kNextWindowPointerAction</string>
		</dict>
	</dict>
	<key>PrefsCustomFolder</key>
	<string>/Users/$username/Google Drive</string>
	<key>QuitWhenAllWindowsClosed</key>
	<true/>
	<key>SUEnableAutomaticChecks</key>
	<true/>
	<key>SUFeedAlternateAppNameKey</key>
	<string>iTerm</string>
	<key>SUFeedURL</key>
	<string>https://iterm2.com/appcasts/final.xml?shard=86</string>
	<key>SUHasLaunchedBefore</key>
	<true/>
	<key>SULastCheckTime</key>
	<date>2016-08-22T16:09:01Z</date>
	<key>SUSendProfileInfo</key>
	<false/>
	<key>SmartPlacement</key>
	<true/>
	<key>WordCharacters</key>
	<string>/-+\~_.</string>
	<key>iTerm Version</key>
	<string>3.0.7</string>
	<key>kCPKSelectionViewPreferredModeKey</key>
	<integer>0</integer>
	<key>kCPKSelectionViewShowHSBTextFieldsKey</key>
	<false/>
</dict>
</plist>
EOM
