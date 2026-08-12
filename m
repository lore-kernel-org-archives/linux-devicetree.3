Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FB41A938
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528650; cv=none; b=Zy7wP3ZjEKnXnBVuEbSCv1Wpcsqp0veVSIFhdwf8/e10ZpS5ITQx3c6EizpvkNBV/G9efzUgCxAE1oAQxLEb01Pb3qPSLnhEGDq8bJBWhGij1h3vdcKEb4wacDaqdE80/7Dip5QKh9zZo6J2Smh3StsqgFRycUUV566lRZTtjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528650; c=relaxed/simple;
	bh=h2yQ8LaLaBkHpdGE1XWNCy/wUnnNRBKCiCRCgbssVuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dvuFAn61J/NV2ku5vMyty/h9mENI7InC4T8eqHXpXZm/0JrY2zu18gAPNmx2848Cm9z76qlpkh4gydbXsBPBY8iggYdLsXbPH7im73Ue3kIbK8IkvRuOIzFsr3NH8AhpastiH6n4wh/4WEIpDrb5Bd+JW3AiDRh4/de+J7pJQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6tc55x3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6tc55x3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4D81F000E9;
	Wed, 12 Aug 2026 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528648;
	bh=a145fMZIlVcGmAiMuGuH4Z67kD8AEDNFy/3Qm8w2poQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B6tc55x3yYVVt3xHsCveN/tYk7wtAA5ucJcFSeNuvDpNC+hpW3wvpOc0tQjmH2JON
	 5pYBCjXAehyk2EJd4GI85zSMPNA1Ewnf4QKl3KjsUMmx/j9NAVDRdPrptd0b1VjkGx
	 omQzr2Vw2VtqmpuiOj9x86nf9o7oj0ivteFoPFrrEf159GAkf4Zz1woicGFcEaizRD
	 gTcF7DzH6Gl+Tll7vp8x4WYgFqVFJPipZeSqfnpdWGp0gLLE2DdLaSFedcn/QkF8hm
	 3vFVSAk/llraqQF7g6vtBjyx1jSw277r/Nfvq+WQBQRYOyTJQGJF7rIbYlolSZz2lR
	 /oO4efWYkHinw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: es8316: Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-2-e7078bc9bc9c@thundersoft.com>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
 <20260812-es8316-regulator-next-20260722-v2-2-e7078bc9bc9c@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:57:28 +0000
Message-Id: <20260812095728.AE4D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Potential I2C communication failure due to missing stabilization=
 delay after enabling regulators.

Pre-existing issues:
- [Critical] Use-After-Free of snd_soc_component in the IRQ handler due to =
devres teardown order.
- [High] Regmap cache desynchronization due to pre-existing hardware reset =
defeating the patch's premise.
--

--- Patch [2]: [PATCH v2 2/2] ASoC: codecs: es8316: Add regulator support -=
--
commit 3daba0da576ac350b6f022776265341a98e4d7f5
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: codecs: es8316: Add regulator support
   =20
ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs.

> Request and enable the supplies during I2C probe, before initializing
> the regmap. Keep them enabled for the lifetime of the I2C device so the
> regmap cannot access an unpowered device and its cache remains
> synchronized if the ASoC component is unbound and rebound.

[Severity: High]
This isn't a bug introduced by this patch, but does the pre-existing hardwa=
re
reset in es8316_probe() defeat the premise of keeping the regmap synchroniz=
ed?

When the component is unbound and rebound, es8316_probe() executes:

sound/soc/codecs/es8316.c:es8316_probe() {
    ...
    snd_soc_component_write(component, ES8316_RESET, 0x3f);
    ...
}

This wipes the physical chip state without marking the regcache dirty.
Consequently, subsequent ALSA control writes matching the stale cache might=
 be
dropped, leading to silent audio or incorrect settings.

> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>

> diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
> index 87f331868dc7f..24ec8b211cdba 100644
> --- a/sound/soc/codecs/es8316.c
> +++ b/sound/soc/codecs/es8316.c
[ ... ]
> @@ -866,6 +874,11 @@ static int es8316_i2c_probe(struct i2c_client *i2c_c=
lient)
> =20
>  	i2c_set_clientdata(i2c_client, es8316);
> =20
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(es8316_supply_na=
mes),
> +					     es8316_supply_names);

[Severity: Medium]
Will this lack of stabilization delay cause I2C communication failures?

If the ES8316 requires a delay after power is applied before its I2C state
machine is ready, the first I2C write during the component probe could
receive a NACK. Might it be safer to add a small post-power-on delay here?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to enable supplies\n");
> +

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free risk during
devres teardown?

During module removal or I2C device unbind, devres tears down resources in
reverse order of allocation. The IRQ is requested later in this function
before the component memory is allocated via devres.

If the hardware asserts the IRQ in the narrow window after the component
is freed but before the IRQ is disabled and freed, es8316_irq() will
dereference the freed component pointer:

sound/soc/codecs/es8316.c:es8316_irq() {
    ...
    dev_dbg(comp->dev, "gpio flags %#04x\n", flags);
    ...
}

Can this lead to memory corruption if the handler executes late?

>  	es8316->regmap =3D devm_regmap_init_i2c(i2c_client, &es8316_regmap);
>  	if (IS_ERR(es8316->regmap))
>  		return PTR_ERR(es8316->regmap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-es8316-reg=
ulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com?part=3D2
