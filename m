Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539D41687A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268417; cv=none; b=PtBvui8c35xTpCqfE8aYIZIEuDWyBapWD/i6fAA9qlfSmAQj05D1PcpSQY6IQ1uTLDAJP8sP1lHYoQzPmGmIDpxp1O+Jj5w1yaOkUpoqnUHkIByZARbHnMVMVJEZV150Trqs9u1sx4waMTwXhnNLXxMPnAvvvLp9l/t6XOP2MJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268417; c=relaxed/simple;
	bh=9G3OJlObGx9Foxnt3wkRhqkCJY2ck3HdrIFqFbEZ+vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bH1miSM6EgRBCRKIcrNgiBQqNxib8zDsTnuR2WbUNpdDx21oF7gqU806A9oo4v/DYVBtjUhLwEThjE1TSwIjuD44kTzSTSxJ+jo33IJULK/h8fY01sZenQc33RFU7LpNW9YaJ7Iz8OOtJGKE9fWhX3n/2NIOiMQvQuh2Hg3dV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0m+1y7N; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0m+1y7N"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so8083705ad.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268413; x=1790873213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UxPkbr3pw7/EMgMfuUOgi5E5rPkq0lQ/KwSa5X8KYI=;
        b=e0m+1y7NGoeoU9CgHc+ykxO9paJsMPasCxAmNzr+l7wcFGqvH0o02fkSxGG5NZizyE
         /oMExbLc16gM4rdG6yZCuNd25AqbKtV1dG//knZrQE0EwR4KCN+/q7rn3J+4FlQmNVOg
         OWqFgoE/4aJp6jykwbNGHt3yKVjV8BH0PAYMPvztJTIXsQXsW5Xk18ZZfqVA8CB+wCRg
         bS/YdqkZsPCvjrF+8MxXJjQjWaut42t1PRHZgyInqDujvNKWoEFde7SikLZb66tsAV02
         Ipv8kl93d55bCF0OUlZ+ZVl60sK4OvgEpLphjx9+YnTydPwyKV3Q/CQ8LK7+plhq8731
         icKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268413; x=1790873213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UxPkbr3pw7/EMgMfuUOgi5E5rPkq0lQ/KwSa5X8KYI=;
        b=jeIIbhrBRSQitY7pBZVYdBRprOih+w2pCplBeHc/L5zfDdJtTQd47XJFSMCexrdX6I
         Olz5iTQv9MEXyis0GzmAceXWjs68Sp+g4rR9Mtyt5Ba/9XLQw7cqJ7c/p/7LFFiDqBL5
         qSQ5fUd5y/D2sJqKBy/I9R5RBMOVEL+Jm+8QXBj6obbJZ8ZtJe4JQ7aUiFqBMJHeK4ys
         r5e3FfOdOr94mE/+m/J4wNA16WyAzf3SaxK4S849QB/k3ngMUUgQueyt8vCKKzORY30e
         z2gXIy1IFgiK7KggMGFE7JHnCpZeaseY4Z0oeSX5JYqYBGEbfHH2EwISrjkMC9DeEEkY
         W/TA==
X-Forwarded-Encrypted: i=1; AKwUvBxXhk9xavVzCwxedKBVK++BdwudPDuRKsDaGqbkCOqXBSOCSWzcndMvUZ7DztKxCS29Pou0rEMIeevi@vger.kernel.org
X-Gm-Message-State: AFuF++nWkO25wiwWP20Dc/Tl3oUH/llDe1Vt2/yBpvV7btc6tKG31mgr
	/ag4YizEbO/YO9wy5k3BxPlffHoj7HIDQ+RrZWfM+xmKqULPPPvBQWo+
X-Gm-Gg: AYBFou2wnqghoh2PHr+1O34zxjnEJKHHyeAKKDAURr6MBHg3KvsXWnCT1Z3sJykAkw3
	cXOYDpn8umt+ASRw5xWeWiC9zB4FjsR8ZkyGcsiJ7RY+6GypT7BDIEbLcydJ9jYZirpZ9fbxBVS
	FQdOCnfpv32609cMRpJ4x5i2dYAxO7mqgRzoS5bHGTSakMTxP75KJoLYDtQzPYZROxvziOd1Nm/
	yQxSjpZPGKdglV3mp9Sc8iypRAyKQ+neDzFSQM62lqRb+pvS/ctedjw4RGa5/eVTGtU8ZXDzut8
	ZuuIJ3R8zco2mVXIqWsJRrqYiVgQUErU43J0/ouSSGgtaaHpPmeTRf2FzTGT6iFAlX9HB5SV8mk
	rowiCLCP24mtyyfCur59VgNDMn2EwXMoWSpwqxVXdpQMY4rwTb3s5i8hGiE8kc0AE6epB4vZHGV
	DgBZzNhwaeXE32AGl478+BAqodG0XltuAgayT997vNaSDFhVH9SoS+i254KgUbmPi4483R8AhoH
	ZXgKXF6dl5E4sQmQgtAR+o=
X-Received: by 2002:a17:903:46ce:b0:2dd:ad73:5b5a with SMTP id d9443c01a7336-2df7e26cfc2mr18250965ad.21.1790268413371;
        Thu, 24 Sep 2026 09:46:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dd166sm30573655ad.54.2026.09.24.09.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:46:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:46:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (lm75) add MAX31875 support
Message-ID: <29aade07-55a9-4d32-92e1-c7f410982f29@roeck-us.net>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
 <20260924084121.82-4-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924084121.82-4-johnerasmusmari.geronimo@analog.com>

On Thu, Sep 24, 2026 at 04:41:21PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the Maxim MAX31875 I2C temperature sensor by
> extending the lm75 driver. The MAX31875 features a 16-bit
> configuration register, configurable resolution (8, 9, 10, or
> 12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> ---
>  drivers/hwmon/Kconfig |  2 +-
>  drivers/hwmon/lm75.c  | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e4c4f2b09732d..c68b6c3c2f866 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1525,7 +1525,7 @@ config SENSORS_LM75
>  	  If you say yes here you get support for one common type of
>  	  temperature sensor chip, with models including:
>  
> -		- Analog Devices ADT75
> +		- Analog Devices ADT75, MAX31875
>  		- Atmel (now Microchip) AT30TS74
>  		- Dallas Semiconductor DS75, DS1775 and DS7505
>  		- Global Mixed-mode Technology (GMT) G751
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 104149a03bad0..886f83c8b0420 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  	max6625,
>  	max6626,
>  	max31725,
> +	max31875,
>  	mcp980x,
>  	p3t1750,
>  	p3t1755,
> @@ -223,6 +224,15 @@ static const struct lm75_params device_params[] = {
>  		.default_resolution = 16,
>  		.default_sample_time = MSEC_PER_SEC / 20,
>  	},
> +	[max31875] = {
> +		.config_reg_16bits = true,
> +		.default_resolution = 10,
> +		.resolutions = (u8 []) {8, 9, 10, 12 },

This isn't how resolutions vs. sample time is supposed to be handled.
For most of the lm75 compatible chips, the sample time is associated
with the resolution: Changing the sample time changes the resolution.
This is not the case here: the chip has separate configuration register
bits for sample time and resolution, and the resolution does not change
automatically if the sample time changes.  The above associates
8/9/10/12 bit resolution with the 125/250/1000/4000 sample times,
which is wrong. Instead, .resolutions should not be set at all,
reflecting the default 10 bit resolution.

> +		.default_sample_time = 4000,
> +		.num_sample_times = 4,
> +		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm = true,
> +	},
>  	[tcn75] = {
>  		.default_resolution = 9,
>  		.default_sample_time = MSEC_PER_SEC / 18,
> @@ -421,6 +431,9 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>  			case tmp112:
>  				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
>  				break;
> +			case max31875:
> +				*val = (regval >> 7) & 0x1;

Please use
				*val = !!(regval & BIT(7));
to match the rest of the code. 

Thanks,
Guenter

> +				break;
>  			default:
>  				return -EINVAL;
>  			}
> @@ -495,6 +508,13 @@ static int lm75_update_interval(struct device *dev, long val)
>  			return err;
>  		data->sample_time = data->params->sample_times[index];
>  		break;
> +	case max31875:
> +		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
> +					 0x0600, (3 - index) << 9);
> +		if (err < 0)
> +			return err;
> +		data->sample_time = data->params->sample_times[index];
> +		break;
>  	case pct2075:
>  		err = regmap_write(data->regmap, PCT2075_REG_IDLE, index + 1);
>  		if (err)
> @@ -848,6 +868,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
>  	{ .name = "max6626", .driver_data = max6626 },
>  	{ .name = "max31725", .driver_data = max31725 },
>  	{ .name = "max31726", .driver_data = max31725 },
> +	{ .name = "max31875", .driver_data = max31875 },
>  	{ .name = "mcp980x", .driver_data = mcp980x },
>  	{ .name = "p3t1750", .driver_data = p3t1750 },
>  	{ .name = "p3t1755", .driver_data = p3t1755 },
> @@ -905,6 +926,10 @@ static const struct of_device_id lm75_of_match[] = {
>  		.compatible = "adi,adt75",
>  		.data = (void *)adt75
>  	},
> +	{
> +		.compatible = "adi,max31875",
> +		.data = (void *)max31875
> +	},
>  	{
>  		.compatible = "ams,as6200",
>  		.data = (void *)as6200
> -- 
> 2.34.1
> 
> 
