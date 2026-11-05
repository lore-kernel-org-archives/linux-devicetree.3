Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890042;
	b=WZcsuWRVrPNuM5p+8Q/fGhBIvUXOAYt5zLcp98MTaOaoweTX/m2p37ZvSqd7nLFILc5K
	 mRGii6NjIuHV8mph4X0ctChd6FvT7DbDDhPPjmT3U8HjCjvygt4C1Ci4lzY5RjCg7bGXC
	 uosilxrJc6ibPYc0QxEMHd3SoxcuJDUr1X9RG9sYz4LKinlFU/QfbCJvFwdLPbvyPp+p5
	 oIdcgfDaOfC0Awv6GZ3gLetzA68HQbKFkZ5lWBjfRsvFFvNySBQxj4CUCEZEoLmc1HoUv
	 ZWBh68y7qxuZCUiGJyq+SPDjJ1DQ3LPzg2V4jx3Dnr7bugZnaeiZszTVunwvu85ERDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
	b=5hjEhoySnPWqHxuFLNNZDfGATLbEaXhlMoXSznM6GqROJIKpIWS0Lb3tuSExv/vMIsmi
	 stcF25HTSlnJD5HK6A+q/nFNP+6aPAZ0sAH8uNuxBRwGnFUnVqFnsJASJoBluovmKOlGE
	 5sdXXntpfeSnT23utP3wl7ZR9idn9R1Dxy5B32vsN933BOYHot2fGF62Ga7MJbATZgnEX
	 2YXbclOEseT5Oyn3qTJ4tnjhHgEYFqzIMQQNDa6fuUjbmxJm61LSBmIHI/mmrYvgrviCz
	 zQRlHSOQ7gmlBrEV+j7ZmsSxqppEMnS9mX67wO+2tWZ/+cCfWsQlPC4JEgQDN57w2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9EA606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9EA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18414715e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793890039; x=1794494839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=h41ijo8VLcdthRc+9RgmvYx5NsDst/AzLIN0l3Rh3PfJaoqgNrfZ7zT2ggC+7lc2kI
         ulT7MbshSrv49Xb5yr+Pch5PAkH0NCtKrPwmJWCokIuuvMfmhEHq9E0R5eCGTcKY961y
         HWm0H//LKYNhJ17tsnxjo2GgUSIAmgFLif7rtAfz5XgU6RY0YnmPbv099YuF4GSseCJi
         DCQ0b2oQEMYtnwVE72KyQZ2bY72UDOxriGGd7OWIwF2ydRTeV3k5ERrR9NKkSmuvT5K9
         RVW0/iAF69WrD8RYuNDgiU4vbm/+J/ta9DFrKDcRjRPoYUDCQ/DfNsmtIudR+h3dpxr0
         5Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890039; x=1794494839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=vwSmht6ncrWKldK8AJo2IX2ga8kTkkdSWyvBStS7hDHx+EcowBURMg6zmA8U8x6g8L
         B2QoPVaR0zoZKeQymHZxLZv+nyKZ2md/8oW288Q+8/AXf8IFlDOyAscvBdQNwPlojmqz
         MVWAMbouIGp9fkjpGT+Q9X1dmWmJ/s5oro55z8YQuYfjznNHBoFSBrEsO8/e4Pwtb4Pl
         zly2glOjiw++gpDEzI9G6wyIepqN0f47FC196LhJpyOHuiewGJKkHztr5XkW1W6aw+Th
         Vw4eziRJBjhVjTtHG3PcQIPoOXYtqexnNxh/VZ2EUtQnm592W1WveQjxx7WAO3HSjk7j
         J53Q==
X-Forwarded-Encrypted: i=1; AKwUvBxI+aEAOPx7BxhugkhPhXAyr3Ip4hczw9TB8IkhDTgHxOTEAidxGBRWDr04E7vZo5FWc0BC995gXC1g@vger.kernel.org
X-Gm-Message-State: APuU4Z91EuJxdkJ0UNICKZq/tzG8+RR1YBNZkE76q/PGMJRXjYxEe++4
	q4St6B8o01C5ptdlcIxTdbT1qW8LZg3YKj+Rj9Zb9Xr5QSpAhvq77f0JQf0TbanXgSk=
X-Gm-Gg: AYBFou17MWcmgNXT0f9c+m47txzM/zII2aVIruO7DoW2uVW98Jhbz3mmv0sayWJsx4j
	FQzzxHWwN18XhYofUqPuqR7p9buVJeFqk3aLnpHr9CBc9wrxOpusZvW9w+9Sbd+utdRqXfEPHAe
	DY6J39/oLWb5eVrNg8p+revQzgSop7jo4M7HLNxJaufm5OI1fyFCDg3KtRKdugBj04dj6UPk9QH
	eimv3KP7hWTv9PF3eASavs5hbd6Mx1r4YgYAa4ALdsHHDFIyHhO7xnpxajFmPp5fnWlDAnqNGEV
	/Syi5L2l5f4VEqBCEf9IPj/y95Kx8z/89Lm1RGFuJy+Ia/ZShvL4w2YIzNJYAMKke/qxSKSLWrk
	MyNVTIi523xjiSzeXETFKsONgkCgVsVrpTBA91d8HJQQNHbgTKKGUWYb2/XiqXiFt4sFUSMPrPH
	6SiEWuHrU+/hQgpJlzoifrbjOtXQ2IqKHurxTDn/gWe26UDi8iOK9D9w8lDWE5WY6jyDYvBMfwn
	hMQ7o/pflYD+gbwZQIIObKLYbZ4drYwYnWjHUIKccJhCwOisyoNY97+9s4E/TgnRzzW5MoyuQTr
	69B7DjScScOBLTievNFFNoAHM83iWF6bmYCsfUnvKd3AIrgwmxk2428=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr460893955e9.19.1793890039475;
        Thu, 05 Nov 2026 06:47:19 -0800 (PST)
Received: from localhost (p50915710.dip0.t-ipconnect.de. [80.145.87.16])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56eb4da1esm115774655e9.6.2026.11.05.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:18 -0800 (PST)
Date: Thu, 5 Nov 2026 15:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Message-ID: <auyL6UF8WWwXsXrS@monoceros>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mag5oduzqhp4hkyd"
Content-Disposition: inline
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>


--mag5oduzqhp4hkyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
MIME-Version: 1.0

Hello Linus,

On Sun, Nov 01, 2026 at 11:14:36PM +0100, Linus Walleij wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id. Alternatively
if you insist on full iwyu, include <linux/device-id/of.h> instead.

<linux/mod_devicetable.h> pulls in many definitions that are unused in
this driver and thus introduces unneeded build dependencies.

The same applies to several other patches in this series.

Best regards
Uwe

--mag5oduzqhp4hkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsle0ACgkQj4D7WH0S
/k4ILwgAu4/aIJ4jmqqXgp8ctE1FUWAaormLaedGkha0tPWWUWZFCWXzzflrAPQp
x3SQdXc7pbe9QPylO/FE1FtFum1V1mELFB8lRrsWaexQxDdOJtfgg9sa2EtNyzON
d0vLNNlqRg+eDysFNiyOOcwYa8AN9IWbE+14HBuzIKAdtfixCwirKoJ07ZKtQEsb
FghiifffoIz93iEIJWklhWkMmMWHCyo7KwUjlW+YCncCdVnLfqR8fbdBo+58IcXx
2dgAHS38lq0GpaZqg7vx8x/QrRgOxOqj6KgK724ffND0DJzxlFGTTLCkDD4AgELB
fCGGyZ3gyhvkLj7YEXBO+Gb9upim6w==
=fVHs
-----END PGP SIGNATURE-----

--mag5oduzqhp4hkyd--
