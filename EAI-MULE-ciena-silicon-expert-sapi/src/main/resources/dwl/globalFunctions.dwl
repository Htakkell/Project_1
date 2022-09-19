%dw 2.0
fun toDBFormatDateTimeCoversion (dateTimeValue) = if (dateTimeValue != "" and dateTimeValue != null) dateTimeValue as LocalDateTime {format : "dd/MM/yyyy HH:mm:ss"} as String {format : "yyyy-MM-d'T'HH:mm:ss"} else null
fun toDBFormatDateCoversion (dateValue) = if (dateValue != "" and dateValue != null) dateValue as Date {format : "dd-MMM-yyyy"} as String {format : "yyyy-MM-dd"} else null
fun toApiFormatDateTimeCoversion (dateTimeValue) = if (dateTimeValue != "" and dateTimeValue != null) dateTimeValue as LocalDateTime {format : "yyyy-MM-dd'T'HH:mm:ss"} as String {format : "dd/MM/yyyy HH:mm:ss"} else null
fun toApiFormatDateCoversion (dateValue) = if (dateValue != "" and dateValue != null) dateValue as Date {format : "yyyy-MM-dd"} as String {format : "dd-MMM-yyyy"} else null