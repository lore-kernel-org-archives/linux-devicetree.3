Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CD19D074
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849167; cv=none; b=rCnrdphx1bz8dHswi4pPRjqBArh49hPdmrnKZNXau0OAxhoml6EYOrUiBdlhqPQsCpDSrwYXkdL5azvLc/083klS6NtKs6mBwbaL0jJq4YWpgF3hi2IIja0oTbPyBlaW78X1dzLtQqIxOEXShhIdJnJkAL3/YHnK3snhDNsMNOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849167; c=relaxed/simple;
	bh=s6wEwwesVR26iVgn/tsSt+twoNPoH8F2NzpaStGjxl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2P3dyihflAQ32tJW+WHwLyFSYXcg3qWauolwjvOTqhBD4RUhUbiof/J9arZ8OSrkuWr2LEPvH3mlbR9XfGJg2AZ9m+e8RM+MoOd9OQ1CYoHqdXdA4Eq7bDM+sJ5S/ISKQL0x6EhOfBgB+/r53zSG2zKoxAQE3ZHp5j1GTKrcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=btaVtpvR; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="btaVtpvR"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d1872504cbso2163183a34.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775849165; x=1776453965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKiBe8rgBpLHxLTkNsa5b/bSw+gXJRM0EijygM+CrR8=;
        b=btaVtpvRxz+asaplnw0u8J0cuCm5irmHOotU9PqcQ7yo+51RhUeCrOyD7Bg0aasLKp
         5ICQm9SuxufAX0ArKH+zesAlQabUvbOKiv56k/mum6wUcluZldlru3gYqNxVjcWNqh2Q
         ygevjbKksPZP4Q0TdALKsAQNz64CQO4EujtCVlEBsmVc3eY54OOFNhgm4P8cEDnQQSzF
         BTGH/eWPP64A7f4OO5vIafl6UwJ8Gx7uaD7IzxeZ+/VhPR6IZATukDr+ald9I+r5HKHH
         I7DliDQCinwG6Sc1geMDsA8bn1bT/tSOu10sR1gWX0zM/HHZIiJhbAJYXCQ2672dNmJa
         5yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775849165; x=1776453965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKiBe8rgBpLHxLTkNsa5b/bSw+gXJRM0EijygM+CrR8=;
        b=XZ9VuupyRu/gOAwqUyv51tMF1Tc/+/TPaM/jAgtajdNn4NkFrTqRturMUCCUVuHOai
         dAprdtqXDOyWRq6Oa7BkWdWjq9TU2Gf/T/ErU24X4RDJ1/pKKNmJPBtBQ424ozmWP4Ma
         pUcG68wltwekM9x/M0GwvrR3tEwtoM17K2QeDJwROimie8qiGa/hzReYTauOvhVj4+aV
         jrTtb0QkvfP1IxbGRiisidhXA0jgOTRre8L6XihqGS3iihYtqCWh0QrPi6bommwk71HL
         QUglA4ejPEiamIhLw8PbNtW1oZX61zc3NkEefO+xTCXD4WkHrpeIVezbYgOaMWQUBaHE
         QfSg==
X-Forwarded-Encrypted: i=1; AJvYcCUXNN2JMgoOzOAbSR5p2Ou3lMVKZvwxMdHkKE/gUsdvrtV02Jnp2zd7KyFSHYcTXi+MZhCPrjLFv7z/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JWc+eV4ThkGpomzV9iPsSJo321pdSaxluHl1srrzVZUIyj/B
	qiB/PMtxmyfGiRiEOqjU2zcxTWlaPd3YaSJYFuGQFPEO+14NY2fjR2YSrR1OJCU7kqM=
X-Gm-Gg: AeBDiesiuZLTBxEyxCdyOZ/G09+YlOsLTNi3kMn2zR+Ksx3PNMwWfjEpW2IudV0SzT5
	jh+/pVZylQaP20XJsaZO07zSFGeTeHilzn5NZngj4KByJ7dlh+zGdsUwUP7k4GP+Ua/aJ+fO3qK
	y0hbdqcrgDY3q8ptwTBael30V7UkmDW2kuGP3vMeMPztKe+FEjVsA0QF8WW16OYr6kFb99no5N2
	/pvUs9hXLkbR26FFPyif1WZAkBmrC6zm81DZF4wnJZkItGGen5DhEXGfQvJP3Ch+D6pHNbGvDcr
	vc7g00lZ8R3FXEjlu5marYdfoiRPLGCP4Ybn2j5SL31X8ypjX1XaLKxgsY8gNYGki/Du48BPI72
	fJBBMcM3xEA9O7yQovhoKn+9X2YsFPpgHDVzkQa3DEXyySFNWIVHifLcrrzGwcYDY7m/fbFj6/1
	X9TwLNFLIPyrdYXV84n66jsxpuMZT+1VMVGL+6zff49ELqg+WgB+Q7SwQ4dH7kEV/PABqHMyGEX
	g==
X-Received: by 2002:a9d:7b4b:0:b0:7db:a297:9e62 with SMTP id 46e09a7af769-7dc17632cfbmr3187099a34.8.1775849164720;
        Fri, 10 Apr 2026 12:26:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc2664157fsm2580273a34.12.2026.04.10.12.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:26:04 -0700 (PDT)
Message-ID: <ac8912f2-3bee-483f-91f1-72c5346792c6@baylibre.com>
Date: Fri, 10 Apr 2026 14:26:03 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add QST QMC5883P magnetometer driver
To: Hardik Phalet <hardik.phalet@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brigham Campbell
 <me@brighamcampbell.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260409210639.3197576-1-hardik.phalet@pm.me>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409210639.3197576-1-hardik.phalet@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/9/26 4:07 PM, Hardik Phalet wrote:

For a series this be, please wait at least a week for more feedback
before submitting the next revision.

> This series adds initial Linux support for the QST QMC5883P, a 3-axis
> anisotropic magneto-resistive (AMR) magnetometer with a 16-bit ADC that
> communicates over I2C. To my knowledge there is no existing upstream
> driver for this device.
> 
> The driver supports:
>   - Raw magnetic field readings on X, Y, and Z axes
>   - Four selectable full-scale ranges (±2 G, ±8 G, ±12 G, ±30 G)
>   - Configurable output data rate (10, 50, 100, 200 Hz)
>   - Configurable oversampling ratio (1, 2, 4, 8)
>   - Configurable downsampling ratio (1, 2, 4, 8) via a custom sysfs

What is the difference between oversampling and downsampling? I think
we have used some filter attribute for downsampling/decimation in some
other drivers so maybe that could be a good fit?

>     attribute
>   - Runtime PM with a 2 s autosuspend delay
>   - System suspend/resume via pm_runtime_force_suspend/resume
> 
> Regmap with an rbtree cache is used throughout. CTRL_1 and CTRL_2
> bit fields are accessed via regmap_field to avoid read-modify-write
> races. The STATUS register is marked precious so regmap never reads
> it speculatively and clears the DRDY/OVFL bits unexpectedly.
> 
> The init sequence on probe is: soft reset → wait 1 ms → deassert
> reset → configure SET/RESET control → apply default ODR/OSR/DSR/RNG
> → enter normal mode. This ordering was determined empirically on
> hardware to produce reliable, non-zero axis readings.
> 
> The driver is placed under drivers/staging/iio/magnetometer/ with a
> TODO file tracking the remaining work before it can graduate:
>   - Triggered buffer support (iio_triggered_buffer_setup)
>   - DRDY interrupt support
>   - Self-test implementation

These are not reasons to have the driver in staging. It is fine
to have a driver that doesn't implement all functionality. We should
be able to add those features without breaking anything.

