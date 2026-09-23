Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8E47F3AE
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164816; cv=none; b=KR5i5ZRLM+03vBjCDKiAvyJLB17SPXAQnTDf0cnMo/frVuW7tn6Oa25rcbCEGu+a6nyMqSppD3WeVvEC+L61j0/uctsWsF9vaCSau7vFZ3d+O+vgdQpfy1b85ECzprsLeCFW2klA0n9gQl7krTE3+A8jnDKi40ENrM9sd/+1x5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164816; c=relaxed/simple;
	bh=zrOOTjJOMNE3FO48HyQI+9FkCX0Jgdja9EBsPy0wOQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rqb/KfRHYxH95MWefwunbX5uT3+ejQ8svjyzMHzCWE2mOwx8hT9SzVT/tEvNjmbHFqJc9SBF+rtlRypjCQZRxxkL+qHG5b4Sl7nvRcySMf5KplOafEUKJ+b0JNMgVK09Sy2FulXaSEEehfiEdX2vYKqU1sLQBtVmBva09hV6UTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAyAQCRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAyAQCRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03111F00893;
	Wed, 23 Sep 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164811;
	bh=es1xVTFbO/dadfVzdUTn+ymtBDEdMZ2I52gwe0+B59Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KAyAQCRjHkDjuzBFya62ydm6oueTHun/LbU9eValwWOvUT4A6Quge1ChgwxGwioOI
	 4J1c6BtRQffLcSxhIbm3rlWJqM90nqwKEfAPmdcep3X8LsZF8dAeruFA8QiyoAjfwb
	 LdS/tNOI/KPBJu5Xt5fxoVr6bVPeOBNeRvaskLDpMFG1nyXOAEsSDWOcxKbI1tJY92
	 oOjDQ+HhVA2P0hQeOXwKtNJ/0sojgQvj2T8SRllUrPxTY+Wf2p64UJWhDR3D4lipux
	 HbiT7ZuNsJu+j+SdkuDaJO/g/SazhdHX890xshdOJwVsB4QWoU/oe1V6aEcFWvg9ST
	 sFSGQq6gUNckQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/amlogic: switch to clk_bulk API to
 support multiple clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v1-2-7d4c4682f182@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
 <20260923-fix-t7-thermal-clock-v1-2-7d4c4682f182@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:00:10 +0000
Message-Id: <20260923120010.A03111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] thermal/amlogic: kernel panic on unclocked register access if DT l=
acks clocks
--

commit ea5439a5f68769e10d58c93a949a283bf6984a5f
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

thermal/drivers/amlogic: switch to clk_bulk API to support multiple clocks

The t7-thermal variant now exposes two clocks (bus and core) in its
devicetree binding, but the driver only knows how to get and manage
a single struct clk. Using devm_clk_get() would silently ignore the
second clock, so switch to devm_clk_bulk_get_all() and the matching
clk_bulk_prepare_enable()/clk_bulk_disable_unprepare() calls.

> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index a0b530624b60c..2e8d042067079 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
[ ... ]
> @@ -323,9 +324,10 @@ static int amlogic_thermal_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(pdata->regmap))
>  		return PTR_ERR(pdata->regmap);
> =20
> -	pdata->clk =3D devm_clk_get(dev, NULL);
> -	if (IS_ERR(pdata->clk))
> -		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n"=
);
> +	ret =3D devm_clk_bulk_get_all(dev, &pdata->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +	pdata->num_clks =3D ret;

[Severity: High]
Does this allow the probe to succeed without any clocks, leading to a crash
during register access if the device tree lacks clocks?

While device trees are typically trusted, missing required properties must
result in a graceful probe failure, not a system crash. The original
devm_clk_get() cleanly failed with -ENOENT if the clock was missing.

By changing this to devm_clk_bulk_get_all(), a missing clocks property now
returns 0. The driver sets pdata->num_clks =3D 0 and proceeds without error.

Later in probe, amlogic_thermal_enable() calls clk_bulk_prepare_enable()
(which becomes a no-op for 0 clocks) and then writes to TSENSOR_CFG_REG1.

Accessing hardware registers without first enabling the necessary bus or co=
re
clocks usually results in a bus fault (synchronous external abort), causing=
 a
kernel panic. Should there be an explicit check for ret =3D=3D 0 to return =
an
error?

> =20
>  	if (pdata->data->use_sm)
>  		ret =3D amlogic_thermal_probe_sm(pdev, pdata);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-fix-t7-the=
rmal-clock-v1-0-7d4c4682f182@aliel.fr?part=3D2
