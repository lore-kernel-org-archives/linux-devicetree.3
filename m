Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919A21256C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539012; cv=none; b=mg6hSlkGG1mUtDZ/YpeDxs//DoJKin6vcxRgf8o28dgN3boMREi7eEZ9h5b6jmJVo4Jx0ED+YQm6pjR7FtcWphCjbuX3inCNoa9u1OAapHpOvbkxwkyisTVee4cbAe31gamTLXKovEPiu+soSznZ8ivmzPJA2q5sQl8UnL3P/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539012; c=relaxed/simple;
	bh=UpVd+iq+foZaM0AvHYoHAizzErM5ZU5Bc8kOhkWkKyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SK+JSjYP8xcctfqfIvYp3LUkJL7I8HGnFBJpj86Q9Rv6mJ6lxgUBgu6mxN6B93CcCgsT82PBrgRbksH+5T5bCsjORqwAVYrvF3PQzEcMQDQsI01sh8WkqExP9PF8sKO899/P38bKedsQrofByMPtas7Ohedu8YhpxVnOIM52oAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqT+cdlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqT+cdlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1201F00893;
	Thu,  4 Jun 2026 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539010;
	bh=7DrHoz8VcZIF0YLP7Tbv5XIB1QAtFEGuPec5nb/9tqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqT+cdlqYSW4BUAYjdwRceKtpqJJFAnFTcT6i4NElZAQCxW5psKTWi8eLm3n5lLu7
	 R3TSBNZLmYLT/TOEVwiS025iPjMLpa80pTZJCH5RWF8eiPfWXekPqAKRHynaT1Mi0e
	 sCYUzabCpUGoGhcMAU93gEO9lKDqtS5jRzI5i547eIPfqrUb5i35XkbXSSoZmM3nq4
	 uHR4n2fkBCZM93m4S3Ft2EdhWwzFRbsJRLLb1rQmS0A/6zMRwR45SMQt8YoevfaiIP
	 fz9D7Cn5Y1e2FxxpJg+NPbRW3rEZxamZB95WFDionMWN8FyWRVWkvk2B7pQnpBqMyK
	 MAJchpuyECfxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604015848.18643-3-wanghongliang@loongson.cn>
References: <20260604015848.18643-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:10:10 +0000
Message-Id: <20260604021010.8B1201F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Calling `devm_clk_get_optional_enabled()` dynamically inside `ls2x=
_i2c_adjust_bus_speed()` causes unbounded devres memory leaks, clock refere=
nce/enable leaks, and introduces an AB-BA deadlock during I2C transfers.
- [High] The prescale calculation divides by `div` without verifying it is =
non-zero, creating a division-by-zero vulnerability.
- [High] The driver silently ignores clock acquisition errors and fails to =
propagate `-EPROBE_DEFER`, breaking probe deferral.
--

commit feb6cc9d7c19ebc975910d8ee72838e62efa3d45
Author: Hongliang Wang <wanghongliang@loongson.cn>

i2c: ls2x: Add clocks property parsing and adjust bus speed

The i2c-ls2x driver supports dts and acpi parameter passing.
In dts, uses clock framework, by parsing clocks property to
get i2c bus reference clock, and define the div of reference
clock by device data.

> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af9..46dafa11b3013 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c
[ ... ]
> @@ -107,12 +117,30 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>  	else
>  		t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> =20
> +	if (dev_of_node(dev)) {
> +		clk =3D devm_clk_get_optional_enabled(dev, NULL);

[Severity: High]
Is it safe to call devm_clk_get_optional_enabled() here?

ls2x_i2c_adjust_bus_speed() is called by ls2x_i2c_init(), which runs during
probe(), system resume(), and error recovery paths in ls2x_i2c_xfer_one().

Calling a devm_ function repeatedly at runtime will cause unbounded devres
memory leaks and clock reference/enable leaks.

Additionally, clk_prepare_enable() acquires the global clock framework's
prepare_lock. Since ls2x_i2c_xfer_one() executes while the I2C core holds
adap->bus_lock, this creates a bus_lock -> prepare_lock dependency. If an
I2C-based clock provider exists on the system, it will try to acquire locks=
 in
the reverse order, which could result in an AB-BA deadlock.

> +		if (!IS_ERR_OR_NULL(clk))

[Severity: High]
Does masking the error here break probe deferral?

If devm_clk_get_optional_enabled() returns -EPROBE_DEFER because the clock
provider hasn't initialized yet, the error is swallowed instead of being
propagated to the probe() function. This could result in the driver binding
successfully without its necessary clock being enabled.

> +			pclk =3D clk_get_rate(clk);
> +		else
> +			pclk =3D LS2X_I2C_PCLK_FREQ;
> +
> +		div =3D priv->div;
> +
> +		val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

[Severity: High]
Can div be zero here, causing a divide-by-zero panic?

div is populated via device_get_match_data(). If the device is dynamically
bound via sysfs or matches a fallback compatible without data,
device_get_match_data() returns NULL, making div 0.

> +	} else {
> +		/* clocks and clock-div are only ACPI properties. */
> +		if (!device_property_read_u32(dev, "clocks", &pclk) &&
> +		    !device_property_read_u32(dev, "clock-div", &div))
> +			val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

[Severity: High]
Can clock-div be zero in the ACPI properties, also causing a divide-by-zero
panic?

If the firmware provides clock-div =3D 0, this will result in an unhandled
division-by-zero exception.

> +		else
> +			val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> +	}
> +
>  	/*
>  	 * According to the chip manual, we can only access the registers as by=
tes,
>  	 * otherwise the high bits will be truncated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604015848.1864=
3-1-wanghongliang@loongson.cn?part=3D2
