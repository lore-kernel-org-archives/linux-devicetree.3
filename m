Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271B55D888
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091544; cv=none; b=l8rb79EPnoX1vZURkD4BJvg4TEwXDNVPLg3fZGDy4pKjY3CVWz6GJCB13M6DEtqHuhrI6drb2qYr1BP5Y8A0UwoD4iI76pMQfObd6kzC3tG1OGozzyWANwyN8Gmx/BNH4S+zA5y58s1ofT8LkRmmdtYvxD3jBeg3pe2KsW/++JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091544; c=relaxed/simple;
	bh=+JXLAV6v8woE1gkcSsznA5qX8B6kVzKRHcLH4jji2wU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDP+CDz/9Kvnx1Aiy3y/zcq9N9p1gmTA3IAa4tCPkfgk+oy5jHnHh4evlDAEMKJqmhNa5b5/+w70APnwTJsMAZMRtzCllsr9IB9ad0piF4xj5RdMI/z8Gk4JeAA3bBdJKZuAUz4OktGyESmHzyaIAV5N2xF3fjBwlilJBsaVGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF7AxkCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF7AxkCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BEA1F00893;
	Tue, 22 Sep 2026 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091543;
	bh=/L//Db6QMjIhKYim1X3AbTYL02GSw97y30shOd9Qno0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lF7AxkCclMw5w5ryEvrL6xI4ngjYn8SzJ+VZtx7tr/OZtYYPxQbxYTccuBHXO/M81
	 /c9SKfEJL0gWT7DgQBj7/mR6rvly/Z1ZStxcATDQLJMCo/d79+Wv4++HBwJ4zM+qT1
	 csfiLLS9m4p9Xdl8boNI+tIBwMBbcW1jkfCZWgABiJLscevZ8QCyc+nhjCbDCn6Tj3
	 +vzn/VnV1fMsY1ac2PESkIQjrNX1RMV9iBvv8Oo3jKvlhzNS+nsoToHnsMPReJwHsz
	 HJIwXWMrGb/WkWGpzmUgT7mTDUFzCKg6A+EPX4/3Ydz/XKb26Gc50xz5kIXSjzsmmM
	 Ghgi5MD/FoJGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] regulator: rpi-panel-v2: Add vcc-supply support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-rpi_reg-v3-2-9214321c4070@oss.qualcomm.com>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
 <20260922-rpi_reg-v3-2-9214321c4070@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:39:02 +0000
Message-Id: <20260922153902.C3BEA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] regulator: leaked enable count on vcc regulator during probe failu=
re and unbind
--

commit db1c448e80eee7e671cad78e558097db3e8ec366
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

regulator: rpi-panel-v2: Add vcc-supply support

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. This commit uses devm_regulator_get() to obtain the vcc supply
and enable it at the start of probe.

> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulat=
or/rpi-panel-v2-regulator.c
> index 30b78aa75ee38..e54d675962e71 100644
> --- a/drivers/regulator/rpi-panel-v2-regulator.c
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c
[ ... ]
> @@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *=
i2c)
>  		.parent		=3D &i2c->dev,
>  		.reg_set_base	=3D REG_POWERON,
>  	};
> +	struct regulator *vcc;
>  	struct regmap *regmap;
>  	struct pwm_chip *pc;
>  	int ret;
> =20
> +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> +	if (IS_ERR(vcc))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> +				     "Failed to get vcc supply\n");
> +
> +	ret =3D regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");

[Severity: High]
Could this introduce a regression where a matching regulator_disable() is
missing in rpi_panel_v2_i2c_probe() for subsequent error paths and driver
remove callbacks?

> +
>  	pc =3D devm_pwmchip_alloc(&i2c->dev, 1, 0);
>  	if (IS_ERR(pc))
>  		return PTR_ERR(pc);

[Severity: High]
If this allocation fails in rpi_panel_v2_i2c_probe(), does the function
return directly and leak the vcc regulator enable count?

The vcc regulator's enable count is incremented via regulator_enable() but
is never decremented. When the driver unbinds or probe fails, devres calls
regulator_put(), which triggers a WARN_ON(regulator->enable_count) and
permanently leaks the underlying regulator device's use count. This prevents
the power rail from ever being physically disabled. On systems with
panic_on_warn, this triggers a kernel panic.

This regression is reachable locally via device unbind, or automatically
during boot if a downstream resource causes a probe deferral.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-rpi_reg-v3=
-0-9214321c4070@oss.qualcomm.com?part=3D2
