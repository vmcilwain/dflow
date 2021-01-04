module ApplicationHelper
    # Long date format
  #
  # @param date [Date] the date object
  # @return day date month year - hour:minutes AM/PM
  def long_date(date)
    date.strftime("%A %d %B %Y - %H:%M %p") rescue 'unknown'
  end

  # Medium date format
  #
  # @param date [Date] the date object
  # @return month/date/year at hour:minutes AM/PM
  def medium_date(date)
    date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
  end

  # Another style of medium date format
  #
  # @param date [Date] the date object
  # @return day/MONTH/YEAR
  # Produces -> 18 October 2015
  def medium_date2(date)
    date.strftime("%d %B %Y") rescue 'unknown'
  end

  # Short date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  def short_date(date)
    date.strftime("%Y-%m-%d") rescue 'unknown'
  end

  # US date format
  #
  # @param date [Date] the date object
  # @return year-month-date
  def us_date(date)
    date.strftime("%m/%d/%Y at %H:%M %p") rescue 'unknown'
  end
  
  def boolean_to_text(value)
    case value
    when true
      'Yes'
    when false
      'No'
    else
      'Unknown Value'
    end
  end
  
  # Create a template header
  # @param [Hash] opts the options to create a header with.
  # @option opts [String] :title The title
  # @option opts [String] :links an array of link_to helpers
  # @option opts [String] :separator display an <hr /> element
  # @option opts [String] :description ('') The header description
  def header(opts={})
    output = "<header>"

    if opts[:title]
      output << "<h1>#{opts[:title]}</h1>"
    end

    output << opts[:links].join(" | ") if opts[:links]
    
    output << "<p class='text-muted'>#{opts[:description]}</p>" unless opts[:description].blank?

    output << '<br />' if opts[:links]

    output << '<hr />' if opts.fetch(:separator){ true }

    output << "</header>"
    output.html_safe
  end
  


  # def sub_header(opts={})
  #   render 'shared/components/sub_header',  title: opts.fetch(:title){""}.to_s, 
  #                                           description: opts[:description],
  #                                           links: opts[:links],
  #                                           separator: opts.fetch(:separator){true}
  # end

  # def search_form(opts={})
  #   render 'shared/components/search_form', url: opts.fetch(:url){""}.to_s,
  #                                           attribute: opts.fetch(:attribute),
  #                                           placeholder: opts.fetch(:placeholder){""}.to_s,
  #                                           label: opts.fetch(:label){opts.fetch(:attribute)}.to_s,
  #                                           no_label: opts.fetch(:no_label){false},
  #                                           button_name: opts.fetch(:button_name){:Search}.to_s
  # end
  
  # def paginate(opts={})
  #   render 'shared/components/paginator', records: opts.fetch(:records){[]},
  #                                         _class: opts.fetch(:class){'apple_pagination'},
  #                                         extra_info: opts.fetch(:extra_info){true}
  # end
end
