api = 2
core = 7.x

; Includes ====================================================================

includes[] = https://github.com/Wiredcraft/buildkit/raw/7.x-2.x/drupal-org.make

includes[] = https://github.com/Wiredcraft/buildkit/raw/7.x-2.x/tools.make

includes[] = https://github.com/Wiredcraft/buildkit/raw/7.x-2.x/multilingual.make

includes[] = https://github.com/Wiredcraft/buildkit/raw/7.x-2.x/libraries.make

; Override buildkit ===========================================================

projects[rubik][version] = 4.0-beta5

; Modules =====================================================================

projects[mollom][subdir] = contrib
projects[mollom][version] = 1.0

; Themes ======================================================================

; Libraries ===================================================================
