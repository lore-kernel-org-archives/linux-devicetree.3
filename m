Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C81423A70
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746180; cv=none; b=u9EmPl5a2dk4qh3BMo3S/t15A6WdEPacSxCmKyde4pTeEkypz5eg+dsox5stzO61Vdsh7I5lqogHBSopafLBwePQ2iKUsGkx8bKLz+DXCz9HHxfOoXe/VGuSp1G6qcLh37kmSdg2MlCPu8ZZNpOiKoH04zuEaCcKaeqrBX4qXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746180; c=relaxed/simple;
	bh=lKy4aCKGQpCX43GhJty4oLzKEwjcCep/eT3eY96uy8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo+hkc4GJKKC/9cVwtn5Gqm707Xc9QGjHcrXKQ5DCBsfdWQt1JqjiclchZuHAo3jWk6iHZvTs7VP0OqTAhe9GRcmmxc+euw7EDSa56Dyezz2gB6X/iIQGffna5br/Ml9wKnTkp0AcQ1ypVTmVGlMryr81i1hc4h9Dnaqc8ij9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QyNMZEAf; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QyNMZEAf"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e94d272a86so2486143a34.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782746178; x=1783350978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xm05s8v0mjGkdrpcNxT3cT8GPMUG6WjwWeFiXkf0Aws=;
        b=QyNMZEAffsobLpv56dFF7GnHk3MVoMLYwbBTSHSUCqyq3+ZsBa4C02Q8fYW0GNVjVi
         2TlwaDJtu5Bvppioy3WZ6fH9OyuSWM065RVFwAZu4ZBAIGt3XApdBKa+9oo0ufxrT28a
         Sdo8vvCiBDi7tx/R3P55rJ70ged4gv/HoMSmcdmXHL2rjwbMyqFoPJP1kPEZxamjc+NR
         aFX8kE/QqDg0QbijretXZfPMd6RuvPDwWgWJ3k5uOJJlvDzIu1bwWGqXg57y4PwM5JyI
         Yyujsr1fdWuJSfIe7vWY1jVOrW2NC//X7KMZ/np01gto9/609CsZELBeWbE/LWOG+Hmx
         aydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746178; x=1783350978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm05s8v0mjGkdrpcNxT3cT8GPMUG6WjwWeFiXkf0Aws=;
        b=kiIEF90qh8O9E4bQwaAB4Ik+hqIwhQfsXb4fYrXgcaXV7QI7m/ajHA6a+44BeQbCm3
         6vgVhYy63UxY5+2zK4jiJcKn1RawspEWKkzpNHmiTcPnZRAS6YeSXJcCwqVv6HRwj3al
         /cPFSksbuwZiOMykbQRcD9ruOM4wD9pemKiCO1GQt+sOeSngfgIUflU5m4dmrtKRIzTP
         DO5SGWzNW423ljpj9pAJBzBjAmw9Cq+mnDYPfptBkR2AZkk+9ukKBzOhyjGDu/mr5eOX
         0eabbd99Y4dq6hIq3C9yWvWEoHWNmE33PZ7vVYBzVj5wkWsvV31pjwr84/1pNi/wLT5R
         gcPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9razG6pOLapq6+NPIWuHJHLd/yOPKFxhc7msK92Hqf01vtwM0X8yv5tw+BuRhviHUEcTGb+TmQgPol@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JpwMwfJLxcBKhcExZk7ChjXXJTFymdXPw0ue6zEnIFrpvFDN
	9MfmZ/re1WJ/waUU+Gc6j9GugdjOWWyuzi0bIvFn/wXFCIcn0DNHEYYcqZ2SdCQwZg4=
X-Gm-Gg: AfdE7cm3p9rdZryPrSmLdxOun4ABKp+o8q4ohm3bZ6B0OL+S8a5D0fTG0VyqYcZmYAs
	zkCEivgDOpoMeqOiMrAdFljHCMe/rpoOwsnpof5MgIkqDvOUa6nsRyRNCte04U4JJN3nDVDX2rK
	0iw0hioeYqvC/0yzQoMmsckJU+88tEgzmcJRf7FEpsEf1jDd9/awp1E7Nm0r2LeqKOQ6F5DLkED
	Fr7fOGmU208SyavqaHLQbB04CAS5eX3LAqMnucWhmUr39l9EFTRAALau8oLlarwq77zGmi9rOGU
	2Iyh+GrN0IwWSM0pTE1mDMcX1Pv2VJIHdzR7hYh0S0biAmddzIDEbSY88Kh0YkgWXtJPvO8VW4D
	Tb1wcEi0EazayQK+5kTeyILchHgn1lJkJB+tPb4u89B5w6sx3F+FAvRi4INBdHaGue/r6nMRnRX
	z+hw1WfcqHk6xfro/B522DrLQjP1CH1jpXOltOxFH+B0uP/FgnEoHp9+BQ/QcfvcQ=
X-Received: by 2002:a05:6830:4998:b0:7e6:f083:130e with SMTP id 46e09a7af769-7e99bfef82bmr15251661a34.4.1782746177656;
        Mon, 29 Jun 2026 08:16:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec3085dfsm18790a34.22.2026.06.29.08.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:16:16 -0700 (PDT)
Message-ID: <3a96a20c-f435-4b98-9e95-26a28bd06e7b@baylibre.com>
Date: Mon, 29 Jun 2026 10:16:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 nuno.sa@analog.com, Michael.Hennerich@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
 <0abf862eeb277ae82262d09b11b1446f04c47be7.1782397418.git.marcelo.schmitt@analog.com>
 <9c6e0a74-c9c5-43ee-8eca-ae1667c51c32@baylibre.com>
 <akKHv7j22P6KczXb@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <akKHv7j22P6KczXb@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It helps if you don't trim the "On ... wrote:" part of the reply so that
we know who wrote what. :-)


On 6/29/26 9:57 AM, Marcelo Schmitt wrote:
>>> +{										\
>>> +	.type = IIO_VOLTAGE,							\
>>> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
>>> +			      BIT(IIO_CHAN_INFO_SCALE) |			\
>>> +			      (_offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0),	\
>>> +	.info_mask_separate_available = _offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0,\
>>> +	.scan_index = 0,							\
>>> +	.scan_type = {								\
>>> +		.format = _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
>>> +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
>>> +		.realbits = _real_bits,						\
>>> +		.storagebits = _storage_bits,					\
>>> +		.shift = (_offl ? 0 : _storage_bits - _real_bits),		\
>>> +		.endianness = _offl ? IIO_CPU : IIO_BE				\
>>> +	},									\
>>> +}
>>> +
>>> +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
>>> +	__LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
>>> +
>>> +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
>>> +	__LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
>>
>> Why not move the (((_real_bits) > 16) ? 32 : 16) into the __LTC2378_DIFF_CHANNEL()
>> macro to avoid repeating it?
>>
> Because that would go wrong for LTC2378_OFFLOAD_BIPOLAR_DIFF_CHANNEL() in patch 3.
> 

It could use `_offl ? ...` in the macro for that. Not a big deal to me though.

>>> +
>>> +struct ltc2378_chip_info {
>>> +	const char *name;
>>> +	unsigned int internal_ref_uv;
> ...
>>
>>> +static int ltc2378_regulator_setup(struct device *dev, struct ltc2378_state *st)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
>>> +	if (ret < 0 && ret != -ENODEV) {
>>> +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
>>> +	} else if (ret > 0) {
>>
>> Else is not needed here.
> Why not?

The if returns unconditionally, so else is not needed. This is just a general
principal.

