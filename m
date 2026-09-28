Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC013D649C
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631002; cv=none; b=b7DxODd7p5sTd0fr3a9TU+odNnezwSKedcHqvXwHDGpTsOl6nTkNji4kbccvtSc/OxjOFZHEoVYiSrjC2aXxhrLJPGxcBrtT9UPn2TmHP6it1tFdorYhPnPBn/6kjAgKZ4ulxD6orZAqzx9QPctsSr8OhSgPHUlCcE2FPxjM1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631002; c=relaxed/simple;
	bh=qUtGw4OCMdtvzmAJNn+SzRWEEkJcrPXlFaXCRNQgp30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UNPVfTIrLx7ZMYj0QFrUyXhUwdZR9V2kiiJRZlRcfm706oDbZxXT/g7buVtuPQSsURJf+9A9TZaw194joUeKVrmSriBjhWFjut7vJIZVdurNHcVueAHmSmMj0E8PV24Vj3jrdDmRhpqx3fs1ty2+a49fyPzvNBEPMl0VdUvtTds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjSvcsYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjSvcsYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6931F000FF;
	Mon, 28 Sep 2026 21:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790631001;
	bh=bylSQFjbaa4DxQi8own4TbjCKlRsaJe+AmeAB7QdcH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PjSvcsYnSfd7TZIsTiWXX55FGM2Oh5Gv/xowqavoFg9q7pdcUIq+VpFpW6o0k7KHw
	 i1Eh985B3PpCH7eRquHVq9o3M98nZphGS38uPmgzTPhZkFLyPQzK7Tu3IpSCKUp/Rd
	 ySjVSG+q+G65xxd+cTXI9kHgDyVysi2T+LyKi9W7aaDwu2ob0Na+406rDjxVF0YJYB
	 tGIOTzitWIdrBT8HxjAw5Ngh+Gadgv0+cAxtH4uWZgU++GrtfSxBULcYn+fvU478N7
	 mzjY8O6K2Oe30r/9VSuw8fRGGFqOg5tIsRXSJPMjmhVKRnJ/gGfkqR3jGhkQntV1K+
	 FLr56OKFErUOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: pse-pd: Add LTC4266 PSE controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Swenson" <kyle.swenson@est.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927212929.593366-3-kyle.swenson@est.tech>
References: <20260927212929.593366-1-kyle.swenson@est.tech>
 <20260927212929.593366-3-kyle.swenson@est.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 21:30:00 +0000
Message-Id: <20260928213001.0D6931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pse: incorrect devres registration order causes IRQ use-after-free
- [High] pse: swallowing -EPROBE_DEFER causes incorrect I_CUT limit calcula=
tion
--

commit 1aad2f6b5a72ee34250a04fe6ad2b8aea94fa801
Author: Kyle Swenson <kyle.swenson@est.tech>

net: pse-pd: Add LTC4266 PSE controller driver

Add a new driver for the Linear Technology LTC4266 I2C Power Sourcing
Equipment controller and integrate with the PSE controller core. The
LTC4266 supports Type 1 and Type 2 Powered Devices.

> diff --git a/drivers/net/pse-pd/ltc4266.c b/drivers/net/pse-pd/ltc4266.c
> index 0000000000000..37dea467811a4
> --- /dev/null
> +++ b/drivers/net/pse-pd/ltc4266.c
[ ... ]
> +static int ltc4266_pi_nominal_uv(struct ltc4266 *ltc4266, struct device_=
node *np)
> +{
> +	struct regulator *vpwr;
> +	int uv;
> +
> +	vpwr =3D of_regulator_get_optional(ltc4266->dev, np, "vpwr");
> +	if (IS_ERR(vpwr)) {
> +		/* -ENODEV means the PI describes no vpwr-supply at all, which
> +		 * is the case the fallback exists for. -EPROBE_DEFER means the
> +		 * rail _is_ described but has not registered yet, so the
> +		 * fallback is wrong for it. Asking for a probe retry is not an
> +		 * option from here: we run from setup_pi_matrix(), and
> +		 * pse_controller_register() unwinds neither its notification
> +		 * fifo nor its pse_pi array when that fails, so every retry
> +		 * would leak. Warn instead so the assumed voltage is visible.
> +		 */
> +		if (PTR_ERR(vpwr) =3D=3D -EPROBE_DEFER)
> +			dev_warn(ltc4266->dev,
> +				 "%pOF: vpwr-supply is not registered yet, assuming %d uV\n",
> +				 np, LTC4266_VPORT_NOMINAL_UV);
> +
> +		return LTC4266_VPORT_NOMINAL_UV;

[Severity: High]
Does swallowing -EPROBE_DEFER here cause an incorrect I_CUT limit calculati=
on?

If the vpwr-supply regulator is not yet registered when the LTC4266 driver
probes, of_regulator_get_optional() returns -EPROBE_DEFER. By suppressing
this error and falling back to a hardcoded 50V nominal voltage, the port
might operate with an incorrect, permanently-cached power limit. This could
result in delivering more power than administratively allowed, potentially
damaging equipment or violating PoE budgets.

[ ... ]
> +static int ltc4266_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_pse_controller_register(ltc4266->dev, &ltc4266->pcdev);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to register PSE controller\n");
> +
> +	/* Enable the interrupt pin, and only report detect events on
> +	 * change (detchg) so idle ports continuously re-running
> +	 * detection in semi-auto mode don't flood the host with a
> +	 * detect event every cycle.
> +	 */
> +	ret =3D regmap_update_bits(ltc4266->regmap, LTC4266_REG_MCONF,
> +				 LTC4266_MCONF_INTERRUPT_ENABLE | LTC4266_MCONF_DETCHG,
> +				 LTC4266_MCONF_INTERRUPT_ENABLE | LTC4266_MCONF_DETCHG);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to configure interrupts\n");
> +
> +	ret =3D devm_pse_irq_helper(&ltc4266->pcdev, client->irq,
> +				  0, &irq_desc);

[Severity: High]
Will this devres registration order cause an IRQ use-after-free during unbi=
nd?

Because devm_pse_controller_register() is called before devm_pse_irq_helper=
()
in ltc4266_probe(), the devres LIFO ordering will free the IRQ first during
module removal or probe failure teardown.

After the IRQ is freed, the devres teardown will unregister the controller,
which unconditionally calls disable_irq(pcdev->irq) inside of
pse_controller_unregister(). If the IRQ was reassigned to another device in
the meantime, this could disable that device's interrupt and cause a denial
of service.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927212929.5933=
66-1-kyle.swenson@est.tech?part=3D2
