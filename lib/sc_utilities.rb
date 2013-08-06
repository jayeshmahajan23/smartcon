module SCUtilities

  def sc_date dt
    dt.strftime(t(:sc_short, scope: 'date.formats'))
  end

  def sc_date_with_time dt
    dt.strftime(t(:sc_short_with_time, scope: 'date.formats'))
  end

  def sc_date_with_tzone dt
    dt.strftime(t(:sc_short_with_timezone, scope: 'date.formats'))
  end

end