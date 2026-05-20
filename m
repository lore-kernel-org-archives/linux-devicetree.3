Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE393ED3A4
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297844; cv=none; b=l+hXaEY3QDeIWwh8CDXCux9EfS4qCRICVkdWnPn7xUxfJXJvQS6gfoqY9djZgh9pVO6opjxGFEiCZEhZbeV6/O+36Lur9xsgbARpYG0jC6Kak5QpwioOvcV11maAC9coD72YfrurlT8mo6ugUz9/pA3wUfsVQsgB1xq+cAFTkF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297844; c=relaxed/simple;
	bh=XjeHEmMyWTayEBvMobxq7me5wOv7WHyDrXtLa0dU/iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qeM7H/PdJL24WNCQEqtAqTmHv7b7SDeS1zuTXsWXK8gbkES6T2OmhjvZ3eHz8XT6zAoXN266HLr0D1A1nEc2fo3cWLMTpbNyV8lFFlJ04rdutRy8oiE+YHfIRYnFIU7lyPAmQ+brPmOVGOSCw62Ftcj022bNvl5pXoGtghiQwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr0LGHJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr0LGHJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0454D1F000E9;
	Wed, 20 May 2026 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779297843;
	bh=bS+BArl4rsUzl8ADJVBYGy7lgteNHmgtt2YeUymgzBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jr0LGHJnbC5qP3P+eYOfqhmv6sMV2C1xK7pvCIuf8he0I5yLIGS3VYmdOV+S/fYNG
	 pIsbyBVCxVDB4JieOWxU+37dHHf+2ZSiNQ08sBQMdHUqy+p9tF1NZy/5J3QsiExDnY
	 wlG68Hx0nMzaSe7Zj6/nc8B6OLF+f1NQa6ONfWRZHEMf05KWtDr+L21A5nLMN2Pm4R
	 2JT3tsp/JhogYX8gyAOSaaZVUlwZOBwQoarWxnXEQPyMH2I0G6tbnl5b4jKixuKDRU
	 qEC32Z5g+D/Rv4sTZOmwRE6BEpr698IJu9SQ4UnSZF5lL2AnIejRJKEnEsImz543+I
	 unoOfdQ6X2RYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] thermal/drivers: airoha: Generalize
 get_thermal_ADC and set_mux function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520155525.22239-6-ansuelsmth@gmail.com>
References: <20260520155525.22239-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 17:24:02 +0000
Message-Id: <20260520172403.0454D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Replacing `regmap_write()` with `regmap_field_write()` implicitly =
changes a full register overwrite to a read-modify-write, potentially faili=
ng to clear other bits in the register.
--

commit 156e68047b2cd59d81061c97136f7825e128ca91
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: Generalize get_thermal_ADC and set_mux function

This commit introduces the use of the regmap field API for get_thermal_ADC
and set_thermal_mux in preparation for Airoha AN7583 support. It also
improves comments and moves a sleep call into the mux function.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index ebb47ae5f2cee..249abbbd46bcd 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c

[ ... ]

> @@ -219,25 +228,32 @@ static int airoha_get_thermal_ADC(struct airoha_the=
rmal_priv *priv)
> -static void airoha_init_thermal_ADC_mode(struct airoha_thermal_priv *pri=
v)
> +static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
> +				   int tdac_idx)
>  {
> -	u32 adc_mux, pllrg;
> +	u32 pllrg;
> =20
>  	/* Save PLLRG current value */
>  	regmap_read(priv->chip_scu, EN7581_PLLRG_PROTECT, &pllrg);
> =20
> -	/* Give access to thermal regs */
> +	/* Give access to Thermal regs */
>  	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT,
>  		     priv->pllrg_protect);
> -	adc_mux =3D FIELD_PREP(EN7581_MUX_TADC, EN7581_SCU_THERMAL_MUX_DIODE1);
> -	regmap_write(priv->chip_scu, EN7581_PWD_TADC, adc_mux);
> +
> +	/* Configure Thermal ADC mux to tdac_idx */
> +	regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
> +			   tdac_idx);

[Severity: High]
Does this unintentionally change a full register write into a
read-modify-write?

Before this patch, airoha_init_thermal_ADC_mode used regmap_write to
write the mux value directly to EN7581_PWD_TADC. Because adc_mux only
populated bits 1-3, this implicitly cleared all other bits to 0.

By switching to regmap_field_write, the operation becomes a
read-modify-write on bits 1-3. Given the register name EN7581_PWD_TADC, if
there is a power-down bit that defaults to 1 at reset, the new code will
preserve it as 1 instead of clearing it to 0.

Could this regression leave the ADC permanently powered down or in an
invalid state?

> =20
>  	/* Restore PLLRG value on exit */
>  	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520155525.2223=
9-1-ansuelsmth@gmail.com?part=3D5
