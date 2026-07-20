Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731B1A8F84
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784513408; cv=none; b=UrhiJuX7ejMjNAEHSXWAYFOah6j5ouduio0L2QHJ29X3lsPyltK4BgCMaN7KUODtTXrA2d0Ve09XFHSMQaPzNGcWUVe5XNqP4LfCBVtbrHiGg8p9nGoF9U8K1M61SBJ1irxOydXPYELmw4nATBrEzok+TjFf7+Fq52qY60BkpCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784513408; c=relaxed/simple;
	bh=RqjlMxO012jgIiybeaAmg6bdFBZBp4O9uOyZB+siAzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl7VH1oBsyzP2UgU15Fm82gK/EmU3XBxV2Oe0LC2asOE5PpPMil/+PA7cN9QEVm78qDMPDq7R7tXTOJLt2wLja2LOziTve86EE2NOg1MKYlTDOniniuqbXzpscSl68Ulj4qXQDk2OHb+rOXEdPuDgJY+zsFxcOdd6sN1RLtnuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqj7rwPU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqj7rwPU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a2dcede83so8533284b3a.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 19:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784513406; x=1785118206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHFbtn3XOKRqd2XipOab6cFjO5p+IVxTDVxSIoIbpSA=;
        b=aqj7rwPU1LquiVppm00qfWcOVSzGdhnZQcRPZl2RbVkI7fQZXcZAU3Lq9WENIaIVdi
         R/nupSKbk0/cXRuv2LoGMVkPrtL9k+izbjI+7O72bWSFgcHa2yzWY1dow4O+mYNDEDrX
         goYHqWBLQDtxCXKhzimhecSAB/7IfnkgKN4hXhh61RmmUF8x9oyELH5so/SFZjo30QiW
         0/IqCU4OzUq7bnZHC1DOeGg+wln9VpCh7LwM/2eNsf08EapmJlc7h3rQbIlxZW6rGn4d
         bIfcaAa/1qF/3f/sFDaBij5N0Y265ysKCWLvq5to3Ez/DMyxtIYych2UZOTp4Yyf+i/K
         nGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784513406; x=1785118206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RHFbtn3XOKRqd2XipOab6cFjO5p+IVxTDVxSIoIbpSA=;
        b=TbZ5/N1j+PIIVAwCbndPyb0RXplTVTgCMHVGU2RPvhUNQMxxSbEVpuWyXrUlQA8mnC
         lpoKR5s839jWz0OUXqbdrd04Megxa+U7DsIRWFJeE9IQ7JKcPsjJt72omfgTSCuq8dxV
         1gnMPOEQ+2qwJr5/B4Lxf+HE++s2uZ5azawGPsSmYHoqTqAHzmp0e0npIIhZyUp7PLhV
         Wy4sf21QGyFulfPv10j/UT/DkY9BE1hns27/7plsi7HtzaMhjikwoYQudr4IJyqd2RbP
         4UBSExaxc3086E/ZgjUKGroAXSjdlseG9Vw4PGVo2eRgYI4nMJL+QdI7PfdnuUqgLvd9
         3I2w==
X-Forwarded-Encrypted: i=1; AHgh+RonPfDlo1HLgRx/+Weani8K+l4YFRlqreaTLBjQLzfkVuHjPgG1yKbexRLeKTAHOhZtwFLbY7jQYz6n@vger.kernel.org
X-Gm-Message-State: AOJu0YxZP46TaDM8K5amqKm35Yi0ynukfj+o0MFGL3r/DBp0NTzJQCD/
	kw+KvWzUk7rvgqSAr4iALEGMohW5k/Amo7eOUPaWH2f/WMgceSu9W69q
X-Gm-Gg: AfdE7cloW+xrDeljLCauC/bIY9RRKen7Ko0B/6i17jqR7E6PiVoQjdKwStPzdMuOOGi
	YdMhbXH5DWFHWni1bosDLlCeuOsX5gKGRP5y8n7iI3ain9ifxd7b6hfv3KPjHjNGsG28iZIsQA7
	73QzzS29eryRJJucalWMGsXzA8Jy/cW84Xs5ogUWSYXlv8x3E5LyfbnTcLsV26wAnBepbkvfbwc
	5cgA5cbSS6Rbm8YFMh5x6dmt1ij1Y4W2OcBdBJS7pwkI0KO2Ao3kWhX3/qGZPcA+WRE07KIndPg
	vTVJDWgNKPr+EN2eaty82oAwRD9Z+mDfb8BeGwN9l2isiR+LCmdsqO0MuvsyASkCvXBwCqzhCjN
	KN5fwP+t+YTCtoPJe617aO5NH/fPT7n5btyYXMintrPg+uvUAi0g1GdLx7jIDoM1FfK98F6P68S
	mR61Iu07MpUKJkcGXRcV/3c03x2Y6sN6uMs1+NnxaFMSQDBgj6SyQ=
X-Received: by 2002:a05:6a21:7a96:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3c3ad5fda1emr12087662637.7.1784513406145;
        Sun, 19 Jul 2026 19:10:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm31370090eec.3.2026.07.19.19.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 19:10:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e93fb55-5055-4c54-8ea2-6ef59248c842@roeck-us.net>
Date: Sun, 19 Jul 2026 19:10:04 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
 <20260706022155.C5B251F000E9@smtp.kernel.org>
 <PH0PR03MB6351F16AE2D15684260D2930F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB6351F16AE2D15684260D2930F1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/19/26 18:58, Torreno, Alexis Czezar wrote:
>>> +
>>> +/*
>>> + * Driver currently only supports READ_VOUT for monitoring that needs
>>> +scaling to
>>> + * convert from feedback voltage to actual output voltage.
>>> + *
>>> + * vout_actual = vout_fb × (1 + RFB1/RFB2)
>>> + *
>>> + * VOUT_COMMAND and VOUT_MAX are currently not in use, but work with
>>> +feedback
>>> + * voltage. If regulator support is added, VOUT_COMMAND values would
>>> +need
>>> + * to be adjusted accordingly.
>>> + */
>>> +static int max20830_read_word_data(struct i2c_client *client, int page,
>>> +				   int phase, int reg)
>>> +{
>>> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
>>> +	const struct max20830_data *data = container_of(info, struct
>> max20830_data, info);
>>> +	int ret;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_READ_VOUT:
>>> +		ret = pmbus_read_word_data(client, page, phase, reg);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +
>>> +		/* Apply voltage divider scaling if resistors are non-zero */
>>> +		if (data->vout_rfb1 && data->vout_rfb2)
>>> +			ret = DIV_ROUND_CLOSEST_ULL((u64)ret * (data-
>>> vout_rfb1 +
>>> +						    data->vout_rfb2), data-
>>> vout_rfb2);
>>> +		return ret;
>>
>> [Severity: High]
>> Does this returned value need bounds checking?
>>
>> If a large resistor divider is used, the scaled PMBus word calculated here can
>> exceed 0xFFFF. The generic PMBus core function pmbus_reg2data_linear() will
>> cast this returned value to a u16, silently wrapping the value modulo
>> 65536 and resulting in wildly incorrect telemetry (e.g., reporting 2V instead of
>> 12V).
>>
>> Should this be clamped using clamp_val(ret, 0, 0xffff)?
>>
> 
> Good Call, will clamp this as suggested.
> 
>>> +	default:
>>> +		return -ENODATA;
>>> +	}
>>> +}
>>
>> [Severity: High]
>> Will returning -ENODATA bypass software scaling for VOUT limit attributes?
>>
>> The driver sets PMBUS_HAVE_VOUT below, which exposes hardware VOUT
>> limits (like inX_max or inX_lcrit). Because only PMBUS_READ_VOUT is
>> intercepted here, the core will read those limits unscaled from the hardware.
>>
> 
> Not applicable - no limit registers exist or are exposed.
> 
>>> +
>>>   static struct pmbus_driver_info max20830_info = {
>>>   	.pages = 1,
>>>   	.format[PSC_VOLTAGE_IN] = linear,
>>> @@ -24,13 +64,25 @@ static struct pmbus_driver_info max20830_info = {
>>>   		PMBUS_HAVE_TEMP |
>>>   		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>>>   		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
>>> +	.read_word_data = max20830_read_word_data,
>>
>> [Severity: High]
>> Does this struct also need a .write_word_data callback?
>>
>> Since PMBUS_HAVE_VOUT is enabled, user writes to limit attributes will fall
>> through to the PMBus core, which writes the scaled PMBus word directly into
>> the hardware's limit register. Because the hardware expects limits in the
>> unscaled feedback voltage range, the written value will be completely out of
>> bounds.
>>
> 
> Not applicable. No writable VOUT registers are exposed. MAX20830 has no
> limit registers to write to. also regulator support is not implemented.
> 

Please add a comment to the code explaining this (if you dod not do that already),
to remind patch authors that there is additional work to do if regulator support
is added.

Thanks,
Guenter

>> --
>> Sashiko AI review ·
>> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260706-dev-
>> max20830c-v2-0-
>> 37761e89bb5f@analog.com?part=3__;Iw!!A3Ni8CS0y2Y!9BBLoE4ditcREIvsDD7
>> _VDDKjsS7XgrV0udXIgvBZeCRChzDWWsu7TY8ybr5VBPG4VQlLnDS6EQmu6fhfLx
>> CpKUl28ZSE04$

