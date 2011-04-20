<?php
/**
 * @file
 * features_settings.context.inc
 */

/**
 * Implementation of hook_context_default_contexts().
 */
function features_settings_context_default_contexts() {
  $export = array();

  $context = new stdClass;
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'admin';
  $context->description = '';
  $context->tag = 'Sitewide';
  $context->conditions = array(
    'path' => array(
      'values' => array(
        'admin' => 'admin',
        'admin/*' => 'admin/*',
      ),
    ),
  );
  $context->reactions = array(
    'block' => array(
      'blocks' => array(
        'system-help' => array(
          'module' => 'system',
          'delta' => 'help',
          'region' => 'help',
          'weight' => 0,
        ),
        'system-main' => array(
          'module' => 'system',
          'delta' => 'main',
          'region' => 'content',
          'weight' => 0,
        ),
        'user-login' => array(
          'module' => 'user',
          'delta' => 'login',
          'region' => 'content',
          'weight' => 1,
        ),
        'node-recent' => array(
          'module' => 'node',
          'delta' => 'recent',
          'region' => 'dashboard_main',
          'weight' => 0,
        ),
        'comment-recent' => array(
          'module' => 'comment',
          'delta' => 'recent',
          'region' => 'dashboard_main',
          'weight' => 1,
        ),
        'user-new' => array(
          'module' => 'user',
          'delta' => 'new',
          'region' => 'dashboard_sidebar',
          'weight' => 0,
        ),
        'user-online' => array(
          'module' => 'user',
          'delta' => 'online',
          'region' => 'dashboard_sidebar',
          'weight' => 1,
        ),
      ),
    ),
  );
  $context->condition_mode = 0;

  // Translatables
  // Included for use with string extractors like potx.
  t('Sitewide');
  $export['admin'] = $context;

  $context = new stdClass;
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'non-admin';
  $context->description = '';
  $context->tag = 'Sitewide';
  $context->conditions = array(
    'path' => array(
      'values' => array(
        '~admin' => '~admin',
        '~admin/*' => '~admin/*',
      ),
    ),
  );
  $context->reactions = array(
    'block' => array(
      'blocks' => array(
        'system-help' => array(
          'module' => 'system',
          'delta' => 'help',
          'region' => 'help',
          'weight' => 0,
        ),
        'system-main' => array(
          'module' => 'system',
          'delta' => 'main',
          'region' => 'content',
          'weight' => 0,
        ),
        'user-login' => array(
          'module' => 'user',
          'delta' => 'login',
          'region' => 'sidebar_first',
          'weight' => 0,
        ),
        'system-navigation' => array(
          'module' => 'system',
          'delta' => 'navigation',
          'region' => 'sidebar_first',
          'weight' => 1,
        ),
        'system-powered-by' => array(
          'module' => 'system',
          'delta' => 'powered-by',
          'region' => 'footer',
          'weight' => 0,
        ),
      ),
    ),
  );
  $context->condition_mode = 0;

  // Translatables
  // Included for use with string extractors like potx.
  t('Sitewide');
  $export['non-admin'] = $context;

  return $export;
}
