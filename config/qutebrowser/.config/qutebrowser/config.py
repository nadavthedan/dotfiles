# ~/.config/qutebrowser/config.py

# Start from a clean slate (disable autoconfig.yml)
config.load_autoconfig(False)

# ========== Privacy & Adblocking ==========
# Use Brave’s adblock list (fast & reliable)
c.content.blocking.method = "both"  # both: adblock lists + hosts file
c.content.blocking.enabled = True
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
]

# Disable 3rd party cookies by default
c.content.cookies.accept = "no-3rdparty"

# ========== Dark Mode ==========
# Enable dark mode for web content
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.bg = "black"

# UI theme tweaks
# Same base color for all tabs
base_color = "#2e3440"  # dark gray/blue
active_color = "#5e81ac"  # nord blue
text_color = "#d8dee9"  # light gray
active_text = "#ffffff"  # white for active tab

# Normal (unselected) tabs
c.colors.tabs.odd.bg = base_color
c.colors.tabs.even.bg = base_color
c.colors.tabs.odd.fg = text_color
c.colors.tabs.even.fg = text_color

# Selected (active) tab
c.colors.tabs.selected.odd.bg = active_color
c.colors.tabs.selected.even.bg = active_color
c.colors.tabs.selected.odd.fg = active_text
c.colors.tabs.selected.even.fg = active_text


# ========== Search Engines ==========
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "w": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/?search={}",
}

# ========== Tabs ==========
c.tabs.show = "multiple"
c.tabs.position = "top"
c.tabs.background = True  # Open tabs in background
c.tabs.last_close = "default-page"

# ========== Downloads ==========
c.downloads.position = "bottom"
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False  # Don’t ask where to save

# ========== Editor ==========
c.editor.command = ["vim", "{}"]

# ========== Keybindings ==========
# Example: open external video in mpv
config.bind(",M", "hint links spawn mpv --ytdl-raw-options=no-playlist= {hint-url}")
config.bind(",m", "spawn mpv {url}")
# Example: quickly reload config
config.bind(",r", "config-source")
# Example: toggle dark mode
config.bind(",d", "config-cycle colors.webpage.darkmode.enabled true false")
# Bitwarden
config.bind("<Alt-b>", "spawn --userscript qute-bitwarden")
config.bind(
    "<Ctrl-Alt-b>",
    "spawn --userscript qute-bitwarden --url-only",
)
# ========== Other Useful Tweaks ==========
c.scrolling.smooth = False
c.confirm_quit = ["downloads"]  # Warn if downloads are running
c.content.autoplay = False  # Block autoplaying media
