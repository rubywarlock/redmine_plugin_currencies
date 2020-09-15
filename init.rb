Redmine::Plugin.register :currency_informer do
  name 'Currency Informer plugin'
  author 'Vitaly Simakov'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  menu :application_menu, :currency_informers, { controller: 'currency_informers', action: 'index' }, caption: 'Валютный информер'
end
