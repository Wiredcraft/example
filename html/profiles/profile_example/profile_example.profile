<?php
/**
 * @file.
 */
require_once DRUPAL_ROOT . '/sites/all/libraries/profile_helper/profile_helper.inc';

/**
 * Implements hook_install_tasks().
 */
function profile_example_install_tasks($install_state) {
  $tasks = array();

  $tasks['install_custom_configure'] = array(
    'display_name' => st('Other configurations'),
    'type' => 'batch',
  );

  return $tasks;
}

/**
 * Implements hook_form_FORM_ID_alter().
 */
function profile_example_form_install_configure_form_alter(&$form, $form_state) {
  // Site information.
  $form['site_information']['site_name']['#default_value'] = 'Example';

  // Admin account.
  $form['admin_account']['account']['name']['#default_value'] = 'admin';

  // Server settings.
  $form['server_settings']['site_default_country']['#default_value'] = 'CN';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'Asia/Shanghai';

  // Update notifications.
  $form['update_notifications']['update_status_module']['#default_value'] = array();

  // Disable validate.
  $form['#validate'] = array();
}

/**
 * Tasks.
 */

/**
 * Task callback.
 */
function install_custom_configure(&$install_state) {
  $batch = array();
  $batch['title'] = st('Configuring @drupal', array('@drupal' => drupal_install_profile_distribution_name()));

  // Create administrator role.
  $batch['operations'][] = array('profile_helper_create_administrator_role', array());
  $batch['operations'][] = array('profile_helper_flush_cache', array());

  // Revert features.
  $batch['operations'][] = array('profile_helper_revert_features', array());
  $batch['operations'][] = array('profile_helper_flush_cache', array());

  // Create links.
  $batch['operations'][] = array('profile_helper_create_menu_links', array('user-menu', array(
    'user/login' => 'Log in',
    'user/register' => 'Register',
  ), 0));

  $batch['error_message'] = st('The configuration has encountered an error.');
  $batch['finished'] = 'install_custom_configure_finished';
  return $batch;
}

/**
 * Batch finished callback.
 */
function install_custom_configure_finished($success, $results, $operations) {
  // Aegir enables this.
//  if (module_exists('update')) {
//    module_disable(array('update'), FALSE);
//  }

  // Done.
  drupal_flush_all_caches();
}
