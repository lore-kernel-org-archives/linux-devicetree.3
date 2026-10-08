Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340B31B131
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475609; cv=none; b=GiQbyBTyRNfDyzFGe13/55cSFaW2q9Y87va+0H0XBoerEnGNCScflAynPjaFxMmcJZh10MHK4zJR/kXfQTgUUnR5XdbtDBjbWDr9uonpSqrKhNxocN2fxBD7Xl+g02l2aaToBUzy8y3umJ4Yd3zYW9nPMBeqlrOhVQ51+ozvXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475609; c=relaxed/simple;
	bh=DkKYwkLrZ5lmwHqBRfrjciTEUqKftXvSj8zeAtQHINQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W8AgwHFcmzHeqWeDD0r7QQXnEqRlOK11xKJR5qS7M5cEcuQyEjio4SMdKVDU7/TlgSJyvaKlXD6sHfWzOXPIqjl36ddP1+ZhU5fHjGZ1Cl562O0hcvdhdLj53PTbsdx5482fJ2DVWTWVJei+Us1FXrFn1hKHEvlL+orSDpmZRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F30OahbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F30OahbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8761F000FF;
	Thu,  8 Oct 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791475608;
	bh=xTB5z6woDQG8vL5tlR/0dBDltshNidGWPj3b4yRc+jU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F30OahbSa34s8968VKqzGTGy0rqBGl6XHQOTCji9M1RZ1zEw1u8Yb8v9obL1y2LTx
	 GfTI381T8usf2kkyvkHxO25iputOLZ682jZIaxpVSWhaprywXGSkeWfM+DwAhgTeYl
	 FAB0PTtaJaTH+EB6ExcOpWT4xY7p4nUoniRNM6DBUmHRDpW+Lrqou8ocRVOBUdWXFx
	 tqohdz9NFaVypCxeqKwDJCOomnww1i6mgrr/MeVj6d2hKC0AlFBXqX63UUh+28M80d
	 hqAqnnp5rz9EQVBCwNZMsKss91L4kHPLZbJPYKd1/K9qkSj5eQt4NaCyhY52eLwPAI
	 +LrVGnQAsKKVQ==
Message-ID: <sashiko-outbox-164366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: histb: add voltage regulator driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008155727.3801095-3-mmyangfl@gmail.com>
References: <20261008155727.3801095-1-mmyangfl@gmail.com>
 <20261008155727.3801095-3-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 16:06:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] regulator: histb: set_voltage may apply voltage exceeding max_uV c=
onstraint
--

commit 800fca6de780a18cd0c58b4d9fc8681fea0944fb
Author: David Yang <mmyangfl@gmail.com>

regulator: histb: add voltage regulator driver
   =20
Add a driver for the voltage rails on HiSilicon STB SoCs which are
controlled by the PMOC block through a PWM signal, as described by the
hisilicon,histb-volt binding.

> diff --git a/drivers/regulator/histb-regulator.c b/drivers/regulator/hist=
b-regulator.c
> new file mode 100644
> index 0000000000000..77073a646e493
> --- /dev/null
> +++ b/drivers/regulator/histb-regulator.c

[ ... ]

> +static int histb_regulator_set_voltage(struct regulator_dev *rdev, int m=
in_uV,
> +				       int max_uV, unsigned int *selector)
> +{
> +	struct histb_regulator *priv =3D rdev_get_drvdata(rdev);
> +	unsigned int duty;
> +	u32 val;
> +
> +	if (min_uV >=3D priv->max_uV)
> +		duty =3D 0;
> +	else if (min_uV <=3D priv->min_uV)
> +		duty =3D HISTB_PWM_PERIOD;
> +	else
> +		/* rounding down keeps the output at or above the request */
> +		duty =3D DIV_ROUND_DOWN_ULL((u64)(priv->max_uV - min_uV) *
> +					  HISTB_PWM_PERIOD,
> +					  priv->max_uV - priv->min_uV);
> +
> +	val =3D FIELD_PREP(HISTB_DUTY, duty + 1) |
> +	      FIELD_PREP(HISTB_PERIOD, HISTB_PWM_PERIOD + 1);
> +	writel_relaxed(val, priv->base);
> +
> +	return 0;

[Severity: High]
Could this rounding logic result in applying an output voltage that exceeds
the max_uV limit?

Because a smaller duty cycle yields a higher physical voltage, rounding down
the duty cycle ensures the output voltage is at or above min_uV. However,
if the exact requested voltage range does not perfectly align with one of
the 240 PWM steps, the resulting physical voltage might exceed the strict
max_uV constraint requested by the consumer.

Should the driver verify if the achieved physical voltage violates max_uV
and return -EINVAL here instead of applying the setting and unconditionally
returning success?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008155727.3801=
095-1-mmyangfl@gmail.com?part=3D2
