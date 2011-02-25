api = 2
core = 7.x

; Includes ====================================================================

includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/dd1c740967b139a03002848bc1ec83e20ca929f7:/drupal-org.make

; Override buildkit ===========================================================

projects[devel][subdir] = contrib
projects[devel][version] = 1.0
projects[devel][download] = NULL

projects[features][subdir] = contrib
projects[features][version] = 1.0-beta1
projects[features][download] = NULL

; Modules =====================================================================

projects[boxes][subdir] = contrib
projects[boxes][version] = 1.0-beta2

projects[date][subdir] = contrib
projects[date][version] = 1.0-alpha2

projects[libraries][subdir] = contrib
projects[libraries][version] = 1.0

projects[markdown][subdir] = contrib
projects[markdown][version] = 1.0-beta1

projects[mollom][subdir] = contrib
projects[mollom][version] = 1.0

projects[token][subdir] = contrib
projects[token][version] = 1.0-beta1

projects[transliteration][subdir] = contrib
projects[transliteration][version] = 3.0-alpha1

; Multilingual ================================================================

projects[potx][subdir] = multilingual
projects[potx][version] = 1.0

projects[i18n][subdir] = multilingual
projects[i18n][version] = 1.0-alpha3

projects[l10n_client][subdir] = multilingual
projects[l10n_client][version] = 1.0-beta3

projects[l10n_update][subdir] = multilingual
projects[l10n_update][version] = 1.0-alpha3

projects[languageicons][subdir] = multilingual
projects[languageicons][version] = 1.0-alpha1

; Themes ======================================================================

projects[rubik][type] = theme
projects[rubik][download][type] = git
projects[rubik][download][url] = git://git.drupal.org/project/rubik.git
projects[rubik][download][branch] = 7.x-4.x
; Fix notices
projects[rubik][patch][] = http://drupal.org/files/issues/999582-1_notices.patch

; Libraries ===================================================================
