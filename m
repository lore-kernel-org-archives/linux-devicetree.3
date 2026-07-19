Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85545399346
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471097; cv=none; b=IKtvMrDMTO2Px62alOkKMGN4ckMyFqdpAByTdHZYzqH3QYdW/QC3gLGF76z7gnJf980Zv7CsE823MLxqY03rhFBNPmNRwwwsDSF/tszJ94AUESuPWA542tVedgzZJBiewy8rheHUi5jJPaOVx7DQlYa9adBXN/9vHhaDMGpGFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471097; c=relaxed/simple;
	bh=zpvxg856tCMzy2Od0dI7kZqxz/2/b1p04/CcpMW/COs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElF3h7NsWH4W/EfHLyuF9QKrEwTKiWXhjHQ3HfuCH60hboVjdbz2RUgu29gpUosepILdB59zLxr6jQPt4/FxuHKCtux+0GTkylj2Y3LPFIIz0HMPvIOJk9EAl7UtCn/YJl2arp/ZyKZnE1LMC6V8dGskfCDfZuX+GH18zcX/DGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP2YAIqm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP2YAIqm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8453427d3f4so8504059b3a.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471096; x=1785075896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovcWgRh/SehcaPYcqFS1j99Q2R9oW6Tj3JBJPCP1Liw=;
        b=qP2YAIqm9L274sjtswH0clLT/5hAC34lE8CH+6NIhgvl/z5yyupvYWByFPqInCgja5
         8kG+/+os/LIAxhUWD9+E0zdU07liCrEqoBPRr3ifTDM0cLC72Hej066PLZJL4xSo7j11
         D8lNocxj/w+6vYihIL3Q2i9ruaY7++fhJRv/niNo+hnZx6MKEtOcHBfbme2tqSt3s93K
         fx+TigHhbe7WxH5W2WoigC6XZ1puwpunhFjo3Eaa6Azw4VzviKkHCeu10ZmOUpqKraK4
         kYvOOQiNqEBacjwXI7jsoym7MdCk7mt+1yFSmDK7/aUh1D7lh92mLCLWSPH834N5L24P
         mFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471096; x=1785075896;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ovcWgRh/SehcaPYcqFS1j99Q2R9oW6Tj3JBJPCP1Liw=;
        b=FnzbDGJz7e1j4/CUYHXFGJFOxVZz+HhJladsSttFoBcwTABIV6f3eiWGD+DLlb8hqb
         mlPu2V5fBDvs952zQt6OgpW0y6kQiD0CKKd/RJvDS5m690g1rWsUjtyDUepdSXifSZcF
         glc5C0F0RNS9Zq6ttqhRkUu2qwpiqhviEA0XgSJN4B112h47QXDHO5FMLBNeplPUOdLu
         wkL27tNNyZqhYLy660Q+WMX1hof8F15jYJwzMeqy5PbLTjwFhocIkPbcHnWgsARTZteW
         h3oth0Lh7I6WhpP1hKvBDfE5WSNwqNzM0odZ3Q7+BU4KIFbr7d/lEw9nPnevboUHBShq
         zxYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBO12QfZs5pSR3Y1rUscpvHLdOzTSrC925noIgaYbbtIXq616oboq//FT9KztAbHpgRcvnkxO48BoT@vger.kernel.org
X-Gm-Message-State: AOJu0YztCs+UnjhWlVuR/Kkbi5YfISgaqyj0dOc1cfDNEZKnWntekNwA
	89z4SvWB2RuUwj1SxkaA3njREMqpWL2HIW3GrzGP85LyqdB2HmyN5Ehe
X-Gm-Gg: AfdE7cnvxirQyIXQG4Md/9L2XdkiAfT1UjdGjXFk55PSP9GuZFfW5gOm2mf9anXh0VC
	hebiqg+7vvXoRbVLpUNGlk/1kIloT14evHne69Tkrvz0wRgV3hfYLjwoW8zzRYt/ke1Cx0V7LXA
	nDaKQzdDh4OVEImL8G3h7QvqY/JoRDFUlfJunD1DhE7XTZ2CZXH2O/Uc/iIpbfIvh9JO5a3+6rB
	lwPiO+UxZWQMfhVZEcZZR7H6tBRd9ZbUMMMKRc1vUmTuvcXqLnVQpg5WXijwx8E0WybZQDeWUmj
	z9UOoo+n6/U5orBdvOEbfyWO8PDtUoiZJCnXGEblRmvo011rc1BV9zDVJD1suaERZyTyjiVHyJw
	UkvcbTN2PxkO7b7SwLGRZArVU7Lg3zCnnz23DXLfs1cLEU/7/wqDh0jANCWFgrHadzef/ySNnU6
	lHEWWwfEimrvXT2BKpMibVcmy8YYHmgg2SpLFV3xtLxd/CzG+fbvs=
X-Received: by 2002:a05:6a21:6110:b0:3c3:a140:938a with SMTP id adf61e73a8af0-3c3ad947db0mr11892130637.45.1784471095830;
        Sun, 19 Jul 2026 07:24:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517aad95dsm3238581a12.7.2026.07.19.07.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:24:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1de9d366-469a-489f-99b1-b667705bf491@roeck-us.net>
Date: Sun, 19 Jul 2026 07:24:53 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
 <20260706022155.C5B251F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260706022155.C5B251F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/26 19:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Scaled `PMBUS_READ_VOUT` value can exceed the 16-bit capacity of the PMBus `LINEAR16` format, causing silent truncation and incorrect voltage reporting.
> - [High] Missing software scaling for VOUT limit attributes and missing `.write_word_data` callback causes hardware limits to be programmed completely out of bounds.
> --
> 

Please comment on Sashiko's findings and either fix or explain in
comments why the issues do not apply.

Thanks,
Guenter

> commit 19e6041d100f0e80c9e49784d17900b141e3ea61
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
>      
> Implement support for external voltage divider scaling using the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> 
> When the desired output voltage exceeds VREF, a resistor divider
> (RFB1 and RFB2) is used to scale down the feedback voltage. The
> driver reads these resistor values from device tree and applies
> the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> index cb2c23672166d..5aad4448054fc 100644
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
> 
> [ ... ]
> 
>> @@ -14,6 +15,45 @@
>>   
>>   #define MAX20830_IC_DEVICE_ID_LENGTH	9
>>   
>> +struct max20830_data {
>> +	struct pmbus_driver_info info;
>> +	u32 vout_rfb1;
>> +	u32 vout_rfb2;
>> +};
>> +
>> +/*
>> + * Driver currently only supports READ_VOUT for monitoring that needs scaling to
>> + * convert from feedback voltage to actual output voltage.
>> + *
>> + * vout_actual = vout_fb × (1 + RFB1/RFB2)
>> + *
>> + * VOUT_COMMAND and VOUT_MAX are currently not in use, but work with feedback
>> + * voltage. If regulator support is added, VOUT_COMMAND values would need
>> + * to be adjusted accordingly.
>> + */
>> +static int max20830_read_word_data(struct i2c_client *client, int page,
>> +				   int phase, int reg)
>> +{
>> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
>> +	const struct max20830_data *data = container_of(info, struct max20830_data, info);
>> +	int ret;
>> +
>> +	switch (reg) {
>> +	case PMBUS_READ_VOUT:
>> +		ret = pmbus_read_word_data(client, page, phase, reg);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/* Apply voltage divider scaling if resistors are non-zero */
>> +		if (data->vout_rfb1 && data->vout_rfb2)
>> +			ret = DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
>> +						    data->vout_rfb2), data->vout_rfb2);
>> +		return ret;
> 
> [Severity: High]
> Does this returned value need bounds checking?
> 
> If a large resistor divider is used, the scaled PMBus word calculated here
> can exceed 0xFFFF. The generic PMBus core function pmbus_reg2data_linear()
> will cast this returned value to a u16, silently wrapping the value modulo
> 65536 and resulting in wildly incorrect telemetry (e.g., reporting 2V instead
> of 12V).
> 
> Should this be clamped using clamp_val(ret, 0, 0xffff)?
> 
>> +	default:
>> +		return -ENODATA;
>> +	}
>> +}
> 
> [Severity: High]
> Will returning -ENODATA bypass software scaling for VOUT limit attributes?
> 
> The driver sets PMBUS_HAVE_VOUT below, which exposes hardware VOUT limits
> (like inX_max or inX_lcrit). Because only PMBUS_READ_VOUT is intercepted
> here, the core will read those limits unscaled from the hardware.
> 
>> +
>>   static struct pmbus_driver_info max20830_info = {
>>   	.pages = 1,
>>   	.format[PSC_VOLTAGE_IN] = linear,
>> @@ -24,13 +64,25 @@ static struct pmbus_driver_info max20830_info = {
>>   		PMBUS_HAVE_TEMP |
>>   		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>>   		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
>> +	.read_word_data = max20830_read_word_data,
> 
> [Severity: High]
> Does this struct also need a .write_word_data callback?
> 
> Since PMBUS_HAVE_VOUT is enabled, user writes to limit attributes will fall
> through to the PMBus core, which writes the scaled PMBus word directly into
> the hardware's limit register. Because the hardware expects limits in the
> unscaled feedback voltage range, the written value will be completely out
> of bounds.
> 

