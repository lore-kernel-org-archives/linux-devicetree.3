Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3837DEBB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379257; cv=none; b=vEAIwk7U7+YL/PLXAlgGj8sF01SNf3e1QnlbNduUkKp2kaNL8+3SjWKfNG8pzA6Uby3mvxjYW9qiv0LnONjRSkFCYE1iiJLl5M3DRCHdTMkDDDGtj5Aj5A3v7g61jnK05eu5jZyisLbBsGkgZeLlwpLoUFvqb0eNZebnabnMwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379257; c=relaxed/simple;
	bh=bHfqsarsKeqIkFDqllAq2cLDi3NkY7dQiJHYzxf7614=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex7SLHjg9vAA9rQ/TJq5/WsQNjAqP7CMCFTITtTvjMzRBZwDjzCdQ+wRoAEaRWxDR4lkfAuHpNgJhy92m/Tnw5dyjgddjTa61gaeKb5UnkUxfgJ/EqX0r/90mPctNuHxdJKska0nbuin1tpJp79prQ1C28sixxEWeoeex1m3u9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0Wu9UnP; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0Wu9UnP"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1284094a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379254; x=1785984054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpl/BhnmY3lT4VrDtie/BwPkv0Auv8SB6MI32u30mKs=;
        b=S0Wu9UnPGR2+X98ecsAivrcMShE+nJTSCc6o9/1YSfm5PgoiRD8FRpHkjYRyZ2Ylrb
         uYzZv1RXA84YHq89WZqY3UPjCH7L0VAhKv2rMd0caFwsnUE42C0SOPVwO6WL1r9/4wr2
         cNedGTzEjTaKAb5CD+DvklSlAicvnP4dJ4xBKkC2vvuuAqRsGVHw4rGLIaoW1orgI/Cf
         I2pR8TTuFupjtDqyAluvYGTiuSUHB8WRRd5UwvZoEuK2EexdCn+S71/7uemVczLDtXeT
         SmcczdwnNtY458GFR/NugsaWB2yJ7KhrhnbRb3nCW/AI5UGFYLvhrGXreFDZVQqueFez
         tfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379254; x=1785984054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpl/BhnmY3lT4VrDtie/BwPkv0Auv8SB6MI32u30mKs=;
        b=f49qoSuOGpDWlk6n2crQn6Rm7cbWaUfFswlaTwnWvhzv/deo629ntYVbLSgHEP3Cff
         3GVmtEEV9m63ifX8cveApV/cmycUF6Se8eqwDT+Hgnuf1MrkFbML3GsXQlHWpYEUXBkA
         niwOv/68ePZXzIPQzuXSOTUz75e9ppDWSnz3NN6YePi/6edfS5k+yPk8j+xkoPDu0TpK
         L1tVyB9vO2AVqUr4a1zKFTPa+ptBxNz/H7n0Crmeoy6W4PGZwbMMP6de8yhf19PV15WQ
         h26iopSOIgA6/ugzFR26R3651m0uRRZ2fJZHIA1a1OmwHfdWsOQtpZpAazznp+ZDSLX4
         1G9w==
X-Forwarded-Encrypted: i=1; AHgh+RoujCnDHHVC/nWTREllNCqE0NaAPNgkJz6nJK5zrhOkgIid9h+o1AzSP7S3/zp0csbV1l5jWg/F5frc@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZn/vXF8p67E9dnoNIwNJMidCncxed2ZfqdcmLOYwp6mDse62
	XLkrJIYuEZXoAhOZbDx+wu5Zpczjx3/Ca7a+vJSFg/xwiASAJfQabD5s
X-Gm-Gg: AR+sD11ybqmiuZR+h4HgCil6njxFPpv4jIIYN2lSWFsJxfiAoNnr6JZqIEAsDj4pJ7s
	TGhANoe7x8qayqpl/DRXjdWLgz06fBsmLinj/czvIXWRAKE3xplJT8ldMWnYU/h6HY34QlcXJIV
	or6uA8kJoevKLCH/hmTPymDhcrtzH3kFlOmvKvmJyrBdlhZbXFquM56SIgGIhdX5qaIThHIvBNx
	UkD/K1ecb4zvXc6dwKA+lUqv3Mg2J5m5VPv4dFGm11mnU1YpXH+lRKZQfMDYeBLFtIJvKhI7NdP
	/xFPiLodN0k4SM7JwyB0IwudhMmF4rbcC/TsmbZYtL3n2QChuI0g9oDlZip7MIpx1xZZk5hI6Yq
	cps92QxjpArg4WTOpJyRXcdr0LQ45iavcmnKkpn7MMKxEVT1n0QBs41bCZYIpkROhY5EjAMspSZ
	q72EENHYSQuJosrdl8thSTDwmpabBj2Zjf4GFZKfYoukckmXrtIoV3p0Bhe9dG3XpUoeIoO3IJa
	g==
X-Received: by 2002:a05:6a21:9985:b0:3c0:9c19:6587 with SMTP id adf61e73a8af0-3c900a02a8emr615851637.65.1785379254046;
        Wed, 29 Jul 2026 19:40:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63fesm14028363eec.15.2026.07.29.19.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:40:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:40:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Message-ID: <4e0d09d8-c083-417e-bd33-f5c132a802b8@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:34AM +0800, Alexis Czezar Torreno wrote:
> Implement support for external voltage divider scaling using the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> 
> When the desired output voltage exceeds VREF, a resistor divider
> (RFB1 and RFB2) is used to scale down the feedback voltage. The
> driver reads these resistor values from device tree and applies
> the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)
> 
> The properties are optional. If not specified, the driver assumes
> no voltage divider is present and reports the raw VOUT reading.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max20830.c | 65 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index cb2c23672166d641852199ca07eb716924f4f286..ddead72a8db5d6f8491cbfbf356db0f8de64da03 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
> +#include <linux/math64.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/string.h>
> @@ -14,6 +15,56 @@
>  
>  #define MAX20830_IC_DEVICE_ID_LENGTH	9
>  
> +struct max20830_data {
> +	struct pmbus_driver_info info;
> +	u32 vout_rfb1;
> +	u32 vout_rfb2;
> +};
> +
> +/*
> + * MAX20830 only supports READ_VOUT for VOUT monitoring.
> + *
> + * Limit registers (VOUT_OV_WARN_LIMIT, VOUT_OV_FAULT_LIMIT, etc.) are not
> + * supported by this driver and return -ENODATA. This means sysfs attributes
> + * like in1_max, in1_crit, etc. will not be available. Only in1_input (the
> + * scaled output voltage) is supported.
> + *
> + * MAX20830 uses an external resistor divider for voltage sensing:
> + * - VOUT_COMMAND and VOUT_MAX set the reference voltage at the feedback pin
> + * - READ_VOUT reports the feedback voltage, which needs to be scaled for actual
> + *   output voltage
> + *
> + * Scaling formula: vout_actual = vout_fb × (1 + RFB1 / RFB2)
> + *
> + * If regulator support is added in the future, some adjustments are needed to
> + * ensure correct feedback voltages are set.
> + */
> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	const struct max20830_data *data = container_of(info, struct max20830_data, info);
> +	int ret;
> +	u64 temp;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2) {
> +			temp = (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
> +			temp = DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
> +			ret = clamp_val(temp, 0, 0xFFFF);
> +		}
> +		return ret;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
>  static struct pmbus_driver_info max20830_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = linear,
> @@ -24,13 +75,25 @@ static struct pmbus_driver_info max20830_info = {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data = max20830_read_word_data,
>  };
>  
>  static int max20830_probe(struct i2c_client *client)
>  {
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
> +	struct max20830_data *data;
>  	int ret;
>  
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->info = max20830_info;
> +
> +	/* Read optional voltage divider resistor values */
> +	device_property_read_u32(&client->dev, "adi,vout-rfb1-ohms", &data->vout_rfb1);
> +	device_property_read_u32(&client->dev, "adi,vout-rfb2-ohms", &data->vout_rfb2);
> +
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
>  	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
>  		return -ENODEV;
> @@ -78,7 +141,7 @@ static int max20830_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, -ENODEV,
>  				     "Unsupported device: '%s'\n", buf);
>  
> -	return pmbus_do_probe(client, &max20830_info);
> +	return pmbus_do_probe(client, &data->info);
>  }
>  
>  static const struct i2c_device_id max20830_id[] = {
