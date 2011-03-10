api = 2
core = 7.x

; Includes ====================================================================

includes[] = http://drupalcode.org/project/buildkit.git/blob_plain/refs/heads/7.x-2.x:/drupal-org.make

; Override buildkit ===========================================================

projects[rubik][version] = 4.0-beta5

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

; Libraries ===================================================================
