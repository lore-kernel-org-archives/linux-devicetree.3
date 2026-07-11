Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7F2E11C7
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799514; cv=none; b=fT8xlLu3keONLbcWY2OIyWbqprEQk1ttz/JPMbR9g52mrGusgvGxsoAgZJAGMWGaogSaq9mY8/GxmyBOE1pgU23aGROgj2jMwgzY5LKE/xwZXusMb8rBMaX9v6x1EoGgwYKnpoumqv5de6Xq6mlRQBD1DRNJgnn2B979Gh9gGb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799514; c=relaxed/simple;
	bh=4p0OwckIoK1pN5+1/GDFed8lvvfZBDCWEOIV0U5JO2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKdopvt7NWGnErn8SXpOPq1aJyKNxGniIpygIgRrLSeb9+nSS5erbLz8oyek7k4YDo++Z2owHJs7U7U2HeCX7iPc40aj8d6qXo3nqJ+YRCR51KCfCveovKkP5IUONivhpY7GKAyW4diQEhrTRpQlrZnR9rDP9BTzQdy9wCdRmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZLrlG9U2; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZLrlG9U2"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb9b427da2so2047753a34.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783799510; x=1784404310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAPzwDmfVpjdqQpz/jSP3klJkP4Fm9YGE/ryylhJqeg=;
        b=ZLrlG9U24rJa3MImVoJM5VPkRg03hKdqXsWv+BUiG/mw3REfzw20SwKraKLE+4zXdd
         N/3ME3JYLqvf7yd+rUAZ5EwEoorjt6BnDfLzm3XJRMPTEmQ3ciKByPy69QipKDsEFBYl
         lGaA+GWUMrRQAt7grwTKCt2Ks5pNzlHjS8vjHpo97xFAgTrhYaS6V0eRFyveZ8hKbbou
         rK9Ghv4DjegXibcxfOUsXcAhwmPRfMYTfFnOcdyLJ7DxNEoy5kBLfyVeac239uRIK52Z
         FuYPx+N5hKntoRBKGlzHnLHnqMjaYez1xWPqxZHK5OxXrL1lPJhP3ErV3DBIUhi8PqI7
         t2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783799510; x=1784404310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAPzwDmfVpjdqQpz/jSP3klJkP4Fm9YGE/ryylhJqeg=;
        b=eZqjqm0lns/UOTC4qQOVKdkihSimSUfvNCjvwZUDyTewl1ty42Dq/fDh5UlHjoatzF
         UPZJnATRq0V7OOt0yfAaIG+xa+4OkmESs7jSRGp2xnUNUgJ1JaB2Vse3byWZmEfrSVDX
         CK9yixch4uqEJ9xkD8t4AMJFaoSSSdJrr5LPLbIKP6g12fp/phYZ+KTyHeXVxPNwgCcE
         Poy4SlGObGNuYJ+XjO63X4oetLbAyMpYQ90POHdehPEDhSed1uxg/DEkwL5wUKBC3HcV
         4umFDh9sFjdXdzfNx33McLEcbsLjrUgIjBMK22N9NGypfHrL0evwHCaqtn/uYywSPvi7
         B18g==
X-Forwarded-Encrypted: i=1; AFNElJ9oFda236DtI9YAD5+MDFVfha7wjp0tOAgWbtZcLyZqMN9DQlGtr1Hm6HCxHFNHXwjgjSHCmNV+Jca+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2J/k37B7s88G7LiY4w15BCmc/ODPgiPCsVhN6mbT7CITwFBE
	BlkwqGdYbmq1s3XBMZNCHjlIEbTMuyDe3mz6iNiWqngdjwR3PvbBfFgd9sPFYjLXQ+Q=
X-Gm-Gg: AfdE7cn0oDlQTKk50kTrO5f0URzYUyQJTvdeFRL2EJniKwBGRzOXtQK+7PLhrHy7VNA
	N5AaptRu2B5b/mERhEejNvjPbjFlrO/8BpmvjlkwqP7IQ3A61Mj8Ev2NlX2jYiEMqkR25NlAva0
	uwJ24WjCKzNdlpiKJYAaS/vENzTuuymrZKNYP3br54vK7vgNLZsIFCfp7aKxCxszmKzHnX8lC5Z
	ZCxyBZ56P264MuQCf0xcslB5bryuJak92uyikBydM/eLPFapIgTT2WSgZEckzkVAU+b9fzdVqRV
	JcCVcE19903C2jXPHByUkd0cBgEZXuQzslNgV7ZB514F4fkt554V5nSu1qfi3EpzITKc4mru6af
	U7+MSD1ejWVEZsjOyqUVHLlMHl1vPvJ+s3hlFOTwJGU7BHRQNivyAS5PkWdMBtSvtyFPmm1uCmV
	63uEu+X3j89mNkAH/P4/poMvwRqNyvXlgwOBW4gphj0nRq8j6McLxH/bdgjxBReoI=
X-Received: by 2002:a05:6820:220f:b0:6a1:1ccd:d09d with SMTP id 006d021491bc7-6a38ba6522fmr4279988eaf.42.1783799509995;
        Sat, 11 Jul 2026 12:51:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm7532770fac.7.2026.07.11.12.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 12:51:49 -0700 (PDT)
Message-ID: <76607231-351c-4730-90d4-c7944e458b97@baylibre.com>
Date: Sat, 11 Jul 2026 14:51:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org
Cc: andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, duje@dujemihanovic.xyz, jic23@kernel.org,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 joshua.crofts1@gmail.com, krzk+dt@kernel.org, linusw@kernel.org,
 marcelo.schmitt@analog.com, mazziesaccount@gmail.com,
 mike.looijmans@topic.nl, nuno.sa@analog.com, robh@kernel.org,
 sakari.ailus@linux.intel.com, wens@kernel.org
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-2-jakubszczudlo40@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260711184414.1013686-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 1:44 PM, Jakub Szczudlo wrote:
> When device is suspended and it is in single mode then changing
> datarate doesn't make it actual wait for new measurement, so to

s/actual/actually/
s/for new/for a new/

> be sure that read after change is correct functions that changes
> datarate and gain will wait for new data.
> 
> Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  drivers/iio/adc/ti-ads1100.c | 67 +++++++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83..6ad80d42d390 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -15,10 +15,12 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
> +#include <linux/iopoll.h>
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/time.h>
>  #include <linux/units.h>
>  
>  #include <linux/iio/iio.h>
> @@ -43,6 +45,9 @@
>  static const int ads1100_data_rate[] = { 128, 32, 16, 8 };
>  static const int ads1100_data_rate_bits[] = { 12, 14, 15, 16 };
>  
> +/* Timeout based on the minimum sample rate of 8 SPS (7500ms) */
> +#define ADS1100_MAX_DRDY_TIMEOUT_US	(7500 * USEC_PER_MSEC)
> +
>  struct ads1100_data {
>  	struct i2c_client *client;
>  	struct regulator *reg_vdd;
> @@ -123,10 +128,46 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
>  	return 0;
>  }
>  
> +static bool ads1100_new_data_not_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return true;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int data_rate_Hz = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
> +	/* To be sure we wait 5 times more than data rate */
> +	unsigned long wait_time_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data_rate_Hz);
> +	bool data_ready;
> +	u8 buffer[3];
> +	int ret;
> +
> +	/* To be sure that polled value will have value after config change */
> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return readx_poll_timeout(ads1100_new_data_not_ready, data,
> +				 data_ready, data_ready != 0,

This is a bit confusing. The function says data_not_ready, but the variable
is data_ready, so when data_ready is true, is it ready or not? Also no need
to compare a bool to 0.

It would be easier to understand if the function was named
ads1100_new_data_is_ready() and returned true when data is ready.

> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
> +}
> +
