Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73573376466
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 05:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238957; cv=none; b=S+OnVnuSpoS4IWNXr4xdj5fJy/SFSdHyfvjZIhbuvWvuFK8MzLTyvx6n0QMKDbJ4+sMTDMS+qqBsYX0QHDM6/+7QQAsc+ZAj0TmZnTZoTV64Z2s5GN6OtGdUqf0Dp/D6ES3RaeMZqc2fhUZHC7KYnIW4rmPzF3uQbLcH11pigM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238957; c=relaxed/simple;
	bh=6dcNl7xQynHRkRhqXasvR8IjTVGH+S6qZlxhwR+bvgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHSleKqGIsVL///GO64oKvYQsO8pdO65fBnBcihTMe/Ak8ihN3lYKM1Q4F/zmqe+BhmyAgugcksko9897iJHBTOvqr8WvlnO9YaS9pMMQB5Wjv2Y9QaoBKsjdlLM920cTgSnPP3KpGRFJ5Eo9E7/fgQgHk71K6XQ/Tznn1BDVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqzOGtdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqzOGtdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF651F000E9;
	Tue,  1 Sep 2026 05:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238954;
	bh=GhLi9tp9YKMC5igAIegO4miuuGN3WNEhB6excM69qIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqzOGtdW+dERNwRQwcXjhEKIS+2yxQhjWewgEbtB+Q0/TO9HNxLjEsQGgocj7sOTH
	 Jvw2XFINbC0PwZ3Ym2SF1xXn52Afa5bHW70X0ZhyqVwKDGDjkQQeYLrVRLJTCNAlNV
	 8c3+npvWpBTojCVEMcILgvR7oQn4Q1lmVaJwu46VLPxl3AhvoiZkCyMmHB8AFcPzAH
	 MmqB67GoTd9nDzDLP1wj6jM5xx/Rp+6ifC14SBO9C+CtDMZXseFn6FxYX9ex4XLm7N
	 5sjU4tMvlQ8RTB7DfAlNIx1ZpMVrT2Qe0+DhifzrgehxML+QLQ80oPZ5d3q7PC6smg
	 Ull+ZyoURFdXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] regulator: mp886x: fix vsel_mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901043123.5401-2-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
 <20260901043123.5401-2-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 05:02:34 +0000
Message-Id: <20260901050234.8BF651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware I2C read/write errors during initialization are silently =
ignored, resulting in negative error codes stored in unsigned integers and =
corrupted state logic.
- [Medium] Potential division by zero in `mp8869_scale` due to unvalidated =
device tree properties.
--

commit e23dcb351cfbd15403625e41999e01844e07121f
Author: Jisheng Zhang <jszhang@kernel.org>

    regulator: mp886x: fix vsel_mask
   =20
    The MP886X vsel is 7bits, fix the vsel_mask.
   =20
    Fixes: 97be82880b61 ("regulator: add support for MP8869 regulator")

> diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
> index e0b62bc02a1e1..a10f3a20d413f 100644
> --- a/drivers/regulator/mp886x.c
> +++ b/drivers/regulator/mp886x.c
> @@ -267,14 +267,14 @@ static int mp886x_regulator_register(struct mp886x_=
device_info *di,
>  	rdesc->min_uV =3D 600000;
>  	rdesc->uV_step =3D 10000;
>  	rdesc->vsel_reg =3D MP886X_VSEL;
> -	rdesc->vsel_mask =3D 0x3f;
> +	rdesc->vsel_mask =3D 0x7f;
>  	rdesc->ramp_reg =3D MP886X_SYSCNTLREG1;
>  	rdesc->ramp_mask =3D MP886X_SLEW_MASK;
>  	rdesc->ramp_delay_table =3D di->ci->slew_rates;
>  	rdesc->n_ramp_values =3D ARRAY_SIZE(di->ci->slew_rates);
>  	rdesc->owner =3D THIS_MODULE;
> =20
>  	rdev =3D devm_regulator_register(di->dev, &di->desc, config);
>  	if (IS_ERR(rdev))
>  		return PTR_ERR(rdev);
>  	di->sel =3D rdesc->ops->get_voltage_sel(rdev);

[Severity: High]
This is a pre-existing issue, but does this code properly handle negative e=
rror
codes if I2C communication fails?

If get_voltage_sel() fails and returns -EIO or another negative error code,
it gets implicitly cast and stored in the unsigned int di->sel. The error
is never returned to the caller.

This negative value could later cause issues in mp8867_set_voltage_sel():

drivers/regulator/mp886x.c:mp8867_set_voltage_sel() {
	...
	delta =3D di->sel - sel;
	if (abs(delta) <=3D 5)
		ret =3D regmap_update_bits(rdev->regmap, MP886X_SYSCNTLREG1,
					 MP886X_GO, 0);
	...
}

If di->sel holds an error code like -5 (0xFFFFFFFB), and sel is 0,
delta becomes -5. Since abs(-5) <=3D 5 is true, the driver incorrectly
writes to the register to clear MP886X_GO, masquerading an I2C error as a
valid small voltage step.

Additionally, hardware initialization errors appear to be ignored elsewhere,
such as in mp886x_set_switch_freq() where the return value of
regmap_update_bits() is not checked. Could the driver end up succeeding in
its probe even if the hardware is completely unresponsive?

[Severity: Medium]
This is also a pre-existing issue, but is there a risk of a division by zero
when reading the divider values from the device tree?

In mp886x_i2c_probe(), the driver reads the mps,fb-voltage-divider array:

drivers/regulator/mp886x.c:mp886x_i2c_probe() {
	...
	ret =3D of_property_read_u32_array(np, "mps,fb-voltage-divider",
					 di->r, 2);
	if (ret)
		return ret;
	...
}

There does not seem to be a check ensuring that the denominator (di->r[1])
is strictly positive. If the device tree provides a zero value for this sec=
ond
resistor, wouldn't this cause a kernel panic when mp8869_scale() divides by
r2:

drivers/regulator/mp886x.c:mp8869_scale() {
	...
	u32 tmp =3D uv * r1 / r2;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901043123.5401=
-1-jszhang@kernel.org?part=3D1
