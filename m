Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3422E8DEA
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783783375; cv=none; b=dPqL5xvEUflUjuClzTldiKq0XYargMe5wmhN5gh5Y22+RlpLoRrQ9kwZtuC1WmQguhzXCTUSqSuMoblfESn11+J4bYHUbb/xpx5M96BMTmvwItpbmZb6c2n3SrIZWIZUQBTySJccUnAa6Zx85V7F1qgqSaAjgYxqNsfd9KyCGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783783375; c=relaxed/simple;
	bh=cyISK+85Dz541Qqs0If42ibLezlTMoZfbi29ufY26+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbN4xck9KwU27FEe7wngpzWy9GaLdLMNjGUZLDJRSkcjiYpK78txISAQKG25OGaZRsgQzv3pdaakJ5sW0QCVZx0zqPYFSHNVDj8h8mLaSJ6CYCNXorj5FFkAZ8aZTVET/SyOBgB+iaLf1V6Y0b3F/f0b0yxJ2ZX9V4iptt/1JQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MhoM3U/I; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MhoM3U/I"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a1888969ddso1130256eaf.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783783371; x=1784388171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQgvAx06dSlqRMJAhcTe3Z4aoWlaS6qUI00wrJ9Xoq8=;
        b=MhoM3U/IzuZwbWRXMHaESKT/BfhxNnv5SVSMwk5BPx0Vh4jrvbfqx0uJJQLLlH2AwH
         f8nfBAeLOqmOTdk01giiOWSCY8X/XpEcW+6gipKvQA0kpZs7wFffgAzE3wvpL8HDfFyL
         0TzPL5z+/xzNlPtpAwu3OnjYWrD82vzLaiq+g+2EAF7nSVZXT1gYMr/MEWWo5igQTLsa
         iV7jsSUp7W5iJEFn2RGByUjy4IejvEUUVdgwaAJuZg50ulu0tNtKtLtreYk1fHR10gbb
         r4UxH7gShfp3GHN/U6gQWa4X7WId0LLVMdnyYmO8FMHfDHYg5rTOptPmXDMfNBvZ0Tbw
         bkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783783371; x=1784388171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgvAx06dSlqRMJAhcTe3Z4aoWlaS6qUI00wrJ9Xoq8=;
        b=Jb0NjLz3d//uTSsDssM0Q14O9WaKRO9gbeH5rNImafUwVjolC7bhj6Iya9E+/QFBhn
         W60KI6lKPK3ba7CRySjMrpwbH9cnEWz0hORjgbb0samLvn8kaWpxGmh44PimGN2zNiVX
         ikl8UG6HlVYeZyeGV4iDcP6lHY595DP/Zl7+2qQJuJaMzj4IU8SULvWvRClI+/eq5o3O
         QDSOA2sP6FaF24gzpdY++da4goTq/jJhkOxape9VXQPNc4hzmSZqnwofF0WJES34cvWZ
         mQubCCqqfjSGui8P2AaiS1Gcm+Yb1xDIzSTLW/zGAt54VVkMROuKCbieN9YmXYds5KDD
         0pwg==
X-Forwarded-Encrypted: i=1; AFNElJ/W1q+LOj1Bw4Jf7pA4LhJHbiws1sZ2SbOc3DaAUrx6T9EAXVSEssqbY7k6XLnSHNicOU3CX4nV3fid@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JQA5cXVkeiWLDLR58Dis6MRZNgq+NA5Zma1vxTHO3WMjBbcF
	h/XbsOPFOyX0AR1rfgJOHUYzYUiZC3hnwvAUlBimgntexvZlDy/xY1aabQW8yJytndY=
X-Gm-Gg: AfdE7clfRw820miQDGPgk2Z1gVGQBFmg3n+XaNW5OzHug33yAIYZr+I3y7+iDbenywF
	3mXK6VryJBlguIHqEdPttgbrnwlf0DXBKI13YzHPYapI2I3TPeIYwgDNFUmd/PD5PVci1AVOYDE
	qSfw0Hap6EoVW5FJqWCA9H61P9R24QH1YTHeDO0PGjE7Ou91RZlyUx6G2iKW8wxjxaz9tuP7tMH
	QCbiZYuv0ROt1fGz1VxMGm7K65XzXbuNH9ESrzAYuXahF2IpShAvi48mWyJlp+s0OOPY2hfh0cG
	q6EnaWc5g/G9v8ujhUFczQu7Eg1B8KEBIMI/Ijvh5MkB1q2GFpXhS6MwWI+6glhTrvDoQu0HSz+
	d2Yb4seaCaP6N7KXPIlNPTku/uHBPpxzNRU7qyWDCY3sKJtsfr9DRXUmXIYPDHdLYQiA04bFRV9
	uGpmfO1dgsrfRhL4orVVy8QI8HYFLOwdNQeiffHDbVEvlRkJ+RYgkZS8vQBMAQXZ4=
X-Received: by 2002:a05:6820:4de5:b0:6a3:7b7e:ee6c with SMTP id 006d021491bc7-6a39a6d19b7mr1803639eaf.40.1783783370923;
        Sat, 11 Jul 2026 08:22:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae20782sm9133072a34.4.2026.07.11.08.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:22:49 -0700 (PDT)
Message-ID: <a5c58557-8289-4cd8-85bd-3349e410392d@baylibre.com>
Date: Sat, 11 Jul 2026 10:22:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] iio: dac: ad5686: add gain control support
To: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
 <20260710-ad5686-new-features-v7-7-1bcc8c280e4d@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710-ad5686-new-features-v7-7-1bcc8c280e4d@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/26 6:20 AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Most of the supported devices rely on a GAIN pin to control a 2x
> multiplier applied to the output voltage. Other devices, e.g. the
> single-channel ones, provides a gain control through a bit field in
> the control register. Some designs might have the GAIN pin hardwired
> to VDD/VLOGIC or GND, which would have no "gain-gpios" device property,
> being able to set "adi,range-double" if it is hardwired to VDD. The
> vref_mv field is moved down in the struct ad5686_state, so that the
> overall size increase is reduced.
> 

...

> @@ -217,6 +229,82 @@ static int ad5686_write_raw(struct iio_dev *indio_dev,
>  
>  		return ad5686_write(st, AD5686_CMD_WRITE_INPUT_N_UPDATE_N,
>  				    chan->address, val << chan->scan_type.shift);
> +	case IIO_CHAN_INFO_SCALE:
> +		if (val == st->scale_avail[0] && val2 == st->scale_avail[1])
> +			double_scale = false;
> +		else if (val == st->scale_avail[2] && val2 == st->scale_avail[3])
> +			double_scale = true;
> +		else
> +			return -EINVAL;
> +
> +		if (st->double_scale == double_scale)
> +			return 0; /* no change */
> +
> +		if (st->chip_info->regmap_type == AD5686_REGMAP && !st->gain_gpio)

This condition is used a couple of times. It could be nice to just add a
st->pin_strapped_gain field to make it self-documenting and use that instead.

> +			return -EINVAL; /* GAIN pin is board-strapped */
> +
> +		st->double_scale = double_scale;
> +		switch (st->chip_info->regmap_type) {
> +		case AD5310_REGMAP:
> +			ret = ad5310_control_sync(st);
> +			break;
> +		case AD5683_REGMAP:
> +			ret = ad5683_control_sync(st);
> +			break;
> +		case AD5686_REGMAP:
> +			ret = gpiod_set_value_cansleep(st->gain_gpio,
> +						       st->double_scale ? 1 : 0);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +		}
> +		if (ret)
> +			st->double_scale = !double_scale; /* revert on failure */
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
