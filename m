Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D553C7DEB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483067; cv=none; b=tWLLlf59SDtk4iU4FPxacYXA0vs8MmDApgiawIMa3H1SLOIR3yA95UVQ5CbntrUdJZJxx6ibnp36JQzY/AOOsnWkBVfTYmUfNKQ6+1wpKMHn5SA8s3OE+/ppeUPyZUeoH3ubNPIHsAcwvk+J2/Xm1czn6vOXKd4j1oWbs+aEVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483067; c=relaxed/simple;
	bh=rb12uoRVB4GQEx5rKrFmaADZveIVmDJVmDoyUxjt1Jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSkGNQgwRmvE1Fcych96idVos4E8GpihZpw9mhzJotIfGCq7uCnbgpFX/iGaO1DB4DoyYc/PGAtq5sXDBsIYKnPGhKFoH4HX4dpcnBHb1+GvLj3TSqveJkxpcYXFjU/ln5bPFD1MuITsyUw/S6oJ5eyAiCMMQSFVysrmFcDIgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/QOi9PQ; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/QOi9PQ"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-804e42309a5so1256471a34.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483064; x=1790087864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twZQdobyrOF6/2xqxEJFQWUmLmsexxdGoJngeBJlLv4=;
        b=W/QOi9PQZpbBsRyXN6RYBzM4XnZu8XHZoo00wGjYcA28kr88j4vv7+Mlmp2Y36EWuB
         e85NfiNQiwxD8xJIan6jltDxjKJw5/ZVNmDGZVMcLb9nh3qeGcFLd80ZP+GRu4mdGne2
         kacYW97gkJ/MwpEo2qRrNEDPq5vmjrfZToGqYQR0r5ErM32tQEKXuG1yCUKeN+4/SEyP
         cK59sLnaQsaB2wri0xvu/GVrco8wkQuoEzU/W3qRoy0jNd3WbSZ6UWODsbyTJq8Ins4a
         mq08OtVitgsNEt7T+/23wMbIlqpyB5Xu0vAda9zvpLcCpsv7Q8Y4hRkh6EujV/MoF804
         Dwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483064; x=1790087864;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=twZQdobyrOF6/2xqxEJFQWUmLmsexxdGoJngeBJlLv4=;
        b=tvNb3WAM933eQD3gAuA2cVmUyISSnL9aFp9u/FtGXU6vUpo6b2eAajzXPZnoZpXrF7
         Q8L7R3whpsYARDPPeh7jo1pMabsd5UFzDq4Y7fMhUYIalOYxs+jh7G0sNoPsbc5PbA2d
         ASkk9kR6ExtOwmwSFpp6bY5FXfQrQVDRAZd02iuhkd1t+gsFwMRj7kIQ1bYmlLI3QA2o
         n47s3cTDe2n+4GCjCRtD/eY6fTm53nZr3ZzwD01GA23l2sIZeiqy6P65GGEAFxMlxpKA
         ZXAVT7Cs296V/Lb23eS1eJ3g7OavIYP41dFEX35uUIA0hH5xL5CLk14UXdF5FeBXtRIP
         Zd/g==
X-Forwarded-Encrypted: i=1; AKwUvBxtbs4LAi4dQ4e+cDfM0YzShuDUzlBHbw3rMtYvAPTUDdPWtMZt/MvvhwaMxYH0DmHfgvTUcPRZwSTb@vger.kernel.org
X-Gm-Message-State: AFuF++mJeYiHHY9PX7ykNz20yXh11LOOgPQZ37j2ctlHRfykVUaGcDLS
	r0ddO2NW0V0O4d8E8RgcxPNIF1eu2Ipr7qZ4JK3FjDiRv99nLvzIVjcr
X-Gm-Gg: AYBFou1fcN4Euiit3QOVKPiSA6SXIETIdfdwbrVjgSxHtzi6HwyzTk4MylkLEQCegmR
	qq4uEej0phSesTvk4AAdKeoW4DKHvpuxbShs6DGk+7x87SNQsG1A0Xwce0M/Dx1KnIzipjAnuOL
	yiObJ8gP7nWTHMjBeI8GfOfWSQ1P60gn/cBf3r0r0zSxtR3St9XELWP5OXAseofSfse9g0P1Yso
	ExNG0xDk4qbhWuShuB8uAOhQJmqCInfr8PN5oPOBQgPByy1Nn2kST8AzOEG04T0x0JVTdVmFI+w
	xOrCeLHGFe9qLSCgA8A52G+8qc4izUvIFqV3kaSMWx2hkr3k5B2z+KZEFPjG+rlSWt7321ViFFy
	SU436s4Z3VRmSGoMqotTHOvaHJAQD7WQ6ykIpHDlSUFIiVUIHH31Btc5Lv8KJ0DJku8LpkzmLCG
	WU/uO97ksu49f+rM6vtSCaGYUWN22awWKzPgz3sgODALf1VSqmjcCzfIQdekKAnF7JrYFt8lrjn
	McElc+aQ4S1VFH7z7gP6V5TK5lxwJQeiRbfDhtGW4RunUr8
X-Received: by 2002:a05:6820:4cc1:b0:6b1:42ab:d040 with SMTP id 006d021491bc7-6c53f5548a6mr4930828eaf.28.1789483063715;
        Tue, 15 Sep 2026 07:37:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50a7a3526sm43199a12.0.2026.09.15.07.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:37:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
Date: Tue, 15 Sep 2026 07:37:41 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: hsyemail2@gmail.com, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jean Delvare <jdelvare@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260915052021.6959-1-syhuang3@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260915052021.6959-1-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 22:20, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
> v3:
> - Reuse the existing TMP112 handling for NCT7715 configuration,
>    update intervals, and alarms.
> 
> v2:
> - Use the standard SMBus word representation for the NCT7715
>    configuration register, removing the NCT7715-specific byte swapping
>    and updating its configuration masks accordingly.
>    
>   .../devicetree/bindings/hwmon/lm75.yaml       |  2 ++
>   Documentation/hwmon/lm75.rst                  |  6 ++++++
>   drivers/hwmon/lm75.c                          | 21 ++++++++++++++++++-
>   3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> index b48bf3fd721f..d55b8b7e49c5 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -31,6 +31,7 @@ properties:
>         - nxp,p3t1750
>         - nxp,p3t1755
>         - nxp,pct2075
> +      - nuvoton,nct7715

Sorry, I did not notice this before. Devicetree changes have to be
made with a separate patch.

>         - st,stds75
>         - st,stlm75
>         - microchip,tcn75
> @@ -78,6 +79,7 @@ allOf:
>                   - ti,tmp101
>                   - ti,tmp112
>                   - ti,tmp75
> +                - nuvoton,nct7715
>       then:
>         properties:
>           interrupts: false
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index ca46754e028b..fac0b8f29ddc 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -150,6 +150,12 @@ Supported chips:
>   
>                  https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
>   
> +  * Nuvoton NCT7715
> +
> +    Prefix: 'nct7715'
> +
> +    Addresses scanned: none
> +
>   Author: Frodo Looijaard <frodol@dds.nl>
>   
>   Description
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9..1a98ecb142c9 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>   	max6626,
>   	max31725,
>   	mcp980x,
> +	nct7715,
>   	p3t1750,
>   	p3t1755,
>   	pct2075,
> @@ -259,6 +260,16 @@ static const struct lm75_params device_params[] = {
>   		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
>   		.resolutions = (u8 []) {9, 10, 11, 12 },
>   	},
> +	[nct7715] = {
> +		.config_reg_16bits = true,
> +		.set_mask = 0x8060,	/* 12-bit mode, 4 samples / second */
> +		.clr_mask = 1 << 7,	/* no one-shot mode */
> +		.default_resolution = 12,
> +		.default_sample_time = 250,
> +		.num_sample_times = 4,
> +		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm = true,
> +	},
>   	[tmp100] = {
>   		.set_mask = 3 << 5,	/* 12-bit mode */
>   		.clr_mask = 1 << 7,	/* not one-shot mode */
> @@ -417,6 +428,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>   		if (attr == hwmon_temp_alarm) {
>   			switch (data->kind) {
>   			case as6200:
> +			case nct7715:
>   			case tmp112:
>   				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
>   				break;
> @@ -486,6 +498,7 @@ static int lm75_update_interval(struct device *dev, long val)
>   		if (data->params->resolutions)
>   			data->resolution = data->params->resolutions[index];
>   		break;
> +	case nct7715:
>   	case tmp112:
>   	case as6200:
>   		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
> @@ -848,6 +861,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
>   	{ .name = "max31725", .driver_data = max31725 },
>   	{ .name = "max31726", .driver_data = max31725 },
>   	{ .name = "mcp980x", .driver_data = mcp980x },
> +	{ .name = "nct7715", .driver_data = nct7715 },
>   	{ .name = "p3t1750", .driver_data = p3t1750 },
>   	{ .name = "p3t1755", .driver_data = p3t1755 },
>   	{ .name = "pct2075", .driver_data = pct2075 },
> @@ -972,6 +986,10 @@ static const struct of_device_id lm75_of_match[] = {
>   		.compatible = "nxp,pct2075",
>   		.data = (void *)pct2075
>   	},
> +	{
> +		.compatible = "nuvoton,nct7715",
> +		.data = (void *)nct7715
> +	},
>   	{
>   		.compatible = "st,stds75",
>   		.data = (void *)stds75
> @@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
>   {
>   	struct lm75_data *data = dev_get_drvdata(dev);
>   
> -	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
> +	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> +				  LM75_SHUTDOWN, LM75_SHUTDOWN);

Drop this change.

Thanks,
Guenter

>   }
>   
>   static int lm75_resume(struct device *dev)

