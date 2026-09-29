Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248839A047
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695831; cv=none; b=uGWpw7U1f2zKfGkM/MZrFFdlno9LX7+y2dd+l0tSenhXepR6d7magLSxM6dbuzH824lI1AU4kGUQFl1KWGp79vuD7qw0WG1QvgV7lkwrI4zCgsvzcWGf3tCbZHYOUOPtD9afhzHcjLQfdJ5vSRprWAG180dafA7CcOqkCeJTx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695831; c=relaxed/simple;
	bh=F4vwzsAv5drBYD3qzwjgWR2J9+Uw6/OSFUG7o1trW1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHvwzYay8CJs+dFb9PZ+S0Ojarx01OX0XJ7C31hdSKAVxca/1r1T6YbgVkwGsTac82KQmOLPEKM6TxorFOlezLZDveObOP3296oEHX93oVPAosbNq6/slQauKbK15pcCpn5LGzxlZOCVEpGKeDs6HrEmnWLjfB1DH43PeqpHPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ia0fNy+g; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ia0fNy+g"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so2619918f8f.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790695827; x=1791300627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyDJvPwiURiXggZLxrM4rW7PJScAxLcWq9jkvSmb68E=;
        b=Ia0fNy+g9yzZ+Pw523i8UgyZHcJ+BoCzNGcM8SKXNyz8VqVp8cL8U2nn90MKMi3sX3
         mvXM4A5oQq4vj0u4bQMRLkeYL26lxE+//KhGXm4BeFGAjTiFNh4lG9397nCMzyhV795M
         Rdp3/xQ7Q26XD6DtpALRkj1p+ekol8Lmqnbr6poyz6roLgb+JojPWIrhRglcc/EmYAA+
         QdiSFX13YJ+o4mIEj05nZa10a3JGltxd7nk+Sxt6xJeVaikZJlTA0+YY5eDEOQlRLGrQ
         Jvwtm6BzMKEZu9VyBtZaMGQDv/4H3Zxqlo0z3G32qkYZ333vTQ6Y8ZqMaDa5xXpCAslD
         wWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695827; x=1791300627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyDJvPwiURiXggZLxrM4rW7PJScAxLcWq9jkvSmb68E=;
        b=ajYyCEd+Z6J1PRT4EB3RM67ojyArzesC+OZS79fLPDfg3Hq+axXAjw7qIqJPvMZFaz
         jCXMWvcOJ7JHn5hoRG6uvNVst51EV3iPdIJSeEoPgqnYJj9UMFoSQd7u46xV/Tbsvs2X
         Gtb6rN+bfdmWlU3yYm579JipmwnCaaDiRRe/fBhXMCIV3vTAbabREZv1oTre4BtavA02
         kC8JdEj7n4gz8fuGlNkPshbHGBsDKXMtKN0fXJiwhlkLGqi0ZuWdy04AMaZHF44tlkjN
         0VnFT5jw3XloxAjSGxrdHbq8tfMrf7WLmfGkVWc9r0J4vq+vOmq5RRXfWUOTh9p8UnsV
         TsXA==
X-Forwarded-Encrypted: i=1; AKwUvBzh7fXP9qYxMBm2al5+O1Lb/VfMzWfIUlKOp6FtIpS0AHglJPmr/l/DgG9RxOA1cKiDJ0ayR7heOSV3@vger.kernel.org
X-Gm-Message-State: AFq9FYLq/XwQC+hNANOinhc81OQgRgWxxBcCPjqi9V2D/iQPiIimpPNc
	3B89Kw9yQBbOdNHw11I7vB0LNAnfjOwLxqxtAq4fYmggfaVc+Svf8qHT0ldJWpxqWk8=
X-Gm-Gg: AYBFou2iCsKi+eCcdyt7IcgaXm3y76AaGec7hRizM1F26Wpgwto1OJevYgMMZ5L6NiF
	VMbTuOkiQAkftutC+jQXQWlDR+qtkevXb9oC/LxHZ26BLQ/D1dojirLiCxkWxEouYf3nQ9/eh0N
	23eD3E4UtsqFG0sOLAM1LzREo96gvJxU0toNUsPQAhehQetdTKprr5JKaAkrA9UXi2pI+m+HPMH
	Sj1xi92kcNkd16odQdHR13KNnq5+NRpuLfFd9YV50+XNUEYHTSoXhpHQZHUQfzKqgi52I/MHvdr
	NLWJael8j/zNz5IGS7+XU7EkdOhXfZIJwnRzFlZvJovpZJPE0srqLFretl2klM2TnpuYYM+r68H
	46NMV7VEf0Ea6C9qBCEKxT2887weZ9FddA6uXFZyEJ1bSz1Sm3Wb8QDKRJLNkLH0F6p1a28NR3y
	C3titZZLglax/se8sk+HABpknLBUHDiOpxAM7dRb/ggQ70Lgkg/FXB0XJm0gQxdojieSf6786T6
	S4MZ6ZCwiGDAYQgXHn1GL+R/ZZ39G9rAugx946LbD7cPTuQp9j+8q+7AKJ0TDwWF3kveORB
X-Received: by 2002:a5d:6f0d:0:b0:488:8131:c684 with SMTP id ffacd0b85a97d-48af171b851mr6071142f8f.13.1790695827301;
        Tue, 29 Sep 2026 08:30:27 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48af4f88352sm5171032f8f.4.2026.09.29.08.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:30:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:30:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Andy Shevchenko <andy@kernel.org>, Rong Zhang <i@rong.moe>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: Add support for Turris 1.x LEDs
Message-ID: <arvYcW1jFeLtcQD_@monoceros>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
 <20260928111907.72592-3-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gf6rtofzqt35lkym"
Content-Disposition: inline
In-Reply-To: <20260928111907.72592-3-pepe.schlehofer@gmail.com>


--gf6rtofzqt35lkym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] leds: Add support for Turris 1.x LEDs
MIME-Version: 1.0

Hello,

On Mon, Sep 28, 2026 at 01:19:07PM +0200, Josef Schlehofer wrote:
> [...]
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. This is a header that
pulls in a plethora of dependencies on subsystems you don't need in your
driver. So either rely on <linux/platform_device.h> to pull in the
definition of of_device_id (my preferred option) or include
<linux/device-id/of.h> if you want full iwyu.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> [...]
> +static void turris1x_leds_shutdown(struct platform_device *pdev)
> +{
> +	turris1x_leds_reset(platform_get_drvdata(pdev));

Is this needed to ensure a proper shutdown? If not I'd expect this
shouldn't be done.

> +}
> +
> +static const struct of_device_id of_turris1x_leds_match[] = {
> +	{ .compatible = "cznic,turris1x-leds" },
> +	{}

{ } please to match the most common style.

> +};
> +MODULE_DEVICE_TABLE(of, of_turris1x_leds_match);

Best regards
Uwe

--gf6rtofzqt35lkym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72Y4ACgkQj4D7WH0S
/k5KnAgAhZtJJoXqunj2x2oJQnmSxm/PEMoRlwQyPhfFAx2hve16++ANVtEO/Ezs
69fImgBN+zPW4Ueuwzlh+LhhIAlzzkOfP+nfg5lY4m74PrhR2N4QxRCUI9H92e2J
igSY1goMilkzXCBvoCmGtqDK0WlGutBJINqBhj7B0EA+2VSzyLzyKvsF+ODcFlx9
lEisDl45mzbd+KX/WAnRQb8UghxxeIR1N1D/anut+YCU+wEX7Bk8quHAb+xx8QnB
eLG/jzOSdS2MqvwA3W4A7Y+rYmiY09xJcqtGGC7lMGz7lAwZilYy1kFl8FMlCsfs
KJL63mPnhbokMwEmeTCXtnL3QObeMA==
=YuO2
-----END PGP SIGNATURE-----

--gf6rtofzqt35lkym--
