Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02366422E2E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302059; cv=none; b=Ltm5H+vXlJltfkwKxBCYsw9DJubHgKZ1TyiFWvXoSLBDB84yzUc4OXlEVajEjvB+2z1DLTk1O65adClXQbGvXtKpE6pzgVhCpmm0sXS27L2qZyC813E1Wu4Fm0WpxerH2R/4qKHNCzhh4fHVTuLW4N4LMK0C1sq85gs/e5PTEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302059; c=relaxed/simple;
	bh=nDPFibpQAAGbyjSWdv98f5GrlnThINYlynFBbJyBsuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JPukf4OM4+CeXRBgaYlJ455M8/mAgG8V56IKPOF1scuRMRiELqz/BYYsNhyxoxicXolIjIcepWzjebnzU/NNmxp1diVhdBKEmJgIT6VWIMn9PaaIE9X08t2gXTUsgjiUkygbnlquvDtqImY034r652xlmrJIZf9iC0zRDrXQq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXQPUrsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXQPUrsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601211F0089B;
	Tue,  6 Oct 2026 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302057;
	bh=SjZXxP68+A+r7TLKWIOMU7oz5PRqUY5QGgeuKaDiWaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXQPUrsauHRQT+g+0+8/70zVLx8EUBL/OPks1In/GRTs1NokODSWQA9FWpSnIfPYO
	 j5A19QAjw2B0ng/NU0134Prs6w+ObOwqTfTnYWuTL1MFFDBtd9gKlb59hRY9XjU+hM
	 GW4/5rboihAdawxYaZUp07iV3prtxt6umLgaNw12z2oEuTMUaklTdRJZ97UuVzHv0r
	 sb3IkRJP1VnDDJbWagxeibjQUS5rl5e3k28yPW2Pql9f8Vos4tZXNMZslng3XzCrXC
	 vDMTUvdTE2hLNB6y445XzcaDG+7BVOvM63XX//icX5kFrwbZ0th20TTcWUCBI7/Pnp
	 jNBDxa2bY+XbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] regulator: lp872x: Remove platform_data based
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261006154431.318936-6-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
 <20261006154431.318936-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 15:54:17 +0000
Message-Id: <20261006155417.601211F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] regulator: lp872x: uninitialized stack variable general_config wri=
te
- [High] regulator: lp872x: ABI breakage due to changed GPIO connection ID
- [Medium] regulator: lp872x: unconditional 30ms sleep in probe path
--

commit ffba7b7b46bbae180cc6ce91332a272bc6093ec2
Author: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: regulator: lp872x: Remove platform_data based probing

This commit removes platform_data-based probing from the lp872x regulator
driver, transitioning fully to Device Tree parsing directly in the probe
function. It also consolidates DVS initialization and drops the use of
of_regulator_match in favor of the core registration framework.

> diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
> index 1e16d7e8361a0..3d95ca7fa0246 100644
> --- a/drivers/regulator/lp872x.c
> +++ b/drivers/regulator/lp872x.c
[ ... ]
> @@ -700,110 +688,45 @@ static const struct regulator_desc lp8725_regulato=
r_desc[] =3D {
> =20
>  static int lp872x_init_dvs(struct lp872x *lp)
>  {
[ ... ]
> -	dvs->gpio =3D devm_gpiod_get_optional(lp->dev, "ti,dvs", pinstate);
[ ... ]
> +	lp->dvs_gpio =3D devm_gpiod_get_optional(dev, "dvs", lp->dvs_pin);

[Severity: High]
Does this change in connection ID break compatibility with existing Device
Trees?

The original code searched for ti,dvs-gpios by using the ti,dvs connection
ID. Changing this to dvs causes the GPIO framework to search for
dvs-gpios instead. Existing device trees using the documented
ti,dvs-gpios property will fail to find the GPIO, causing a fallback to
register-based DVS.

[ ... ]
> @@ -817,152 +740,77 @@ static const struct regmap_config lp872x_regmap_co=
nfig =3D {
[ ... ]
>  static int lp872x_probe(struct i2c_client *cl)
>  {
[ ... ]
> +	u8 general_config;
>  	int ret;
[ ... ]
> +	/* Always set enable GPIO high. */
> +	lp->enable_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HI=
GH);
> +	if (IS_ERR(lp->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lp->enable_gpio),
> +				     "Failed to request gpio\n");
> +
> +	/* Each chip has a different enable delay. */
> +	if (lp->info->chipid =3D=3D LP8720)
> +		usleep_range(LP8720_ENABLE_DELAY, 1.5 * LP8720_ENABLE_DELAY);
> +	else
> +		usleep_range(LP8725_ENABLE_DELAY, 1.5 * LP8725_ENABLE_DELAY);

[Severity: Medium]
Should this delay be conditional on whether an enable GPIO was actually
found?

In the previous implementation, if there was no enable GPIO, it returned
early and skipped the delay. Now, devm_gpiod_get_optional() returns NULL if
no GPIO is configured, but the delay runs unconditionally. This adds an
unnecessary 30ms sleep during boot for LP8725 platforms without an enable
GPIO.

> =20
> -	ret =3D lp872x_config(lp);
> +	device_property_read_u8(dev, "ti,general-config", &general_config);
> +	if (device_property_read_bool(dev, "ti,update-config")) {
> +		ret =3D regmap_write(lp->regmap, LP872X_GENERAL_CFG, general_config);

[Severity: High]
Can uninitialized stack memory be written to the hardware here?

If a device tree specifies ti,update-config but omits ti,general-config,
device_property_read_u8() will fail and leave general_config untouched.=20
Because general_config is declared on the stack without initialization, this
leads to uninitialized memory being written to the LP872X_GENERAL_CFG
register.

> +		if (ret)
>  			return ret;
> +	}
> =20
> -	ret =3D lp872x_init_dvs(lp);
> +	ret =3D lp872x_init_dvs(lp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006154431.3189=
36-1-clamor95@gmail.com?part=3D5
