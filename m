Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9137C93F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287833; cv=none; b=PDp05hoRrBe7c4+8B9B7bVVpf0akn5cFv3YdA/WjBSVGAbbp18+KF54KWoet9Wfq5/XptfIv3eGIUkW55inPa5iEpO+T58FlI0LnM0Ov/5Gha43z7zCuDE2lavLhrJ/GT+dNya2bBEguK7Gzb76RpHG/4wJXWLQw2xJrWbaPDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287833; c=relaxed/simple;
	bh=0r/EmojD7gcfdYa4N2je+oMNOKZRm3t8fk/caPZyvcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NEqonqm6VwNtfPQuXmAHgOCH2bGCCDZAPtz7XnZ38DDm9xbh7XEBSCHu0rFOt/NA3OqbvTypQTAFFicvMdEbkgyqpUNo4jT2uJuHwN3gpYaB/l/1VWGPP2t4ipLdTUWAHTb2LCvVIqMIlW6SfdiVn69EScNuX5Ft8eRmZnor07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHjBfaFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHjBfaFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAC71F000E9;
	Fri, 21 Aug 2026 04:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787287832;
	bh=GQM8Eo2UAn9U7dgBfOWBka1NK+pdZEjuC7OI7BtK2R0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OHjBfaFM6QxON1Jf2finMnQ3WrpQdG3A1j86tyVb8yp+Ho1zUBFHwt3hWLnHjJpLj
	 s1NWQ6LOiRV/bBBJweIrxnbAfbswkfh+7da6P5ZrkWj9yABjiIUnF6jtjYq6EJAq2K
	 KNMk4tG1BxdPbP/NIoOp3eHORkxvSg/8aiZeE5oYK1RIAiKJQSymkDBdmEL/xq8Yle
	 WgKtYfn/YdSsPSujJbmVsUSlR1Vcc1X7VxW2ptaPoQm7w8Luk1g2i8i6WyQrzD3uxY
	 GHL+YvVe+bSJ+IYvcIRccAPlliEiSwjMXhmaR7IScq6cbDbL0Zom52lkfWBMaBHvNP
	 aoI6X79l8ztcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260821043859.171871-4-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
 <20260821043859.171871-4-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 04:50:31 +0000
Message-Id: <20260821045031.CEAC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clock setup unconditionally requests 256x MCLK and checks a hardco=
ded 128x minimum, violating hardware limits and breaking 64FS mode for high=
 sample rates (e.g., 768kHz).
- [Medium] Internal software states (`priv->mute_user`, `priv->dop_auto`) a=
re mutated before the hardware write succeeds, causing permanent desynchron=
ization on I2C errors.
--

--- Patch [3]: [PATCH v2 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M=
 codec driver ---
commit d6078d6a073963832dc02c18cb1b239c05eaaf57
Author: Karl Asseily <karl@asseily.com>

ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver

This commit adds a new ALSA SoC driver for the ESS Technology ES9039Q2M
32-bit 2-channel audio DAC. It provides support for PCM, DSD, DoP, and
S/PDIF input formats, handling software mode over I2C.

> diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
> new file mode 100644
> index 0000000000000..bd09e230f9a3e
> --- /dev/null
> +++ b/sound/soc/codecs/es9039q2m.c

[ ... ]

> @@ -821,11 +821,11 @@ static int es9039_mute_put(struct snd_kcontrol *kco=
ntrol,
>  	if (val =3D=3D priv->mute_user)
>  		return 0;
> =20
>  	priv->mute_user =3D val;
> =20
>  	ret =3D es9039_apply_mute(priv);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does this leave the cached state out of sync with the hardware?

If es9039_apply_mute() fails (e.g., due to an I2C error), priv->mute_user
has already been updated. Since the function returns early without reverting
the state, subsequent attempts by the user to set the intended value will be
short-circuited by the `if (val =3D=3D priv->mute_user)` equality check. Th=
is
could leave the hardware permanently out of sync until a different value
is toggled.

[ ... ]

> @@ -857,11 +857,11 @@ static int es9039_dop_put(struct snd_kcontrol *kcon=
trol,
>  	if (priv->stream_rate)
>  		return -EBUSY;
> =20
>  	priv->dop_auto =3D on;
> =20
>  	ret =3D es9039_apply_dop(priv, on);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Similar to the mute control above, if es9039_apply_dop() fails, does this
leave priv->dop_auto permanently out of sync with the hardware?

[ ... ]

> @@ -1108,18 +1108,18 @@ static int es9039_setup_clocking(struct es9039q2m=
_priv *priv,
>  	ratio =3D priv->bclk_ratio ? priv->bclk_ratio : 64;
> =20
>  	if (!priv->mclk_fixed) {
>  		/*
>  		 * 256 * FS is the usual choice and clears both the 128 and 130
>  		 * floors with room to spare. Take whatever the clock actually
>  		 * settles on rather than assuming the request was honoured.
>  		 */
>  		ret =3D clk_set_rate(priv->mclk, 256 * rate);
>  		if (ret)
>  			return ret;

[Severity: High]
For high sample rates like 768kHz (which the driver advertises support for),
will this request a clock rate of 196.6 MHz?

The ES9039Q2M maximum MCLK is documented as 50 MHz. Should this limit the
requested clock multiplier based on the sample rate so it doesn't violate
the physical limits of the chip?

> =20
>  		priv->mclk_rate =3D clk_get_rate(priv->mclk);
>  	}
> =20
>  	if (es9039_is_sync(priv))
>  		min_mult =3D ES9039_SYNC_MIN_MCLK_FS;
>  	else
>  		min_mult =3D ES9039_ASYNC_MIN_MCLK_FS;
> =20
>  	if (priv->mclk_rate < min_mult * rate) {
>  		dev_err(dai->dev,

[Severity: High]
If the clock provider safely clamps the requested clock to the 50 MHz limit
for a 768kHz stream, will this check unconditionally fail?

The 768kHz rate requires 64FS mode (which is handled later in
es9039q2m_hw_params()), but min_mult here is hardcoded to 128 or 130, meani=
ng
50M < 128 * 768k. Could this prevent 768kHz streams from being played at al=
l?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821043859.1718=
71-1-karl@asseily.com?part=3D3
