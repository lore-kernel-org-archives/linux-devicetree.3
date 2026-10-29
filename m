Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272828;
	b=ZJ7MrRDclqtxJymosFWbtU89/60C6L99+GzTKcGuYGkdhdmkJoeqGxn6YAMxLusa1wAl
	 BkGStvTkUv9GvJdXmOldWp0Wt22oBpNRKfomMF3+rr03JxybqSg6vsIeMdrcyH7Iw1zrh
	 PP7cOzix64a8OE10Fl26ozmaRVzNbfpEP9umLoGNC1t7bfPPrHikB75E4/IqisJ6mxHe5
	 c19qcr3c3M+DGZoFQOjWKITMpMAmHfzZkONewBnbZIy2F2RRqBP6iQ5yByVNuACHCJC9f
	 8pEBspOEKmUoq9VOg6X8VLiq7RiZZzmsJmqyxR33sP7QVLKtDu9d1BKBtp2WUf1MEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
	b=Uul7PTen58XKSjnoP5OO0RY6RdCDnyMZlk5ke+MlgpQuLgz3mliC2b0cNjEKPh7o47xI
	 98E2lTK0VDgC8yGYFwofeibhTPnqvsO1PBzVSMGHEl6w2eXsAlJZMInnt0MREgQaLc+3n
	 BLYQOBzmp0ANt3ocIn33JgWZ5l+D6aOrYXNE17ulgHeNiCwz1vSlX5XaKsMjaRW4u15Br
	 6SwsKaVt48OAjFEa/NUVplUOAPX+7UvchjaHAn4Ti7e68lpvfRHU0b10vZxYkzxG+Cf90
	 tRgzOaNX4VxYxATXxnK+l7Zs5A+lQEZnJ5IwSwKpk6sWNb7YPp/72C9mzQ5EWGj2PTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf0+jnlU;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA943606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA943606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf0+jnlU
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8283205e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272826; x=1793877626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
        b=Pf0+jnlUONlj2VAi35lQK+uRzr7kbgX9ldnEV/NSIsg+SKnM5FqDBuIuB6exfW+74k
         vgsUqhpIQNrGDXg8WrHq6j48D750X8T2xOSL/XjZTr4/vK4BHI9DRrf8qHZSNOzPEQg0
         UNqDM0fIHvJxfMzKPG9ol9ZyUr4FvqNkLA+nURZmEju0xBMkz2bKcMRIdzc10y3Owg8q
         20MZ55dtmpbIsO6kqIHqc9jcQ1zP4mqKfI1cI+fzQ/L0yiMD31GPXO/ZXuAoDvt3f9kO
         d0aPAJchToVRAO2hN61RNxAbJg6GO8sMn/wHHpQtstkNaG1RiAvNcRBUeBzMdH1dOweD
         T/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272826; x=1793877626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWr1SxRoSXUpgXKKNJoVMyu+qAI3Q0fzstEAk/1G7Uk=;
        b=PjSb4HR6yRq9rWLT/aY4Po2w6EqyjTa4HIHA/dQmiV2mWpXAK3cBvF5cvcgAY6E3e4
         yfHEe+H9/sNR2RqgyuYKGAAKhL5bfjiI+kzFPMT1M2DJYx8YsVAdIqZGLlirIfk3QUjc
         Lc1i7wuKRVMyw/EF7C6kRWLScqJSgaj3IErHlvMMVqkaH06q+FHo0L+Ov6fZvl2b5H2x
         NpsGTBhXPojx8raOtwcXh8fna6oYWFHNHEnC+sEX1rqCc7MLFzX4jZgRDCqYYCf4aNeV
         mTh/azHuj5WdRZ2tSmZ5swCvx9aS9/uoSWDnvjSt+KNYt5iDGs55ut+kNSRdLKGRBO0Z
         R4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+rgAg4jsNwKvWq/mKtvo2nME1QPAOvXUosFZqb4qbkyp/Ke+W/8SALRv59lO5Coe6taiuziP2N8xA@vger.kernel.org
X-Gm-Message-State: AFq9FYJoDCDOjYcHsIS9qthDgIuS8okIrvaxr0ZnmzmJvRGRYk+AgFO4
	XOIDWC2sLcr0G3s+3d8s7JZJoIhsjF+JnqDx0EXP5KvFmkHOiThr2M65
X-Gm-Gg: AYBFou1LFZmYBQhtdkE/4L4hHWjk22C4CZF/poV2AOUSh/gaamLROGvwfn9fjgQjLxf
	GTi7PUK+MHN04jCiXcwyaWHDWqPEVJRPh8pmWwHpQjtSOkzmXFmZ6e0sxGLkzLoWyeB4UoQkAzT
	XRlmraUh5ZoeHDpPPKg5gW0R5zpxRde1A2jOptx3q1oZGY1vI5oV/qMFNWFY58xJyR5lB3hSIEN
	pG3s0h5iuMDvqhwanZ/149a9ROzYJYet9mbrgiZdeP+Xce/8+p2itSHoKsgexFPOrjSjOwUEQiC
	1GZlRL5cPvhfC6gY1yNw6V0f3qhV94lqalxvfy5Z544QFRpDq4Zd2HbKV6eUhY/7WRSz7dtv9Yn
	8Hjnkq8MajhugbSweZMYKQsdhyHZs2LrUA2DiG0egxxDAEzOfmr7JzDfRaPD7Y8LGom3HM+g/un
	GoKUo74IzV/HkAYOEh0XCSFa4bqHe2bupuI/4bT6fumUok/QVLgAwZCBY6sO+2FQettu/j8cUQb
	2hmtMvVS4JlBM68FKFY04dLDehdUOmilzCsV5TSfdUjKW8WTKOqGVn7qsXPv6aaSwjjnPsIQHmN
	2LThk0aZZKAUOzQg/IIcSXV80oNXuZqfMLWLzGXQ2Csfw0A=
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr54740705e9.16.1793272826044;
        Thu, 29 Oct 2026 04:20:26 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm15790305e9.12.2026.10.29.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:20:25 -0700 (PDT)
Message-ID: <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
Date: Thu, 29 Oct 2026 12:20:24 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
To: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Shi Hao <i.shihao.999@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261029074851.216029-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 8:48 AM, Chang Yu wrote:
> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> 
> The AS7343 is a 14-channel spectral sensor featuring 11 visible
> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> flicker detection channel.
> 
> The driver exposes 12 spectral channels (11 visible light and 1
> near-infrared) via sysfs. Runtime PM is implemented to stop
> measurements and enter SLEEP state when the device is suspended
> or torn down.
> 
> Future patches will add configurable gain and integration time,
> interrupt support, buffered reads, VIS channel, and flicker
> detection.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>


[snip]

> +		/* Check for digital saturation. */
> +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
> +			/*
> +			 * Per the datasheet, ASTATUS is self-clearing: writing
> +			 * the value back clears the entire register.
> +			 */
> +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);


isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
only and ASAT_STATUS clears on access, so the write shouldn't be needed.
it also covers analog saturation, not only digital

> +			return ret ? ret : -EIO;

-EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
wouldn't that fit better?

		if (status & AS7343_ASTATUS_ASAT_STATUS)
			return -EOVERFLOW;

-- 
cheers,
jose a. p-a
