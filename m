Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC04FDA71
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686689; cv=none; b=fNPph9aXsj1JBIGW+i54y3u+d6vQkpoJtP7Wi0HpxgDWor8w2zEZ94/2Xd9RVmvvgj/vskfXsalEpmzCMzgPiqN5/yDrDeSoRQaOIk+Ie5HKmGIw9C3M4FdOK6t7aApRDDZ7r6OQki/86k6zl8vXexSicOB3hiYbqxpFeBw6lFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686689; c=relaxed/simple;
	bh=4gc5/CjtPg6aIh9x14Ev4xGOd7ZDoWaoIT9UYsutvIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jDFZNU/Z73sA+42FX6l7Mc1bVdawOBe/qtNSgYTP+3NEvr3aUbwtfUdcXkia0b7EiNI4ljZ12tNvI3S4dYU/frFEF3JkGpwpyS5BQJ4Srq7lPWva1f0doNxcGiqv2joH2TOeM4kBFmLGP4JyUgHA0stlzKlzynTAqI9dec7eVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+pFas//; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+pFas//"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C131F000FF;
	Tue, 29 Sep 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686687;
	bh=YTrvRjxvjW2eu4/CjaH1M4a3CL+MjED0YWTB/wSxK5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n+pFas//MgM+PaWKh0xx/QzOHn0655+ozwnmvblFMg4pmFEwFFFTFKcnhYYQ8W41q
	 K2Z1N1AUd0vGQgqT3SKmNlk+CDaP5vCLurgu5w/8W3SxFjAmkNTnD1XeeTF10PzQhN
	 JSi0IIR96oJ6Y6znT3ASeZ8HweDYNv7CTg3hm8WVZ1/FhakbPAcpxCR2V95+8yRtol
	 5EjX9OY68XDE+1dTj1aXXbOl9QPYpzahP1kGxifCKoIMg1uBE9kZ9wVMfK4uCnV42P
	 hboSGf5zU21uAXzG8Dv4Ze4GeZpIYQO5Cfj/QEIjxLL0yPxCNlOpvqnBfQmgwNYaMq
	 H24NlO7lgps4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] iio: adc: rzt2h: Add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929124248.237032-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:58:06 +0000
Message-Id: <20260929125807.35C131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: pm: shared reset_control deassert_count leak on driver unbind
--

commit 2c9879cdb042266b9cb867be82cd949d29dd6f14
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

iio: adc: rzt2h: Add optional reset support

Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H. Asserts the optional reset when the ADC is
runtime-suspended and deasserts it on runtime resume before calibration.
Uses a shared reset control to support SoCs where the reset line is shared.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index f1a830da6f9b7..4726f892da232 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
[ ... ]
> @@ -706,6 +708,10 @@ static int rzt2h_adc_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, adc);
> =20
> +	adc->rstc =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(adc->rstc))
> +		return PTR_ERR(adc->rstc);
> +
>  	ret =3D rzt2h_adc_parse_properties(adc);
>  	if (ret)
>  		return ret;
[ ... ]
> @@ -767,10 +773,22 @@ static const struct of_device_id rzt2h_adc_match[] =
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

[Severity: High]
Does this driver leak the shared reset control's deassert count when unboun=
d?

If the driver is unbound (e.g., via sysfs or module unload) while the device
is in the RPM_ACTIVE state, devm_pm_runtime_enable() merely calls
pm_runtime_disable() which forcibly cancels pending autosuspends without
invoking the runtime suspend callback.

This RPM_ACTIVE state is reliably reached if unbind happens while the IIO
buffer is active (where IIO core triggers an asynchronous
pm_runtime_put_autosuspend), or within 300ms (the autosuspend delay) after a
single-channel read_raw operation.

Since the driver lacks a .remove callback or custom devm action to
synchronously suspend the device on teardown, this
rzt2h_adc_pm_runtime_suspend() is completely bypassed and
reset_control_assert() is missed.

Will this cause a permanent denial of service for shared hardware resources,
preventing the physical reset line from being asserted for other ADC instan=
ces
until a reboot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929124248.2370=
32-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
