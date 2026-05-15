Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637347B406
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844009; cv=none; b=SYnnw6tibddMQqiZREryp0ih1RwWdtE0ezag72l0FrQT6fux4mGOF2o0DrmS+l9qdypgMsmhVhSrmTehflEPyI9v8qRqO8BgFxzIVmsk6wWUs0dAtFAAk9hYOmjIZ+T23pljsDlzEWKDy8hoJZh7Wp6uc3rq2tT1oO5lKqGj5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844009; c=relaxed/simple;
	bh=MBVvFwtii19BC+pYHj6lzYWE+KLCtBiWlScePV+1adI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+vriJEvZh37k52Fl7LRhlo1qdEX7KNW6E8v7nKzPOfGFkhA4RUm3hp5ZgwJWSXYgA1PqhE3FDGe4qc0No3EZ6A8JN2n/NHwVpHs/rE8ROJjNik6fVfXM5jTeqjPQCEgcZ7pA5V7shqGJMqAIRiPy7skSnWQUXfkdUXyJ/yFzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZEYIsyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZEYIsyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5351C2BCB0;
	Fri, 15 May 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844008;
	bh=MBVvFwtii19BC+pYHj6lzYWE+KLCtBiWlScePV+1adI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FZEYIsyW6dvr9XFFohXNG7J38SRdcXFxChZNbq9dhDnHNu/ONPhQuQU88SIoJhMwG
	 vnN09BLY/7tOYRjpPCDgoZ9zacYnTQh4plp+OCX5bXssM1bzTD404Gca2PwBDyhMqg
	 5D1rOHjkwwIOs/W+xBUe8MU+aFuMG5+j4RgJoqzat7AxkR0d+0hAKngPeNnfDrMWJ7
	 OHIYz1T2i0vhgrfCAsjHdBQYCL5M6lZ/o7iV+RXGUk35u42O55372Byf58MX/UdtB5
	 MORStaCNuxL78x2W8PmAx27g+VYAK+3XQl7hcPxZ3YgIMloJpHvlpgfwfTgKsejWb/
	 YQ8Am0MqvPFHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/11] power: supply: add support for Samsung S2M
 series PMIC charger device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-11-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-11-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:20:08 +0000
Message-Id: <20260515112008.A5351C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Registration of power supply before acquiring `extcon` creates=
 a race condition that can lead to a kernel panic.
- [High] `extcon_get_state()` negative error codes are incorrectly evaluate=
d as true in boolean contexts, risking hardware damage.
- [High] Missing `else if` in `s2mu005_chgr_get_usb_type()` overwrites vali=
d USB types.
- [High] Infinite probe deferral loop if the mandatory 'muic' device tree n=
ode is missing.
- [High] Ignored return value from `devm_extcon_register_notifier_all()` si=
lently masks registration failures.
- [Medium] The initial hardware charger mode is not synchronized with the p=
hysical cable state during probe.
- [Low] Misleading indentation in `s2mu005_chgr_mode_set_charger()` due to =
missing curly braces.
--

commit e4bc7879e2d0f0f694862fddb5772356c6262c9b
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

power: supply: add support for Samsung S2M series PMIC charger device

Add a driver for charger controllers found in certain Samsung S2M series
PMICs. The driver includes initial support for the S2MU005 PMIC charger.

> diff --git a/drivers/power/supply/s2m-charger.c b/drivers/power/supply/s2=
m-charger.c
> new file mode 100644
> index 0000000000000..b32cea55b8b04
> --- /dev/null
> +++ b/drivers/power/supply/s2m-charger.c
[ ... ]
> +static void s2mu005_chgr_get_usb_type(struct s2m_chgr *priv, int *value)
> +{
> +	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_CDP))
> +		*value =3D POWER_SUPPLY_USB_TYPE_CDP;
> +	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_SDP))
> +		*value =3D POWER_SUPPLY_USB_TYPE_SDP;
> +	if (extcon_get_state(priv->extcon, EXTCON_CHG_USB_DCP))
> +		*value =3D POWER_SUPPLY_USB_TYPE_DCP;
> +	else
> +		*value =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
> +}

Does the missing else if on the DCP check overwrite valid CDP or SDP states?
If a CDP or SDP charger is attached, DCP evaluates to false, which executes
the else block and overwrites *value with POWER_SUPPLY_USB_TYPE_UNKNOWN.

Also, extcon_get_state() can return negative error codes (e.g. -EINVAL) if
the cable ID is unsupported. Does evaluating this directly in a boolean
context cause it to be treated as true? Should this explicitly check for > =
0?

[ ... ]
> +static int s2mu005_chgr_mode_set_charger(struct s2m_chgr *priv)
> +{
[ ... ]
> +	/* then set to charging mode */
> +	ret =3D regmap_update_bits(priv->regmap, S2MU005_REG_CHGR_CTRL0,
> +				 S2MU005_CHGR_OP_MODE,
> +				 FIELD_PREP(S2MU005_CHGR_OP_MODE,
> +					    S2MU005_CHGR_OP_MODE_CHG));
> +	if (ret < 0)
> +		dev_err(priv->dev, "failed to set opmode to charging (%d)\n", ret);
> +		return ret;
> +}

Is there a missing curly brace for the if (ret < 0) block? While return ret
executes unconditionally, the indentation is misleading.

[ ... ]
> +static void s2mu005_chgr_extcon_work(struct work_struct *work)
> +{
> +	struct s2m_chgr *priv =3D container_of(work, struct s2m_chgr, extcon_wo=
rk);
> +
> +	if (extcon_get_state(priv->extcon, EXTCON_USB_HOST))
> +		s2mu005_chgr_mode_set_host(priv);
> +	else if (extcon_get_state(priv->extcon, EXTCON_USB))
> +		s2mu005_chgr_mode_set_charger(priv);
> +	else
> +		s2mu005_chgr_mode_unset(priv);
> +
> +	power_supply_changed(priv->psy);
> +}

Could a negative return from extcon_get_state() evaluate as true here? This
might trigger s2mu005_chgr_mode_set_host() erroneously, turning on the 5.1V
boost converter on the VBUS line. If this triggers while connected to an
external power source, back-driving 5.1V could damage the hardware.

[ ... ]
> +static int s2m_chgr_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	psy_cfg.drv_data =3D priv;
> +	psy_cfg.fwnode =3D dev_fwnode(dev->parent);
> +	priv->psy =3D devm_power_supply_register(dev, psy_desc, &psy_cfg);
> +	if (IS_ERR(priv->psy))
> +		return dev_err_probe(dev, PTR_ERR(priv->psy),
> +				     "failed to register power supply subsystem\n");
> +
> +	/* MUIC is mandatory. If unavailable, request probe deferral */
> +	extcon_node =3D of_get_child_by_name(dev->parent->of_node, "muic");
> +	priv->extcon =3D extcon_find_edev_by_node(extcon_node);
> +	if (IS_ERR(priv->extcon))
> +		return -EPROBE_DEFER;

Could registering the power supply before acquiring extcon introduce a race
condition? If userspace (like udevd) reads the usb_type property
concurrently via sysfs:

sysfs read
  s2mu005_chgr_get_usb_type()
    extcon_get_state(priv->extcon, ...)

If this occurs while priv->extcon is still NULL, it passes NULL to
extcon_get_state(), returning -EINVAL.

Additionally, if extcon_find_edev_by_node() defers and returns
ERR_PTR(-EPROBE_DEFER), priv->extcon becomes an error pointer. Passing an
error pointer to extcon_get_state() bypasses its !edev NULL check, leading
to a dereference of an invalid address.

Furthermore, if the muic node is completely missing from the device tree,
of_get_child_by_name() returns NULL. Passing NULL to
extcon_find_edev_by_node() returns -EPROBE_DEFER.

Does this cause an infinite probe deferral loop for hardware that will never
appear? Should this explicitly check for !extcon_node and return -ENODEV
instead?

> +
> +	ret =3D devm_work_autocancel(dev, &priv->extcon_work, extcon_work_func);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize extcon work\n");
> +
> +	priv->extcon_nb.notifier_call =3D s2m_chgr_extcon_notifier;
> +	ret =3D devm_extcon_register_notifier_all(dev, priv->extcon, &priv->ext=
con_nb);
> +	if (ret)
> +		dev_err_probe(dev, ret, "failed to register extcon notifier\n");
> +
> +	return 0;
> +}

Is there a missing return statement before dev_err_probe()? Execution will
fall through to return 0, leaving the driver falsely reporting success but
unable to receive extcon state changes.

Also, the driver registers an extcon notifier, but is the initial hardware
charger mode ever synchronized with the physical cable state? Since
notifiers only fire on state transitions, if a USB cable is already plugged
in during boot, the PMIC might remain in its default unconfigured state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D11
