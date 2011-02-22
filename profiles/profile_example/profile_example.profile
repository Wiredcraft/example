<?php
// $Id$

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
  $form['site_information']['account']['name']['#default_value'] = 'admin';

  // Server settings.
  $form['server_settings']['site_default_country']['#default_value'] = 'CN';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'Asia/Shanghai';

  // Update notifications.
  $form['update_notifications']['update_status_module']['#default_value'] = array(0 => 0, 1 => 0);
  $form['update_notifications']['#access'] = FALSE;

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
  $batch['operations'][] = array('_profile_custom_roles', array());
  $batch['operations'][] = array('_profile_flush_cache', array());
  $batch['operations'][] = array('_profile_revert_features', array());
  $batch['error_message'] = st('The configuration has encountered an error.');
  $batch['finished'] = 'install_custom_configure_finished';
  return $batch;
}

/**
 * 'Finished' callback.
 */
function install_custom_configure_finished($success, $results, $operations) {
  drupal_flush_all_caches();
}

/**
 * Custom.
 */

/**
 * Create custom roles.
 */
function _profile_custom_roles() {
  // Create a default role for site administrators, with all available permissions assigned.
  $admin_role = new stdClass();
  $admin_role->name = 'administrator';
  $admin_role->weight = 2;
  user_role_save($admin_role);
  user_role_grant_permissions($admin_role->rid, array_keys(module_invoke_all('permission')));
  // Set this as the administrator role.
  variable_set('user_admin_role', $admin_role->rid);

  // Assign user 1 the "administrator" role.
  db_insert('users_roles')
    ->fields(array('uid' => 1, 'rid' => $admin_role->rid))
    ->execute();
}

/**
 * Private.
 */

/**
 * Flush caches.
 */
function _profile_flush_cache() {
  drupal_flush_all_caches();
  drupal_get_schema(NULL, TRUE);
}

/**
 * Revert all features.
 *
 * Difference with features_revert().
 * - call features_get_component_states() with $rebuild_only = FALSE and $reset = TRUE.
 */
function _profile_revert_features() {
  module_load_include('inc', 'features', 'features.export');
  features_include();

  $restore_states = array(FEATURES_OVERRIDDEN, FEATURES_REBUILDABLE, FEATURES_NEEDS_REVIEW);

  $items = array();
  $states = features_get_component_states(array(), FALSE, TRUE);
  foreach ($states as $module_name => $components) {
    foreach ($components as $component => $state) {
      if (in_array($state, $restore_states)) {
        $items[$module_name][] = $component;
      }
    }
  }

  features_revert($items);
}
