Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB123242AC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269483; cv=none; b=qma6rwKZZbd0a+1D8ZpkYThfrDZ2xoXXz7cWHh7kDADFutuI/pumcreVnns2F4ah5fcgRIsLikCIKeECeWx5iAlyg+HM0OWyizgr3rwO2ufkUQwBcAjW5ESjl5pjLpsvbOmUHScOJAsAxO09MuRaLO+QEHfpFV7WWXPuW7IAfoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269483; c=relaxed/simple;
	bh=wiNXPP+4KyBElZz66J1pONugI2UWQP9eIktjaTTO/nI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Avgtc0Fa3o8Kz0B7DSAmrJT3OvE+qaLjZ/c34MjBtgnuGB2TceL2IWkTsF0txwmm5XQlMbH39S62QqynmXsXBB59mIfNa6Sg9yeBiFuce2dKBrdIh4MbPAHYcf1UiQ1Z9oO55LKeq7wA2qco/syubv4UZ+tV8+Ugq0aWzPiu+8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4+GXe7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4+GXe7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DECC2BCC7;
	Fri,  8 May 2026 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778269483;
	bh=wiNXPP+4KyBElZz66J1pONugI2UWQP9eIktjaTTO/nI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=S4+GXe7+XoyxrivlTBsspOfblmHOBn7CK+uqUybaMCVrNZrF6EUDM2qS+rlgtpHFa
	 s9G1j+Bk+XhCZSuoIVr+1dXbSdDOLwtezBEqgpQ6sEmHvTwrzFnNqtc8PuYVTovSS8
	 d6opigqzU07cVtgpMrE8rxp7a3L5CEhMxpX15XmQMN7K8JwLaDTqlaSsjYE7w0rMjG
	 Kv95my1ug1kYLxEJzloG4/8N4q45Sffq52xheDhLdI5edEX+/FUCFtRGYuHbnuHTvP
	 qMRX6QxGJCIN66Yt6NDrMLwhPDhh+c2mZe/Y9mCHbAetgpA5DC0eCAfo2V9etar53x
	 z3Ox94t1SIMvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] irqchip/meson-gpio: Add support for Amlogic A9 SoCs
Reply-To: sashiko@lists.linux.dev
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-a9-gpio-irqchip-v1-3-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-3-9dc5f3e022e0@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:44:42 +0000
Message-Id: <20260508194442.D6DECC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Fragile bitmask logic when clearing the both-edge trigger bit.
- [Low] Extraneous trailing semicolon after the function definition.
--

commit 295d9fc711855b4e0f9dd4bdc918ad1908141ca0
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

irqchip/meson-gpio: Add support for Amlogic A9 SoCs

This commit adds GPIO interrupt support for the Amlogic A9 SoCs. It defines
the mappings for the main and AO interrupt lines and implements the
interrupt type setting behavior for the A9 AO domain.

> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson=
-gpio.c
> index 74a376ef452e2..f68476b2c5382 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c

[ ... ]

> @@ -375,6 +403,53 @@ static int meson8_gpio_irq_set_type(struct meson_gpi=
o_irq_controller *ctl,
>  	return 0;
>  }
> =20
> +/*
> + * gpio irq relative registers for a9_ao
> + * -PADCTRL_GPIO_IRQ_CTRL0
> + * bit[31]:    enable/disable all the irq lines
> + * bit[0-19]:  polarity trigger
> + *
> + * -PADCTRL_GPIO_IRQ_CTRL[X]
> + * bit[0-5]: 6 bits to choose gpio source for irq line 2*[X] - 2
> + * bit[16-21]:6 bits to choose gpio source for irq line 2*[X] - 1
> + * where X =3D 1-10
> + *
> + * -PADCTRL_GPIO_IRQ_CTRL[11]
> + * bit[0-19]: both edge trigger
> + *
> + * -PADCTRL_GPIO_IRQ_CTRL[12]
> + * bit[0-19]: single edge trigger
> + */
> +static int meson_a9_ao_gpio_irq_set_type(struct meson_gpio_irq_controlle=
r *ctl,
> +					 unsigned int type, u32 *channel_hwirq)
> +{
> +	const struct meson_gpio_irq_params *params =3D ctl->params;
> +	unsigned int idx;
> +	u32 val =3D 0;
> +
> +	idx =3D meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
> +
> +	type &=3D IRQ_TYPE_SENSE_MASK;
> +
> +	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg, BIT(idx), 0);

Is this asymmetric bitmask logic intentional?

The both-edge trigger bit is cleared using BIT(idx), but it is set using
BIT(ctl->params->edge_both_offset + idx) just below.

While edge_both_offset is initialized to 0 for the A9 AO domain, will this
clearing operation target the wrong bit if the code is ever reused with a
non-zero offset?

> +
> +	if (type =3D=3D IRQ_TYPE_EDGE_BOTH) {
> +		val =3D BIT(ctl->params->edge_both_offset + idx);
> +		meson_gpio_irq_update_bits(ctl, params->edge_pol_reg, val, val);
> +		return 0;
> +	}
> +
> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +		val =3D BIT(idx);
> +	meson_gpio_irq_update_bits(ctl, REG_A9_AO_POL, BIT(idx), val);
> +
> +	val =3D 0;
> +	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> +		val =3D BIT(idx);
> +	meson_gpio_irq_update_bits(ctl, REG_A9_AO_EDGE, BIT(idx), val);
> +
> +	return 0;
> +};

This isn't a bug, but there is an extraneous trailing semicolon after the
function definition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-a9-gpio-ir=
qchip-v1-0-9dc5f3e022e0@amlogic.com?part=3D3
