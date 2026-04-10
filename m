Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA023254A5
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855726; cv=none; b=GJJuGUUHVP7A7HVaUO2Is0zh+AawyhgHqaTiPJ5urQ/cPHJRnCKHIYnzqA0ma0WLq/kp3gYxcwh3Lrk5Wjyg/Tl2EhQxl98+7PFycJMkc6q2chJ8oQGJjmYnBb3kpE4REoh7tbaGqvzCeGmxCWYwecQElIoKw8stcwQpTVxVlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855726; c=relaxed/simple;
	bh=cAXb9CrTpv524+4pOELODw8P3jQqS2XAiSFfzufoL7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5uya2BGrnpzlyXSbCU74rqsmDkQu9lUro/qaX3ghQbQmWGAazBSD80SSBpPSKG6p9JIWwunFhlp22SeIi3xl7N8fmyltgQUuAL/pi1tv+8Geuyn8lDRw2BvAEOxlK7ez6qbA/fSLpb8zSQMguc/VT96R3mqF7itQUUvusRgaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Iq4bgpeP; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Iq4bgpeP"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-68a253b7301so1366058eaf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775855722; x=1776460522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2F93Mx6phIJ7QoLcf5ftd6VaLTce3YAnV6T7zlntoQ=;
        b=Iq4bgpePomKXt6AMMlpaPk9SJk6i/A1tgjOMozgB89M4I78HwLhBvsHC1LHos7KBTN
         hpQ5SoqDc9gLQ6r4JlVk9gTNB0EDMcNQ52ebRjbV7tPVSN7n/7oRDkF23vPhPzRKRDzR
         WnAdhK0JDnro1imOvz2DyaJD00+fhQylcUQIWrwcEDCYt9tx01uQGcBkI0RubUc0HFx9
         YRXnP4SKu3Cn1BKhHX1sPr3PfLl2+b2V1rv9roHxLJ562FK0rvJKZB/K0e1Zvcsmh2uJ
         ij7Ck1Oc+hrE6HUmw+S/ihUc+crUt7sGS6G0KMpccao9YqE6NojZVaQorKVOXQDxd7ov
         Q5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775855722; x=1776460522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2F93Mx6phIJ7QoLcf5ftd6VaLTce3YAnV6T7zlntoQ=;
        b=r9i8VFyADF3ua3vcmCzyLrqmvjIN/tRV92ZY2uM8sfhxKz6PfuZrm9Z2kY9zfBdLF6
         3DaaEaNcw2Dxw2DEaK1nBY/HUqjQc6iP2UrZHAIlx3j6+j2f7Z7p2bxAZxRUMG3nwPAf
         iTrDSxFEpI7JupazjtRbslgRpPW7F+SmMDwZRI7dc5cwZHj3oSNwVVFkTihrp1dB7VZT
         29Kr1BX2irmndqtcNDVpB3ecO1p2HVoO4mhnpP6R9cuyXfBcSSw0qZm7ZDbNlS9+xLNG
         SXqcM2P+ukRMRII4w9SZbFOSKCXvaABzKIvBcpJb6XnuR45lm0uUB37qSBXs66UeLdlE
         c+dg==
X-Forwarded-Encrypted: i=1; AJvYcCWuZQ8Gk3zodGwGtiXmyt33jib9SSEdH6T15JoTQlw1BdWQVFpGIlXo5bxdWtpZ1YiQbDz3xarSKP2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCsLDFNUFTs97YxqrrWy5ttR5SLbZywAc9EN35zEDm8BPn5u2
	b0Bp6JgnBbPRwxWYxZNif0Qz+4Kyy+u7Z06EiRqXUXPZPK9vRqxBZXlYwYU4BEe96z8=
X-Gm-Gg: AeBDievVLAaiHItQkmPL3HFnh044G0tsNgX0ZJnSxIabMWVsbtRu21zwgjwGsmAwgTY
	5uLVwbOuYb4AM7pVfY6LxyuwJOW524exOyadUor/zKe3fwBbAxnAqBqNEPpwBD1fLbP/dJBD1ff
	oESHDNpIlxBfhVPjeHvyRZORk/CwqLVOQHkR9qiY6tEwvXLOYzWSbFqBFY5ked+iCXGEKFqLLrY
	/7NzjyRJj+h/Drb2ZMhpyAVB8XYyyOj53XDgzL6mKE3XldO4y5z94ZRRM0C3CO3Bbc4J34EaV+u
	SckdepmsgoZfMjQmgBhIawGWpAGlND9HHdZaf3KAk0RC107wa5xdW1jC2Czfk32gDwYhvroOp7u
	cFyH8yJg2p8bSMx3ZA21Pgs2VCMHlkSdy5CNFv9cIx9r+uPb6N7Dtla649TTKG1gMC9dJorN661
	iJYeo6xgZHFkRDom73RoS74TyLTQvqP9SCNcjnYa09Y/OahyFJFJZmUeQrhqWZhif8i36lKafk1
	Q==
X-Received: by 2002:a05:6820:822:b0:687:a24d:5ba2 with SMTP id 006d021491bc7-68be8bd89b5mr2314197eaf.55.1775855722351;
        Fri, 10 Apr 2026 14:15:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bc82ea1b7sm1972885eaf.5.2026.04.10.14.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:15:21 -0700 (PDT)
Message-ID: <742b1821-9103-414e-a860-c2e8d5406e35@baylibre.com>
Date: Fri, 10 Apr 2026 16:15:20 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] iio: adc: ad4691: add oversampling support
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-5-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-5-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add per-channel oversampling ratio (OSR) support for CNV burst mode.
> The accumulator depth register (ACC_DEPTH_IN) is programmed with the
> selected OSR at buffer enable time and before each single-shot read.
> 
> Supported OSR values: 1, 2, 4, 8, 16, 32.
> 
> Introduce AD4691_MANUAL_CHANNEL() for manual mode channels, which do
> not expose the oversampling ratio attribute since OSR is not applicable
> in that mode. A separate manual_channels array is added to
> struct ad4691_channel_info and selected at probe time; offload paths
> reuse the same arrays with num_channels capping access before the soft
> timestamp entry.
> 
> The reported sampling frequency accounts for the active OSR:
> effective_freq = oscillator_freq / osr

Technically, the way this is implemented is fine according to IIO ABI
rules. Writing any attribute can cause others to change. It does
introduce a potential pitfall though. Currently, changing the OSR will
change the sampling frequency, so you have to always write oversampling_ratio
first, then write sampling_frequency to get what you asked for. If you want
to change the OSR and keep the same sample rate, you still have to write both
attributes again.

In other drivers, I've implemented it so that the requested sampling frequency
is stored any you always get the closest sampling frequency available based on
the oversampling ratio. This way, it doesn't matter which order you write
the attributes. In that case, the actual periodic trigger source isn't set up
until we actually start sampling.

> 
> OSR defaults to 1 (no accumulation) for all channels.
> 

...

> @@ -499,7 +570,7 @@ static int ad4691_get_sampling_freq(struct ad4691_state *st, int *val)
>  	if (ret)
>  		return ret;
>  
> -	*val = ad4691_osc_freqs_Hz[FIELD_GET(AD4691_OSC_FREQ_MASK, reg_val)];
> +	*val = ad4691_osc_freqs_Hz[FIELD_GET(AD4691_OSC_FREQ_MASK, reg_val)] / osr;

I guess we don't have to worry about fractional values here?

>  	return IIO_VAL_INT;
>  }
>  
> @@ -536,6 +607,11 @@ static int ad4691_read_avail(struct iio_dev *indio_dev,
>  		*type = IIO_VAL_INT;
>  		*length = ARRAY_SIZE(ad4691_osc_freqs_Hz) - start;
>  		return IIO_AVAIL_LIST;
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		*vals = ad4691_oversampling_ratios;
> +		*type = IIO_VAL_INT;
> +		*length = ARRAY_SIZE(ad4691_oversampling_ratios);
> +		return IIO_AVAIL_LIST;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -566,6 +642,11 @@ static int ad4691_single_shot_read(struct iio_dev *indio_dev,
>  	if (ret)
>  		return ret;
>  
> +	ret = regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(chan->channel),
> +			   st->osr[chan->channel]);
> +	if (ret)
> +		return ret;
> +
>  	ret = regmap_read(st->regmap, AD4691_OSC_FREQ_REG, &reg_val);
>  	if (ret)
>  		return ret;
> @@ -575,8 +656,9 @@ static int ad4691_single_shot_read(struct iio_dev *indio_dev,
>  		return ret;
>  
>  	osc_idx = FIELD_GET(AD4691_OSC_FREQ_MASK, reg_val);
> -	/* Wait 2 oscillator periods for the conversion to complete. */
> -	period_us = DIV_ROUND_UP(2UL * USEC_PER_SEC, ad4691_osc_freqs_Hz[osc_idx]);
> +	/* Wait osr oscillator periods for all accumulator samples to complete. */

Why did we need to way 2 before and only 1 now when OSR == 1?

> +	period_us = DIV_ROUND_UP((unsigned long)st->osr[chan->channel] * USEC_PER_SEC,
> +				 ad4691_osc_freqs_Hz[osc_idx]);
