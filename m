Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1585334C1D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295684; cv=none; b=i54A7X1bjJ5ahMVkf62H4Wo1DLJQ2D06UCymwD8s4xILI2Y0g03ukq43cepq7tRfCz9CsEs9WABjE8+Fq4S2AYBrsNlImqjrnPrJCAAiv3qWwd2aZbGLb+y0baOIaloZRHpXq7Zgte7noL3jvYOpI1athy+gE9jbxvWOlL/JjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295684; c=relaxed/simple;
	bh=vm0PxFDshxFv/4DPW2RzAaUhI046C86xI/8jRmNuvRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o4UyzbRsfOtXp/KCJi5zvjGWQIug3riCBoMASM9P9p0xAQTr+9YFk9EVpCUoxPmUum5t6ye+bUFSQ7Fk0uC5ceswlrqg3p15Qid7v+VNmUa7FxAXlhFS9qq4P9gumufK0bA6M4jrhNWVQqyJ1y70/b13wr8wkyZjHBLLP90U0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlCiP22I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlCiP22I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF4C1F00894;
	Wed, 20 May 2026 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779295682;
	bh=J4vxLNl+gJPC+p7R6B5rrEq/XMJRAV/OYYQouBMD8CY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RlCiP22IKCBpNGJMhJhtCetpHhytrLFR+XirYyblMOZAeUm6gOvNRGYVzcVqFGhsR
	 NUSRYZDlf07I6ZIS96rTd/g1UTaiiJ6d4hq2moQqhQqJbKblaD4jAVUuSmdvt2oKrN
	 FdZM1txAn2oc8+TDC7kWDy9paC3WflUQ8cgCoUEzIjyXURZVsvodfm8/Z78HwuPq3k
	 0K099xZ54AU2IXXAzfEyJoHGw+Ibr6fbj1o59iFCSCf0A8D5imzn45lJN+jm2tLudd
	 QyVHwA7GjanPOGvvRAdPudLUu7uK5cSEOjhZDUnuNGeWKMoiWp2caGXsM20YMzDU5e
	 erjgqsDofN/fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] thermal/drivers: airoha: Convert to regmap API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520155525.22239-4-ansuelsmth@gmail.com>
References: <20260520155525.22239-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:48:02 +0000
Message-Id: <20260520164802.8EF4C1F00894@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Simultaneous temperature trip interrupts are dropped instead of be=
ing handled.
- [High] The IRQ is requested before the thermal zone is registered, allowi=
ng a potential NULL pointer dereference in the IRQ handler.
- [High] Non-atomic read-modify-restore sequence on a shared syscon regmap =
without external locking.
--

commit 952c01597265eea8ee25e21cc2c92bef3e5ca97e
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Convert to regmap API

In preparation for support of Airoha AN7583, convert the driver to
regmap API. This is needed as Airoha AN7583 will be based on syscon
regmap.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index 829a7327fc403..b63893a8997a3 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c

[ ... ]

> @@ -300,9 +300,9 @@ static irqreturn_t airoha_thermal_irq(int irq, void *=
data)
>  	struct airoha_thermal_priv *priv =3D data;
>  	enum thermal_notify_event event;
>  	bool update =3D false;
> -	u32 status;
> +	u32 status =3D 0;
> =20
> -	status =3D readl(priv->base + EN7581_TEMPMONINTSTS);
> +	regmap_read(priv->map, EN7581_TEMPMONINTSTS, &status);
>  	switch (status & (EN7581_HOFSINTSTS0 | EN7581_LOFSINTSTS0)) {
>  	case EN7581_HOFSINTSTS0:
>  		event =3D THERMAL_TRIP_VIOLATED;

[Severity: High]
This is a pre-existing issue, but what happens if both high and low
temperature interrupt status bits are set simultaneously?

If both EN7581_HOFSINTSTS0 and EN7581_LOFSINTSTS0 are set, the bitwise AND
will yield a combination of both bits. Since there are only case statements
for the individual bits, the code will fall through to the default case.

The status will be written back to clear the interrupts, but the events
will be silently dropped without notifying the thermal core.

Would it be safer to replace this switch statement with independent if
checks for each interrupt flag?

> @@ -329,18 +329,19 @@ static irqreturn_t airoha_thermal_irq(int irq, void=
 *data)
>  static void airoha_thermal_setup_adc_val(struct device *dev,
>  					 struct airoha_thermal_priv *priv)
>  {
> -	u32 efuse_calib_info, cpu_sensor;
> +	u32 efuse_calib_info =3D 0;
> +	u32 cpu_sensor =3D 0;
> =20
>  	/* Setup thermal sensor to ADC mode and setup the mux to DIODE1 */
>  	airoha_init_thermal_ADC_mode(priv);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the
chip_scu regmap sequence to race with other drivers?

Looking at airoha_init_thermal_ADC_mode(), it performs a read-modify-restore
sequence on a shared syscon regmap:

static void airoha_init_thermal_ADC_mode(struct airoha_thermal_priv *priv)
{
    ...
    regmap_read(priv->chip_scu, EN7581_PLLRG_PROTECT, &pllrg);
    regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT,
                 EN7581_SCU_THERMAL_PROTECT_KEY);
    ...
    regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);
}

Because the internal regmap lock is only held during individual register
accesses, could another driver (like a clock or pinctrl driver) accessing
the SCU concurrently cause the protect key to be incorrectly overwritten or
prematurely removed?

[ ... ]

> @@ -462,8 +475,8 @@ static int airoha_thermal_probe(struct platform_devic=
e *pdev)
>  	platform_set_drvdata(pdev, priv);
> =20
>  	/* Enable LOW and HIGH interrupt */
> -	writel(EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0,
> -	       priv->base + EN7581_TEMPMONINT);
> +	regmap_write(priv->map, EN7581_TEMPMONINT,
> +		     EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but could we encounter a NULL pointer
dereference if an interrupt fires before the thermal zone is registered?

Looking earlier in airoha_thermal_probe():

    ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
                                    airoha_thermal_irq, IRQF_ONESHOT,
                                    pdev->name, priv);

    ...

    priv->tz =3D devm_thermal_of_zone_register(dev, 0, priv, &thdev_ops);

If an interrupt is already pending (for example, left active by the
bootloader) when the IRQ is requested, the handler will run immediately.

If an event is detected, airoha_thermal_irq() will call
thermal_zone_device_update(priv->tz, event). Since priv->tz is still NULL
at that point, it will crash.

Should the IRQ be requested after the thermal zone registration is complete?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520155525.2223=
9-1-ansuelsmth@gmail.com?part=3D3
