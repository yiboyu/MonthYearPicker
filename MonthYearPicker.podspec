#
# Be sure to run `pod lib lint MonthYearPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MonthYearPicker"
  s.version          = "2.0.0"
  s.summary          = "A UIDatePicker subclass that allows users to select a month and a year"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
    `UIDatePicker` doesn't have a mode for month/year, which is commonly used
in credit card forms. MonthYearPicker is a `UIDatePicker` subclass that displays
 localized months and years.
                       DESC

  s.homepage         = "https://github.com/alexanderedge/MonthYearPicker"
  s.license          = 'MIT'
  s.author           = { "Alexander Edge" => "alex@alexedge.co.uk" }
  s.source           = { :git => "https://github.com/alexanderedge/MonthYearPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/alexedge'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit'

end
