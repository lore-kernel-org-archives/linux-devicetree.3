Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939E5478D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238855; cv=none; b=RAwt4z2+CVRWP7o2RgiLzcSm/EGEpbwexfiIqa0nnXzCpyDOBDK7+1iaeclhcThH2yNjbysUgVuJlSs23yuIcRv90iyt1WjjSop0mui4/QG/llKyO9b23a2kssy/TVVScRgGkQGgWsCWew8KuHii1sIK3/pyi1pt+TSY9TlLUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238855; c=relaxed/simple;
	bh=0i0sx2KLxfq++r0MKtfhskbx4Yf0mICJNQPTDj92Urw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jaaoRO//c0X8uwKIxdZ+N79jjUQaP/55nexS2mjU5mVcC7Sz5+TZq5Ke+FUrlLdbVjETjMlTb8u4wsAtyuijZ4vzpm0Sqmv/n7BPHwsAF7GgEBEL/n0SmCgsLsqYUzN2EypkEEHhoLenXkaPF61yhLyCqGw8pYPESbtnXKi3pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STb/M4zH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STb/M4zH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC581F000E9;
	Tue,  1 Sep 2026 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238853;
	bh=SCFSrPWvEAsquo0iWWU/h4Sm5M02izLCW7XbxwulQTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STb/M4zHUMDl3x6bC3myeE4YQAFTGKLzKY+I/K9C/MbJmRLp9lDL7/NPD2irkFbqI
	 s2ASIhHNVhcrW25WmfVTaI7dDMxMFrjTIW9EDCqBaAaeFv0SVjBOpebtcaZr/uX2/l
	 Uh+neWhSo+KcgT6O1roL7qFJcEmvHOkktc/eqrwtDiCYTHG1xayeiO/Ve43s230Mnn
	 6GiyQrwiXEVVz/GAbvU6ddRnMTN12JJcu4BhKezj7Bc/O8pr3IddWlAUOrdIe6rm87
	 FoHeZvolc36492Ezx/s/L5yuINPw2uz0RE2ixImuxpUDn/70HZMT0Gh2+SJ+fBM1Jk
	 CPT2Bh62LYsfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] regulator: mp886x: add MP8864 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901043123.5401-4-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
 <20260901043123.5401-4-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 05:00:53 +0000
Message-Id: <20260901050053.8BC581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Regulator map failure for scaled feedback voltages exceeding the i=
nternal reference limit.
- [Medium] Division by zero in `mp8869_scale` if `mps,fb-voltage-divider` p=
rovides 0 for the second resistor value.
--

commit 11c9edb9604a047f4176e93b2eddadc949a9e73b
Author: Jisheng Zhang <jszhang@kernel.org>

regulator: mp886x: add MP8864 support

This commit adds support for the MP8864 synchronous step-down converter to =
the
mp886x regulator driver. It updates the Kconfig description and adds a new
device tree compatible and specific switching-frequency table.

> diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
> index a10f3a20d413f..14f60cdcbbd6b 100644
> --- a/drivers/regulator/mp886x.c
> +++ b/drivers/regulator/mp886x.c
[ ... ]
> @@ -229,6 +229,23 @@ static const struct regulator_ops mp8867_regulator_o=
ps =3D {
>  	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
>  };
> =20
> +static const struct mp886x_cfg_info mp8864_ci =3D {
> +	.rops =3D &mp8867_regulator_ops,
[Severity: High]
This is a pre-existing issue, but by using mp8867_regulator_ops, does the
MP8864 inherit a potential initialization failure for typical step-down
output voltages?

In drivers/regulator/mp886x.c:mp8867_get_voltage_sel(), when fbloop is true,
the driver scales up the internal reference voltage and attempts to map it:

	uv =3D mp8869_scale(uv, di->r[0], di->r[1]);
	return regulator_map_voltage_linear(rdev, uv, uv);

However, since rdev->desc->min_uV (0.6V) and rdev->desc->uV_step (10mV) are
hardcoded for the unscaled internal reference, the maximum mappable voltage
appears capped at 1.87V. If the scaled voltage is above 1.87V, does
regulator_map_voltage_linear() return -EINVAL and prevent the regulator from
syncing its state?

> +	.slew_rates =3D {
> +		64000,
> +		32000,
> +		16000,
> +		8000,
> +		4000,
> +		2000,
> +		1000,
> +		500,
> +	},
> +	.switch_freq =3D { 600000, 850000, 1100000, 1600000 },
> +	.fs_reg =3D MP886X_SYSCNTLREG1,
> +	.fs_shift =3D 1,
> +};
> +
[ ... ]
> @@ -341,6 +358,7 @@ static int mp886x_i2c_probe(struct i2c_client *client)
>  }
> =20
>  static const struct of_device_id mp886x_dt_ids[] =3D {
> +	{ .compatible =3D "mps,mp8864", .data =3D &mp8864_ci },
[Severity: Medium]
This is a pre-existing issue, but if the device tree for an MP8864 device
includes the "mps,fb-voltage-divider" property with a 0 value for the second
resistor, could this cause a division by zero during boot?

In drivers/regulator/mp886x.c:mp886x_i2c_probe(), the resistor values are
read without validation:

	ret =3D of_property_read_u32_array(np, "mps,fb-voltage-divider",
					 di->r, 2);

If the initial voltage selector is queried, mp8869_scale() uses di->r[1] as
a divisor:

	u32 tmp =3D uv * r1 / r2;

>  	{ .compatible =3D "mps,mp8867", .data =3D &mp8867_ci },
>  	{ .compatible =3D "mps,mp8869", .data =3D &mp8869_ci },
>  	{ }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901043123.5401=
-1-jszhang@kernel.org?part=3D3
