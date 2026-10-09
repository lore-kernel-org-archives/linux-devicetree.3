Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0253CF1FF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572010; cv=none; b=kYc/1Gmxzo54DK2AnM0HsaCVXXkCqAA3mc9EJmwKErRLZ2zGIg04FQc0WnyZHi9sNSD7xp0zSVIv/YtIHP/A3BWQaYcClnE/8Msrx9dZ5nDAILHvOLr6i7FjuwGyIdhvgFrkBsAWyKSxPuJ2Kz4M5QUP5wmOgnmzKtKgxlUZw+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572010; c=relaxed/simple;
	bh=15xAuwM7X8m8ujQVGT8AX0DROcZLmJy1rNy4NSKHl5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pgv72Eqrjnm6eda8j/911Fpd88qSQud8EnkBFJKLl9cxwQlJBzoQu1n7rtmFp7fQzmp0GNZmnVdNA3l+ftGeogieK+j2bCyEO52GwwGm2RfIQ0C+sjJzpF0OyoTbPqVwmjXJL3njpTjHTSdbLNcv/YnHt6eyBth4Y/bPQ8hiELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW3n2SSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW3n2SSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CFA1F000FF;
	Fri,  9 Oct 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791572008;
	bh=iCc9e2bOvhIDVqGbTGQQUZT4yq3Nde5sSMDx+8au+Fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IW3n2SSfFwKcAwdAc1GsdPtdJVklX3T3tZr225cdZoRT9xvaCMEu2TnL4Fex4o3au
	 Ap8U2q+hRkMGlm160NoQpbOrJ38bPEc2bI0sr75sGQQRUawsxvohe3XAaRLWnpCFJZ
	 BOFmuykaWf8xEW4Zx0ldIa4kwArb10ZXuykGh9lxZcw/QJpgnEhz4XiDxhGIzt1g8l
	 FVB+s6nhLrLtjIORLPQ4iRRuFdrqppPdzz1c34+CrtQ5VokfK3wH2+vnBG7awW+KeD
	 ogf2zROwr2MpIVIdbmMoFS2LT44ICPZs+PEMRSvHykcapLT69BkApRxbgQ6tp6b4Wk
	 u69nOwswnIT8w==
Message-ID: <sashiko-outbox-165988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] iio: adc: rzt2h: Add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009184122.1378797-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:53:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: adc: rzt2h: Shared reset control leaked if unbound while acti=
ve
- [Medium] iio: adc: rzt2h: hardware settling delay bypassed when calibrati=
on is unsupported
--

commit 1e05a1801dd44e25bef73244db6d8173cc097ea8
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

iio: adc: rzt2h: Add optional reset support
   =20
Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H. Assert the optional reset when the ADC is
runtime-suspended and deassert it on runtime resume before performing
calibration. Use a shared reset control to support SoCs such as RZ/V2N where
the reset line is shared between multiple ADC instances.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 58e33fd0249c9..62120d2185152 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -710,6 +712,10 @@ static int rzt2h_adc_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, adc);
> =20
> +	adc->rstc =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(adc->rstc))
> +		return PTR_ERR(adc->rstc);
> +

[Severity: High]
Because this driver acquires a shared reset control and enables runtime PM =
via
devm_pm_runtime_enable() without providing a custom unbind action or .remove
callback to synchronously suspend the device, could this leak the shared re=
set
control's deassert count?

If the driver unbinds while the device is in RPM_ACTIVE (for instance, due =
to
a concurrent sysfs read or a user setting power/control to "on"), the devres
cleanup calls pm_runtime_disable() which leaves the device active.=20

This would bypass rzt2h_adc_pm_runtime_suspend() entirely, meaning
reset_control_assert() is never called, and the deassert count is permanent=
ly
leaked. Other driver instances sharing this reset line would then be unable
to assert it, potentially breaking their power management transitions.

>  	ret =3D rzt2h_adc_parse_properties(adc);

[ ... ]

> @@ -771,10 +777,22 @@ static const struct of_device_id rzt2h_adc_match[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
> =20
> +static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
> +
> +	return reset_control_assert(adc->rstc);
> +}
> +
>  static int rzt2h_adc_pm_runtime_resume(struct device *dev)
>  {
>  	struct rzt2h_adc *adc =3D dev_get_drvdata(dev);
>  	const struct rzt2h_adc_chip_info *chip_info =3D adc->chip_info;
> +	int ret;
> +
> +	ret =3D reset_control_deassert(adc->rstc);
> +	if (ret)
> +		return ret;
> =20
>  	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
>  		return 0;
>=20
>  	/*
>  	 * Datasheet Page 2810, Section 41.5.6:
>  	 * After release from the module-stop state, wait for at least
>  	 * 0.5 =C2=B5s before starting A/D conversion.
>  	 */
>  	fsleep(1);

[Severity: Medium]
Does this early return bypass the required hardware settling delay for
devices without the calibration feature?=20

When rzt2h_adc_pm_runtime_resume() is called for hardware lacking
RZT2H_ADC_FEATURE_CALIBRATION, returning 0 immediately skips the fsleep(1)
that follows. This means the IIO core can immediately start A/D conversions=
 on
the newly-resumed hardware before the datasheet-mandated 0.5 us module-stop
release delay has elapsed, potentially resulting in unreliable initial ADC
conversions.

> =20
> -	return rzt2h_adc_calibrate(adc);
> +	ret =3D rzt2h_adc_calibrate(adc);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009184122.1378=
797-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
