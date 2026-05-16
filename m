Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FB30C17B
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960113; cv=none; b=Sd+ZtkwGUXVHCtX7t8Hq+4EgWdnsIwVizBlfHC/KThWdjHZgy2csCPSDkeK9aKjRtWjecks0cTm6g2gy4XS2ML/ZPrso8nAsu6vhopoAHzPj8OJLZ1Q/qM0Jj4KuB3YakyeopJojyeI5pVxDiRVg7ApnU63GGAPfVeFJatTvMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960113; c=relaxed/simple;
	bh=NnjdJ0VTzldu49W5mcdmVmQl1rEFGjOR7UXnupRT89o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNUl7D1DzcUxLKOAFkDz56XisPAKL+4DjgZL7B0iHWv1uBl1vRsDd7clLpjpwJdu8xeWT7sqmh8Bxsq74KNXnvCDmiWHk3v3yRLgTb5rPEe4Yjk306AIfemJkjqezIGuX1Y2Io+mNsv5UZ00AnAgTGBCcVfFJtCIzsiXaeGAyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ycSFdIHX; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ycSFdIHX"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6948d7ccfbbso219865eaf.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778960111; x=1779564911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2i7S9wo1ePdNkbO172mKq17H2QCBIBfTWKgSltqMeIg=;
        b=ycSFdIHXs9K+m3s4gmn0h5deTpkDt9ZhNq9w2hQhZ17c57ZrA1XU+xgHxu79eyPdH3
         /GCKWJKltawnEfsWVBnGgkyL3i9u6ZXxZPAkzJkcTNBCaHQm+nkMNUZFrMiqx3cnL7i0
         qApuwisVDLguS2/wyn4jLE3cDIIOsWJHaKfSUMcg89FTkPLCKcK5V9BfQehB1pFjJkjs
         pMX1XRSxyUFqyr4X81SgiJ0YJ9icqJQYUe/k4EA0Dm+JtVjux97j7Cpjr+5ku4dGXX83
         Sq0kuUjLH9ZKe2OSDdqpXNyfhHauBOSAfEgfOcfNOE+swwEHH8BxM19a03ziVhc/la1b
         +0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778960111; x=1779564911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i7S9wo1ePdNkbO172mKq17H2QCBIBfTWKgSltqMeIg=;
        b=bz1XHI17ScrvdAk+ukWPMAD6Rvd1ChyfG+rTrMYgJGlkVJwDNSzwwbnm5SxA2AjVcI
         cicQPcWzkeDzbyRSh7hfZI2fqEW8jGlwksxrsftggS80Kp18fc7NhLGj3kJfhcdObgAo
         n2P3rvlAbIkg7nSZUNwkSeJoQRVfJRL4W/rdL79hKDCkGIfHp+u4M/kK+D3tz8urysxE
         EUd/pfQB7mH5wi272ojZiZ41G40reHQ2UjYrtRbksv3G/4DHmIZ3rKazL8GVwpdHooFh
         1tzorXQM8o/skRvGiL23VtwZycC/fHoSMro+WuJKUNt4NtN/1jBrIrzysBrLfscLk/CI
         5org==
X-Forwarded-Encrypted: i=1; AFNElJ+P4E7cQIV7cIMstbQr6dCJwC9l8hzBbZ/3uov/R9eKqHBnZPHPGopz0+UkNbo0+K0FLM51fw0ABbHC@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEWggkjWB12MO0YVlKyJOg9ZAX0RaG2lB1aQfcaGy1r0R0Os3
	/3DMHrCSSrdGIF35TiyQPbNfxU1GLmHcmR5F6gBVzadqmX+uc8965gmJU1OTWGNlWF8=
X-Gm-Gg: Acq92OEqWzxFCGuk/sX7gkY5T7U6/ijFo5tQ5ruZ5EaDkUiD6f+0Z6q2dnGigWnROwk
	7Ztt4yxuq2lVvibjz1ya2afrNdYVqwo88ymUnZeTskxrbl3rXMjarqfTFdUiIBW7FGtkMkeUwMQ
	5RJpnXrpKLek7hOEGe4Nc9g5tRVNpE01vej9pSEWolBm7gniaT6d+lY3GM9fJl+8dgE6KQxIH/o
	4mqkeC8xO2/KhxC6YNLbTMZZNIjXDxwmFRtIGhxzXQ9DDxUfWxJgUai1ffs1j9O3wd5X80iBe3k
	1zFm6WhI+Xz9A3sho3+zrp8dmlLlNR0b3A1k8FSyWlGw2jwm2Bc9WIMemJBq7laQCgs4kjIT097
	Htq2lYmxRZav++JbAHTSnwg5DnvhdzdgC3yUqSpfS7fGIva849yenYNWG9yyYSjmi/GmyqcNsoj
	ntI4/4K9tXBwMej0z9rN7pYGb2Ux+/Bx8mAIjPGmpH5SPUTjg6mRR+lN5NlERDfYWQeSTboNEUT
	w==
X-Received: by 2002:a05:6820:2017:b0:694:a2c9:2d50 with SMTP id 006d021491bc7-69c9c07d4fbmr5938765eaf.59.1778960110874;
        Sat, 16 May 2026 12:35:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b36d:bd18:7c02:29e2? ([2600:8803:e7e4:500:b36d:bd18:7c02:29e2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d048b3c51sm3071760eaf.11.2026.05.16.12.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:35:09 -0700 (PDT)
Message-ID: <2f74e76e-b066-40ac-9cb4-c75137c9825d@baylibre.com>
Date: Sat, 16 May 2026 14:35:09 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: dac: Add AD5529R DAC driver support
To: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Janani Sunil <jan.sun97@gmail.com>
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260508-ad5529r-driver-v2-2-e315441685d7@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 6:55 AM, Janani Sunil wrote:
> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> 

...

> +#define AD5529R_DAC_CHANNEL(chan, bits) {			\
> +	.type = IIO_VOLTAGE,					\
> +	.indexed = 1,						\
> +	.output = 1,						\
> +	.channel = (chan),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
> +			      BIT(IIO_CHAN_INFO_SCALE),		\
> +	.scan_type = {						\

> +		.sign = 'u',					\

This field has a new name `.format`.

> +		.realbits = (bits),				\
> +		.storagebits = 16,				\
> +	},							\
> +}
> +static struct regmap *ad5529r_get_regmap(struct ad5529r_state *st, unsigned int reg)
> +{
> +	if (reg <= AD5529R_8BIT_REG_MAX)
> +		return st->regmap_8bit;
> +
> +	return st->regmap_16bit;
> +}

Another way we have done this is make custom read/write functions for the
regmap itself so that we don't have to have two regmaps.

> +
> +static int ad5529r_debugfs_reg_read(struct ad5529r_state *st, unsigned int reg,
> +				    unsigned int *val)
> +{
> +	return regmap_read(ad5529r_get_regmap(st, reg), reg, val);
> +}
> +
> +static int ad5529r_debugfs_reg_write(struct ad5529r_state *st, unsigned int reg,
> +				     unsigned int val)
> +{
> +	return regmap_write(ad5529r_get_regmap(st, reg), reg, val);
> +}

Would be more logical to move these closer to the struct that
references them.

(I snipped a bunch of functions here)

> +
> +static int ad5529r_reg_access(struct iio_dev *indio_dev,
> +			      unsigned int reg,
> +			      unsigned int writeval,
> +			      unsigned int *readval)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +
> +	if (!readval)

Might as well swap these and avoid the !.

> +		return ad5529r_debugfs_reg_write(st, reg, writeval);
> +
> +	return ad5529r_debugfs_reg_read(st, reg, readval);
> +}
> +
