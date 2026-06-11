Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B83D5226
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179606; cv=none; b=qAJuRzUfArxaPFfAirRsEOyO+WC0M38Ilu0da8rVqfMMb8aeLl9P6tHDBF+6eeyP0hnjkuu1+SWWEQVjIiwAfnrlWrfvzptadji3NqQCXh7ZFN8gbutNWPIrqrQ23HCVpWLyE5SI2y3XPSoBRHSgM86wWY3pI2WVLaI5bHk92d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179606; c=relaxed/simple;
	bh=wlwhQdkGb5D5EOr9Nwp4TREnWfUfgJpQ3LhnjufL8pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZzdxqIZyyNpN4Rh/zigfRZ0cMCg0k4CYkGBUE45S4XO4/F54pEf2yaJycgf1llXPW2yfbFVRoedVZvF9Tcd3VhEK5bceX1TqEv1GHGFq2IUNCr3cq3W+GIwCHWUSA9GoQV8huD773MpCIf8d8hWC6cemhhJ2iQzNTdA6NGcQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cj/C87xm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cj/C87xm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso3539614a91.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179605; x=1781784405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YOESj/vm8UEXKqEt301U2+lEFuGwhlHJIvdQRFOion4=;
        b=Cj/C87xm5mxaHWDBMs50GZFugQSxqRx0Eeii4vd8WjTFialO5Pj553rJyKW817SPdW
         hvbv4mUVwd15mPei8NL8d+SVqDeBNBUlZ7QhGEK41AkxX7cg6IfQUqvUllHfTv41zclR
         UjGS0OOOzYLJvqlQPfsw3tcDfUmf1e5tkseTP2toAvISu5kcMu96bkkIgYgveB/Hks8J
         IFrlcCvjVyxPnW3JXt40I1MYlpuH88wRxmE3P+iF6MnwWV0N+W3VrEXhYNrxMYDrvlOM
         vCTCrP//Xcau81YszdnT85yO1TThthTFTCN224IVw971SuNLaddQxmnf++DbOkTJjDb6
         okAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179605; x=1781784405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOESj/vm8UEXKqEt301U2+lEFuGwhlHJIvdQRFOion4=;
        b=a+DFEDbiPAg1oDuiwOthI21+/ZtdvdX0ImFmWtzIOqZBbioMR6MypB6rQWFfPpOVJM
         PNaiKdcRIUYStkC/VrGpr10OxOL9FzRf3J69hMyBBOFy6nUezd09OQDmlId0gBgbXHaj
         j9UTw7ISUa6l8QPh4W4NpBxCa7Srl83c8p4PuQWxPxAbDaDjJNk+1QJy+D3uVEW6Obzv
         J5h0qBwjWpANYa1HInvOb/n7QDRAITslkMtR/DYMJbs6AM6D1yP5yX3MTd8pcQTlTB38
         JoiJ/shfS9ak1zF+fYk5deDGgOBo30YorJjGADQG+zetR2w96k+j1kCbTs/RkwFveir+
         LFKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Iyk2vP74DdgRdTk0pYKcGnKDdXnHk9VcjCxO5XaBLH6cRS4nNPpCmMnJTcErMEA1RZS3KMFPgdBY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKJW9WbM/focB9PJ4ErrKoDEK9t6xChdSdeE20i2ZrqkspGOp
	IHKIuERb+eyF4PkVjOi707Opcesr2sb/+URA4hRDf03/qQMiv0Yn7AgP
X-Gm-Gg: Acq92OHL6hKsjTc+CyYTjrLgt0NRaN65P30TKpk8sShobxM0bxSo0SVNRiUuTjHeNr+
	Lc9DRdD5VSmv3JbM5Lva2EVv9UJdhP3+9LV5WTV0jIllvu7OYRV9+lW7SyHGpH7rivCT8h1a7/5
	Y8UXh2eM4M659Uk2HiRAoOWz55gH31KdGvs+q+hPOp7wUmXsxV8ea2IhNQVBtDWRkPwe8815Uh0
	EXLLyN4AFdRu+2EwyO7KTYmhipUI36m5xfRg951gE0ytyGRNbQAI+dNwlm24s3KD5NoWNQ8JrcW
	aMUkzFIotlZsVYzYZfaeO0U8SJwpn1IM2QaNbY7Akps9eIHXYsjgjxpOvAWEblkGphHr3K8Ocj9
	vgLQ/lOt10U6XP+qxrc1HmES96T6gsJAsCd1jMqx6GRNOW3E12fxHhpv5+fQaHAkcjVwAsZb9Ms
	uDWimlnR+tg23rDpussJoyEhzV4xjV1Lxy+EK/7xYfyrl/9qzUuOLTm9E7vPQLely51iq95iWiu
	4fa7fNNusM=
X-Received: by 2002:a17:90b:1c0e:b0:36d:cc9b:2f67 with SMTP id 98e67ed59e1d1-377a76c21bemr3289918a91.19.1781179604887;
        Thu, 11 Jun 2026 05:06:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2521809a91.12.2026.06.11.05.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:06:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <811d784d-00a8-4a31-8872-e481a30e81a6@roeck-us.net>
Date: Thu, 11 Jun 2026 05:06:43 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: pmbus: Add support for Silergy SQ24860
To: sashiko-reviews@lists.linux.dev, Ziming Zhu <zmzhu0630@163.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260611074335.4415-3-zmzhu0630@163.com>
 <20260611075433.325CB1F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260611075433.325CB1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/26 00:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing signedness check on PMBus limits causes negative inputs to silently set maximum hardware limits.
> - [Medium] Returns -EINVAL instead of clamping for out-of-bounds lower limits in PMBUS_IIN_OC_FAULT_LIMIT.
> --
> 
> commit 1edf6322da1b629fce9b16a96496a18863aacef8
> Author: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> hwmon: pmbus: Add support for Silergy SQ24860
>      
> Add PMBus hwmon support for the Silergy SQ24860 eFuse. The driver reports
> voltage, current, power, and temperature, along with history attributes
> and over-current fault limits.
> 
>> diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
>> new file mode 100644
>> index 0000000000000..f16f650ff7ba2
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/sq24860.c
> [ ... ]
>> +static int sq24860_write_word_data(struct i2c_client *client,
>> +				    int page, int reg, u16 value)
>> +{
>> +	int ret;
>> +
>> +	switch (reg) {
>> +	case PMBUS_VIN_UV_WARN_LIMIT:
>> +	case PMBUS_VIN_UV_FAULT_LIMIT:
>> +	case PMBUS_VIN_OV_WARN_LIMIT:
>> +	case PMBUS_VIN_OV_FAULT_LIMIT:
>> +	case PMBUS_VOUT_UV_WARN_LIMIT:
>> +	case PMBUS_IIN_OC_WARN_LIMIT:
>> +	case PMBUS_OT_WARN_LIMIT:
>> +	case PMBUS_OT_FAULT_LIMIT:
>> +	case PMBUS_PIN_OP_WARN_LIMIT:
>> +		value >>= SQ24860_8B_SHIFT;
>> +		value = clamp_val(value, 0, 0xff);
> 
> [Severity: High]
> Does this handle negative user inputs correctly?
> 
> The PMBus core converts limit values into 16-bit 2's complement integers
> (s16), but passes them as u16 to sq24860_write_word_data(). Because this
> driver treats value as an unsigned u16, a negative user limit written via
> sysfs will become a large positive value (e.g., 0xFFFF).
> 
> When this large value is logically right-shifted and clamped here, it
> results in setting the maximum possible hardware limit (0xff) instead of
> clamping to the minimum limit (0).
> 

Without a datasheet it is all but impossible to determine how to handle
this. Is the 8-bit value signed or not ? Who knows. The read function
suggests that it is unsigned, given that the sign bit is not extended,
but that is just a guess. If the value is unsigned, negative values
(0x8000 and higher) would have to be set to 0 prior to shifting and
clamping. However, that really depends on the chip.

>> +		ret = pmbus_write_word_data(client, page, reg, value);
>> +		break;
>> +
>> +	case PMBUS_IIN_OC_FAULT_LIMIT:
>> +		if (value < SQ24860_IIN_OCF_OFF)
>> +			return -EINVAL;
> 
> [Severity: High]
> Could a negative user limit bypass this bounds check?
> 
> Since value is unsigned, a negative limit (e.g., 0xFFFF) will evaluate
> as greater than SQ24860_IIN_OCF_OFF (165). This bypasses the check below
> and overflows the 32-bit unsigned calculation, effectively disabling
> over-current protection by incorrectly setting the hardware limit to its
> maximum.
> 
Same as above.

> [Severity: Medium]
> Should this clamp the value instead of returning an error?
> 
> The hwmon sysfs ABI convention requires drivers to silently clamp
> out-of-range user limits to the nearest supported hardware value rather
> than returning an error.
> 
> If the requested limit translates to a value below SQ24860_IIN_OCF_OFF,
> returning -EINVAL violates this convention. Would it be better to clamp
> the limit to SQ24860_IIN_OCF_OFF so the underlying register is set to 0?
> 
Yes.

Thanks,
Guenter

>> +		value -= SQ24860_IIN_OCF_OFF;
>> +		value = DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DIV,
>> +					  SQ24860_IIN_OCF_NUM);
>> +		value = clamp_val(value, 0, 0x3f);
>> +		ret = pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
>> +		break;
> 

