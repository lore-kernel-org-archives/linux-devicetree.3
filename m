Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48B47A0AB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843833; cv=none; b=GGHwUoKf5Ljk6zYLoEgsdWP3KtujHv85sgTa9qTorz6QiK8kH3MsSthUDMbrzWW0qvy+HTjSPiZ70swGPST6EPLXcQKy6mtxZS82NBRYuypDZh2FNI2nWRnAPexxSpibzurtguVLWoKYojvGe7G+xDAuUFx+IIlF3N9m30SUdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843833; c=relaxed/simple;
	bh=/+/qOlqblTIjmXSucilj1HQdfibHrRL34i6XJWlRoB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QyjZOnONrObUv0fMoh8ZH6bk7AzVbAFasB7BnAhbe3rVwkolk/Z1KYSqspIAuOUOj56orRPFoJzjen74LpZtBzMmVUPz4eETluC9T+YrM5yqAA1b7UAvTYzRN5w4ff0hYxQCQ5NjABz1bFXkXKt7VS0y2rw+eZSJoxshE+iYKb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/k6wKqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/k6wKqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF89C2BCB0;
	Fri, 15 May 2026 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843832;
	bh=/+/qOlqblTIjmXSucilj1HQdfibHrRL34i6XJWlRoB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R/k6wKqeR422O0f76jEwwssHuwpbmyfwxVDeIag/Re1Mi+pZEo5/2KnIKbgBhlzLO
	 ZBSGeNr96p6FPErzr1R7vnSn6eFFz4Ltyv9e1U5Ng3CqT4tm9nF8sD4ro5wHrGAhUJ
	 ryJtyCHd78yimWPNLFwii4zLmBVfqIIz5n2ZCiNS49hr0sL7p3CPY/DP88ip/p+wJL
	 nhelbJw744P0bK7HhUx2UrhOxmPhyjBhfPj/guUgNZ7SmjDq3qhygcUaJieQdLCoEv
	 KO1ngs52mO8ncvV3RBs/TzLQWr6JgeMes3YrvqgbMdTdQ6Mz7habvw8WQ1RmEpRlcl
	 7/McnkEBbbGBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/11] extcon: add support for Samsung S2M series
 PMIC extcon devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-10-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-10-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:17:11 +0000
Message-Id: <20260515111712.3EF89C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver attempts to set the extcon state using an unallocated `=
priv->extcon` pointer during initialization, causing the initial connection=
 state to be lost.
- [High] The driver writes instance-specific IRQ numbers into a globally sh=
ared static array, breaking driver re-entrancy and multi-instance support.
- [High] The driver suppresses the `-EPROBE_DEFER` error code when requesti=
ng IRQs, permanently failing the probe.
- [High] The USB DM/DP pin configuration and extcon logic incorrectly handl=
es Dedicated Charging Ports (DCP) and Charging Downstream Ports (CDP).
- [High] Unconditional dereference of `platform_get_device_id(pdev)` will c=
ause a kernel panic when probed via Device Tree.
- [High] Missing synchronization locks allow concurrent threaded IRQ handle=
rs and the `remove` callback to race and corrupt shared hardware state.
- [Medium] A bitmask register value is evaluated using an exact-match `swit=
ch` statement, leading to silent failures if multiple bits are set.
--

commit f656e24319a7eaa1f4ea39f962f29d98ebf1b285
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

extcon: add support for Samsung S2M series PMIC extcon devices

Add a driver for MUIC devices found in certain Samsung S2M series PMICs.
These are USB port accessory detectors. These devices report multiple
cable states depending on the ID-GND resistance measured by an internal
ADC.

> diff --git a/drivers/extcon/extcon-s2m.c b/drivers/extcon/extcon-s2m.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/extcon/extcon-s2m.c
[ ... ]
> +static int s2mu005_muic_attach(struct s2m_muic *priv)
> +{
> +	unsigned int type;
> +	int ret;
[ ... ]
> +	/*
> +	 * All USB connections which require communication via its D+
> +	 * and D- wires need it.
> +	 */
> +	if (type & (S2MU005_MUIC_OTG | S2MU005_MUIC_DCP | S2MU005_MUIC_SDP)) {
> +		ret =3D regmap_update_bits(priv->regmap, S2MU005_REG_MUIC_SWCTRL,

Does this pin configuration logic erroneously include S2MU005_MUIC_DCP (whi=
ch
shorts D+/D- and performs no data communication) and omit S2MU005_MUIC_CDP
(which does require data communication)?

[ ... ]
> +	switch (type) {
> +	case S2MU005_MUIC_OTG:
> +		dev_dbg(priv->dev, "USB OTG connection detected\n");
> +		extcon_set_state_sync(priv->extcon, EXTCON_USB_HOST, true);
> +		priv->attached =3D true;
> +		break;

Since the type variable was previously checked using a bitwise AND, indicat=
ing
it acts as a bitmask, could this exact-match switch statement fail to proce=
ss
the attachment if any other bits or status flags are set in the register?

> +	case S2MU005_MUIC_CDP:
> +		dev_dbg(priv->dev, "USB CDP connection detected\n");
> +		extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
> +		extcon_set_state_sync(priv->extcon, EXTCON_CHG_USB_CDP, true);
> +		priv->attached =3D true;
> +		break;
> +	case S2MU005_MUIC_SDP:
> +		dev_dbg(priv->dev, "USB SDP connection detected\n");
> +		extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
> +		extcon_set_state_sync(priv->extcon, EXTCON_CHG_USB_SDP, true);
> +		priv->attached =3D true;
> +		break;
> +	case S2MU005_MUIC_DCP:
> +		dev_dbg(priv->dev, "USB DCP connection detected\n");
> +		extcon_set_state_sync(priv->extcon, EXTCON_USB, true);

Is it correct to assert the EXTCON_USB state for DCP connections? EXTCON_USB
typically signals a standard data connection to the system. Setting it for a
charger with shorted data pins could wake the USB PHY and cause enumeration
timeouts.

[ ... ]
> +static int s2m_muic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct s2m_muic *priv;
> +	int ret;
> +	int i;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->dev =3D dev;
> +	priv->regmap =3D pmic_drvdata->regmap_pmic;
> +
> +	switch (platform_get_device_id(pdev)->driver_data) {

Can platform_get_device_id(pdev) return NULL when the driver is matched via
Device Tree, since the platform bus does not populate pdev->id_entry?
Dereferencing it unconditionally could cause a NULL pointer dereference cra=
sh.
Would device_get_match_data() be more robust here?

> +	case S2MU005:
> +		priv->extcon_cable =3D s2mu005_muic_extcon_cable;
> +		priv->irq_data =3D s2mu005_muic_irq_data;
> +		/* Initialize MUIC */
> +		ret =3D s2mu005_muic_init(priv);
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV,
> +				     "device type %d is not supported by driver\n",
> +				     pmic_drvdata->device_type);
> +	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to initialize MUIC\n");
> +
> +	priv->extcon =3D devm_extcon_dev_allocate(dev, priv->extcon_cable);

Since s2mu005_muic_init() configures the hardware and calls s2mu005_muic_at=
tach(),
it will attempt to set the extcon state before priv->extcon is allocated:

    extcon_set_state_sync(priv->extcon, EXTCON_USB_HOST, true);

Because priv->extcon is NULL at that point, the extcon subsystem will return
-EINVAL. Will this cause the driver to silently drop the initial cable stat=
e if
an accessory is already connected at boot?

[ ... ]
> +	for (i =3D 0; priv->irq_data[i].handler; i++) {
> +		int irq =3D platform_get_irq_byname_optional(pdev,
> +							   priv->irq_data[i].name);
> +		if (irq =3D=3D -ENXIO)
> +			continue;
> +		if (irq <=3D 0)
> +			return dev_err_probe(dev, -EINVAL, "failed to get IRQ %s\n",
> +					     priv->irq_data[i].name);

If platform_get_irq_byname_optional() returns -EPROBE_DEFER, will returning=
 a
hardcoded -EINVAL here prevent the driver from properly participating in the
kernel's deferred probing mechanism?

> +
> +		priv->irq_data[i].irq =3D irq;

Because priv->irq_data points to s2mu005_muic_irq_data, which is a global s=
tatic
array, does modifying the array here break driver re-entrancy and multi-ins=
tance
support?

If multiple devices are instantiated or a device is rebound, the global arr=
ay
is overwritten, which could cause earlier instances to fail to match their
interrupts and silently drop them.

> +		ret =3D devm_request_threaded_irq(dev, irq, NULL,
> +						s2m_muic_irq_func, IRQF_ONESHOT,
> +						priv->irq_data[i].name, priv);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void s2m_muic_remove(struct platform_device *pdev)
> +{
> +	struct s2m_muic *priv =3D dev_get_drvdata(&pdev->dev);
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
> +		break;
> +	}
> +}

Is there a race condition between the threaded IRQ handlers and the remove
callback?

The IRQ handlers perform read-modify-write operations on the shared
priv->attached flag and issue regmap commands without holding any locks. Si=
nce
the IRQs are managed by devres, they remain active during the execution of
s2m_muic_remove().

If an interrupt fires during module unload, it could run concurrently with
s2mu005_muic_detach(), potentially corrupting shared hardware state or
re-enabling manual switching right as the driver is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D10
