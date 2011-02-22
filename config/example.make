api = 2
core = 7.x

; Includes ====================================================================

includes[] = http://drupalcode.org/viewvc/drupal/contributions/profiles/buildkit/drupal-org.make?revision=1.17.2.1.2.13&view=co

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
projects[rubik][download][revision] = 33f84bf36e5cdbd26bdb17c20407f440ac4657c1
; Fix notices
projects[rubik][patch][] = http://drupal.org/files/issues/999582-1_notices.patch

; Libraries ===================================================================
