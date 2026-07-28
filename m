Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739D3A7858
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213111; cv=none; b=oAUJvRoGZ2L7OooMbAIBaklQFhHCbu4UjHKpmmeCGLY6tzr5vhARjORVlRUDtMTWFy/QrhnS1a03rENmLKSEsk3Q5svQOtSX55qfMew5sAGwspfv2udAR3ZoROTD/VHRXWUoNBrcw1YDsPlAz1Ac1WgV+g2/S/0+c/+AWdYdlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213111; c=relaxed/simple;
	bh=xW+jeVJ7gBoIcbZHJ2Y9ZJZhRwhdct15ixQFUsZWyJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGYPn88aEYTnDIG/NnurqIr8QbocZ4Xvxg+mBfzqqvQJMo0m/oqDdmhVdfGU0XfgQtncRXQBf50hCnPupJLCKBSmHFF8FKUz2NlC1PDXjHbSFbVvKiTmY2HJ1Ach2wQZOOHLRkAZEsVK0HFSXZzqTjbd8cV3yUXjBI30kUP1Hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZojooIiP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZojooIiP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbb662575d3so1963737a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785213107; x=1785817907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vBFBzSt7pNhRD/NLr/9cCWACL2lf1sDzhfdvaRdsOs=;
        b=ZojooIiPN2HOcNkyAW0+/H3S+5JrawWrG0B6oT+Bap3hmYkv/iyMkujKSbXV2tsa0H
         ntfpaRO+EHWbBNUgFOYMFyagMA9LEJXOgrH2zLvVPiFCZmd+DPXTGRoi3qAdBDWnTmmf
         1D1godSSCeuh/fFa4JIsILAUnbDywGapUQbUzAEfNGCaBb7fIQLaiUlt9mUkm7gvTFqq
         VFQ11OH92WX3dcxv/0/hvB4zHf4vaNkslDKlG5Gj/dZgRhsVlIvQD8mgz1MuhwZuU/yE
         Yu+yn4VsCo0hfolZ+2NypGKVX0STHGAoSWblblyfgjOlGfmtdkFspgV5Kr/S0ylW0Gd5
         yExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785213107; x=1785817907;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1vBFBzSt7pNhRD/NLr/9cCWACL2lf1sDzhfdvaRdsOs=;
        b=DfiHijMKkOc9Xy12Wo9l1+Y60M7JforcVsxDObkyBvexVXMkXlSbXnU6bNGHtbOsmB
         S0+/yvPLk96yEnhMqBjMS1HxmDIroUr7L8xzg4zyuon0MSxAwyHtFPNjo3HzBEmPh58Y
         P8t823C+bkRWYWa1Ezl5TNzSvHFsIl2wfnj1RQn469sjpkLSCioQUzusT7dWlL2lsxo3
         dEpMlFn4liyMIBkllJcffFvgu0bNHQGN/fy4Yq2GIeELRgzy5Sy3GojocH41kKh9TxLU
         fNbDit/xOu+qvt2T1Om1Mm8E2gcVkO9x3/p0xZApoKoxTxARJ9R/+HqsQrGfbTjiILOu
         K1cg==
X-Forwarded-Encrypted: i=1; AHgh+RqZdDxrTMB+v+ERfBlM3kAP9X2E6+TlI/5GQ78ky2J0tXw+FFoEdqCUaxsFE5CbiIrtW78Xyi97isQD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8Q+vsH2iPLbQSKDjMdfZh/PjYWD+6uevtAJwy5Wc8N1eMg3v
	zK6jotYJvrUpggf8KRcarYQ15ose9E8XZL18D6STtc0Wv5h22GmhdVDl
X-Gm-Gg: AR+sD13hIQq/R9Czum5fNQz8FXk4TnSVOykqIb6oVoyzCburdxBz+y892G7ijQtXU9J
	W42vzKEeWOgtGriYC+pF2BsWdUzFrTEQXXVhuu564FnElcRzTw34VU5sZPZhrxQZXwkeX7FmTTe
	6S8ZZaPNwZl8wLHTLd+6p3uf5C7T+7l2gU2HQ1VaSJYYtY+fW0FHR3EgYcd04NMozqFiU0FN0y4
	/FqTsy9tG1XODHEG3rkVZHGxtdOXBZXVjDfYCg1aIfFGF8EfT2fZVrQpwu1jYsBcKCEJHUrzWkw
	k4ilMpM1WwbNGixGSrndXRh2UW7fnWANBVWPkDyHqsZ0W5Y1sLKUT7PXZNIjgn1QUmgn/1QFC9f
	l7XEuuwLvGT/+DuKTSvSMxYMKtBhoCi2VHgvP00pre661JPoiVBLyH/5d6sw9+O04LqS+LEDm0k
	mXYOYTfrKdWgG5fCmrx/Iz8IIXuciiVLquBz+47L2anujaxG/j06/0MH622TWbaRTJzFlmS171P
	/vonpBfyvGVZ+N06dEkmZ0zS0HXGU0BE/AtbQ==
X-Received: by 2002:a05:6a21:3a42:b0:3bf:7994:ddca with SMTP id adf61e73a8af0-3c8ba462562mr1069953637.29.1785213107414;
        Mon, 27 Jul 2026 21:31:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm3912996a12.30.2026.07.27.21.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:31:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <336bd264-52ec-473a-b74f-5661f06286ed@roeck-us.net>
Date: Mon, 27 Jul 2026 21:31:45 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728-dev-max20830c-v4-4-cec034298535@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 20:32, Alexis Czezar Torreno wrote:
> Add support for MAX20830C and MAX20840 step-down DC-DC switching
> regulator with PMBus interface. MAX20830C is a different packaging
> for MAX20830, and MAX20840C supports 40A regulation compared to
> MAX20830 that is only 30A.
> 

Are those chips still not published ? I find MAX20840T, but no "C" variants.
And MAX20840T presumably has an I2C device ID of "MAX20840", not "MAX20840C".

I also noticed that MAX20810 and MAX20815 seem to be register compatible.

> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>   Documentation/hwmon/max20830.rst | 27 ++++++++++++++++++++++-----
>   drivers/hwmon/pmbus/max20830.c   | 27 ++++++++++++++-------------
>   2 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20830.rst
> index 936e409dcc5c0898dde27d782308d4a7e1357e73..b850f3b6e40d1f1d0cec944be40af02265aced59 100644
> --- a/Documentation/hwmon/max20830.rst
> +++ b/Documentation/hwmon/max20830.rst
> @@ -13,6 +13,22 @@ Supported chips:
>   
>       Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max20830.pdf
>   
> +  * Analog Devices MAX20830C
> +
> +    Prefix: 'max20830c'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +  * Analog Devices MAX20840C
> +
> +    Prefix: 'max20840c'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
>   Author:
>   
>     - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> @@ -21,12 +37,13 @@ Author:
>   Description
>   -----------
>   
> -This driver supports hardware monitoring for Analog Devices MAX20830
> -Step-Down Switching Regulator with PMBus Interface.
> +This driver supports hardware monitoring for Analog Devices MAX20830, MAX20830C
> +and MAX20840C. These are Step-Down Switching Regulator with PMBus Interface.
>   
> -The MAX20830 is a 2.7V to 16V, 30A fully integrated step-down DC-DC switching
> -regulator. Through the PMBus interface, the device can monitor input/output
> -voltages, output current and temperature.
> +MAX20830, and MAX20830C are 2.7V to 16V, 30A fully integrated step-down DC-DC
> +switching regulators. MAX20840C is similar but can reach 40A. Through the PMBus
> +interface, these devices can monitor input/output voltages, output current and
> +temperature.
>   
>   The driver is a client driver to the core PMBus driver. Please see
>   Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
> index 7c1e94c43ac4e5d1b4f69dc77b02e424a674e908..029733a377123ae6a861841db4a40dd540f1149e 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -99,13 +99,12 @@ static int max20830_probe(struct i2c_client *client)
>   	 * which do not support SMBus block reads.
>   	 */
>   	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
> -		/* Reads 9 Data bytes from MAX20830 */
>   		ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>   		if (ret < 0)
>   			return dev_err_probe(&client->dev, ret,
>   					     "Failed to read IC_DEVICE_ID\n");
>   	} else {
> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> +		/* Reads 1 length byte + data bytes */
>   		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
>   						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
>   						    buf);
> @@ -121,26 +120,28 @@ static int max20830_probe(struct i2c_client *client)
>   		ret = ret - 1;
>   	}
>   
> -	/*
> -	 * MAX20830 IC_DEVICE_ID sends string data "MAX20830\0".
> -	 * Return value should at least be 9 bytes of data.
> -	 */
> +	/* Verify we read the expected number of bytes */
>   	if (ret < MAX20830_IC_DEVICE_ID_LENGTH)
>   		return dev_err_probe(&client->dev, -ENODEV,
> -				     "IC_DEVICE_ID too short: expected at least 9 bytes, got %d\n",
> -				     ret);
> +				     "IC_DEVICE_ID too short: expected %d bytes, got %d\n",
> +				     MAX20830_IC_DEVICE_ID_LENGTH, ret);
> +
> +	/* Null-terminate the string */
> +	buf[ret] = '\0';
>   
> -	/* 9 bytes of data, buf[0]-buf[7] = "MAX20830", buf[8] = '\0' */
> -	buf[MAX20830_IC_DEVICE_ID_LENGTH - 1] = '\0';
> -	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
> +	/* Verify the device ID matches what we expect */
> +	if ((strcmp(buf, "MAX20830") && strcmp(buf, "MAX20830C") &&
> +	    strcmp(buf, "MAX20840C")))
>   		return dev_err_probe(&client->dev, -ENODEV,
> -				     "Unsupported device: '%s'\n", buf);
> +				     "Unsupported device: '%*pE'\n", ret, buf);
>   
>   	return pmbus_do_probe(client, &data->info);
>   }
>   
>   static const struct i2c_device_id max20830_id[] = {
> -	{"max20830"},
> +	{ "max20830" },
> +	{ "max20830c" },
> +	{ "max20840c" },

I don't think that is needed or warranted, given that there is no matching
devicetree node.

Thanks,
Guenter

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, max20830_id);
> 

