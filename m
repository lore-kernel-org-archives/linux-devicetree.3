Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A6372EEC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378788; cv=none; b=PAZvnHe/rucPGZevI/RdkXL/3pHdSNx3Btbwve52ewHELx0p7p6kxQ0C3iF+fMKSWLO9HjjNhGLO2C1yCb5LSNgeWUMR4SiiLCfdSckzCvkgqIJo0/jKIdVimf1Xz8y897sjqG015Go1XwY9CadL3s3taaRG7/F+zD2ZOtgFP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378788; c=relaxed/simple;
	bh=ttbQS1ugAzozKvPvphXvY2aYW+nGXbJ9/3tjmYcPKRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5itulV+PUMEeLs8GLDLMqWkUswhXDJviffi8d06AOcmqOnF8zP0kYkeLrnyLutBvR2mxBrz1WVGaDl7uZwGFmOoKyZ/+4sJg7N6BRSAkTxYVo+XvPzBmlOB4GRUumSr72dXq/3HPMWSKWAmxorsbTcBrR5IA77gFEjRz/yazB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNRHv0fA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNRHv0fA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1114073a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785378786; x=1785983586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFlyU2udPpzIKUy1BZ0++XXzHI1+IsIEl+Vexov3IQI=;
        b=GNRHv0fAnRaibpSIDHBUKSU+vP/4PjD8q5bR/rJQlR+pLhzzRbGdCOy9zISoc6iQu+
         NBiiO4FOsT8B4pNMnwsrOlx9PevaGIsSoTRbluTQmUN6jlkKpx6CY4RCFYLTOZoVX6K8
         un6fePIbkHllfWdd0yIA3qmNr4UCCSTHHmY58cUKL0rLxZcAT+7dlIDVWJ73TaUsXLck
         u85i9dliaZeCZQKUFbeqAZwc7sEAVU+i54CnsemMPnvi9yjRAPoiCFw6xjarvi8/RunN
         iwF58MMCYU7a6M1PAPGmC1nvKZIqMcmm/oXFRDW5re2+8PGjJmwAYuuBfT7giWRU5PAP
         aLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378786; x=1785983586;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iFlyU2udPpzIKUy1BZ0++XXzHI1+IsIEl+Vexov3IQI=;
        b=nGQq+AjmXkXmWerjfX1Us7V6Souqg9MY7n+MVkJyEzKoFMuwdBqx5Zxi7XaGMPLMST
         W+KZ8uoba2DHVUDW/H4dTFcT14Vkmlvsn7zmVW2V+T/CqSrBJ15pRMLXhmq9QE3S42nF
         qG/U13I72wgMTCb4He5LFLMfyMZqxzONiVYzeNqODg2E4bsr6+h5SJo3VoRD5gAKZiAe
         n5mE0TwdRfIEUJu5ocd2L2HqnG4axy9fzcfi9o/DEskPuUdKV+Lh+mANSYlSuNG3CfAt
         jW8jbex2VY1mg+YQhFSCnWRnoz5uljDJlJb6G09+srRTUwA4rstd9Klx2QANnpFkVD1B
         K1pg==
X-Forwarded-Encrypted: i=1; AHgh+Rqeudm6xKChQc2XFIXE6O1KSSjfeLgiF+ecl1/yDC2GkVA98noz18r29cBK5v6hUGwvGv6Dk85apAiY@vger.kernel.org
X-Gm-Message-State: AOJu0YxteNHEiLuCBTq9DPq5CYxePz5mESvbFkyu6UJdOk+KFEgPN76H
	1b7dW1fMhob7fx6B5MytsVNu4rCXtD/xca+3QONoE4PUSA+OIEXCk4ry180nuQ==
X-Gm-Gg: AR+sD11YtT0HIpc3uEGwGGBrfemLarFuLWm0BM8UXqLUUfsKpxVKAOzHQrBVtgW3ane
	I+H6VYcvlLqsEozW9d1VuuiCO4ItNGw+7vGgZw5xli0FPYJNxzl+vorgT8qCczYaWlCChrRbBXe
	Ey0oq3wzc6oEo+VJBVNWXzz23LL/RcftFOuJXxY+Z3z42E+Tr4OOeVmDqQWIlBQ/qdDYXrLTh42
	UtgQVmpDG/hF2jG59+U85wHcOZj8TWELQy5wqQdqpSobeQlpEFEVPKwrEoinLKGqGq/escvJVp7
	v5nq9rzoEbwMxTGTcpc5ufdVt5f+q242Tr+P1YAOrunmmbDhyRPpF/s9dNTgWBnHrfrJXK+/OGw
	7Bg6mRAR8Rw6AAKF1hVp7J2UaL0WT1fPGEBXgahZ8hb4EILSnA6eo5J9bVysHfkTwQLts7H4pE+
	0bSVQ458mPIufbbhhGXdWTe0b6w9yU780gibt0NXA4FEEFVmeRXjyEcraodxn+Lxe1rqWnipuEO
	C+WMcqoEVhrabeYadMoM2v4k5i9F33+Wnw/Rw==
X-Received: by 2002:a05:6a20:7f9e:b0:3b4:731e:6f95 with SMTP id adf61e73a8af0-3c900649475mr687211637.39.1785378786148;
        Wed, 29 Jul 2026 19:33:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7262b8bbsm12628153c88.3.2026.07.29.19.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 19:33:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49155880-5994-4247-81fd-caa45b1e6d88@roeck-us.net>
Date: Wed, 29 Jul 2026 19:33:04 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-2-a7553f84ee74@analog.com>
 <20260730011458.525861F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260730011458.525861F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 18:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Returning -ENODATA does not mask unsupported PMBus limit registers, incorrectly exposing unscaled limit attributes if the hardware responds.
> --
> 
> --- Patch [2]: [PATCH v5 2/4] hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support ---
> commit 852e7cf36da1bb5ec1c29eff09bb747755762b5b
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
> 
> This commit adds support for external voltage divider scaling in the max20830
> driver. It reads resistor values from device tree properties and applies a
> scaling formula to VOUT readings to report the actual output voltage.
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
> [ ... ]
>> @@ -14,6 +15,56 @@
> [ ... ]
>> +static int max20830_read_word_data(struct i2c_client *client, int page,
>> +				   int phase, int reg)
>> +{
>> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
>> +	const struct max20830_data *data = container_of(info, struct max20830_data, info);
>> +	int ret;
>> +	u64 temp;
>> +
>> +	switch (reg) {
>> +	case PMBUS_READ_VOUT:
> [ ... ]
>> +		return ret;
>> +	default:
>> +		return -ENODATA;
> 
> [Severity: Medium]
> Does returning -ENODATA here actually mask the unsupported limit registers as
> intended?
> 
> In the PMBus core framework, returning -ENODATA from the driver's read
> callback is treated as a signal to fall back to a standard I2C read. It
> does not block the attribute.
> 
> If the hardware responds to the limit register reads over standard I2C, the
> PMBus core will still create the sysfs attributes. Because scaling is only
> applied to PMBUS_READ_VOUT in this patch, these exposed limit attributes
> (e.g., in1_max) would report raw, unscaled feedback voltages, while in1_input
> reports scaled actual voltages, creating an inconsistent interface.
> 
> Should this return -ENXIO instead, which explicitly tells the PMBus core that
> the register is unsupported and prevents the sysfs attributes from being
> created?
> That would require explicitly listing either all supported or all unsupported
attributes. Let's not do that unless it is really necessary.

Guenter

