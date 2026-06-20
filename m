Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF9397332
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781972069; cv=none; b=olpBpX5RvTDH5kMv8HSeJ1u8eiqt0BEegtMB0gxwDkeL+h7Qkdte+rHDtp5b4nonvThowOiAWqGrOuanMqm8JP6SIFJF5qY0aqoLGsiIcTO/WbIFOeOBHbySYFgPcoEsSRFThG+7BR5vzvGD0jlvB/yjXr2vx4KK7RQtvpq/DVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781972069; c=relaxed/simple;
	bh=VDtfdO15TmSPd1YLF4tUzPuukTeoidBLVzbiod0dE00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxBccJiuLSaT3QqhQQmjtyBuNwrrhd65TVbhDgACDgBeDYG5Iib+XO7fzTp0MJj6tkg05crtZMl5A/FL0Cnz3sl8P5gn3C41bVRT64ZoN1TE712pGAhQaiIi4DrAbgHGHCMnA1c2rMwkZ2mxj0AR8irbZuA0KVvlSD9i3rQZNBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SDZ03XKK; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SDZ03XKK"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e615efd7d7so2684024a34.2
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781972066; x=1782576866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stc9e+NuTJE390Jhi5x3KXowpSGWUhAucrUQzkG/9Rw=;
        b=SDZ03XKKcfO/O04ALEvwuwqdEXBk+jOYzB89SvCsht9gA8SKqn76eNznYPuWM4UQbJ
         sPA1oVDRrMymwuWIsCR4E+AIVr+EGwifiaZCwZFx8YpmMNKYO0IG+aCy/qHEB833nZzo
         eJfr+/V1Zj/mant2RCEaorgygEt5xZAJSj0DA9Ile3Jmur91kTpwB795LdEgF+wUG0/R
         LmXPG0i+GucraZPzGmP1CNvP74FsDFiYk1j8HWlt4t6Ks4f1uwt1Zehbb9BCAN7ZK6op
         RTaoxpwfwIU/SWgDm3WRyOJI87Ep24Xc9kkI1OBr6l2hoUs7SzmAggbeHUL4ASsuNkap
         RZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781972066; x=1782576866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stc9e+NuTJE390Jhi5x3KXowpSGWUhAucrUQzkG/9Rw=;
        b=b7B19Jya4G0RnLuEjOzSPsBrK3Aa+VosvOwKt/PG0+I5zS969PpGvxDpeGPjrhvtnc
         DPGwubdb03JIFtQAI1xVdUKyChZulpQkHC99+WTeR/Ivk8g3I6HMglvRdt3lUaCNBH41
         uH5yCOWty8JszeZfomS91Yu8npjFgqGC62ov2k8ShJGoY3nhh7spE3yDdqdpPW2DFPZm
         hGd82ITo+sJhzpgU9jlIfv9bT1nARYUGx+Gsa3TNOcwN46solzj09Gyq0K/X2woxaEvN
         5gELxEpSYAQk3Wg+3DgHkFQwwM2xuQHMJqFoHIeAtgoKLCoIsd3+n/6XZZyjPHnszGXb
         CJpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2rO0zAlBw0VTaHZ749JKvTln6qwG5PXm9IRxIW8/oYA+Yry1OxmQli6QmRaXzbGtC6f/3ZU3Mqi8V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgn1lIyRfraw0mXWAhnaZ6jtwNJQQh6es8/p7GnJrVghFpo2rH
	aTYKjtXu6OzYq4bnn8s/50R5UMbdlk62BlnQ3YBjO2fHUjd13QnzhXm+mwE5aiq33E8=
X-Gm-Gg: AfdE7clH20Mf+sUmF8G9Aoli24Yu+qAE+ECf51zkvSDZnMiu2pjDrOJGXBJpFgXlMqR
	jb5+Z/GyLqFJa87xKT6AWnlCw+0llj2rjAhBz2WylsnSjqI7JP3kincyNM1uvnnPNpRcEk6GVo0
	9EBGBHsytSEZqXESzZ1LeKk3ff/3BS/5h5jIKgHaO5BoCAM1essDb2M27KX6gxvHpoF/g0MBwkh
	j9JWvKoE8xU1ePzto/sk80lYszVu0D73NvtjiuVa3rnFdB5zZ7NqPCNKptlRS290SqGyCff/6Qc
	QQYLyIOKoQ8cJcJ9yO3okKnGfSqbHJaFEDEG7BKBny8thQHg9FoF6trPYOshcxpRgG75iB84E4v
	ageHneD5zLaG8ZHCSBCh3nkedGhMpSKs9lMGE4sVtBTngE9ojqJJc7gRAv7fRyAi3z1dXSLAoJE
	fLzfQPI/e0DWj0KvUiav8eIbDexIS+F5BrDDZoFYu++asd7yMncOYolfL0oBrR3oU=
X-Received: by 2002:a05:6830:3749:b0:7de:84b5:88e3 with SMTP id 46e09a7af769-7e92d879fdfmr6842830a34.8.1781972065809;
        Sat, 20 Jun 2026 09:14:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3ad0:4082:8242:2d72? ([2600:8803:e7e4:500:3ad0:4082:8242:2d72])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94424c93fsm2202181a34.14.2026.06.20.09.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 09:14:25 -0700 (PDT)
Message-ID: <d2e4e716-da13-48aa-8a71-155ed90e593a@baylibre.com>
Date: Sat, 20 Jun 2026 11:14:24 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] iio: dac: ad5686: add ldac gpio
To: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20260616-ad5686-new-features-v3-0-f829fb7e9262@analog.com>
 <20260616-ad5686-new-features-v3-7-f829fb7e9262@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260616-ad5686-new-features-v3-7-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 3:21 AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> If wired LDAC, should be held low when unused (pin is active-low), which

Would better match the implementation if this said "asserted" instead of
"held low" (code says GPIOD_OUT_HIGH which should be read as "asserted").

> allows for synchronous DAC updates. This will be used to update all the
> channels at the same time when adding buffer support.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/dac/ad5686.c | 6 ++++++
>  drivers/iio/dac/ad5686.h | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index a48acedff51c..73105c197964 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
> @@ -12,6 +12,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
> @@ -515,6 +516,11 @@ int ad5686_probe(struct device *dev,
>  		return dev_err_probe(dev, PTR_ERR(rstc),
>  				     "Failed to get reset control\n");
>  
> +	st->ldac_gpio = devm_gpiod_get_optional(dev, "ldac", GPIOD_OUT_HIGH);
> +	if (IS_ERR(st->ldac_gpio))
> +		return dev_err_probe(dev, PTR_ERR(st->ldac_gpio),
> +				     "Failed to get LDAC GPIO\n");
> +
>  	reset_control_assert(rstc);
>  	fsleep(1); /* reset pulse: comfortably bigger than the spec */
>  	reset_control_deassert(rstc);
> diff --git a/drivers/iio/dac/ad5686.h b/drivers/iio/dac/ad5686.h
> index a06fe7d89305..f3110410d89b 100644
> --- a/drivers/iio/dac/ad5686.h
> +++ b/drivers/iio/dac/ad5686.h
> @@ -60,6 +60,7 @@ enum ad5686_regmap_type {
>  	AD5686_REGMAP,
>  };
>  
> +struct gpio_desc;
>  struct ad5686_state;
>  
>  /**
> @@ -119,6 +120,7 @@ extern const struct ad5686_chip_info ad5679r_chip_info;
>   * @dev:		device instance
>   * @chip_info:		chip model specific constants, available modes etc
>   * @ops:		bus specific operations
> + * @ldac_gpio:		LDAC pin GPIO descriptor
>   * @vref_mv:		actual reference voltage used
>   * @pwr_down_mask:	power down mask
>   * @pwr_down_mode:	current power down mode
> @@ -131,6 +133,7 @@ struct ad5686_state {
>  	struct device			*dev;
>  	const struct ad5686_chip_info	*chip_info;
>  	const struct ad5686_bus_ops	*ops;
> +	struct gpio_desc		*ldac_gpio;
>  	unsigned short			vref_mv;
>  	unsigned int			pwr_down_mask;
>  	unsigned int			pwr_down_mode;
> 

