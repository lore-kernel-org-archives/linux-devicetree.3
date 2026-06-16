Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902B29CB57
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617468; cv=none; b=atLrHi7XuNkkOjyDI8BzhuY2sNOGugpBNr5xBib6TbbNX/iaaCqkffsz6Q3LjxhS87XDmq8fzdhAMQGxc4i6JuiUUcWixXDdK7MXOVXFVt0zZfrsx29DLpM8TlW/cyAhW4AxyMWAm0e6NEuwPQaUfXUipeIbt2QiaWIAiBSnzaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617468; c=relaxed/simple;
	bh=t8xnma6Kl6YuvgJySZUlMh+udppcxkm+UE1sq0T0nfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X9xABmPYpzXAeqkCxc6nxE4qmeyyh9D9usIjm9SnRg02bFuDL0vrCjjZ21fGwHMbI5Km6IfrVlc9wHc6cVO4ctL7K8zAxWXoZM/xj5iEGTSzLY3iq8UQKi8NbdhNh9aHUUg8wc7p9bSWKANUH/emeT6DjMhGX+vI8PVTPaZfnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7+KBkR9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7+KBkR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6D01F000E9;
	Tue, 16 Jun 2026 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617467;
	bh=BNsXcTImhAF26E189emDc+2rOOsXp0WrgKMraNzYhKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7+KBkR9tYg4HrKGPa3Ane/tuSfVhh3ZnDvAWCc3u+KqUjBujDBUMfZt4EMNwEEmH
	 MP2DlUAL4XuvpSNqGjjXj8MixShDN074gwDYU8xnbXG0I8CyE0LPEWzfTXkvJCxSRF
	 cPQgaMU+MgOWJgw4sD+CwqsDLOFPLBvT+sTEmMh13JOVQxvpy/CxqhM9T94NxtDWib
	 mOsTDhfWwutaBuCDmPchHH/+mMSpC5ixRDmMJ5UgivZ5qJNLAT8KaRPJOjinlbbTLF
	 nw54+l10n55jSHhjw7VyCD4BQHvMeWAUOO+TXI/YamuBEWDJdLGRw+wf5IOESrFDna
	 Ym7ZO9Kl85LlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616131559.3029543-4-salih.erim@amd.com>
References: <20260616131559.3029543-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:44:24 +0000
Message-Id: <20260616134426.7A6D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] If a device tree specifies an IRQ for the I2C device, the core dri=
ver will register a hardirq handler that calls sleeping I2C regmap function=
s.
--

commit 08d83b16d0694386536f5b4f39bdb131024076df
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block. It
creates an I2C regmap backend and delegates to devm_versal_sysmon_core_prob=
e()
to initialize the device.

> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> index 0000000000000..cd8d5846ff9b2
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
> +	return devm_versal_sysmon_core_probe(dev, regmap);

[Severity: High]
If a device tree incorrectly provides an interrupts property for the I2C
node, will devm_versal_sysmon_core_probe() register an interrupt handler?

Looking at devm_versal_sysmon_core_probe() in versal-sysmon-core.c:

	irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
	...
	if (irq > 0) {
		...
		ret =3D sysmon_init_interrupt(sysmon, dev, indio_dev, irq);

If an interrupt is registered, the handler sysmon_iio_irq() will run in
hardirq context, acquire a spinlock, and call regmap_read():

	guard(spinlock)(&sysmon->irq_lock);
	if (regmap_read(sysmon->regmap, SYSMON_ISR, &isr) || ...

Because the I2C regmap backend uses i2c_master_recv() which can sleep,
won't this trigger a sleeping in atomic context panic?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616131559.3029=
543-1-salih.erim@amd.com?part=3D3
