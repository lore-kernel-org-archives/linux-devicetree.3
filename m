Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215508;
	b=l0yT1kS+YsvZQ6+S5Tw2DgQ/LUG8lJN7iXEEMKR96pMClWduWu6fQ2eYXR6BMEfAWO1L
	 gQy8FAblRPfrxvh/w/oqMhNav2iOvFyrIk+wP1hSLCGGybTSeXGS6bPVhMThnyjnfekia
	 XtIYBRPWhC8XzAkaJcRVKgrxRJc1Nx4Mi3ZHoGTmzmWzWirqggr0Xw1fy36QgphU+NzuA
	 Xd7JdZCM9qV0O4jjKLuY1DGchmju/wRho7vRMe8x3EoUzxBvAmj2FOi3JIuaqbwfWBMpu
	 wwVNP20ACbizxmjHYBCEW3Z2aANBfqVgYzbiQoZtBi2Y4gLxwvSE45oMBSTGnttHZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uGaLfSIvU+GuOfolhIECbvRujyzyc11RwREQhrQ5Kdo=;
	b=YFGxdt5/4ucJLD2agBbuvHGn2kON0EIkuh20UyF1uhn47d0yAKE0gDwoIjxWVGyzHbVh
	 MQkBTHjH/aQGfOlBQQSlJ96xGXBORF6YgjsjzwfoAsBblG5qck8ccDV/hX1xeOP7a4x4o
	 UqeVWl54oqbIT3nlMlRk71TKy9uPG/UHcfD3bXpj/321ACbYYmTv0yojVWI3B/z7H5Ba0
	 r84JFiNQXk9ebskLaQwfEIc2uft+VbRD4aFW4BY+i368UGXA4ouLP/amnI+ScL2rwf7jH
	 NFCbT+zb9HYrzcas/16Vpr4R3QhP7hYIawhvjqt8mZO27JE5pDKj1JsJGjyWev9xC2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8R1OulX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9940606A685
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8R1OulX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6031F000C6;
	Fri, 20 Nov 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215508;
	bh=uGaLfSIvU+GuOfolhIECbvRujyzyc11RwREQhrQ5Kdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8R1OulXMD/ogO7ze3L/05t/68i1Jn9Qo66aVkfPvmVldEF/AwHroDp5r8qTjC5mc
	 Zog0oww5wJNqr8n0Mnz4K8azoq8mfKFeSkBGkvCMw1JC+//LLJxMVCtkv1U+04ud9W
	 xkmEwJ5rCvK5kx8fAOw8X3J3+uLvzLDlW30j1wVWiV/bb9CtC5NKgx7B8WpdSBjh7E
	 m71tncBQiDbYGsyQ/kzn2vU5v4xzq7Cp/WkSjfx4jQABj6Oc55Lo1LKUKaL16SWvfg
	 HcycHkn50EAcs3xDN1prdzfAT+Kd45nWN2+jKMu1XgCykaQo8qcqQkCS7dJY2LT61n
	 XGC/hkDdWEZJw==
Message-ID: <sashiko-outbox-226320@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 04/13] dpll: add basic SiTime SiT9531x
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-5-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-5-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dpll: sit9531x: missing regulator enable in
  sit9531x_dev_probe()
--

commit 7413ebc82cba0bf0979b71e1af2d94d59391bd01
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: add basic SiTime SiT9531x support

This commit adds the core I2C driver, probe handling, and paged register
accessors for the SiTime SiT9531x DPLL family.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..99dd5e70dc5e6
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +static int sit9531x_dev_probe(struct sit9531x_dev *sitdev)
> +{
> +	struct clk *xtal_clk;
> +	u8 variant_id;
> +	int rc;
> +
> +	/*
> +	 * Request before enabling the XO: a probe deferral would gate the XO
> +	 * and remove the reference of a running part.
> +	 */
> +	sitdev->reset_gpio =3D devm_gpiod_get_optional(sitdev->dev, "reset",
> +						     GPIOD_ASIS);
> +	if (IS_ERR(sitdev->reset_gpio))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(sitdev->reset_gpio),
> +				     "Failed to request reset gpio\n");
> +
> +	/*
> +	 * Fvco =3D Fref * (DIVN + frac/2^32); Fref is the rate of the XO feedi=
ng
> +	 * XIN/XO_CLK.
> +	 */
> +	xtal_clk =3D devm_clk_get_optional_enabled(sitdev->dev, "xtal");
> +	if (IS_ERR(xtal_clk))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(xtal_clk),
> +				     "Failed to get xtal clock\n");
> +	sitdev->xtal_freq =3D clk_get_rate(xtal_clk);
> +	if (!sitdev->xtal_freq) {
> +		u32 freq;
> +
> +		if (!device_property_read_u32(sitdev->dev, "clock-frequency",
> +					      &freq))
> +			sitdev->xtal_freq =3D freq;
> +	}
> +	if (!sitdev->xtal_freq)
> +		return dev_err_probe(sitdev->dev, -EINVAL,
> +				     "no xtal rate: provide clocks=3D<&xo> + clock-names=3D\"xtal\",=
 or a clock-frequency property\n");
> +
> +	/*
> +	 * Keep reset deasserted, never pulse it: a reset discards the
> +	 * configuration from efuse or a pre-probe NVM blob. Release it before
> +	 * the first I2C access.
> +	 */
> +	if (sitdev->reset_gpio) {
> +		rc =3D gpiod_direction_output(sitdev->reset_gpio, 0);
> +		if (rc)
> +			return dev_err_probe(sitdev->dev, rc,
> +					     "Failed to release the reset line\n");
> +		fsleep(10000);	/* internal boot after release */
> +	}
> +
> +	rc =3D sit9531x_read_variant_id(sitdev, &variant_id);

[Severity: Medium]
As reported by Jakub Kicinski on v15 [1], should sit9531x_dev_probe() reque=
st
and enable the device power supplies before releasing reset_gpio and perfor=
ming
the first I2C read?

The sitime,sit95316.yaml DT binding defines vdd-supply, vddin-supply,
vdds-supply, and the vddoN-supply rails, but the driver never claims or
enables any regulators. On boards with switchable rails that are off at boo=
t,
sit9531x_read_variant_id() will fail against an unpowered chip; if the
bootloader left a non-always-on regulator enabled, regulator_late_cleanup()
will turn it off at late_initcall time while the driver is bound, powering
down the device and losing its configuration.

[1] https://lore.kernel.org/r/20261117021809.2220080-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D4
