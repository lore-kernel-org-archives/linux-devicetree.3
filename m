Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EC338A73B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761638; cv=none; b=Dv45GjCYmlsw71/zNoVcVQR+CzqDVDak8GAxzF7NfvOZ4naSbnA5/4et9H9nBVdKMTG+unAc9s7jhbjLNswriXjwvrV7ediQeywWrJRFfHRPZt+Sed76ScbNNX1205DOtSKOk9IeAeZyQMmqxhS5KnrF7Ukz2OzDCYEz7DW5cPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761638; c=relaxed/simple;
	bh=VyLvzBG+iuoj0OI/YPSjtzQw6m/EdXtCcFeVugPhgF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fCEI5Mr6cySqEQ1vX2EL36M4btnaVU5A9P07QfohrIABzlors/ZbgLk7XlIu4Z4+Pr3/spkSmNaQ4U/jxfME+L5t1fjdL654b3EOV84ekPV3MmHdPZZRkj2W30Dj/O5RlBRJ/Dt6pB93/kqyJ42kQadR505sZw7HZidv0p8ER0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CktP54rf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CktP54rf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7F31F000FF;
	Wed, 30 Sep 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790761635;
	bh=pLNZehOw5Gc365xdDG1uUiqrYBjTaCS0tryymumsQr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CktP54rfHNt5/ecMdOmf0notoRsr8N9mN3+NzRELkIzY7kqUhyAQxFbBm6Ii1rVnS
	 niQ0ygGOw0xfR7P+R8GV8pLPqHZm7mBXkyXahwSgMSKKGkLV7bq0dY2ekI08PR9Qqd
	 zQJ4BlsSuVx/cMVqrEncSaTYkXJ0F5RRg4pKPCK2VhPsNiZLyJnoUl4KNyJY4Gjq8X
	 U6t0zdwuHx6+DtrGIz38cSKvmByecCcaRzRNF06XyYB4wH8PiwPj5bBjMED+sxDU/f
	 9q1K4lmuAP31SO4oZqEcf1TpFSRD1GqIyfD4ChjANvESe9vBARG6Ln7+bttdThCR2l
	 /VBD3XdJb+9Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 09:47:14 +0000
Message-Id: <20260930094715.7B7F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pinctrl: memory leak of devm allocations in dt_node_to_map
- [Medium] pinctrl: erroneous removal of preexisting group on error path
- [Medium] pinctrl: out-of-bounds MMIO access due to unchecked DT properties
--

commit e697f1ea4503df3b1dd2739d4e9326a68689dde7
Author: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

pinctrl: ti: Add TDA54 pin controller driver

The TDA54 pin controller splits the pad configuration across two registers:
PADCFGA and PADCFGB. This commit adds support for the pin controller in
the TI TDA54 SoC, mapping device tree configurations to pinmux and pinconf
settings.

> diff --git a/drivers/pinctrl/ti/pinctrl-tda54.c b/drivers/pinctrl/ti/pinc=
trl-tda54.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/ti/pinctrl-tda54.c
[ ... ]
> +static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
> +				struct device_node *np,
> +				struct pinctrl_map **maps,
> +				unsigned int *num_maps)
> +{
[ ... ]
> +	grpname =3D devm_kasprintf(tp->dev, GFP_KERNEL, "%pOFn", np);
> +	pins =3D devm_kcalloc(tp->dev, npins, sizeof(*pins), GFP_KERNEL);
> +	gdata =3D devm_kzalloc(tp->dev, sizeof(*gdata), GFP_KERNEL);
> +	grpnames =3D devm_kcalloc(tp->dev, 1, sizeof(*grpnames), GFP_KERNEL);
> +	if (!grpname || !pins || !gdata || !grpnames) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
[ ... ]
> +	mutex_lock(&tp->mutex);
> +
> +	gsel =3D pinctrl_generic_add_group(pctldev, grpname, pins, npins, gdata=
);
> +	if (gsel < 0) {
> +		ret =3D gsel;
> +		goto unlock;
> +	}

[Severity: High]
Will this leak devm-managed memory if the group already exists?

If a client device defers probe, or if multiple nodes map the same group,
pinctrl_generic_add_group() will return the existing group's selector, which
is a positive integer. Because these buffers are allocated using devm_*
functions tied to the pinctrl device (tp->dev), they will persist until the
pinctrl driver itself is unloaded. This causes a cumulative memory leak on
each probe deferral or repeated group mapping.

> +
> +	grpnames[0] =3D grpname;
> +	ret =3D pinmux_generic_add_function(pctldev, grpname, grpnames, 1, NULL=
);
> +	if (ret < 0)
> +		goto remove_group;
[ ... ]
> +remove_group:
> +	pinctrl_generic_remove_group(pctldev, gsel);

[Severity: Medium]
Could this inadvertently delete a preexisting group in the error path?

If pinctrl_generic_add_group() returned an existing selector and then
pinmux_generic_add_function() fails, the error path jumps to remove_group.
This unconditionally calls pinctrl_generic_remove_group() on the selector,
destroying a preexisting group that might be actively used by other client
devices.

[ ... ]
> +static unsigned int tda54_padcfga(unsigned int pin)
> +{
> +	return TDA54_PADCFGA_BASE + pin * TDA54_PADCFG_STRIDE;
> +}
[ ... ]
> +static int tda54_pinctrl_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	of_property_read_u32(dev->of_node, "ti,proxy-id", &tp->proxy);
> +	tp->base =3D base + tp->proxy * TDA54_PROXY_STRIDE;
> +
> +	ret =3D of_property_read_u32(dev->of_node, "ti,npins", &tp->npins);

[Severity: Medium]
Can an excessively large ti,proxy-id or ti,npins value from the device tree
cause out-of-bounds IO memory accesses?

The proxy offset and npins are read directly from the device tree without
being verified against the dynamically mapped IO resource size. Since npins
is used to calculate register offsets like in tda54_padcfga(), an unusually
large value in a malformed device tree could cause the driver to access
memory outside the mapped IO region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930092020.1047=
221-1-y-abhilashchandra@ti.com?part=3D2
