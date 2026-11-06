Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984429;
	b=znzstl6VxEkz9QNHTRJ51NrHVrwXjPDBcWIZrMSJtmO2xlHhiXN0cG89AZfnNrpAeC33
	 ddkDw60ImIp3ByptvjeUDx318WCle68sAJIFaSb0EkxzW+lmgwGT+1ta43f7OEfKJyDeF
	 o+B8DIAYukFdj3D+VoQO4fvH+ACTrDtyquffBu6Ghc+gjmObDl2SZLpYAjo3FUKMr+eM1
	 /s8aI+2gnYrnaLaWomWyg2ElHei3OYlE3jYsnzOQ+E3BX1vwrx8nR44HbhF8W+opGxtW8
	 Qo1ypt4fDYp4DOKToxL3VhuOT7hq07iTXEaKsDBqnsRKUB7+tOvytoBS7418lZ606iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
	b=i+9mOfshzViyeI5KdBBV5aSjGr6/+BKA0LsYO+/ZrC56f3GXrPtbfB9G43fVIEQnDu7a
	 Jf8GEaTN82+Z/mmaWuoo1TnXkucD1S7o81Wi3PGfvyN/5POACWo+AJ1N2EaUciNqsZwG3
	 c5jrhMT8fLDUahHJy14YuVLQhqIq/89pV4lmZISmkRQ3NeERVSOJH23DrAf+BzVJmaZ20
	 ce+XvrDVkqhjx64sYAUrpXjRp2A2ptcHgadAW83ZhAOSDAQpjbUk9P6pq6HpMgTytnlFL
	 Hnqe/gQV5jmUEDTaMY701k4VLHWgEJCtSZxNjEJH+VsJj5LJxRlIb2kt4oSC/vEBOow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFF606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FFF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso430731f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984427; x=1794589227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=MRPFEpLMHBiOhevWNNFBWNmChmSf9amwu9QOajBFX+0euSNnRYDCXlICEjk/SuLhs3
         NFK0ucD7IEzaiwwvD/bsceRIiiqnY2kquXNffVws1stKsQzqZ3CtCWQqiRg6VfazVwMH
         ZNe7sPwfjBakP8bL4YWXAoqj3lCYXv8+ZMeAXUkp9uLUyfCO8Akh8ZnLtaN0Ldj/lXkx
         AktNUSoS9425652OCNe6JlohitzRbL/4fjeLLtVREhFVQmMl4je7LqUdfd6QoMD/tkJt
         bHuQeK3c0DbcoU7MjsDywS6xGrfQzh2PVe/OlIWsbjmVaqUtOXi2v4/2NukMjJwKW6Ch
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984427; x=1794589227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=nCHmVBOfdLVTLUfCxILhgJmkGH8kfCuq7T1H7dX8WQ1ZMxUXsrrAJF9No5aiDBD1HY
         eVgEMZVVTYUj5O44xc0x9GJRASZHQMI7nuHyyrfdG8EGgX9twOPMAiRZrfOwASND5ix+
         XKQBW75VfqixMUBwKWHCLsgSdj2O0T6lgFO+i+3cVfl9I9lzH/1SLKgXm/Dke8rH0NkZ
         /Vtx2wh/dqzEvvp0PyWk07iZMXKdew5s+o3kCputYEhiaxIFVMgbCNR4fuUw8hBbKvG3
         jQRjURcERP0bfuGke2Rk3lIoGywi0qdnwdTemkc1W37bOviyD8a8kjDGEOUbOihzKomm
         2P/g==
X-Forwarded-Encrypted: i=1; AL+hErHluZuuDkUFyQ6RQ0nSyUHI8B+BBNGxqIWWwkor83n/DbjLDWApX2kYrBo/fWoJhngSMprGjqRhM0L5@vger.kernel.org
X-Gm-Message-State: APuU4Z+vtxXM6N09ncg7owUWLnhEBLh8311mBfE0+In8mUt793rVQaSP
	9nSlxLSaAgiDqFUyAM1ufGG9/5DShBQX3OOXZA+pOruH1OCAgoTWPRhoOtQqNzlT6b4=
X-Gm-Gg: AYBFou1AeBnTWiKUDm9LmcZrEbwL4z1fff/4puRPsvaMcvKr2tKUfQk/XTuk28zfFnb
	XNAXasvdtsVutn4WHJ1BnjgyuV9NID0VFo52q/Axgk3Tc4+x8OXwOuE9EeuM4ELkhGPe52JKSNZ
	aNydMni3MyXdF45aXyi9GO059oznF7Rh/nCUhmAoTcJc2G/cNIWlaYkJA/l6AqleGjDgKU9HI1X
	gc3LgAedvr6Y7BINXf0dbrAkf5mZksPrJhl5+aLC8PAGighHiam0VP6a7SmJsmFiHmw0QoNJ9zN
	R9qGcAx4KvK1yAIOaX74eh/BX52ao6oxviEnjFM66sthKIu/y2S5+TJkTCm0t1giWKlEAOKniWg
	kZtpODYpx65RgME4eHzlNUhF5MknoMFivihQdRVwQTh8Ut0bSluvys6WiFTn8OYIh23XFuBWo6Z
	b9+wIahAGoLtSPZf6UjPH6uLQCAr4Cw4jguF/kxGPLdZ4H57BsLndKcdS0XSWUjRKYH9xjSqzQU
	K1QbA9gCfbCcbowq4mDaXqpXM16pfdHaabo5K+y5bPrRbkFld/rFs5ie1IJHE2O23upnU/f9hbQ
	OvLu3nVLW5tFlbZM86JTVcMa4Ig/4tjjkA==
X-Received: by 2002:a05:6000:41c2:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-492c53e3120mr4511725f8f.49.1793984426953;
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d8472969sm4866752f8f.58.2026.11.06.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
Message-ID: <au4Hc7LAXH-ujDPj@monoceros>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="t4rhlzyxszxfhcxv"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>


--t4rhlzyxszxfhcxv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:21:01AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> +static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
> +	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
> +	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
> +	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
> +	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
> +	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
> +	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
> +	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
> +	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
> +	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
> +	{ /* sentinel */ },

Please drop the trailing , after the list terminator.

> +};
> +
> +static struct platform_driver sf19a2890_periphcrm_driver = {
> +	.probe	= sf19a2890_periphcrm_probe,
> +	.driver = {
> +		.name		= "sf19a2890-periph-crm",
> +		.of_match_table	= sf19a2890_periphcrm_dt_ids,
> +	},
> +};
> +builtin_platform_driver(sf19a2890_periphcrm_driver);

--t4rhlzyxszxfhcxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB6YACgkQj4D7WH0S
/k7+kQf7Bfwba+pB8VQAImJsoI9nkvjYio2wmtjnDf+tDu84xWgQjB1NbQpNvz5V
3y7UDyK2deoH4CY8KBCBTRT7cDaxITXkF1a0HhwFJjQzDdqTdHEY4A8Y2+kwtaFE
XtG+i/38jjNC4FlZcl5XsIWsdXDJdmBVAQKyUIcufiTuxj7l++dfH+kC6Ex1M06H
ScbOsMnUQvQkOWUgbwbEI3sNWya0aIIYp10+UtnzXQTaMbZhUSviiwshdzpvF+We
ph8X0cK0eb1Xzob0dAIaL/GXyoeOmriWS7iJsLMed0+8cgUxySH9/PS2BUvFBWRt
gsqT7bKiL8d2E9MAbWotEFMpAA8JNw==
=PDSn
-----END PGP SIGNATURE-----

--t4rhlzyxszxfhcxv--
