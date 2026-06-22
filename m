Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EAB3815D2
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114899; cv=none; b=iAiHCrtKjNrfMwCr256WQQGObGrwpHSRBFXKFXbDht0HASsAHthnRfCysDudwCciYgJB76YYN1ossYnK/hsCoN00oJdIaddwAJdNQux/LTGzPlbjS5tDe3bD2Ubdp1mfMMyyrHMQRxmF7deUWtVWDshm63r5qoihw/PvFkd38P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114899; c=relaxed/simple;
	bh=fjgCiZHdtnSk1zr89/B4Cl3GHhqiNpUos1fWQvLGm5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XURsf+VEomXbRwhU/u2igb3mkRhTtgVTN8a9PnTjNsZTpSidcjUVsZZqgpFsJgWUsPCUWktZ8ntymI9mwm1bTXrz79+D/wPyBTdCDTLNdtjDtHzzXVFgAuyAeR9UG7FKTwF1JvXsMqSEWSIQmLmiHmfzKkq/xKcaL0iPKnP/hRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2WzPta7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2WzPta7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6661F000E9;
	Mon, 22 Jun 2026 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782114897;
	bh=mnJCUTmkoIqbzjhjdxTlQXz73gwO5yBgPl2SgDGiaHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2WzPta7AFOq6upVLnB7vuA5HM+Fo4U+0uqC7oEFlvFfOjESLVnSL+Rojqk0kBqCB
	 XinNOzVRc5yFp4PiNl4SUNrcUIeqFCbx1epva9aVbFPPLYRq8Jz+DfumTuRfMSPyCZ
	 Lzvb044W5kdr55MUSgOvqLSucC4TTviPovk9FMVFA1Z3KA202kTz1MXXOgWb2PkBoK
	 6eXzTACXDCHJ8SHw917upmg//uT/aDzytpifoThaeZ8OL7VVgqq0dtJI2QKGu3wpaB
	 mLqnqMOGqwegiWO46pfEQiPNCyCVZv4Q9f1nB6HKlNU7VMnp3wP7uFmojTFooyvsRl
	 uhRHQXCGOVY/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 07:54:57 +0000
Message-Id: <20260622075457.7E6661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect error code passed to dev_err_probe() causes probe to inc=
orrectly succeed on regulator failure, leading to a zombie device.
--

commit e9d35c0c4f9ed7b92e86089b5cd8263bb84313d2
Author: Petar Stepanovic <pstepanovic@axiado.com>

iio: adc: add Axiado SARADC driver

This patch adds support for the SARADC controller found on Axiado AX3000
and AX3005 SoCs. The driver supports single-shot voltage reads through
the IIO subsystem, using SoC match data to determine the available input
channels.

> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_sar=
adc.c
> new file mode 100644
> index 0000000000000..12efe814318c5
> --- /dev/null
> +++ b/drivers/iio/adc/axiado_saradc.c
[ ... ]
> +static int axiado_saradc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	info->clk_rate =3D clk_get_rate(info->clk);
> +	if (!info->clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "invalid clock rate\n");
> +
> +	ret =3D devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (ret < 0)
> +		return dev_err_probe(dev, info->vref_uV,
> +				     "failed to get vref voltage\n");

[Severity: High]
Does this error path incorrectly return 0 on failure?

Because info was allocated via devm_iio_device_alloc(), info->vref_uV is 0
before being assigned. Passing info->vref_uV to dev_err_probe() instead of
ret causes dev_err_probe() to return 0.

Will this result in the probe function returning success on regulator
failure, leaving the driver bound to a non-functional device and
silently dropping valid probe deferrals?

> +	info->vref_uV =3D ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-axiado-ax3=
000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com?part=3D2
