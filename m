Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F5A79B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782656479; cv=none; b=QdhwAsdybqZYlSs6bx8SOD0cb13ajpd5lsKUiaCDb1RuLStLyEXukKETLoBMYIcmXkpjmbhyWnkJ2w6OkXm0/OYYXsrqASQzFGgPyADcIUYMAuAoHK9YffTsVEfaPcR61JiYZHZidCWyDsLmWqEVlLoc1DhbevTYNvRLGl+rD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782656479; c=relaxed/simple;
	bh=8cDq7MVvz5Ueuq3rTk39T63TGyve6Qwvh9wXEtTE8F0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EgjN5h+AIF7p3P4ZPAJTCdfLAIVCqQxmZUyxWLNUs5m8LR2jyh28OiS4D0ZolGmEzymYn4av6/NPvGNpMe6h5RXA7d4X4Qza4P6KN4/+Tm1Gb00HY2Xk5Wx9M/ml8V+rlvU6qqzKW+QCldJe7ELtIJ8mWv00F5lw7gi/H2GCGiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr10B5WQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr10B5WQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2165D1F000E9;
	Sun, 28 Jun 2026 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782656478;
	bh=yPc2d8uf/LJ1ygq6ToQgUh5O6AuACXdtcLmrthIUytg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cr10B5WQiNdMv/5w4ojY8EbFCD7tkxHBG6BcQYOfLpy8YkdQulkXZv2DS1nKD9UXt
	 3NwO7y1QP2F0nQffgpSWWaivRouBaJWqPvru+7C8JW8IbtMblqqLBsmUEEvOfEGwz5
	 x6hjuKbUCOFVUQ+KcSqCtjYSKP6JTBG8HWKZTBrpRO/tjD5jIX+No7DO6CvuoGIjWv
	 bT0r5WefEN77zvZ3HqWSuD2KdGbzBlDzsdmA+gSE+iOJ2O2oj7+MAwmJC8v1CIfwfS
	 ulMejlwiFvkAZkp9iZSuwqsLjJqCiHYpUN6aVQIiYTvs0xQhfEHpugWThjgXMT4sbc
	 5fvpYLeLC3YEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] iio: dac: ad5686: consume optional reset
 signal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260628-ad5686-new-features-v5-6-577caadbf7c0@analog.com>
References: <20260628-ad5686-new-features-v5-0-577caadbf7c0@analog.com>
 <20260628-ad5686-new-features-v5-6-577caadbf7c0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:21:17 +0000
Message-Id: <20260628142118.2165D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The return values of `reset_control_assert()` and `reset_control_d=
eassert()` are ignored.
- [Medium] Missing reset recovery delay after hardware reset deassertion.

Pre-existing issues:
- [High] The driver unconditionally requires the `vdd` and `vlogic` regulat=
ors, breaking probe on older device trees on platforms with full regulator =
constraints.
--

commit a475ccccddaa1769cffb9d807bfd0a081ce1514a
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: consume optional reset signal

Add RESET pin GPIO support through an optional reset control, which is
local to the probe function. A reset pulse is manually generated after
the device is powered up.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index e2ebabca68873..8ad8931a3d7f8 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c

[ ... ]

> @@ -486,6 +488,11 @@ int ad5686_probe(struct device *dev,
>  	st->ops =3D ops;
>  	st->chip_info =3D chip_info;
> =20
> +	rstc =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "Failed to get reset control\n");
> +
>  	ret =3D devm_regulator_get_enable(dev, "vdd");
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");

[Severity: High]
This is a pre-existing issue, but does unconditionally requesting the vdd
supply here break backwards compatibility for older device trees?

If a platform boots with an older device tree that lacks these supplies and
full regulator constraints are applied, the regulator framework might return
-ENODEV and cause ad5686_probe() to abort, breaking probe on older systems.

[ ... ]

> @@ -509,6 +516,11 @@ int ad5686_probe(struct device *dev,
>  	/* 4.5us power-up time: Datasheet Table 4: Timing Characteristics */
>  	fsleep(5);
> =20
> +	/* 1us >> 30ns reset pulse activation time: Datasheet Table 4 */
> +	reset_control_assert(rstc);
> +	fsleep(1);
> +	reset_control_deassert(rstc);

[Severity: High]
Can the return values of reset_control_assert() and reset_control_deassert()
be ignored here?

If the underlying reset controller (e.g., an I2C/SPI GPIO expander) encount=
ers
a communication error, it could return a negative error code like -EIO. The
device might then remain stuck in a physical reset state, causing subsequent
communication to silently fail rather than failing early during probe with a
clear error message.

[Severity: Medium]
Is a reset recovery delay needed after deasserting the reset control before
moving on?

Since there is no explicit delay after deassertion, fast CPUs might begin
sending the first SPI/I2C commands before the DAC's internal state machine
has finished initializing from the hard reset.

> +
>  	/* Initialize masks to all ones */
>  	st->pwr_down_mask =3D ~0;
>  	st->pwr_down_mode =3D ~0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-ad5686-new=
-features-v5-0-577caadbf7c0@analog.com?part=3D6
