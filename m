Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9C3B4439
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944734; cv=none; b=qR5DjMLxLnl+kgZiDJx0D0TqoD2ZlHIvk8jCuIfXyPq2TEJxLdmmUZO9m9XCfqtNfwL2PXVNgdtHSO37yKqEODIW+qLSoEfan2JCFAXwhenb8O54zkiWzdICyrH2snZw5YhxE6NZpUBAPr10MPkfdszcZo0bHGveRcXu5SdSt68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944734; c=relaxed/simple;
	bh=bIi5s7l1Ea4AiUiWlLMaC2AFbTKEVaCSda/bYKQSrYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4WlqnclYKPJt/i7VqlFf7LoSE1RmXsOUrPboSDmzNXHNkouqCPaS8/g3A/bZSEfwHyQXQB0YYicafakcfzyOk8jOYgqai/8kYLl4q1yPoLpx5G0DOz7IEFWohB6FxH0zR6n2mzsLMi8aiW6ZzOE9Br2HNPIQNOryhxd+PFKGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exk/Q1Hn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exk/Q1Hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3D11F00893;
	Mon,  8 Jun 2026 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944733;
	bh=gcz4jibTG256tk/lCwoK1eSIisT42A15aP7csXjGcfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exk/Q1HnUIlFFl8pyvgd6X+XPL6+h+BMgvVjYD/FXJLhuj+6knDB0LCAXe2um5UHS
	 V6br3YUGUL9I1ldMyUdzdR405c/Izt88lQUxgb/o/Ls+qi18afEVnzBMrWTydPT5qe
	 ga3xvsgnbUR3SjdM5G1Yc6xmtJsgAxGNdPA1XU3H+OcBMxZnF2Dx44L5zNVpOXjdL7
	 /Fd2hE5AQhyUyTKsC0MAzk9WYx9UN7EzaOPNHQ/MgX3g4pFALEfqghLBhWgFEG7RIH
	 TGliYZNkS6KuI2IcfZftz80tl60Q/gCEWGObicmrpEQi5x3eNcBUyqNGC3kp/iwFAP
	 UypKr0PRZqa1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608183801.1257051-4-salih.erim@amd.com>
References: <20260608183801.1257051-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:52:12 +0000
Message-Id: <20260608185213.2D3D11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional probe failure for I2C devices due to incorrect handl=
ing of optional IRQ.
--

commit f3303ed1c4a2a87b882fc5ca294a42e9cb520b70
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block, allow=
ing
an external master to read voltage and temperature measurements. It explici=
tly
omits event support as the I2C path does not have an interrupt line.

> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/versal-sysmon-i2c.c
[ ... ]
> +static int sysmon_i2c_probe(struct i2c_client *client)
> +{
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init(&client->dev, NULL, client,
> +				  &sysmon_i2c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* I2C has no IRQ connection; events are not supported */
> +	return sysmon_core_probe(&client->dev, regmap);

[Severity: High]
Will this unconditionally fail to probe when called from the I2C driver?

Looking at sysmon_core_probe() in versal-sysmon-core.c, it attempts to
get an IRQ and treats any negative return as a fatal error:

int sysmon_core_probe(struct device *dev, struct regmap *regmap)
{
	...
	irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
	if (irq < 0)
		return dev_err_probe(dev, irq, "failed to get IRQ\n");

Since the I2C device tree node lacks an interrupts property, fwnode_irq_get=
()
will return a negative error code (such as -EINVAL), which causes the probe
to fail entirely before it can successfully initialize the device.

Should the core probe gracefully handle missing optional IRQs so that the
I2C driver can succeed?

> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608183801.1257=
051-1-salih.erim@amd.com?part=3D3
