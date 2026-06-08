Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA212F363F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926546; cv=none; b=XcCiJca2kO4m4cg+9fntXwl0A6wcCiFIiGLtD2AgcO9H5Lw1KfKX9tykFizG262eGqr5Z627CLoMBQPDrq1csO2+P7flcXihvvCX9ht1scIPa4aqlmEBbEwE11YRUCJtAtrXbWF9jmXsy4ULkrji2cKaA4BM0sA5YIYfr2KbSXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926546; c=relaxed/simple;
	bh=WKdnKt8uVSNPulYJchYSeIt746GgXLZCDsr7dlvwG8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rr7+3J9lzcNdpn4HhqEDI6lAkBxJbJmfMVxyX5xvQGgXmcrFwdOQwmXBy7u6abqDEiPMP0KJm8oQhtTTb4KWeC8OD6EqYTu/RAGqapdvcUb0diRfNUrYdt5NulpqxdQlvHcHsO/1l1NTZFr88XfMOAJIYd19PaIfTsVGo72OR5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPPhPYLY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPPhPYLY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf20f6be6bso33099305ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926544; x=1781531344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dP80yCRxSazdInPQLjGyNhGAqwlp9fjz0KW2XAV0D0w=;
        b=IPPhPYLYKzb3yUyZgl0Svi/eTaRavz0/rh0n45TjEDS9Tztvw76KLfBlCPkhhKCAeS
         i2ukgeAeCBoUvNo8XuYg9UfZC1ij2uIhgJY16UuTy+CCYVxv/bT8N8rho/OwDrF7tLd9
         5uD84fFbVbACE3IPnZB3m0wPV9rg/oC8IMjGjWFRaJpsGJ6yBT0uGpUoD3kijNQy+tn/
         MdT1iM0NRqBIxYSg2cGcqcvy97UTUwh9QdkG5GRKPAlAMJ1f+3m6/oj3AaXe6Fl6XZTs
         qc/V8LtV48lax+CPSYvQgJKjUF+HGf6L3xDNWQ6qsZnj2GCNxVNuwkdDS/G0vFNTQIR3
         vhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926544; x=1781531344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP80yCRxSazdInPQLjGyNhGAqwlp9fjz0KW2XAV0D0w=;
        b=AtYRWyfCv1KjLNikWdryJ2+kE5a9panZzG5w9dghz7n62AaGi0L9AG5E6HtPGNderT
         wBVVjrbJpasYiyLg+GXgqUybT3yO0FafZg+dxz9zv7TQcAsi1uYTpdM/9FktiWpB0bUG
         7j12uejssGASiXOavwh4/YePi/XWXuGjFCJrdYce/z2h33Jaz1lj5I1JvUSeu9PCEe66
         872h0zx/q7dExmlt7cVy9I21i+OO7D8kTlN+i3yFo4/YCjQK+kCUFjKpsq8RzkMBcegY
         79nWX944GpL4W8TDpmeAURoWqtxjVvkFfg0e1oGNRCLnYyI6JTTuEIPUJTVYbi63+/UA
         PIzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eSA2X4wTBY4QkMgLdJhV97VaX1G3ZZCr441TmnljWr1DYw8ZpK+ZpHVJ5Jg0TSdjWX97X/LzvBGnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1QhRuLKoJox/CpfWyFAI2rSQw3KmmFHGm7PmFZoMlLFQCR2d
	5243rgQiHQUfottd6aOIZZzo6gs6+/MlzzGITqig5b3oTi5SteKeYJ8mWQsLKb20
X-Gm-Gg: Acq92OHxcuuo3UYPK9IvhUEjFj7a2WPSJmnh5Jz3KAUgblU+uq8Dg2kM2hQ8LEOEsHJ
	3kyPaKNegwPYJAIWq6b0MVlpaZlTcrX1uQfyt7XtiDijlrb0LYaGAKyA5Cjm2viDqzCZrzPLpKa
	AEjHjlMSd4klgh4m17rvpyRY+zSSeITCiTrWhdIfEyX6Jt7zyvT2tO2rSGoLF9A0bag00azIEZP
	opqqtf21WjyxeWt647ynYlipZD9ZlMCefDTzN45y5IjNZxpGNXKFYdMg2eTG03uDfMt6d34GMvX
	wCQbcITxLI/NczJEv+8b/KXdnshHENIrIqviSBN4HUBHvxu3752M0HKYzjDkOyOaQ4FwgUEYM0i
	pSbFz749C46vEV07T5ob/0EW6e0ccbehA6UlNYD2WyQNb3KGqkGBvqWILUHcx9S9WU0bvIm71fL
	AT960bD7Wy22ad+7oO5E0m5MpljO4p+F7FSByM6ZWeS2Eh0YVSi9rk3aq3THecagCSghHWF7eRu
	4v7RjRvoQI=
X-Received: by 2002:a17:902:f24d:b0:2c0:d9b7:b7b0 with SMTP id d9443c01a7336-2c1e8220afbmr115307245ad.31.1780926543810;
        Mon, 08 Jun 2026 06:49:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm179766245ad.16.2026.06.08.06.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:49:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f03b52b2-1193-4127-ae5e-bd4a954f8e3e@roeck-us.net>
Date: Mon, 8 Jun 2026 06:49:02 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp730
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
 <20260608061544.5613-3-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260608061544.5613-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/26 23:15, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDP720/XDP730 Digital eFuse Controllers provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processing.
> 
> Both parts share the same PMBus register map and direct-format
> coefficients; they differ in the GIMON gain step exposed via the
> TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> (XDP720: pin 9, XDP730: pin 20).
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
> The value of RIMON (kohm) can be provided by the user through device tree using
> infineon,rimon-micro-ohms  property.
> ---
>   drivers/hwmon/pmbus/Kconfig  |  2 +-
>   drivers/hwmon/pmbus/xdp720.c | 97 ++++++++++++++++++++++++------------
>   2 files changed, 65 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..a9e86d92b044 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -715,7 +715,7 @@ config SENSORS_XDP720
>   	tristate "Infineon XDP720 family"
>   	help
>   	  If you say yes here you get hardware monitoring support for Infineon
> -	  XDP720.
> +	  XDP720 and XDP730 Digital eFuse Controllers.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called xdp720.
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> index 8729a771f216..9bdeac2d82f5 100644
> --- a/drivers/hwmon/pmbus/xdp720.c
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -1,27 +1,46 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   /*
> - * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
> + * Hardware monitoring driver for Infineon XDP720 / XDP730 Digital
> + * eFuse Controllers.
> + *
> + * Both parts share the same PMBus register map and direct-format
> + * coefficients; they differ in the GIMON gain step exposed via
> + * the TELEMETRY_AVG register and in the VDD_VIN pin number.
>    *
>    * Copyright (c) 2026 Infineon Technologies. All rights reserved.
>    */
>   
> +#include <linux/bitops.h>
>   #include <linux/i2c.h>
> -#include <linux/module.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
> -#include <linux/of_device.h>
> -#include <linux/bitops.h>
>   #include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>

Reordering include files and adding the regulator include
is an unrelated change and would need to be done in a separate patch.

>   #include "pmbus.h"
>   
>   /*
>    * The IMON resistor required to generate the system overcurrent protection.
>    * Arbitrary default Rimon value: 2k Ohm
>    */
> -#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_DEFAULT_RIMON 2000000000U /* 2k ohm */

Is this preference or needed ? Either case, it is an unrelated change.

>   #define XDP720_TELEMETRY_AVG 0xE9
> +#define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
> +
> +/* Chip identifiers carried in OF match-data and i2c_device_id->driver_data. */
> +enum xdp720_chip_id {
> +	CHIP_XDP720 = 0,
> +	CHIP_XDP730,
> +};
>   
> -static struct pmbus_driver_info xdp720_info = {
> +struct xdp720_data {
> +	enum xdp720_chip_id	 id;
> +	struct pmbus_driver_info info;
> +};
> +
> +static const struct pmbus_driver_info xdp720_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = direct,
>   	.format[PSC_VOLTAGE_OUT] = direct,
> @@ -56,57 +75,69 @@ static struct pmbus_driver_info xdp720_info = {
>   
>   static int xdp720_probe(struct i2c_client *client)
>   {
> -	struct pmbus_driver_info *info;
> +	struct xdp720_data *data;
>   	int ret;
> -	u32 rimon;
>   	int gimon;
> +	u32 rimon;

Why this change ?

>   
> -	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>   		return -ENOMEM;
>   
> +	data->id = (enum xdp720_chip_id)(uintptr_t)i2c_get_match_data(client);
> +	data->info = xdp720_info;
> +
>   	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
>   	if (ret)
>   		return dev_err_probe(&client->dev, ret,
>   			"failed to enable vdd-vin supply\n");
>   
>   	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> -	if (ret < 0) {
> -		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> -		return ret;
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +			"failed to read TELEMETRY_AVG\n");

Another unrelated change.

Please, if you want to clean up the driver, that is fine, but please do it
with separate patches. It is ok to make a simple cleanup change as part of
a patch like this, but it needs to be mentioned in the commit message.
But this goes beyond "simple". The patch

- Reorders include files to alphabetic order
- Adds the missing regulator include
- Declares XDP720_DEFAULT_RIMON as unsigned constant
- Changes error return to dev_err_probe()
- (unnecessarily) changes the rimon/gimon declaration order

in addition to adding support for the new chip. This is just too much.
Please split that out.

Thanks,
Guenter

> +
> +	/* Bit 10 of TELEMETRY_AVG selects the GIMON gain step in microA/A */
> +	switch (data->id) {
> +	case CHIP_XDP720:
> +		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 18200 : 9100;
> +		dev_info(&client->dev, "Initialised XDP720 instance\n");
> +		break;
> +	case CHIP_XDP730:
> +		gimon = (ret & XDP720_TELEMETRY_AVG_GIMON) ? 20000 : 10000;
> +		dev_info(&client->dev, "Initialised XDP730 instance\n");
> +		break;
> +	default:
> +		return -EINVAL;
>   	}
>   
> -	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> -	ret &= GENMASK(0, 0);
> -	if (ret == 1)
> -		gimon = 18200; /* output gain 18.2 microA/A */
> -	else
> -		gimon = 9100; /* output gain 9.1 microA/A */
> -
> -	if (of_property_read_u32(client->dev.of_node,
> -				 "infineon,rimon-micro-ohms", &rimon))
> -		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
> +	if (device_property_read_u32(&client->dev,
> +				     "infineon,rimon-micro-ohms", &rimon))
> +		rimon = XDP720_DEFAULT_RIMON;	/* Default if not in FW */
>   	if (rimon == 0)
>   		return -EINVAL;
>   
>   	/* Adapt the current and power scale for each instance */
> -	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> -		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
> -	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> -		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> -
> -	return pmbus_do_probe(client, info);
> +	data->info.m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> +		data->info.m[PSC_CURRENT_OUT] * rimon * gimon,
> +		1000000000000ULL);
> +	data->info.m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> +		data->info.m[PSC_POWER] * rimon * gimon,
> +		1000000000000000ULL);
> +
> +	return pmbus_do_probe(client, &data->info);
>   }
>   
>   static const struct of_device_id xdp720_of_match[] = {
> -	{ .compatible = "infineon,xdp720" },
> +	{ .compatible = "infineon,xdp720", .data = (void *)CHIP_XDP720 },
> +	{ .compatible = "infineon,xdp730", .data = (void *)CHIP_XDP730 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, xdp720_of_match);
>   
>   static const struct i2c_device_id xdp720_id[] = {
> -	{ "xdp720" },
> +	{ "xdp720", CHIP_XDP720 },
> +	{ "xdp730", CHIP_XDP730 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, xdp720_id);
> @@ -123,6 +154,6 @@ static struct i2c_driver xdp720_driver = {
>   module_i2c_driver(xdp720_driver);
>   
>   MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> -MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720/XDP730 Digital eFuse Controllers");
>   MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS("PMBUS");

