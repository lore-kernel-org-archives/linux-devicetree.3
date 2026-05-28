Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041D36C0CE
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956147; cv=none; b=d8YEbQd0qKF8zqDCJ6SKVRJ/u9Im054qeUqm+IaQA2+t7UJ1dxnKFtYinTxHLiffDKZ1sRirRlrPmnSdOynYitWmdvI6RQPPZR8tCyg7yGu8zLC9A26ro2uLSHUokHItixfKq349X3+xNaTP0sRMrJzicvxrSamaCPbV0jYsKfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956147; c=relaxed/simple;
	bh=1daAnqLthFDykxVw6VMYhwiRU/fRwVpnxGCbCjDC26k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hIgR71PPL3t83g1MlnvqGhG9A3kjesB7yX4jV3O0mnmBBwEyP7WL6xxEDBloK+0E0vpU0rhrihINA1T/WLhtgrGcUk6GtQw51JIJqqkvvjwBuxvK82+4y2ip2dAizSwO0NgkfGdo9ke7AOA9CfJo9WwEmqEd4tqV9fAVRE/O73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+RXatKZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+RXatKZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51ABC1F000E9;
	Thu, 28 May 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956145;
	bh=4e2dhUG239AKunU1wFvdVzwxmMD0g5OSsUVIMzv5PgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+RXatKZSkBAeWyL27+fT6iT3xvrmty0u2XVPitJTylKI536fO4EAdCoZYDKoUTFz
	 o44m77Gvzoczj+oGT1jdu05CFmEW+voRVkxu5j/YWPk/RsMB5HXngDgyMGM8QnVpJY
	 pH/zLNBxCrHF9fj57RTORJRMXL36oMEE8NppU3KMxbbq028czeEDPgQaHoF7IB4/HV
	 ackkiPRVrOE4OgSEKEjbdCOtGZWg6eDIUIzE/l4bKuF+FMwWGYVjNHOWMzuSJ37OEM
	 +MZhPVZQlQmenGLrEuSKEf9frUgmd3Cw8bL6Y2qfABJKZApL02qYeK96PK+1DrpxvE
	 WW0EmyRXzdtZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-upstream_i2c-v30-2-5d4f9adc3530@aspeedtech.com>
References: <20260528-upstream_i2c-v30-2-5d4f9adc3530@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 08:15:44 +0000
Message-Id: <20260528081545.51ABC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `struct i2c_timings timings` variable is declared on the stack=
 without initialization. If the `clock-frequency` device tree property is m=
issing, `timings.bus_freq_hz` remains uninitialized, leading to undefined b=
ehavior and incorrectly bypassing the fallback logic.

Pre-existing issues:
- [High] The driver disables the I2C controller and asserts hardware reset =
before unregistering the I2C adapter, leading to hanging I2C transfers duri=
ng teardown.
--

commit 295034b0d28e53ac8b8ea47c906ff258ad2c83f6
Author: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: i2c: aspeed: Read clock-frequency via i2c_parse_fw_timings()

This commit updates the Aspeed I2C driver to read the standard
clock-frequency property using i2c_parse_fw_timings(). It falls back to
the legacy bus-frequency property only if the standard property is absent.

> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index a26b74c712061..137889e57ddc6 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -1000,6 +1000,7 @@ static int aspeed_i2c_probe_bus(struct platform_dev=
ice *pdev)
>  	const struct of_device_id *match;
>  	struct aspeed_i2c_bus *bus;
>  	struct clk *parent_clk;
> +	struct i2c_timings timings;

[Severity: High]
Does the timings structure need to be zero-initialized here?

>  	int irq, ret;
> =20
>  	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);

[ ... ]

> @@ -1025,12 +1026,18 @@ static int aspeed_i2c_probe_bus(struct platform_d=
evice *pdev)
>  	}
>  	reset_control_deassert(bus->rst);
> =20
> -	ret =3D of_property_read_u32(pdev->dev.of_node,
> -				   "bus-frequency", &bus->bus_frequency);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev,
> -			"Could not read bus-frequency property\n");
> -		bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +	i2c_parse_fw_timings(&pdev->dev, &timings, false);
> +	if (timings.bus_freq_hz) {

[Severity: High]
Since use_defaults is passed as false to i2c_parse_fw_timings(), if the
clock-frequency device tree property is missing, i2c_parse_timing() will
not modify timings.bus_freq_hz.

Could this leave timings.bus_freq_hz with uninitialized stack memory,
which might evaluate to true and bypass the fallback to the bus-frequency
property?

> +		bus->bus_frequency =3D timings.bus_freq_hz;
> +	} else {
> +		ret =3D of_property_read_u32(pdev->dev.of_node,
> +					   "bus-frequency",
> +					   &bus->bus_frequency);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"Could not read clock-frequency or bus-frequency property\n");
> +			bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +		}
>  	}

[ ... ]

>  static void aspeed_i2c_remove_bus(struct platform_device *pdev)
>  {
>  	struct aspeed_i2c_bus *bus =3D platform_get_drvdata(pdev);
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&bus->lock, flags);
> =20
>  	/* Disable everything. */
>  	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
>  	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> =20
>  	spin_unlock_irqrestore(&bus->lock, flags);
> =20
>  	reset_control_assert(bus->rst);
> =20
>  	i2c_del_adapter(&bus->adap);

[Severity: High]
This is a pre-existing issue, but does the I2C controller get disabled
before child devices are unregistered?

In aspeed_i2c_remove_bus(), the driver disables the I2C controller and
asserts the hardware reset before calling i2c_del_adapter().

Since i2c_del_adapter() coordinates the removal of registered I2C child
devices, their remove() callbacks might issue final I2C transfers to
gracefully shut down. Because the controller is already disabled and held
in reset, could these transfers hang and expire the timeout, leading to
teardown delays and inconsistent hardware state?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-upstream_i=
2c-v30-0-5d4f9adc3530@aspeedtech.com?part=3D2
