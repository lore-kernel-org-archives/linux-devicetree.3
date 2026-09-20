Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30D2EEE79
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912986; cv=none; b=axy4tKomy2U1hngLM1dBsq1u7kK4jbD3yy+GlRMIGI7BIy3RPtt7DywlFEkuatZ0czzCq1HvUaFYE58y73Z83Nq+ueDANkJwYO2Zb6B0EyXlnHjbZtVQ42nmL7c1ORNaS8ZEBKk492gwZ+5ks2cAe+P7WxsKNUvUl1cvrznc7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912986; c=relaxed/simple;
	bh=KBEWERMKVz+kidmKpZBAbGJ4UDpVNu5XhVT7ZOFCQzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVg4I1n4HHtBclcFncy/W5TPpuLLE256wdZwTwM5/oeykfQMMSsGbUCLHZlVWtWLwZ/MUimMscQ4qcDUUUOZMbuo7U2s+pDu91bXmZfX34ZZ1jvBiV2uCcRgmXNE5ssz9e4U2QpyktewOKFQ8pNiaRcrMPIQ1rXhsjwO1KgJIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0rxR4ge; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0rxR4ge"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so612636e0c.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912978; x=1790517778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGOBrazGO1SbR4ysdjTYnrXtGS2lZGrR+BRy6J/y9+M=;
        b=p0rxR4geQgJyn1lcoOzcm42MinZN/j2Cjba1iZqi1giy2HYHWUNZNvEjL8nxMf4Bjv
         3QZ1Da8Q3uS4qiYPBctPCew5XU26KXUjh2Cr4mJ4SdaWglEYvHW7p0suOEf9N4rQegUf
         6DCawZO1QbBWPhiZt/2ElFI8PQYmgeWFzHG+doCXWDecIGWzVN3pdTPCHM7MuXfsNR9i
         kkwXGIt3gQZSw2mX8QC2KqOnAl/cgai1AiuoSy5EudVAU8mb2GNMKyCaEJ3qQgtmr/MQ
         T7QXgCpjCG342pMqTNJ/J8Vea43JqlCQEFOM9KrueY7lD7lyjZY9EnIuff7SDYXTz5yX
         V1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912978; x=1790517778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGOBrazGO1SbR4ysdjTYnrXtGS2lZGrR+BRy6J/y9+M=;
        b=eZoKIdH/BKqZoJBuSHGqVNjHAT/wLhYaaTZtQ84T0F/kkRpvg5kzHOC0WfcTClcVS9
         kLqVbS/sSKdHHwF7lPeo6q4757WsoUHBVNVY5hPCtHBegfNmu9d3wRKy2tCOUKUVXhM0
         80+QyY5njoM/WSacdGuca1oFWug8Ypuqb3TRTej95diZ4IM/N6F6XpDTzFJ1e6zrm2Sm
         Jjd3EUqEeNTLEtp121vFA57w+L7xmCdwrWMECzqF3Wk/A7oUPF4qyxvPZ6MpwID6WiDi
         WDHoCSZhl1ZK419ScKcd+JANkEp1kso04E1mD/p+F6+BMbjee2q+tu+GEY2J6dOa9C3U
         Cycg==
X-Forwarded-Encrypted: i=1; AKwUvBwG1rwalzVMjOADlsUxXXu72t5IdlPnVlM9uLfMhiqYVDxLzaC3Ek0aco4rjCkO8HvtTr10g5dC61np@vger.kernel.org
X-Gm-Message-State: AFuF++nvLmSsjnwOhBqnTwVwotss89bGJZU6gHzbePHoCYkj1wea9kSH
	5mdDuhEww8X5q9Xch2WV8cZ9Fn5LwJufRt2YpO3v1okEGljZ7VjMllQx
X-Gm-Gg: AYBFou1mWV+pYWby5fqPmVcy927s55g0ui/yxjhjxjw/Kgg0LWOWjBFLmF6mKK3BV1i
	GBHeUFb4Fk7puO0dDzsCyEkGA6dc64DUErXnTEMupitJ/Xj3oxSLfgGOKEBCQpZzdXSTnNuDx6z
	IdN0qIIIpujlT5RDARd1XwJPX+owZKt+nZ3BznrHobBtH77l//1TjPyRqaZsZztMR+UMnLPtQt7
	hUtcquknvoAzsEEy6WDeVLg6QL7Zw4mEvOQ2UwF1uUJrYTqGQR/6mRy9sLeNw/jvbTtzH9mRxpB
	X5+sy/ishR638JuM9vNaFLM2CjdO4BGRq0/FYxf8INrj8hRIE/+Uy/skiUZk9KVrY8ANmT0MDSC
	Rn6qTOZJaXCnCILR0+8gPoRjAnnlq4CEkw5jv6YwffXNF5wBKTbjsCHPjdx5TkfI6aGd9+Jl4pI
	iFfBpSPYw7CjQKe4ShzPE5cPbhBIMnatBtKydzKQbdt1+d0fP3VteLEz1yO2icA0R1eI3vgTYmX
	KuGol7TcQu1uZI=
X-Received: by 2002:a05:6122:3291:b0:5c9:a617:580c with SMTP id 71dfb90a1353d-5c9b8b29d50mr3290274e0c.9.1789912969770;
        Sun, 20 Sep 2026 07:02:49 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c198f790sm4743292e0c.18.2026.09.20.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:02:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 11:03:55 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] iio: imu: inv_icm42607: Add support for
 ICM-42370-P
Message-ID: <aq_nyxWauKzWQwFC@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-inv_icm42370p-v4-3-fd9373f123c9@axis.com>

Hello Kanak, just a couple minor suggestions to this one.

On 09/17, Kanak Shilledar wrote:
> Add support for the Invensense ICM-42370-P MEMS MotionTracking 3-axis
> accelerometer with built-in temperature sensor. This device is almost
> identical to the existing Invensense ICM-42607-P IMU, but lacks
> gyroscope. The device supports I2C, SPI and I3C, implement only I2C
> support.

The device supports I2C, SPI and I3C, though, only I2C support is currently
being implemented.

Would sound a bit more natural.

> Provide basic support for raw sensor reads via sysfs. There is
> also a built-in temperature sensor but it can not be turned off similar
> to the ICM-42607. Return with `dev_err_probe()` when WHO_AM_I read
> fails.
> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
...
>  	/* Warn, but don't fail. */
>  	if (val != st->hw->whoami)
> @@ -630,15 +648,20 @@ int inv_icm42607_core_probe(struct regmap *regmap,
>  	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
>  
> -	/* Initialize IIO device for Accel */
> +	/*
> +	 * Invensense, ICM42607 and ICM42607P both have accelerometer
> +	 * and gyroscope functionality. Whereas, Invensense, ICM42370
> +	 * has only accelerometer.
> +	 */
I would specify ICM42370P (with 'P') here. Since there is ICM42607 and ICM42607P,
it wouldn't be surprising if ICM42370 (different from ICM42370P) eventually
shows up.

>  	st->indio_accel = inv_icm42607_accel_init(st);
>  	if (IS_ERR(st->indio_accel))
>  		return PTR_ERR(st->indio_accel);
>  
