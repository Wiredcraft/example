<?php
/**
 * @file
 * features_tags.features.user_permission.inc
 */

/**
 * Implementation of hook_user_default_permissions().
 */
function features_tags_user_default_permissions() {
  $permissions = array();

  // Exported permission: delete terms in tags
  $permissions['delete terms in tags'] = array(
    'name' => 'delete terms in tags',
    'roles' => array(
      0 => 'administrator',
    ),
    'module' => 'taxonomy',
  );

  // Exported permission: edit terms in tags
  $permissions['edit terms in tags'] = array(
    'name' => 'edit terms in tags',
    'roles' => array(
      0 => 'administrator',
    ),
    'module' => 'taxonomy',
  );

  return $permissions;
}
