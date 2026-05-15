Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E45368D53
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883036; cv=none; b=e9cNa0OheOML6bratn4ZpwRp66XNk13H3qy4jrPvF++aND4ZSEqvVq+5R92GiO6F+ntlNkWfTGKhU7NHIP7OcFa7GO8tHJ/Rk/cmF0bYDpyAmZA3IN2HU/XQYRLLg4tOHiZiBbQO7FsMw6nrAsTmL8ZhYMsKv0ZA5F3HUbKqK6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883036; c=relaxed/simple;
	bh=wUOKmgzqsrm0VDc4UQ4oCildkUIvhtSErxBFe89Yhdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3g4n68ujAmi3xLsPArO1MaLg10uD6qPlAiYqiYwIB18befFkSKSM22epamfz9VvZjEHmYbUm1L9FMWjmUU4FvynaPjYVC9SMw7b59MHQcgTyDAmwyqrjfm4bDdYdzRI77owYSJLT9EW/sF/vVLXHEHfP/ByrL0rGE8rMbYc5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9c4Ambt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9c4Ambt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C961EC2BCB0;
	Fri, 15 May 2026 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883036;
	bh=wUOKmgzqsrm0VDc4UQ4oCildkUIvhtSErxBFe89Yhdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=V9c4AmbtbVHzDMv5UvUGrxARUah/8yDxnyt3M2aqEjVZH54JiboxiBQYJEBaqHDC5
	 2EU4gzPSJDJskof1eVNE85tWeYT3YnYSXf2cjmVXdN5fnUSH0sJh0uFBQJQe7kG4Mc
	 xpdu44VqiEYU9J8ZjhC92wKAbxEyaaMalCWM1TyHBVESOQBs1Sy4Md+rigx3+nnyrj
	 5XPLj+NDz7Je+8XWfoLnkkv5xXluLIKB0v/Soah46I7rUlk9tdlFFyy+yLLbpnTKE8
	 Xfd3U0FCGdeKbrtzaguZYMyg90X7LTS/qaGFfVX7A5my9mJlMJsaw8ROidjfjkSErk
	 wOafM9FFoAbEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/10] extcon: add support for Samsung S2M series
 PMIC extcon devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-9-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-9-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:10:35 +0000
Message-Id: <20260515221035.C961EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Self-deadlock in `s2m_muic_remove()` due to recursive acquisit=
ion of the internal extcon spinlock.
- [High] Sleeping I2C regmap accesses are performed in atomic context while=
 holding a spinlock.
- [High] Missing mutual exclusion allows unprotected concurrent execution o=
f attach/detach handlers, leading to state corruption.
- [Medium] Unhandled 'no device attached' state causes a spurious warning o=
n boot.
- [Medium] The driver uses a fragile `switch` statement on a register read =
that is explicitly treated as a bitmask.
- [Low] Misuse of `WARN_ON_ONCE` by passing a string literal instead of a l=
ogical condition.
- [Low] A failed memory allocation error is masked if the subsequent initia=
lization function fails, and initialization is performed unnecessarily.
--

commit fa85a485ca17ccd71c4ade607d5194878ea06e29
Author: Kaustabh Chakraborty <kauschluss@disroot.org>
extcon: add support for Samsung S2M series PMIC extcon devices

This commit adds a driver for MUIC devices found in certain Samsung S2M
series PMICs. These devices report multiple cable states depending on the
ID-GND resistance measured by an internal ADC.

> diff --git a/drivers/extcon/extcon-s2m.c b/drivers/extcon/extcon-s2m.c
> new file mode 100644
> index 0000000000000..8450fdf2ff3ed
> --- /dev/null
> +++ b/drivers/extcon/extcon-s2m.c
[ ... ]
> +static int s2mu005_muic_attach(struct s2m_muic *priv)
> +{
[ ... ]
> +	ret =3D regmap_read(priv->regmap, S2MU005_REG_MUIC_DEV1, &type);
[ ... ]
> +	if (type & (S2MU005_MUIC_OTG | S2MU005_MUIC_CDP | S2MU005_MUIC_SDP)) {
> +		ret =3D regmap_update_bits(priv->regmap, S2MU005_REG_MUIC_SWCTRL,
> +					 S2MU005_MUIC_DM_DP,
> +					 FIELD_PREP(S2MU005_MUIC_DM_DP,
> +						    S2MU005_MUIC_DM_DP_USB));
[ ... ]
> +	switch (type) {
> +	case S2MU005_MUIC_OTG:
> +		dev_dbg(priv->dev, "USB OTG connection detected\n");
> +		extcon_set_state_sync(priv->extcon, EXTCON_USB_HOST, true);
> +		priv->attached =3D true;
> +		break;
[ ... ]
> +	default:
> +		dev_warn(priv->dev,
> +			 "failed to recognize the device attached, unknown or bad type\n");
> +	}
> +
> +	return ret;
> +}

Could this switch fail to match if multiple bits are set simultaneously,
given that the earlier code treats type as a bitmask? If multiple flags
can be set, independent bitwise checks might be safer.

Also, since call_on_probe is true for the attach handler, if no cable
is attached at boot, won't type be 0? Does this cause the driver to emit
this warning on boot when no device is attached?

[ ... ]
> +static int s2m_muic_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	switch (platform_get_device_id(pdev)->driver_data) {
> +	case S2MU005:
> +		priv->extcon_cable =3D s2mu005_muic_extcon_cable;
> +		priv->irq_data =3D devm_kmemdup(dev, s2mu005_muic_irq_data,
> +					      sizeof(s2mu005_muic_irq_data),
> +					      GFP_KERNEL);
> +		/* Initialize MUIC */
> +		ret =3D s2mu005_muic_init(priv);
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV, "device type not supported by drive=
r\n");
> +	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize MUIC\n");
> +
> +	if (!priv->irq_data)
> +		return -ENOMEM;

If devm_kmemdup() fails but s2mu005_muic_init() succeeds, does this
mask the -ENOMEM error? It also seems to perform hardware I2C initialization
even if the core data structure allocation failed. Could the allocation
check be moved immediately after the allocation?

[ ... ]
> +	for (i =3D 0; priv->irq_data[i].handler; i++) {
> +		ret =3D platform_get_irq_byname_optional(pdev, priv->irq_data[i].name);
> +		if (ret =3D=3D -ENXIO)
> +			continue;
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get IRQ %s\n",
> +					     priv->irq_data[i].name);
> +
> +		priv->irq_data[i].irq =3D ret;
> +		ret =3D devm_request_threaded_irq(dev, priv->irq_data[i].irq, NULL,
> +						s2m_muic_irq_func, IRQF_ONESHOT,
> +						priv->irq_data[i].name, priv);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +
> +		if (priv->irq_data[i].call_on_probe)
> +			priv->irq_data[i].handler(priv);
> +	}
> +
> +	return 0;
> +}

Is there a possibility of concurrent execution here? The attach handler is
invoked manually after devm_request_threaded_irq() has already enabled the
interrupt.

If the IRQ fires immediately, the probe thread and the IRQ thread could
execute s2mu005_muic_attach() simultaneously. Is there a need for
driver-level synchronization (like a mutex) to protect the priv->attached
flag and the regmap configuration sequence?

[ ... ]
> +static void s2m_muic_remove(struct platform_device *pdev)
> +{
> +	struct s2m_muic *priv =3D dev_get_drvdata(&pdev->dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->extcon->lock, flags);
> +
> +	/*
> +	 * Disabling the MUIC device is important as it disables manual
> +	 * switching mode, thereby enabling auto switching mode.
> +	 *
> +	 * This is to ensure that when the board is powered off, it
> +	 * goes into LPM charging mode when a USB charger is connected.
> +	 */
> +	switch (platform_get_device_id(pdev)->driver_data) {
> +	case S2MU005:
> +		s2mu005_muic_detach(priv);

Will this cause a self-deadlock when the driver is unbound?
s2mu005_muic_detach() calls extcon_get_state() and extcon_set_state_sync():

s2mu005_muic_detach()
    extcon_get_state()
        spin_lock_irqsave(&edev->lock, flags);

Since s2m_muic_remove() already acquired the exact same priv->extcon->lock
before calling s2mu005_muic_detach(), and Linux spinlocks are not
recursive, won't this hang the kernel?

Additionally, is it safe to perform I2C operations in this context?
s2m_muic_remove() acquires a spinlock with IRQs disabled. While holding
this lock, s2mu005_muic_detach() performs multiple regmap_set_bits()
operations. Since the PMIC is an I2C device, these operations can sleep,
which violates atomic context rules.

Could this be avoided by using a driver-level mutex instead of bypassing the
extcon API to access the internal lock?

> +		break;
> +	default:
> +		WARN_ON_ONCE("execution shouldn't have reached here!");

This isn't a bug, but WARN_ON_ONCE expects a boolean-like condition, not
a string literal. While the string evaluates to true, it causes a
pointer-to-integer conversion warning in static analysis, and the string
itself isn't formatted into the output message. Should this be
WARN_ONCE(1, ...)?

> +	}
> +
> +	spin_unlock_irqrestore(&priv->extcon->lock, flags);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D9
