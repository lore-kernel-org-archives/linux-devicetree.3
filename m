Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7C4E0210
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673363; cv=none; b=RUd1ujljgXb0sRLrKPCmXHqcS4E93UR6Npmsod/s+o3g3jzEUSUpEVzQQskRgFlOTV/x9msN7Zh8ZSu+TCtKwJMm9AIDd95eq+24gQfEE7kT3PLXhklDJhLlkfM2IHjw0ui2Pl7cZMQ1ij0TpDOKmJ5W0Ao5IVTCI6A9mp84wE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673363; c=relaxed/simple;
	bh=YS8sKfzyOvgcy+t9gI+9kI2qTliCqgDJATUjrfOVZ74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJWMZAxAItp//RurXuys/vJf7k3K16diHo+tz49XsxcSMnaiskAHexHa9BYV++WoNHF9H6hCmHpCZ2cnrXTDTdt/ajamJWm4eDF5kElx5QX9twav1GhYhbSvSLjkbpzGE6HnA4cCcXiiQZCcldGXZ/zFkOk/9b5fR4cJNz4JTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfCSFZtb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfCSFZtb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62D71F00893;
	Tue, 29 Sep 2026 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673359;
	bh=2Kg4sDrJEupHp/87wKDvR8xnkKKTq6vaggUXORKV9wU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfCSFZtbFAmYKtZDFC7/kcEPUUnpUGCGDix2JeseuzHEUYNG1d4fGuyFGVJX7sjH3
	 LW2ufA1olwpil8n/J4efAKUWVoqnpkbsd6eRKaWDMiVYj6UAM4Gya/hntxcIvJ2ytI
	 5uxRQNr3y0XCPsy1RMymAPoOaDd+pCwySHHBDwLzBkKm9tf/SjaIbsayNQX8RI76mS
	 e9GjKK5E7iCdSVbrB1mYq7Vi+pOjLmY9h+0n662o3Aq3kwGtryFmHTpL3kwHdUEfdL
	 zH08d2w9vUAMfdz5FGOKDQKvdBYQWsO3+yGkr5kIOfsNouo52GsfrRLfLTG8KqQ2Er
	 WwNHpnKFBFsxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: ak4619: Add optional powerdown
 GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koch" <mail@alexanderkoch.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929090821.1476257-2-mail@alexanderkoch.net>
References: <20260929090821.1476257-1-mail@alexanderkoch.net>
 <20260929090821.1476257-2-mail@alexanderkoch.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 09:15:58 +0000
Message-Id: <20260929091558.B62D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ASoC: ak4619: missing power-down GPIO assertion on unbind
- [Low] ASoC: ak4619: missing inclusion of <linux/delay.h> for msleep()
--

commit 1a6c5d3bb52b0196ff6b96586fdeceef456751a9
Author: Alexander Koch <mail@alexanderkoch.net>

ASoC: codecs: ak4619: Add optional powerdown GPIO

This commit adds an optional 'powerdown-gpios' device tree binding. If
defined, the PDN pin is configured during probe with a delay prior to
register access.

> diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
> index d9c9f6b200284..c4f0db1e51c8d 100644
> --- a/sound/soc/codecs/ak4619.c
> +++ b/sound/soc/codecs/ak4619.c
[ ... ]
> @@ -875,10 +876,20 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
> =20
>  	i2c_set_clientdata(i2c, ak4619);
> =20
> +	ak4619->pdn_gpio =3D devm_gpiod_get_optional(dev, "powerdown",
> +		GPIOD_OUT_LOW);
> +	if (IS_ERR(ak4619->pdn_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ak4619->pdn_gpio),
> +			"powerdown GPIO request failed\n");
> +	if (ak4619->pdn_gpio)
> +		msleep(10);

[Severity: Low]
Does this code rely on transitive header inclusions for msleep()? It appears
that <linux/delay.h> is not explicitly included in this file, which might
cause build failures if core headers are refactored.

[ ... ]
> @@ -887,6 +898,8 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to register ak4619 component: %d\n",
>  			ret);
> +		if (ak4619->pdn_gpio)
> +			gpiod_set_value_cansleep(ak4619->pdn_gpio, 1);
>  		return ret;
>  	}
> =20

[Severity: Medium]
Will the device remain permanently powered on if the module is unloaded or
unbound? The probe error paths correctly revert the GPIO state to 1 to power
down the device, but ak4619_i2c_driver lacks a .remove callback to handle
the unbind path.

Could this state leak be addressed by using devm_add_action_or_reset() duri=
ng
ak4619_i2c_probe() to ensure teardown symmetry when the device is unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929090821.1476=
257-1-mail@alexanderkoch.net?part=3D1
