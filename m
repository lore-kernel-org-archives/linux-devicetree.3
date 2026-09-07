Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE20C45D1BD
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776822; cv=none; b=oZwKRgR5dFG3TpVKi1kicwSvT6/MWjelIlTwNswKj4ikjJTZOoum49Zk0ecDswzE2nWy4NBhYLMbAMgKVdkLxTqBmSMS2HPZdnIa2Lxc8v+/cBwQWWwwkvKXcmgfW4mKGf33Hbdi7f/L/Z/IUQYgUZJ1PtW54+pY1o3xOPPbBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776822; c=relaxed/simple;
	bh=HpF9CH1NwLmGnpIoyUgaGLtiKsOCgIYMWb9JqYzl9gQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ICRw3/r/cbu80FG3QyFn594aR1v9YsPwdAwloHF+HXqRlTgHAye7LazzhrQXx0L0CxgYAeXr5mjxwrKLXlE4ZPPkMCebJ3tpRD6SkFfoWjNCYhzJW9C0qYaDsSbxoagLiW453+nTeYL3GhLIQdMNse5h4YJsmvq7HI/ZOIq1CDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxwHo9tX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxwHo9tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0761F00A3A;
	Mon,  7 Sep 2026 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776820;
	bh=oxlvNium/SbefiPLerDvdzaFa0+I7FgjOMV5LX1sjDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxwHo9tXpGzFFxOT+ramDeTR4nWm6dMROvs2LHeC15v3LU15m3sk2IJgPjFT+PRyT
	 wztdoqxgsranEn/PQNUwAIvCyJc1SrliHjjL2vzv6Ja26SnlAbvuNgzS8c1VCuCLme
	 wttDijNtAElS0qwS/QsEYPU0k4ZEJ5tCyToCr2wT5ICrI1duSTIRU6KFbrAS0zkm8V
	 XgKtiscVVokBdph6KC0HTF8BQp0JVoa9/iiW3QR3J3VXjRVmTQuCQ6sEDuzkAsQPlg
	 QPoKgNbAurgu5+TmxZjmgOzJJghtZhai0XdPVrmqws82ErzgcTEVeAv2VjIUcdE4wY
	 Bf6kv8yVeW2Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] iio: adc: ade9000: add support for ADE9430
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907101623.8730-4-antoniu.miclaus@analog.com>
References: <20260907101623.8730-1-antoniu.miclaus@analog.com>
 <20260907101623.8730-4-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:26:59 +0000
Message-Id: <20260907102659.DD0761F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The ADE9000_REG_DICOEFF configuration register is written after th=
e DSP has been started, violating initialization requirements for existing =
devices.
- [Medium] The ADE9430 full-scale ADC codes are identical to the ADE9000 co=
des, contradicting the commit message claim that they are different.
--

commit 95855f12cd746ba14c4e360029b507dc042d8327
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ade9000: add support for ADE9430

This commit adds support for the ADE9430, noting it is register compatible
with the ADE9000 but lacks the on-chip digital integrator and has slightly
different full-scale ADC codes.

> The ADE9430 is a polyphase energy metering device that is register
> compatible with the ADE9000. The differences relevant to the driver are
> the absence of the on-chip dip/swell detection, the absence of an on-chip
> digital integrator (the ADE9430 uses an external analog integrator for
> Rogowski coils, so the DICOEFF register does not exist) and slightly
> different full-scale ADC codes.

[Severity: Medium]
The commit message mentions that the ADE9430 has "slightly different
full-scale ADC codes", but looking at the newly added ade9430_chip_info
struct below, the rms_full_scale_codes, watt_full_scale_codes, and
pcf_full_scale_codes are identical to the ADE9000 codes.

> diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
> index 0f64bfb221da0..2f5fe016a82f3 100644
> --- a/drivers/iio/adc/ade9000.c
> +++ b/drivers/iio/adc/ade9000.c
[ ... ]
> @@ -689,6 +693,16 @@ static const struct ade9000_chip_info ade9078_chip_i=
nfo =3D {
>  	.rms_full_scale_codes =3D 52866837,
>  	.watt_full_scale_codes =3D 20823646,
>  	.pcf_full_scale_codes =3D 74680000,
> +	.has_digital_integrator =3D true,
> +};
> +
> +static const struct ade9000_chip_info ade9430_chip_info =3D {
> +	.name =3D "ade9430",
> +	.channels =3D ade9430_channels,
> +	.num_channels =3D ARRAY_SIZE(ade9430_channels),
> +	.rms_full_scale_codes =3D 52702092,
> +	.watt_full_scale_codes =3D 20694066,
> +	.pcf_full_scale_codes =3D 74532013,
>  };
> =20

Are these the correct values for the ADE9430, or were they inadvertently
copied from the ADE9000 without being updated from the datasheet?

> @@ -704,7 +718,6 @@ static const struct reg_sequence ade9000_initializati=
on_sequence[] =3D {
>  	{ ADE9000_REG_EVENT_MASK, ADE9000_EVENT_DISABLE },
>  	{ ADE9000_REG_WFB_CFG, ADE9000_WFB_CFG },
>  	{ ADE9000_REG_VLEVEL, ADE9000_VLEVEL },
> -	{ ADE9000_REG_DICOEFF, ADE9000_DICOEFF },
>  	{ ADE9000_REG_EGY_TIME, ADE9000_EGY_TIME },
>  	{ ADE9000_REG_EP_CFG, ADE9000_EP_CFG },
>  	/* Clear all pending status bits by writing 1s */
>  	{ ADE9000_REG_STATUS0, GENMASK(31, 0) },
>  	{ ADE9000_REG_STATUS1, GENMASK(31, 0) },
>  	{ ADE9000_REG_RUN, ADE9000_RUN_ON }
>  };
[ ... ]
> @@ -1672,6 +1685,14 @@ static int ade9000_setup(struct ade9000_state *st)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to write register sequence");
> =20
> +	/* The ADE9430 has no on-chip digital integrator and lacks DICOEFF. */
> +	if (st->info->has_digital_integrator) {
> +		ret =3D regmap_write(st->regmap, ADE9000_REG_DICOEFF,
> +				   ADE9000_DICOEFF);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to set DICOEFF\n");
> +	}
> +
>  	fsleep(2000);
> =20
>  	return 0;

[Severity: High]
Does this change cause a regression for existing devices by writing the
DICOEFF register after the DSP has already been started?

Because ADE9000_REG_DICOEFF is removed from ade9000_initialization_sequence,
the multi-register sequence now concludes with setting ADE9000_REG_RUN to
ADE9000_RUN_ON without writing DICOEFF first.

Then, ade9000_setup() conditionally writes ADE9000_REG_DICOEFF after the
initialization sequence has already started the DSP. Could this lead to the
configuration being ignored or cause unpredictable calculations since it is
written while the DSP is running?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907101623.8730=
-1-antoniu.miclaus@analog.com?part=3D3
