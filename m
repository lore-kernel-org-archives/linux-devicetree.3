Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551961;
	b=Yavm8rQ3WM+w8Yq7uXA4hKg49IMpf81WrNItwGBZD2T60tH2YsbozpROt/QtBVba915g
	 KwMCMs+EBDsdRol96SintjLW7J7BsrYWwYJpOh0hCTF48hda4CGLlbXcEL+FyK56eIIw9
	 SiOyqj2hy31FMr+Vx/HGx0f1LLFFKy1YaP7mCuioznT+YjDwZmByXC6cH1xhrepHG6hdi
	 0ldp3imz83lAbjMedentLYxaR4DojjEx53pik4XJ75Fy6cUAqJuB715u8QU+tnnuJSXO5
	 Gnofs3HOsmTLI5lvmfBlCi/bK49Xg7vcMccDAQlI4UKpADGk89tqlld8CP0/iIK/CbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
	b=hJuSijDPqE3rJ7Xua0IwG2iLzz46tKfxCxXS7cHNgG1B+EF1ympXfVim/vFPgPT//Ja3
	 98aHW8JM1dXdNehdd7VB19QHlAZXRcnJRcuHp701toVVWT+xiwjWm5e1X+AAZai8hfoJ5
	 Or+qQuKhehqGLHKXt1OECuUWEqKLrDLmjzvvHXkHSIYCM5eER03kdtlZobAJUVEugv38W
	 cx78JqRuIjW0PzO/4vF+8tsIiKMuzfUUowu8eTcL3qTQokUjofJqpeYTHPAsgQguDQs6T
	 eiBWWrV0IiP7RN00o5hNTStBk6DTZg9PA2fLmV7UVwgmBLGoLkWzZkEhewwFxYxmhsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZjagDXF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF634606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF634606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZjagDXF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3938195e9.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551959; x=1795156759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
        b=EZjagDXFCK0Lo7oDVmBW7cCcjuCk8KiSMHEydT/OlW8HQAD9HiP/sZ4CU7ohuoGLfr
         QkfMqAucR9MAv/tDzZCLc8MYXF7BZamqo+8spP4P+QZnOHR2gR5RYC/ujaCRkjQcFB0I
         gYuLaSGsSnwI2oervcbwErgkqd2v+6vyjGSVXv0txkhVC3BUq3D6MyCBcjmU0LsWI7mk
         r0zNwasI9g6yncFSdbs+7hzh2L9O3N2u/gis5qnQOChwAxfJjlK+mxu52KVzJAObVuMk
         SA5ae+tCgmAelr++YsRnu2zv79byx93dzB1hYoEM0dv2XVJmV+N1WubJCaViWnE1GoRb
         /qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551959; x=1795156759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
        b=lNYxjkHUlcWWr86WhULG2DI9pcdO/xagPxW5Yu/AG1UMFms6AMmq2+k1GqCkpGczGg
         urlJR1y1RCifFUG9HEyZrTQrU4zrT/MgcroYvD8v8tU/EJJCH9T87B0FCs+8S7I6Nf6V
         JZbclfayLSzEJTD650cnRCLm2F6l9+gGqTLqPwslI3y5S6AdZIaKfq4Duf0Lb7LW9xzW
         I5bpNcOm1FjSh9MAYaNWcaQpV2W/YKGskFwo1m/KAUE9ez1fmJ/r+B2tRu+mZ7kM4vOF
         xC0Iok/3VRaN7RlDd+H+/yEwIAtyPkaonGRsruQwDuNvvCS9KG+CVKGH2zUov9lgFsm5
         iqIw==
X-Forwarded-Encrypted: i=1; AL+hErFzFokA78oRXNIA48ARUCuSSZ8QTl5XbcsqBR9P7IsFUJbkG68H/Dbs0sslh9HIYZSzzyDjTiEHfsdf@vger.kernel.org
X-Gm-Message-State: APuU4Z+OG2K0g4YZHWLaessLvbKzSpDc6WdRbD1xB7ZW2+pyWej3Q1VA
	CzyM6KWXHcE5Lq1HUZqCsCRnJD5DRNnWuWd9/VVMD1zzSdOdFLCG8Pk61N4fkbGsGPQ=
X-Gm-Gg: AYBFou3w/IxApVRr7N+RREZ0OHL5ic2vYyKlr9/tH8tZm9WBXnsUF0W7f5zduoxlK6N
	I5pHlKaIRlUJtL1x9vGKW76Zbld/hT6p80hA7AFWWzBlga38Xc5xGX9GdbnQgiWv5nBCaY5yHG2
	nC66fSPdaH340wFN1lr08zrN68ESuJVv/BunQQNXcG7GSws/L6lJhU4OQ4R42/75ghSZ2lKrDcQ
	BI9SX0PJqdaUNg7Ap4qn6/uFbUbQW5oRXtgMiDdY6K6pDo5t244Tx7CK/2ZBVmV6FqGYbmHRbdN
	k5PUa6rG9m3niOORY81eqetCXaHTokx1nb/g6BAaShBiRgbCnC/Bvg8Q/nwz4k1AXDI6y/ldoZZ
	/SedblR2fkxigifUdHSKsFIk6QrrDw7M5AwFJcC/2e7fUe7/gB2v931g2J7jclOeYEG0D0B7bdF
	+OMny51bRq4ja3YCg5sIvOTJnGMl+9reQUREsPbWaEUvSiiwW0GWR1IXpx6T0J8aa7p1sD/Y80a
	5gx7bV4nLPG2V5uQn7LLWn0PJBMKQbUjD4NjGDHOqglKj+B1h9jdAN1/M0HQzSpfLz/aSgWw8tK
	AO8BRRpkn259qYFrR6/kap+BVKk1Q4Awion2egqhvTN9ooO47RuQ509q
X-Received: by 2002:a05:600c:c105:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4bb55a66006mr23009675e9.7.1794551959351;
        Thu, 12 Nov 2026 22:39:19 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e294420sm121574605e9.9.2026.11.12.22.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:39:18 -0800 (PST)
Date: Fri, 13 Nov 2026 07:39:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: korryasdlerto@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
 driver
Message-ID: <avawPqDGPEYPWTEg@monoceros>
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>
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
	protocol="application/pgp-signature"; boundary="2r6ji5mtzotwcfxp"
Content-Disposition: inline
In-Reply-To: <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>


--2r6ji5mtzotwcfxp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
 driver
MIME-Version: 1.0

Hello,

On Wed, Nov 11, 2026 at 05:35:00PM +0200, Asdlerto Korry via B4 Relay wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides of_device_id and
<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies. So please drop the latter.

> +static const struct of_device_id sm5714_fg_of_match[] = {
> +	{ .compatible = "siliconmitus,sm5714-fuelgauge" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sm5714_fg_of_match);
> +
> +static struct i2c_driver sm5714_fg_driver = {
> +	.driver = {
> +		.name = "sm5714-fuelgauge",
> +		.of_match_table = sm5714_fg_of_match,
> +	},
> +	.probe = sm5714_fg_probe,
> +};
> +module_i2c_driver(sm5714_fg_driver);

Don't you need an i2c_device_id table, too?

Best regards
Uwe

--2r6ji5mtzotwcfxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2sJAACgkQj4D7WH0S
/k5y8gf/bVX1KSrZP9ZVVaVPusWdsCZBWZ+d4JVqPpF6oSNJa2Q6ZDZ/OOo2nKxA
a0dM4DiFeiMba5iq/37djbjc8Rtubmpul2v7hZbj4p+OQ59Lopm/9e79YCjrwisZ
SRdXQ6vG9oelZv+uR2YGT94QVjqw4Fq+Cd0VuqlhqL25l9rkhuNWkEWSwfRPpnzp
voMo8iSpMRRg/Ty0xDT9z4iZPH2UG5jxKJ4seN1PLOfOZt3pYo+9Bh97hjZtIR1j
R79pD+VSw+OP7i+LbFRMwcZ9PHPqSrHZB+av72B+gMfP+GBItgYp4seVLJceH2pl
FZfM1hdZ+icIbbO7MFyIhJRCKJ0amw==
=+err
-----END PGP SIGNATURE-----

--2r6ji5mtzotwcfxp--
