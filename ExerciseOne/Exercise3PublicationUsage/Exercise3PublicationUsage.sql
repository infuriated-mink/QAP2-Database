CREATE TABLE Publication (
  pub_id SERIAL PRIMARY KEY,
  pub_title VARCHAR,
  last_rev DATE
);

CREATE TABLE MonthyUsage (
  monthly_usage_id SERIAL PRIMARY KEY,
  month DATE,
  pub_id INT REFERENCES Publication(pub_id),
  CONSTRAINT FK_MonthyUsage_pub_id
    FOREIGN KEY (pub_id)
      REFERENCES Publication(pub_id)
);

CREATE TABLE DailyUsage (
  daily_usage_id SERIAL PRIMARY KEY,
  date DATE,
  usage INT,
  monthly_usage_id INT REFERENCES MonthyUsage(monthly_usage_id),
  CONSTRAINT FK_DailyUsage_monthly_usage_id
    FOREIGN KEY (monthly_usage_id)
      REFERENCES MonthyUsage(monthly_usage_id)
);
