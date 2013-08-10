class Log < ActiveRecord::Base
  TYPES = {
    login:                  'login',
    logout:                 'logout',
    signed_up:              'signed_up',
    invalid_login_attempt:  'invalid_login_attempt',
    pass_reset:             'password_reset',
    forgot_pass:            'forgot_password_requested',
    contest_scheduled:      'contest_scheduled',
    contest_draft_saved:    'contest_draft_saved',
    contest_ended:          'contest_ended',
    contest_created:        'contest_created',
    contest_deleted:        'contest_deleted',
    contest_edited:         'contest_edited',
    contest_copied:         'contest_copied',
    bought_ppc:             'bought_ppc',
    bought_basic:           'bought_basic_subscription',
    bought_branding:        'bought_branding',
    bought_plus:            'bought_plus_subscription',
    bought_premium:         'bought_premium_subscription',
    cancel_subs:            'cancel_subscription',
    profile_update:         'profile_update',
    upload_contest_banner:  'uploaded_contest_banner',
    upload_contest_bg:      'uploaded_contest_background',
    upload_prize_image:     'uploaded_prize_image',
    linked_twitter:         'linked_twitter_account',
    winner_declared:        'winner_declaration',
    report_download:        'downloaded_report',
    player_contacted:       'player_contacted',
    added_manager:          'added_manager',
    deleted_manager:        'deleted_manager',
    deactivated_manager:    'deactivated_manager',
    reset_manager_pass:     'reset_manager_password',
    resend_mail_to_manager: 'resend_mail_to_manager'
  }
  belongs_to :user
end
