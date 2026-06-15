Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADEC3A784A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563100; cv=none; b=t1HppQCA5lJMF+cU/99BhDJ9C5h7K8FoQtsCDcyFIvGiq18sONAb4H3X7u460YVBby15N+OVbVXNqclnxst/h2i0u2pY8NytH+LeVADT3kKfrX/U7dI4wzYfdJWLP4sgcryX7z+ZLaxZ1qi60OGodkqGy6XS2XjaBl81Kg/2EQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563100; c=relaxed/simple;
	bh=zmh/9/I+Ra5L4aazE3efwtz83X4risHFng4evJxdkUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQdv86Rwj7/+vawheT9bVJTeo6IiParJbNoIpyi2e0iVuKRo07uho4/6UivJnzuWkOyhRCieu4gJs3pOBBhBrY0xWKrgut+W1J5CFWJr7H67+f7iIpRyZWpaT3WpVD5dfXEK2NCqWjFPTOzOrysM8coLtC2fQTT+PknEM813UFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PI8hpePX; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PI8hpePX"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69e4af5a411so2778109eaf.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781563097; x=1782167897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4mjjwj3awSpNfiOcNaXS7as/d7nNuOZ0XR39U0Vdf0=;
        b=PI8hpePX/od6rFqYwZJD0h08MCQREHmXS55r0az/ST3+7MXW+gXwHbFVUA+uGdP4PZ
         gR3+eWWGg8xzhipy2anFXl+CFz1Iz901v3vVtYYMmEYzwcNUOqRtGi35mDUABW5gcUXL
         UIUPi0D57PVFXhoeh9apaIXNb7N/GPQtJ6xzHKmDKJCqmPKc4cuDNXguzQaKsESfMRIA
         RAUfYYkPTmFKPWrNrQPWeMEdyRwhserI0j+vPOaQPu0pqBxFVeoYXWOVO/0rU1ddDcuC
         ExhS1Z/wJm/HBlNytSTLlJaxGTOAn9ipRtMMQAJDu8XDT6t7vECMlHfGaWQABLdu/QM2
         fX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563097; x=1782167897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4mjjwj3awSpNfiOcNaXS7as/d7nNuOZ0XR39U0Vdf0=;
        b=o2zbT/rTSP67fBtKZLQetHp1X1tr97mjJeSJ9NSCnSWLkP3LtMiRfvIRjoCEgVt4lv
         HpGc8Py4vVqEvwUdSNlSEYNjuQyEtBHLBJb/gJqXxhP8AjcMBx3OllvdbLDHbofXd1/k
         CsAZVEhO/axTwfdzqDMgZlyVkO+EJaAYenkxHyILR5uBgVOY73oZoiCLKj07PPGWVVFc
         eqHay5ajBkgLBwLVU0V8ex1WDEIwi5DSO+GJahGvOT8RMUGyrj6V4vFbvbXM+nl7oFNv
         0oM+MwuID7bkmgPblKFOOK8wKKDq/jhp1RjIiyEYKzWoOS7bT8dCPCaJmYiJG0pe1RKf
         VXCA==
X-Forwarded-Encrypted: i=1; AFNElJ9aH3gQTuxx02UzdAUqBrUJWHakFYkhSTE167UtpI72Vri7xAyulED0wXMhxk9DWoqvDwuceXXnto/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBYS8yBbV3E2xFnHYDhX+CQRHpkw8VQmoELizwWiytnhz/+JU
	XIuldlIRW8L/6BrCoxFzdD/GXEXIlJoxTZrXlWlblvA27QKILg2As1wsYA+uNvOcw74=
X-Gm-Gg: Acq92OE+JJqc1KX6GhGj/72YprQC8yukya9N7pe6BnFgq5JyQ6HHNtiJHN4g/90A3pA
	at7Dvk4aw7fMuOVRE1JPwxomzL3OXc+6tUb8/t3rmnI4UCMaFLQSKMWYh8tS+ztVziFQQggH3wa
	Q84XrGVVf4MoSAna+xO27L2cyvKviJSUv0WhP5PTG1PU2FDBvjjNR6Vn9bVs3aT/78I10u42sGJ
	XBuL+KeEWiqMrtvpLtsI/TEThPBSfgD1/KbjQwLqul3VInWhKmTdfVloJpWNgyR2bT0bNFWiL71
	aN6pnXS/eREEfR7+Zcw3fbIx3xspLtnTNeDGv1QBQqK2lPw3zU+2dkID9nxCcPxrk3UyCaDrqEw
	9Xg5hNf9LQcVG6iBdOzGVmB/eg5QD5AiGXgkJ4SE1XxH9eI+bFseLLKaU3FeEhHAJYwqIbe99Az
	kaZJYUzJLl7PrTrNebpktJu7mS4J6GaAi/pH7yrFghHhNrTLbutxYGrChHHefHnmp22yrVFSfAx
	A==
X-Received: by 2002:a05:6820:4c05:b0:69b:544f:b2e1 with SMTP id 006d021491bc7-69eec77e4acmr8859005eaf.2.1781563097377;
        Mon, 15 Jun 2026 15:38:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:16b0:5133:47b1:a939? ([2600:8803:e7e4:500:16b0:5133:47b1:a939])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00edacdasm3753191eaf.11.2026.06.15.15.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 15:38:16 -0700 (PDT)
Message-ID: <a0e19dd9-c2de-489f-a727-dbc42e5b36da@baylibre.com>
Date: Mon, 15 Jun 2026 17:38:15 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org
Cc: andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, duje@dujemihanovic.xyz, jic23@kernel.org,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 krzk+dt@kernel.org, linusw@kernel.org, linux-kernel@vger.kernel.org,
 marcelo.schmitt@analog.com, mazziesaccount@gmail.com,
 mike.looijmans@topic.nl, nuno.sa@analog.com, robh@kernel.org,
 sakari.ailus@linux.intel.com, wens@kernel.org, joshua.crofts1@gmail.com
References: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
 <20260613190957.654798-4-jakubszczudlo40@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260613190957.654798-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/26 2:09 PM, Jakub Szczudlo wrote:
> When device is suspended and it is in single mode then changing
> datarate doesn't make it actual wait for new measurement, so to

s/actual/actually/

> be sure that read after change is correct functions that changes
> datarate and gain will wait for new data.

s/datarate/data rate/g


The commit message isn't very clear to me. Is the point that the
changes don't actually take effect in the ADC until a conversion
is done?

> 
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  drivers/iio/adc/ti-ads1100.c | 55 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 76de2466dc53..195394665cd1 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -123,6 +123,36 @@ static int ads1100_get_voltage_microvolts(struct ads1100_data *data)
>  	return ads1100_get_voltage_milivolts(data) * MICRO / MILLI;
>  }
>  
> +static bool ads1100_new_data_ready(struct ads1100_data *data)
> +{
> +	int ret;
> +	u8 buffer[3];
> +
> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 3) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	bool data_ready;
> +	int datarate = data->ads_config->data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
> +   // To be sure we wait 5 times more than datarate
> +	unsigned long wait_time = DIV_ROUND_CLOSEST(MICRO, 5 * datarate);
> +
> +	/* To be sure that polled value will have value after config change */
> +	i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +
> +	return read_poll_timeout(ads1100_new_data_ready, data_ready,
> +				 !data_ready, wait_time,
> +				 ADS1100_MAX_DRDY_TIMEOUT, false, data);
> +}
> +
>  static int ads1100_data_bits(struct ads1100_data *data)
>  {
>  	return ads1100_data_rate_bits[FIELD_GET(ADS1100_DR_MASK, data->config)];
> @@ -165,6 +194,7 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
>  {
>  	int microvolts;
>  	int gain;
> +	int ret;
>  
>  	/* With Vdd between 2.7 and 5V, the scale is always below 1 */
>  	if (val)
> @@ -185,21 +215,40 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
>  	if (gain < BIT(0) || gain > BIT(3))
>  		return -EINVAL;
>  
> +	ret = pm_runtime_resume_and_get(&data->client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
>  
> -	return 0;
> +	ret = ads1100_poll_data_ready(data);
> +
> +	pm_runtime_put_autosuspend(&data->client->dev);
> +
> +	return ret;
>  }
>  
>  static int ads1100_set_data_rate(struct ads1100_data *data, int chan, int rate)
>  {
>  	unsigned int i;
>  	unsigned int size;
> +	int ret;
>  
>  	size = data->supports_data_rate ? ARRAY_SIZE(ads1100_data_rate) : 1;
>  	for (i = 0; i < size; i++) {
> -		if (data->ads_config->data_rate[i] == rate)
> -			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
> +		if (data->ads_config->data_rate[i] != rate)
> +			continue;
> +
> +		ret = pm_runtime_resume_and_get(&data->client->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ads1100_set_config_bits(data, ADS1100_DR_MASK,
>  					FIELD_PREP(ADS1100_DR_MASK, i));

Why no longer checking the return value of ads1100_set_config_bits()?

> +		ret = ads1100_poll_data_ready(data);
> +
> +		pm_runtime_put_autosuspend(&data->client->dev);
> +		return ret;
>  	}
>  
>  	return -EINVAL;

