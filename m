Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4C3B19B5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374018; cv=none; b=WG2prAU+L6NXRvJqqX/5qi2o28LN99R0SywCu5+SHLC6R7WzA5m+anjxvjZG5b++KQKJ5V3+0SEOczZLkpTb5Ipg4QRzmeRVg8DBEifet0TQUeiabNHlFiua4NhscthDTqUUPzbgXMj2j/NvduQvB1uHdpLLEas9Gff5CmFuzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374018; c=relaxed/simple;
	bh=nHOcLQLzATw9cof4evao9T+Tp7/JcGCq/kvRVe7peSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=quyp0ttB8mbtwuHZufzHF901dOeOAgdT4k6HwqiblWNp9hroH/ElYvYdySDQz1/dcHOJndXSn3I62JEUT3XHYn5vsHnBFSTgnarDzlKSjIM2g1yz9YtA0++EMd9EAfQ02Qu4mEhTqLxs9n/R9vZT3TAUNpKot8sfurTlbgTjflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk1o+r1Y; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk1o+r1Y"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso323702566b.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374015; x=1789978815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3bkgTCY3BGMCzpvqOCMkFaqg9m2jt+stwcdJVhFHOE=;
        b=Bk1o+r1Yzp0a3uopZ/s1b4gD2Z/CJlLJtFgZPnUB/O8REC28rRnVYwQ5EQaJawC10F
         2r+OMJSihm2gzZNLVJt0bQeQXgQ7Mp2Rkot2cBCeZonA8Ev+wJC/7suIF5o0d8SfQTos
         1dAayCpF2SMZ0qUQW47VGh91rYMu4RP2uzLFNz6YmHI/Ke4QD4Iay098nmm50W4EacJ6
         0LWiYoxmeBk2jphZBfLvX+1rP2QPy2c7XkqdERCEetL6B6u+Y0DYndeak2kgBN/cD6Jq
         QNe/OUcBpbxyK2t8Odnz1ew4lcoaeQqsWC94vrvvwgRfOFRe80jjTYDG2qAQsth+x5A0
         zK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374015; x=1789978815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3bkgTCY3BGMCzpvqOCMkFaqg9m2jt+stwcdJVhFHOE=;
        b=NoCZOS0w0VmgJDj8D4d44Vajc9/ObEGJdfiIwCBZK3EMMIUuIImRq95WshZ5YroVf5
         5SrOKLWuG76Hx13AYYf7hBj0IGbSK1MtRN1YJS+VKUu6dLE04p6woeaiyZbfh5n59YCH
         TQ9wtiMg1oR89B/IBJ+8zwLMgsbB/7VJkwBY3PVHvDC9lbgokpHhFN87u2P96sXtFRVE
         Y4UvpMFdAwqTsVp9ovIYsxn9i/D5tLwuc59XS+/4IOCUj/ZsggGniXbPJwn84YJw29rm
         148xqsEfnU68aUHd91JTjuI71WeMTAazDQ5ZuCCFHVfra4D6VA2MXnCfzNB3Y4sGm8CB
         xjEA==
X-Forwarded-Encrypted: i=1; AKwUvBwTWi1TdboNflZ5/M2Md3DX66YxU3yP6uXsi6aJOvpfKWF5iJS9wdUtDOg/VbSZkek1mh5h63s2N0V4@vger.kernel.org
X-Gm-Message-State: AFuF++l9uh2T/vCARBLu4skofS86ONTjb0/DcV7R69tUP4bsfU2XkSHp
	43EkVpQMa66/RUAtysOZjDz50xuosNYnWbvpXizOZjVZicT7XsrBf813
X-Gm-Gg: AYBFou3TkumfPUvMGqAS49UArhsjQ3wHYeZXY6PqWZV5Hc0440nJENOM3q/mTtyGr/D
	lGeCCW0Xe9hd8G1f9ifN/cTZRDZ7BQmjn8lw2FGOdh/z4oi78d5azHVEP8Hc/OJ//4/6Hj1Adr2
	Xi9PZhfHI69KiLS+Zl/Ih01n4kVO/2/oEFAZ/vauhRFlIY5rrRIjxcX0sexvxeVN2I7u7HAVgJN
	n2MR5aZX4ZTQZQSj/hyjAugzXqgNCSX+Mox1F3Q92ZPrWtuuSGcUua9z0g3orn44ZWBPsQdIcqQ
	gpG8tPuU3975oWuljPqYE3L0E5sLJZbt48e5t7VfcwYNIPaTU5FO9cCOt4w0aiIbsmVYiDjuAgp
	dajbBJmUlr0UVaU6ic1M89Q0VIsILAvsa0kFUl2Pym+v+Ni9L1dBYi0BvqAD5EJaiR6Q8+CdYqi
	oadMVntSI4/rkAg9iVKsleB8yQW9FjdBP0xXZRzlJszyVngUyxW3yTox3La/LkGQjhTE9glNVJa
	Ss3hA7CpUL35A7bWZvxPcY=
X-Received: by 2002:a17:907:94cf:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c29b83c24edmr160816366b.8.1789374014925;
        Mon, 14 Sep 2026 01:20:14 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660d49b5sm399233066b.46.2026.09.14.01.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:20:14 -0700 (PDT)
Message-ID: <567c2221-7237-41c9-84a2-6e6865b27617@gmail.com>
Date: Mon, 14 Sep 2026 10:20:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Janani Sunil <jananisunil.dev@gmail.com>
Subject: Re: [PATCH v7 07/17] iio: adc: ad7768: Add power mode helper
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260910-ad7768-driver-v7-0-7f70b07627e1@analog.com>
 <20260910-ad7768-driver-v7-7-7f70b07627e1@analog.com>
 <178933271416.413489.11205164036404426330.b4-review@b4>
Content-Language: en-US
In-Reply-To: <178933271416.413489.11205164036404426330.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/13/26 22:51, Jonathan Cameron wrote:
>> +static int ad7768_set_power_mode(struct ad7768_state *st,
>> +				 unsigned int mode_idx)
>> +{
>> +	const struct ad7768_power_mode_info *mode_info;
>> +	int ret;
>> +
>> +	mode_info = &ad7768_power_modes[mode_idx];
>> +	ret = regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
>> +				 AD7768_POWER_MODE_POWER_MODE_MSK |
>> +				 AD7768_POWER_MODE_MCLK_DIV_MSK,
>> +				 FIELD_PREP(AD7768_POWER_MODE_POWER_MODE_MSK,
>> +					    mode_info->mode) |
>> +				 FIELD_PREP(AD7768_POWER_MODE_MCLK_DIV_MSK,
>> +					    mode_info->mode));
> Sashiko:
> [Severity: High]
> When configuring MEDIAN mode via ad7768_set_power_mode(), does this code
> inadvertently configure the MCLK_DIV bitfield using the power mode
> register value instead of the correct clock divider register code?
>
> For MEDIAN power mode, mode_info->mode is 0x2. Writing 0x2 to the MCLK_DIV
> bitfield sets the hardware divider to 4 (MCLK/4), instead of the expected
> divider of 8 (MCLK/8, which requires register value 0x1).
>
> Since ad7768_power_modes correctly defines mclk_div = 8 for MEDIAN mode, the
> software will calculate output rates and delays based on a divider of 8, while
> the hardware runs twice as fast.
> -
> I haven't looked into this one so please check it out.

Both Median power mode and its corresponding MCLK divider use 0b10 register encoding. So using mode_info->mode for both the fields is intentional and logically right.

Best Regards,
Jan

