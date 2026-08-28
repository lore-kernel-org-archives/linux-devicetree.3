Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B940F749
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912458; cv=none; b=DgnD9HGvN+70k2v//NCpRAFw2/yo9FXzGpSymzVglQUQ2lSYfNdHyttj34IYhLeuZEHE7MEbNYkM/GniPmGGFlVWXJuxbNNaG+NGv3pjgHgYKvCAUNISSliO2FeMAc0p0L/9O/jQkI0tjV0DUjXpxAEBrGPjqlze5LZ/XLcJwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912458; c=relaxed/simple;
	bh=e6vjWG/2IqabglMONwXW6fe/jbbgPBxwk5A//o91LS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zb7J6mzdJUX8KzDKd/O+8n1o5FuiFrP2uzFbFtnmo9hNkH+EUs6+p4zb3MFzLTQv4+tIhccNMMF3Uno41z3fTJ7Ba7Mq2sg3UgLh5qOcM87Yh8SSxIHiWnJuFdmfyRdJ7hcN1EHGRhyW5Od7sxRFnWI5pkhwo8Gun+UKfywOPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrzaWRAi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrzaWRAi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065CE1F000E9;
	Fri, 28 Aug 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787912456;
	bh=q1UfVoEno1rsRmBuRnIB4HJAvwzLX5WxzL9zqA9d/h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrzaWRAiS7VNLx5Z/SKbkxsew0BKHLBiZdILxZ+3rPz2vvtwyK6vaQ8zNfG1mUQpz
	 0O56NSJx2dydt0EWISBZ/ZsmHwkWjkCHbj950CluELZsl1ufJx7d56A/YyBadB+Hgm
	 91VRP0Zuavwds8fHxt7qz3OyiuvUM4ykkNJhKZCxdL5ScaYseidHdTDr0jaYkOMXe8
	 obiG/BTWILlJ1jiYI0Ovj9ngwjCmXUd+MPX6LtHs+aY2IJg60Dz6LENUw0IZv037QH
	 sMtZtXVldSZ1tLz/vC0pO92a/YW3At77V3etJNe/CMtYmgP9scjnrWawSHKtqQZ8y/
	 aBOE6iMqT+rxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mux-controller: ti: add driver for event mux router
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Sharma" <r-sharma3@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828100615.1700223-3-r-sharma3@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-3-r-sharma3@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 10:20:55 +0000
Message-Id: <20260828102056.065CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Explicit iounmap() called on a devres-managed memory region on the=
 error path.
- [High] Blocking memory allocation with GFP_KERNEL is used inside a PM sus=
pend callback.
- [Medium] Disabling the mux (state 0) fails to clear the interrupt enable =
bit (MUX_ENABLE_INTR).
- [Medium] Brittle error check using modulo operator bypasses negative erro=
r codes that are multiples of 3.
- [Medium] Masking of original error code from devm_platform_ioremap_resour=
ce drops context like -EPROBE_DEFER.
- [Low] Driver enables COMPILE_TEST but fails to select REGMAP_MMIO, causin=
g linker errors.
--

commit 4ce655ff4ffe60f566fd3744fe5da650083548ce
Author: Rahul Sharma <r-sharma3@ti.com>

mux-controller: ti: add driver for event mux router

The driver supports event muxing routers like gpio mux router and timesync
router. It allows configuration of hardware mux routers using memory-mapped
registers and supports a 3-field format for precise control.

> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index eb34457beaab3..58739a01f0d53 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
[ ... ]
> @@ -83,6 +83,21 @@ config MUX_RZV2H_VBENCTL
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-rzv2h-vbenctl.
> =20
> +config MUX_TI_K3_EVENT_ROUTER
> +	tristate "TI Event Mux Router using MMIO registers"
> +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)

[Severity: Low]
Does this dependency expose the driver to build failures? When compiling wi=
th
CONFIG_COMPILE_TEST=3Dy and CONFIG_REGMAP_MMIO=3Dn, this allows the driver =
to be
built, but devm_regmap_init_mmio() lacks an inline stub when REGMAP_MMIO is
disabled, which can cause linker errors. Should this select REGMAP_MMIO if
COMPILE_TEST is enabled, or depend directly on REGMAP_MMIO?

> +	help
> +	  This is extension of MMIO mux for  timesync router and gpiomux
[ ... ]
> diff --git a/drivers/mux/ti-k3-event-mux.c b/drivers/mux/ti-k3-event-mux.c
> new file mode 100644
> index 0000000000000..2469500d1b48c
> --- /dev/null
> +++ b/drivers/mux/ti-k3-event-mux.c
[ ... ]
> +static int mux_ti_k3_event_suspend(struct device *dev)
> +{
> +	struct mux_ti_k3_event_chip *chip =3D dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!chip->saved_states) {
> +		chip->saved_states =3D devm_kcalloc(dev, chip->num_fields,
> +						  sizeof(u32), GFP_KERNEL);

[Severity: High]
Can this blocking allocation cause a deadlock during system suspend? The
mux_ti_k3_event_suspend() callback dynamically allocates memory using
GFP_KERNEL on the first system suspend. Executing GFP_KERNEL allocations
during system suspend is unsafe because user processes are frozen and devic=
es
may already be suspended, potentially triggering memory reclaim and writeba=
ck
that waits on a suspended device.

> +		if (!chip->saved_states)
> +			return -ENOMEM;
> +	}
[ ... ]
> +static int mux_ti_k3_event_set(struct mux_control *mux, int state)
> +{
> +	struct mux_ti_k3_event *fields =3D mux_chip_priv(mux->chip);
> +	struct mux_ti_k3_event *field =3D &fields[mux_control_get_index(mux)];
> +
> +	if (!state)
> +		return regmap_update_bits(field->regmap, field->reg, field->mask, 0);

[Severity: Medium]
Does transitioning to the inactive state (0) fail to clear the interrupt
enable bit? The active state (1) forces MUX_ENABLE_INTR to be set. However,
the inactive state updates the register using only field->mask with value 0.
Because MUX_ENABLE_INTR is not part of field->mask read from the device tre=
e,
regmap_update_bits() will leave the hardware mux channel partially enabled.

> +
> +	return regmap_update_bits(field->regmap, field->reg, field->mask | MUX_=
ENABLE_INTR,
> +		field->value | MUX_ENABLE_INTR);
> +}
[ ... ]
> +static int mux_ti_k3_event_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get base address\n");

[Severity: Medium]
Does hardcoding the return value to -ENODEV break deferred probing? Masking
the original error code from devm_platform_ioremap_resource() discards
context like -EPROBE_DEFER, preventing the core subsystem from correctly
deferring the probe when resources are unavailable.

> +	} else {
> +		regmap =3D devm_regmap_init_mmio(dev, base, &mux_ti_k3_event_regmap_cf=
g);
> +	}
> +	if (IS_ERR(regmap)) {
> +		iounmap(base);

[Severity: High]
Does this explicit iounmap() cause a double-free of the ioremap mapping?
Because base was allocated using devm_platform_ioremap_resource(), the
devres framework will automatically attempt to unmap it again during the
probe rollback if devm_regmap_init_mmio() fails.

> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get regmap\n");
> +	}
> +
> +	ret =3D of_property_count_u32_elems(np, "ti,reg-mask-val");
> +	if (!ret || ret % 3) {

[Severity: Medium]
Could this error check bypass negative error codes that are multiples of 3?
If of_property_count_u32_elems() returns an error code like -EOVERFLOW (-75=
),
ret % 3 evaluates to false. This results in the driver calculating a negati=
ve
num_fields and proceeding to devm_mux_chip_alloc() with a wrapped size,
hiding the true configuration error and failing with -ENOMEM later.

> +		ret =3D -EINVAL;
> +		dev_err(dev, "ti,reg-mask-val property missing or invalid: %d\n",
> +			ret);
> +		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828100615.1700=
223-1-r-sharma3@ti.com?part=3D2
