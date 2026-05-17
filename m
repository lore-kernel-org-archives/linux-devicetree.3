Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BB33987
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779019002; cv=none; b=q0k9qEiir0a/s+sqg+22S9juLwdkNAaONtmyeI05QRfCwrImJh/lQt58v20BJpA9Vb6n+P4G34aTDMySZfydpfJMia1pWxnLwQjv9+ciJkuxiY/zTHUqLpnsSNQxDeeX4yIoGfghVcLqefyytfUmiZ2ZHtrn3c/4+6rTEGlviMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779019002; c=relaxed/simple;
	bh=VbJz2Rn0gIHJEUY5GaHXSAxyzbQ5cDZUdYtk1FxkzKI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP/+e1P0g5kACXvFyNtw9qKuoSfU200PL/dXWDM9o8Fep3KjosTo+88c3Oo1EkDlWfbkMwQ5Pk1ZArDjpSh8fC0Y1hvOq9OebXd3AwV2oQAwtiw0p/fCpc3QHAb8cOEJ3ySp9Yrk53GLC8f+IpSI9WZomyZvvVNa98tDyA7WTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7KlqRdP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7KlqRdP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso12074985e9.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779019000; x=1779623800; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k5XGPivfu4oRNtdf2/WneQ1IlRuetqttJw7Rt30LkRY=;
        b=s7KlqRdPG7Q5e2qFkdfdWSY0iO0UEuM+8hhRxkk9lTxrYW3zfgqYGZaSH3ytGLqmFt
         jLymDUB1qUxaN1bQZ8fq92ZEcP3/fYKTmsioJ+p7PlwjCVpJD+MNcNXDbt6lBbxQGfMk
         3HFCJtsuBeFThHYGruqG9hn4U99WtvyP8cwsxNI6mScsv1E8D1Y0guMdNtVs383Wuf0R
         /wy8LIhwKfROsfiLO8ihvIVNAk1/9jyp1hAfVHOlYX0Sil4Nc38nYLmYvPbuBibieKeS
         ZGrNfjGHHaMudoCJkY7yZqfZ6HG0Szx2ebnz3FSMtgTUsdOi/UbQ1hD9GIMthw05M3dm
         eUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779019000; x=1779623800;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5XGPivfu4oRNtdf2/WneQ1IlRuetqttJw7Rt30LkRY=;
        b=V8khSZOq20GtV2/JZC7s8fZDclxUDyfBeq+jGUYhhbLJal6eCMcFeAbZrEBRthh2rk
         tmUq3Vbmjb+Yf3lIgi2pzpobR+GcR1oyE8/BFnuEkPtfJsQgc+9oCF/v9ySbeyZaxuk6
         zM8AEyrnqwEj5wCizqrwYESVN/n2RSivQ196qT+NSe6AbvGVXgWleb3PfPcbOhecmvao
         8IWaaW+POTfDVsIFbLpRPEzXcMChzwQtQYvtPAZ+zwsO0A8xnEkzPP4FMBx1XawtsjfL
         NXQXnqoLhixhAEwiIOti/ejpqCzYkSQGDxFsA/gL2niRUF5XNVvsAF7jsKR7VDJ3jpnU
         S09g==
X-Forwarded-Encrypted: i=1; AFNElJ/y6cRtfPQ2CTqJ+K5LN8SIqVrmpXDZBP/TRuZ6pgx0iD6jKcocs260ugvLZxY3f/hzxGZfs2gRD/Ul@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ELBvursUbhvVbIKnKa9rOiC7dHfHrA5hSRAE/p183GJq6Yz3
	ycv/GNBQX9ouUUhpWJ/5GACKFdD0Agey0AmtGiuU9op2cpCAXEGN1Rx9
X-Gm-Gg: Acq92OFwITfCpILBZEPFOoFjioxPFXqu+hJF4/24kplEy76XbfWs+3CKKTQIAfHdItU
	41CLsAm3OB7EnrgDjrtsR3V29Hco+nf01xCGgw+D8JETL03Em8RHuoux/0CM1A30tFAJuLvFCpo
	ZhK4BkFigqsy44toSsGrQabTklnkGDHGNiAAHhvEPW0iUpZfMZUkgQ9limsGOrMFxGqa0FCt9fU
	iD0kO/MgVb3LDhBKqH63owNCfIJO4LR41DmMJjTsf7Y/bRpa6Am3TcYDTcUjeMn0Vl4C8FUcjU4
	cjReKd6jnhJNCtPwTeUsgGN7AcWuzWn2ct/prPrkdn1oz8nbK3Epkw/0qGv3kS4CTkGIQfRrHSg
	WZ6IP2rN4i2zwwd218rapGi48Zn8CuF6/JuERWTIYwHoipXiiC+LiAxba8FC0Ta8GFmJG85R6dE
	4e5qaHFj7Bxp7heidccygHJvofsPEaswrQ7h8r0R0D/Luhkg9hlpFRa7A/mRoQTU7RWDWDenhJI
	APb7HvwTT1vYdIm6ivmMX7B2tdGgHMDQYR+4QUK+eSXF8l0Zg==
X-Received: by 2002:a05:600c:528c:b0:48f:d612:3c6e with SMTP id 5b1f17b1804b1-48fe60de745mr157045145e9.2.1779018999404;
        Sun, 17 May 2026 04:56:39 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm56214765e9.17.2026.05.17.04.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:56:38 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 12:56:32 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v13 08/12] iio: frequency: adf41513: driver implementation
Message-ID: <4ptk56iotvgsmb3wv6gr3o2luihkzv4plir2eis73fkq5wq2og@3lwlke6subs6>
References: <20260517-adf41513-iio-driver-v13-0-bb6e134a360f@analog.com>
 <20260517-adf41513-iio-driver-v13-8-bb6e134a360f@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517-adf41513-iio-driver-v13-8-bb6e134a360f@analog.com>

On 26/05/17 10:14AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> The driver is based on existing PLL drivers in the IIO subsystem and
> implements the following key features:
> 
> - Integer-N and fractional-N (fixed/variable modulus) synthesis modes;
> - High-resolution frequency calculations using microhertz (µHz) precision
>   to handle sub-Hz resolution across multi-GHz frequency ranges;
> - IIO debugfs interface for direct register access;
> - FW property parsing from devicetree including charge pump settings and
>   reference path configuration;
> - Power management support with suspend/resume callbacks;
> - Lock detect GPIO monitoring.

Sashiko's feed back at:
https://sashiko.dev/#/patchset/20260517-adf41513-iio-driver-v13-0-bb6e134a360f%40analog.com?part=8

...

> +static int adf41513_calc_pfd_frequency(struct adf41513_state *st,
> +				       struct adf41513_pll_settings *result,
> +				       u64 fpfd_limit_uhz)
> +{
> +	result->ref_div2 = st->data.ref_div2_en;
> +	result->ref_doubler = st->data.ref_doubler_en;
> +
> +	if (st->data.ref_doubler_en &&
> +	    st->ref_freq_hz > ADF41513_MAX_REF_FREQ_DOUBLER_HZ) {
> +		result->ref_doubler = 0;
> +		dev_warn(&st->spi->dev, "Disabling ref doubler due to high reference frequency\n");

	Will this cause kernel log spam if an application frequently changes the
	frequency? Since ref_doubler_en and ref_freq_hz are constant after probe,
	could we validate this once during initialization or use dev_warn_once()
	here?

Indeed, will move this check to parse_fw() 

> +	}

...

> +static int adf41513_calc_variable_mod(struct adf41513_state *st,
> +				      struct adf41513_pll_settings *result)
> +{
> +	u64 freq_error_uhz, mod2;
> +	u32 frac1, frac2;
> +	u32 int_val = div64_u64_rem(result->target_frequency_uhz,
> +				    result->pfd_frequency_uhz, &freq_error_uhz);
> +
> +	if (st->chip_info->has_prescaler_8_9 && int_val >= ADF41513_MIN_INT_FRAC_8_9 &&
> +	    int_val <= ADF41513_MAX_INT_8_9)
> +		result->prescaler = 1;
> +	else if (int_val >= ADF41513_MIN_INT_FRAC_4_5 && int_val <= ADF41513_MAX_INT_4_5)
> +		result->prescaler = 0;
> +	else
> +		return -ERANGE;
> +
> +	/* calculate required mod2 based on target resolution / 2 */
> +	mod2 = DIV64_U64_ROUND_CLOSEST(result->pfd_frequency_uhz << 1,
> +				       st->data.freq_resolution_uhz * ADF41513_FIXED_MODULUS);
> +	/* ensure mod2 is at least 2 for meaningful operation */
> +	mod2 = clamp(mod2, 2, ADF41513_MAX_MOD2);
> +
> +	/* calculate frac1 and frac2 */
> +	frac1 = mul_u64_u64_div_u64(freq_error_uhz, ADF41513_FIXED_MODULUS,
> +				    result->pfd_frequency_uhz);
> +	freq_error_uhz -= mul_u64_u32_div(result->pfd_frequency_uhz, frac1,
> +					  ADF41513_FIXED_MODULUS);
> +	frac2 = mul_u64_u64_div_u64(freq_error_uhz, mod2 * ADF41513_FIXED_MODULUS,
> +				    result->pfd_frequency_uhz);

	Can this calculation result in a frac2 value that exceeds mod2? 
	Because mul_u64_u32_div() truncates the remainder during the integer
	division, the subtracted value might be smaller than the exact mathematical
	contribution of frac1. This leaves freq_error_uhz artificially larger than
	its theoretical bound. 
	When frac2 is computed by multiplying this enlarged error by
	(mod2 * ADF41513_FIXED_MODULUS), couldn't the result exceed mod2? If
	the hardware requires frac2 < mod2, should we cap frac2 or handle the
	remainder differently?

will replace to:

	/* calculate frac1 and frac2 */
	frac1 = mul_u64_u64_div_u64(freq_error_uhz, ADF41513_FIXED_MODULUS,                                                                                                                                                                           
	            result->pfd_frequency_uhz);                                                                                                                                                                                         
	frac2 = mul_u64_u64_div_u64(freq_error_uhz, mod2 * ADF41513_FIXED_MODULUS,                                                                                                                                                                    
	            result->pfd_frequency_uhz) - (u64)frac1 * mod2;

which would remove the possible error introduced by freq_error_uhz -= mul_u64_u32_div().   

> +
> +	/* integer part */
> +	result->actual_frequency_uhz = (u64)int_val * result->pfd_frequency_uhz;

...

-- 
Kind regards,

Rodrigo Alencar
