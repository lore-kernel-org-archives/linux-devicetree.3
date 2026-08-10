Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D573612E0
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348951; cv=none; b=KwcGnqrHmkeEmAFw63bVaUihGwPXP6ujDvscYJvBUFsgY8SI997CnWIEaeXV43cfRig6+1N/qLDjhA6x/cSEvyfnwjvgU01I1EjEbnMpVgVcnqz3dMnKMsEo2ZY3k6PmLLdJeyRo6v/QFldnhVFlT7izxrj9McQmRMTsBMgpJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348951; c=relaxed/simple;
	bh=Y79Rrj1iCs2DymD/rM7kX5tBfXxIyMiwr9IPvzbgLJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qp4htKnc99ZzdGw0axrw9rsZeG7qOVPS1PuMVq1IID0aIxJ/YL3pNOA+Qlh4BGCv+s0rVbNRYTTE2wSOeK/99UUzzYly7cS935UU47KX6odAYL1BQ67yPuqE5CGM3o7h/RtK9J/NO8xnz/E8HvK0dQezEVGpgzH6u4ykMNwRAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZOEP3Vb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZOEP3Vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8221F000E9;
	Mon, 10 Aug 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786348950;
	bh=19flgh5gQLk+Tbh3Ul6AGZCiN9CfiZ2IKmsZvMVUex8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZOEP3Vbh0p5cdaB9DLQGKEkEpaulm/pRnbBK8osn4Nr6HbX4A8WPNuexn7QXY6bW
	 +4vq7epaVbRiCKVF6+jKY0bmMkabtu45BZftePZ2r7I8Df/oTE/4kBAIudKeWFdMnm
	 6ipSiMshtUoQlqmscJFHo7kgfbcR6D1scDrAusopdjshB+4qCNpOgN9++cvVBxml2N
	 oNRYa2coCWv+9sf3CrKaoWDDAWLvr0PXaooJe5dNPH9TEoPQWUyYqT9PfOeyL5ztYd
	 y38UG42kP2HsCCWLkCgo+lQu45SYRNYWNsxhum/59m2Wrk+pBhttZ/zcCofC3bgIP1
	 3rJjGChqKM1rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260810074927.25284-3-wanghongliang@loongson.cn>
References: <20260810074927.25284-1-wanghongliang@loongson.cn>
 <20260810074927.25284-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 08:02:29 +0000
Message-Id: <20260810080230.4C8221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] 64-bit integer division using the '/' operator causes a linker err=
or on 32-bit architectures.
- [Medium] The ACPI fallback path reads the generic 'clocks' property as a =
single 32-bit integer frequency, violating standard property semantics.

Pre-existing issues:
- [High] Hardware interrupts are enabled before the IRQ handler is register=
ed.
- [High] The driver lacks a remove function, failing to disable hardware in=
terrupts during driver unbind.
--

--- Patch [2]: [PATCH v9 2/2] i2c: ls2x: Add clocks property parsing and ad=
just bus speed ---
commit d881529f1ceaa7d91f234c648749c3641859d689
Author: Hongliang Wang <wanghongliang@loongson.cn>

i2c: ls2x: Add clocks property parsing and adjust bus speed

This commit improves I2C bus speed calculation across platforms by parsing
the real I2C bus reference clock (PCLK) and div from DTS or ACPI, instead
of using fixed values.

> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af9..65451fc9145b7 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c
> @@ -107,12 +116,13 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>  	else
>  		t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> =20
> +	val =3D ((u64)priv->pclk * 10) / ((u64)priv->div * t->bus_freq_hz) - 1;

[Severity: High]
Will this 64-bit integer division using the direct '/' operator cause a
linker error on 32-bit architectures?

Since CONFIG_COMPILE_TEST=3Dy is possible, compiling this driver on 32-bit
architectures emits a call to __udivdi3, which is intentionally omitted in
the kernel.=20

Could we use div64_u64() or do_div() from <linux/math64.h> here instead?

> +
>  	/*
>  	 * According to the chip manual, we can only access the registers as by=
tes,
>  	 * otherwise the high bits will be truncated.

[ ... ]

> @@ -304,6 +315,32 @@ static int ls2x_i2c_probe(struct platform_device *pd=
ev)
>  	if (irq < 0)
>  		return irq;
> =20
> +	if (dev_of_node(dev)) {

[ ... ]

> +	} else {
> +		/* clocks and clock-div properties are used only in ACPI path. */
> +		ret =3D device_property_read_u32(dev, "clocks", &priv->pclk);

[Severity: Medium]
Does reading the ACPI "clocks" property as a single 32-bit integer frequency
violate standard property semantics?

The driver expects ACPI tables to provide the input clock frequency as an
integer under the "clocks" property.=20

However, "clocks" is standardly defined as an array of references (phandles)
to clock providers.=20

Should a standard property like "clock-frequency" be used instead to pass a
scalar integer?

> +		if (ret || !priv->pclk)
> +			priv->pclk =3D LS2X_I2C_PCLK_FREQ;

[ ... ]

[Severity: High]
This is a pre-existing issue, but does initializing the hardware in
ls2x_i2c_probe() enable interrupts before the IRQ handler is registered?

drivers/i2c/busses/i2c-ls2x.c:ls2x_i2c_probe() {
    ...
    ls2x_i2c_init(priv);
   =20
    ret =3D devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c=
",
                           priv);
    ...
}

In ls2x_i2c_init(), the CTR_READY_MASK (which includes the interrupt enable
bit LS2X_CTR_IEN) is written to the control register before the handler is
registered by devm_request_irq().

If a hardware interrupt is asserted in this window, could it lead to an
unhandled interrupt storm and permanently disable the shared IRQ line?

[Severity: High]
This is a pre-existing issue, but is the driver missing a remove function
to disable hardware interrupts during driver unbind?

drivers/i2c/busses/i2c-ls2x.c:
static struct platform_driver ls2x_i2c_driver =3D {
    .probe      =3D ls2x_i2c_probe,
    .driver     =3D {
        ...
    },
};

Because the driver relies on devres for cleanup and lacks a .remove
callback in ls2x_i2c_driver, devres will free the IRQ handler on unbind
while the hardware is never quiesced.=20

If an interrupt asserts after the handler is freed, would this cause an
unhandled interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810074927.2528=
4-1-wanghongliang@loongson.cn?part=3D2
