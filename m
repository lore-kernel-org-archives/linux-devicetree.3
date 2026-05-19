Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F52701C4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232745; cv=none; b=fSNjth5v5YCYbe550Czv3oQXp1rxaWTC1Ov7LW1zMwTiWpxa5LbKC0wo+lBPRli4ewa3tPdbAJodSt0RGYGXzboy0TZmPDhOEfSZGAu2Zvq6bvUrQZKly0sCKkcVlNYdv5Ocfek1qo7MeTgv+20YVC5403szngrHoqwWBRMvBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232745; c=relaxed/simple;
	bh=GbYL9uPzo4RrM1gQVUYV4XnjVAePdUsiMPwHBCQL/iU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lqzYpxXExVdIzTJRoAxGwpH6N03+dmggI1iulI36K2GXI9V++73DGUiT9hTcJm2D/54I8AsjSCRHohOeINOh+c7q2zE8CO/YRPTnbm3N9byTiE1pFOtGOoRbeHYTeYpRzcSZGne9m7KzrZMAfqQgB/2JWRHEj5/7DJpe5/UpnaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2XZl/s7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2XZl/s7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EA11F00893;
	Tue, 19 May 2026 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232744;
	bh=F/92unQsNKkx9aoGJP0kFqlusaXk6ZxHSBm1aK9DoAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2XZl/s7fmksjhGuYJfw0OzkRjpkSh2hwG8VB/c1lWzcloQboe6WhRxVrmyFoDt4g
	 ptI2xPsM2LEQZKSSlGdJ/uU2+GY9rBK03mmz8UHME2WUoE84aMqVAoQfmb4mh1PkxD
	 5pDpd3NDf4O5jPGdQDd3zeKyI6meEHjvX31jqWhSPjSIeTWdVFYYEBAx08cYUBwwYh
	 CU26QitM3SxO9jkTiTdbjnVgUvLmGVHlrWmIXCTev+FwBds4b4xyvldP4Mc1P84m2v
	 07kf81MHDq3r11lOy0x4QGT+05zypNAjMpVnSVN8wQHQ4gTLUyMyXrknnbsk4VN6T3
	 EkahqsCUoJ7ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] thermal/drivers: airoha: Generalize
 get_thermal_ADC and set_mux function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519222433.29684-4-ansuelsmth@gmail.com>
References: <20260519222433.29684-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:19:03 +0000
Message-Id: <20260519231904.67EA11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Moving a 10ms sleep inside the hardware protection unlock window l=
eaves system registers vulnerable to concurrent accesses.
- [Medium] Device node reference leaked if devm_regmap_field_alloc() fails.

Pre-existing issues:
- [High] Interrupt is requested before the thermal zone device is initializ=
ed, risking a NULL pointer dereference.
--

commit 19dda8e8483928d41cb239d4372777541c03f962
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Generalize get_thermal_ADC and set_mux function

This commit prepares for Airoha AN7583 support by generalizing
get_thermal_ADC() and set_thermal_mux() to use the reg_field API. It also
moves the thermal ADC enable sleep inside the set_thermal_mux() function.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index 864a01fd8fd80..a062922cb116c 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c

[ ... ]

> -static void airoha_init_thermal_ADC_mode(struct airoha_thermal_priv *pri=
v)
> +static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
> +				   int tdac_idx)
>  {
> -	u32 adc_mux, pllrg;
> +	u32 pllrg;
> =20
>  	/* Save PLLRG current value */
>  	regmap_read(priv->chip_scu, EN7581_PLLRG_PROTECT, &pllrg);
> =20
> -	/* Give access to thermal regs */
> +	/* Give access to Thermal regs */
>  	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT,
>  		     priv->pllrg_protect);
> -	adc_mux =3D FIELD_PREP(EN7581_MUX_TADC, EN7581_SCU_THERMAL_MUX_DIODE1);
> -	regmap_write(priv->chip_scu, EN7581_PWD_TADC, adc_mux);
> +
> +	/* Configure Thermal ADC mux to tdac_idx */
> +	regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
> +			   tdac_idx);
> +
> +	/* Sleep 10 ms for Thermal ADC to enable */
> +	usleep_range(10 * USEC_PER_MSEC, 11 * USEC_PER_MSEC);

[Severity: High]
Does moving this sleep inside the hardware protection unlock window leave
system registers vulnerable to concurrent accesses?

The EN7581_PLLRG_PROTECT register is unlocked just before this sleep, and
relocked immediately after. Because usleep_range() blocks and schedules out
the task, the system controller's hardware protection mechanism is left
globally unlocked for at least 10ms.

This exposes a race window where concurrent operations from other subsystems
or drivers sharing the SCU could inadvertently write to protected registers.
In the original code, the registers were securely re-locked before the sleep
occurred.

> =20
>  	/* Restore PLLRG value on exit */
>  	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);

[ ... ]

> @@ -454,6 +473,17 @@ static int en7581_thermal_probe(struct platform_devi=
ce *pdev,
>  	if (IS_ERR(priv->chip_scu))
>  		return PTR_ERR(priv->chip_scu);
> =20
> +	for (i =3D 0; i < AIROHA_THERMAL_FIELD_MAX; i++) {
> +		struct regmap_field *field;
> +
> +		field =3D devm_regmap_field_alloc(dev, priv->chip_scu,
> +						en7581_chip_scu_fields[i]);
> +		if (IS_ERR(field))
> +			return PTR_ERR(field);

[Severity: Medium]
Could this error path leak the chip_scu_np device node?

The of_parse_phandle() function called earlier increments the reference cou=
nt
of chip_scu_np. If devm_regmap_field_alloc() fails here, returning directly
bypasses the of_node_put(chip_scu_np) cleanup that happens later in the pro=
be
function.

> +
> +		priv->chip_scu_fields[i] =3D field;
> +	}
> +
>  	of_address_to_resource(chip_scu_np, 0, &priv->scu_adc_res);
>  	of_node_put(chip_scu_np);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> =20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					en7581_thermal_irq, IRQF_ONESHOT,
>  					pdev->name, priv);

[Severity: High]
This is a pre-existing issue, but does requesting the interrupt here risk a
NULL pointer dereference?

The interrupt is requested without IRQF_NO_AUTOEN. If the interrupt fires
spuriously or was left enabled by the bootloader before priv->tz is
initialized (which happens later in the parent airoha_thermal_probe() via
devm_thermal_of_zone_register()), the interrupt handler en7581_thermal_irq()
will execute.

The handler sets update =3D true and calls thermal_zone_device_update() on
priv->tz. Dereferencing the NULL priv->tz pointer would cause a kernel oops
or panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519222433.2968=
4-1-ansuelsmth@gmail.com?part=3D3
