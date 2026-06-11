Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF133BB114
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217482; cv=none; b=P1OZYyPevS52/ZFcagGoMmXxNJCMzWoENsUhmgVm9+D2TjSqsbJYeSpet0n/eIWLKgHY2A+IbwFBX+1F8bQjRxZPPpuEWMNN8+CZEl8H+y588uErNoW+E5+K5+smvr8BColO1zCNGYshPDp3q+psfJ9q0HDOZhx+vb0Bj3N9P9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217482; c=relaxed/simple;
	bh=Fj8z2pmrJALHHoHgaNWwxSZ70MUkX31TLVusSi5Zos0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nFm+Y/we53j0mQljpFnO2mribRYKXS16rQDoJS/KoXrgor5yUFDjA5p627yL7QTNhg4TLWyE9uK8BsgWG2suQnr/McBVPTpvqI/8tmFBJxdLSY6gR39rvxTHRWdXG4XaOu+NDz1Xv/DKfmz9NNjqLhV2h+37f0qFGJkZjCkYzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6uEnvGh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6uEnvGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939FA1F000E9;
	Thu, 11 Jun 2026 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781217476;
	bh=z1v0LiANz9JZEgnWINPPuavyAy6lppCVKBjvZsjnnuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k6uEnvGhiIrnCzgeGVi4G3v8uRRhT3dNNdaa88m9gn+VP0WEpb5fndqpXslf7HiqM
	 JoTjJVW8q21XR0P/EOikd+pVrZekq+TnTrXqxIhjFmNQPS5w1BVtmVSFjNP7h0Gl1f
	 UoO6vYVV00v+WGwdgNPwxTZBIDa7oKddaTggHufvopPWGfGWVcUtRUE9BTxDhdV1Ti
	 ZQxFpDzNJxZwtusDYaaqoQr79S09WEzrDbIqJzphu6dyL1buMieUa/fyWuOiTwnk6i
	 kjpkXkwgJKCPKsLNxqHW76HwWCPRk1UP2Uvp0v3UtW3hgX8iTcCBj5yt8jC9sP+dHK
	 1p1XN1QfSD3+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611222738.2035062-4-salih.erim@amd.com>
References: <20260611222738.2035062-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 22:37:56 +0000
Message-Id: <20260611223756.939FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver unconditionally registers an interrupt handler based on=
 the Device Tree, which causes a panic on I2C systems because the I2C regma=
p backend cannot sleep in atomic context.
--

commit adf35a1c0d89c3413cd1a863d9f01cfad15d4e03
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block. It
enables external masters to read voltage and temperature measurements throu=
gh
the same register map used by the MMIO path, though events are not supporte=
d.

> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/versal-sysmon-i2c.c

[ ... ]

> +static int sysmon_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init(dev, NULL, client, &sysmon_i2c_regmap_confi=
g);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* I2C has no IRQ connection; events are not supported */
> +	return sysmon_core_probe(dev, regmap);

[Severity: High]
If a misconfigured Device Tree provides an interrupts property for the I2C
node, will this unconditionally register a hardirq handler?

Looking at sysmon_core_probe() in versal-sysmon-core.c, it parses the IRQ
directly from the fwnode and sets up the interrupt if found:

    irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
    ...
    if (irq > 0) {
        ...
        ret =3D sysmon_init_interrupt(sysmon, dev, indio_dev, irq);

If that interrupt fires, sysmon_iio_irq() attempts to take a spinlock and
perform a regmap_read():

    guard(spinlock)(&sysmon->irq_lock);

    if (regmap_read(sysmon->regmap, SYSMON_ISR, &isr) ||

Since the I2C regmap backend requires sleeping to perform I2C transfers,
won't executing this over I2C in a hardirq context cause a "scheduling while
atomic" panic?

Does the I2C transport need a mechanism to explicitly instruct the core pro=
be
to bypass IRQ parsing?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611222738.2035=
062-1-salih.erim@amd.com?part=3D3
