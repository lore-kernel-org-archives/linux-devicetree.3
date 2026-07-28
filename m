Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D675135A53
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202502; cv=none; b=N9eOw4wh9q1hAgLOVh53NZ5W8oLZ25yA7LlDahvcNJ5ki2Kv3lDDg/uoFZ5ihE8Pj6zlmYA0caHGZ1+wr68MSHi6F/ONi8Nb78Sx1izqZH55kdNbJ0Kh0k3OXlOdqEnEQUB6r4rgCa7Gtv8iXbL1mIHhpEqoRsdFM/iPPmvguzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202502; c=relaxed/simple;
	bh=MJegaleSO4/37a1J8Voa+pfX3E2SeDYZYnSPybOfpzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XXCqjn3Cst6r25jDxc7SPIUnvF6FxaRYiRjoZSEgM/Vrd8W1Aio/vB3bZK4aFPtm2DBa4ULHgER9C/dUZgHqOiFo2tA/OT2YjoYHYifNnfUY/gm+csqpiw/8SQNTVEuPCnzmrlkXXzbVhh33WyLDbQk5gKeKElmklne9qjobUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiZ7rqTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiZ7rqTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7501F00A3F;
	Tue, 28 Jul 2026 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785202500;
	bh=ntEyAuYZl1W43LA8FTdBZljm34CX40uAb24lQQqwZRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fiZ7rqTPgtP93cK5BXySUAX20Rc5tB8odpBrONWavS1daP+AYhmVfJFQWLJ6KBRBa
	 aWhiLRzivzedCJFXMjArQcIehIYNWlJDwUgYrDLxfogcUO/E9pQhE+kRIBKYupziep
	 lv3C8MEhou8ai2GbWytK5yqcJDomkkkJJT7V2aYv2sh4hB8feoHWwgi9OsuL5v5IVA
	 0qx0xUjTgcOBfL3tn1alDgl6jYs8jBw6PqkEG6EBm0OWSd5SL9njaa/UgPfqAw6imz
	 su2YG9rlud+hOQk9SW2UN8bOP+Kr/8TxagFjH3IWHKDpzc0st8qviAy+xirmk0zbsW
	 +eyqT332yhZfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 01:34:59 +0000
Message-Id: <20260728013500.6B7501F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver leaks the runtime PM usage counter on probe failure and=
 module unbind, permanently preventing the device from suspending.
- [High] The driver acquires an exclusive reset control but never deasserts=
 it, potentially leaving the hardware in a permanent reset state.
- [High] Use-after-free risk due to accessing a device tree property string=
 after dropping its node reference.
- [Low] The dev_pm_ops structure is unconditionally assigned without using =
the pm_ptr() wrapper, violating power management subsystem guidelines.
--

--- Patch [2]: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI U=
SB controller glue ---
commit fc962bfb4e19df62045a5d6f590433718732e755
Author: Thanh Quan <thanh.quan.xn@renesas.com>

usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue

This commit adds a new driver for the glue logic surrounding the DWC3
USB controller core on the Renesas R-Car Gen5 SoC.

> diff --git a/drivers/usb/dwc3/dwc3-rcar-gen5.c b/drivers/usb/dwc3/dwc3-rc=
ar-gen5.c
> new file mode 100644
> index 0000000000000..344d0851559f5
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c

[ ... ]

> +static int dwc3_rcar_gen5_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	reset =3D devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control=
\n");

[Severity: High]
Does this leave the hardware in a permanent reset state? We acquire the
reset control here, but it doesn't look like we ever call
reset_control_deassert() on it later in the probe function.

[ ... ]

> +	ret =3D of_property_read_string(subnode, "maximum-speed", &maximum_spee=
d);
> +	of_node_put(subnode);
> +	if (ret)
> +		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\=
n");
> +
> +	priv->use_usb3_flow =3D !strcmp(maximum_speed, "super-speed-plus") ||
> +			      !strcmp(maximum_speed, "super-speed");

[Severity: High]
Can this cause a use-after-free read?

The property string pointer maximum_speed points directly into the device
tree node's memory. By calling of_node_put() before the strcmp()
evaluations, the node memory could theoretically be freed if an overlay
is concurrently removed.

Should the of_node_put() happen after we're completely done with
maximum_speed?

> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to resume runtime PM\n");
> +
> +	return devm_of_platform_populate(dev);
> +}

[Severity: High]
Does this leak the runtime PM usage counter if devm_of_platform_populate()
fails? It looks like we return its error code directly without calling
pm_runtime_put().

[ ... ]

> +static struct platform_driver dwc3_rcar_gen5_driver =3D {
> +	.probe		=3D dwc3_rcar_gen5_probe,
> +	.driver		=3D {
> +		.name	=3D "renesas-rcar-gen5-usb",
> +		.of_match_table =3D dwc3_rcar_gen5_of_match,

[Severity: High]
Does this driver need a .remove callback?

Without one, the PM usage counter incremented during probe via
pm_runtime_resume_and_get() is never dropped when the module is unbound,
permanently preventing the device from suspending.

> +		.pm	=3D &dwc3_rcar_gen5_pm_ops,

[Severity: Low]
Should this use the pm_ptr() wrapper? Assigning the dev_pm_ops structure
unconditionally leaves dead code in the kernel when CONFIG_PM is disabled.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728011656.4650=
40-1-marek.vasut+renesas@mailbox.org?part=3D2
