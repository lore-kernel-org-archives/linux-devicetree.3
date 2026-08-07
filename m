Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C82C21F4
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111377; cv=none; b=K6pbILYj4FhXq7yTdpv3RV15Z+PgH4GNpjqY8YnGFmTKvGb8StXy1fCrvmCjy+WjLhidkayrQGxpgiaeGe8cs0piyt4eLGMelMQldJWf1c1DQIvLrW5t55UdM5iFbL3bLLLl+RwZyqpSrC6qcTWuGl8pV8V5En7VgqPw3jVupjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111377; c=relaxed/simple;
	bh=Nr0Wzu7RKEkCl/EoFRC4p4sDl1UjATcRqSmEFkYKQ0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTtMrL8nPuV812Z1WeTAl5SPIdWYYtHNQRvWs7RSp7wSGHvC8j1T2w4BKf1WXlowqQSsNZBLeVsHjsC6H9sILmQWSGhVl3SwJFOES+UYQf4i6zvHx+VOT/tTFi9wSif/xw/gCqY5JD6oK962EgMf/X5tKSP97xueh4OSVd1qV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezl9Iw+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezl9Iw+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628601F000E9;
	Fri,  7 Aug 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786111373;
	bh=D1VvJwK1KsZYmSP/k0z3ShNkZQv+NwjGA7kLeI9vAj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezl9Iw+mFsp5k94L8406Juekv458FVq5xSbuLNeau0Scn3SXDt8LWlRGOm9nelJLy
	 KsezncPvuxLr55ilqPx5kXi/UavBi3yM6wyfKnYPjyaXv4wbbJ+tmSVa6SkCNMZt27
	 6efAG+HQIYfMYTQPwQSzq2auiRCvtntU/OPKrubAnerRimlQA96mUQ9XFsnFNkmC40
	 Odj30nHg5SvK/dBuYk7yDIDdpjrSmiMKLdnvnfitJdsz0j67LNSoO34m0zVFrgdrge
	 hhsHTbY3Y3hTqUUAIQG+s2639S2jVKJNitAYHJrH3UDPucyXn779bB8jRFeiwK7hke
	 Xk15NTao+M+JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v1 2/2] net: dsa: realtek: rtl83xx: add support
 for enabling supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806140239.3518906-3-o.rempel@pengutronix.de>
References: <20260806140239.3518906-1-o.rempel@pengutronix.de>
 <20260806140239.3518906-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:02:52 +0000
Message-Id: <20260807140253.628601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Potential back-powering of unpowered chip during device removal or=
 probe failure.
--

--- Patch [2]: [PATCH net-next v1 2/2] net: dsa: realtek: rtl83xx: add supp=
ort for enabling supplies ---
commit bb86fcef91dead11293d5508eb30d8736c1afc82
Author: Ahmad Fatoum <a.fatoum@pengutronix.de>

net: dsa: realtek: rtl83xx: add support for enabling supplies

This commit extends the Realtek DSA driver to optionally enable power
supplies specified in the device tree. The supplies are enabled before
the reset line is driven to prevent forcing current into unpowered pins.

> diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/=
rtl83xx.c
> index 35df809a59518..fb6aaaa60aa35 100644
> --- a/drivers/net/dsa/realtek/rtl83xx.c
> +++ b/drivers/net/dsa/realtek/rtl83xx.c

[ ... ]

> @@ -195,17 +215,22 @@ rtl83xx_probe(struct device *dev,
>  	priv->leds_disabled =3D of_property_read_bool(dev->of_node,
>  						    "realtek,disable-leds");
> =20
> -	/* TODO: if power is software controlled, set up any regulators here */
> +	/* Enable the supplies before the RESET line is requested and driven,
> +	 * so the chip is powered before current is forced into its pins.
> +	 */
> +	num_supplies =3D rtl83xx_enable_supplies(dev, var->supplies);
> +	if (num_supplies < 0)
> +		return ERR_PTR(num_supplies);
> +
>  	priv->reset_ctl =3D devm_reset_control_get_optional(dev, NULL);
>  	if (IS_ERR(priv->reset_ctl))
>  		return dev_err_cast_probe(dev, priv->reset_ctl,
>  					  "failed to get reset control\n");
> =20
>  	priv->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

[Severity: High]
Does this allocation order cause the unpowered chip to be back-powered
by the SoC during driver unbind or probe failure?

Because the devm regulators are enabled before the devm reset controls are
allocated, devres will clean them up in the reverse order. The reset
control and GPIO will be released first, followed by the regulators being
disabled.

Releasing a GPIO via gpiod_put() or a reset control doesn't automatically
assert it or change it to a high-impedance input state; they remain driven
to their last active value (deasserted). Then devres disables the
regulators, leaving the switch unpowered while the SoC continues to actively
drive the reset pin.

> -	if (IS_ERR(priv->reset)) {
> -		dev_err(dev, "failed to get RESET GPIO\n");
> -		return ERR_CAST(priv->reset);
> -	}
> +	if (IS_ERR(priv->reset))
> +		return dev_err_cast_probe(dev, priv->reset,
> +					  "failed to get RESET GPIO\n");
> =20
>  	dev_set_drvdata(dev, priv);
> =20
> @@ -214,10 +239,13 @@ rtl83xx_probe(struct device *dev,
>  		dev_dbg(dev, "asserted RESET\n");
>  		msleep(REALTEK_HW_STOP_DELAY);
>  		rtl83xx_reset_deassert(priv);
> -		msleep(REALTEK_HW_START_DELAY);
>  		dev_dbg(dev, "deasserted RESET\n");
>  	}

Is a custom devm action (like devm_add_action_or_reset) needed here to
safely assert the reset line before the regulators are disabled on teardown?

> =20
> +	/* Wait for the chip to come up only if we powered and/or reset it. */
> +	if (priv->reset_ctl || priv->reset || num_supplies)
> +		msleep(REALTEK_HW_START_DELAY);
> +
>  	return priv;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806140239.3518=
906-1-o.rempel@pengutronix.de?part=3D2
