Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A30381AE0
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711788; cv=none; b=TqzBA2hBRyMpUwCE7BhvHVvcateXRdtwxGPwVZUVqtAlEBE7BH5bYB/LYtAnEoTZd7B8LAMTiNh33yXjpqSLQf/IZqr4BFfHDjSgHnkNI/AMEtYBVVzvyS3oPjsY1Pzjw+brMFRckOZMoPyUEtjVASEqb6hl0Swx9JsSd+wkLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711788; c=relaxed/simple;
	bh=ziLuSDW3HmRf4pDzufiT+C0KmTwDS9dsmkbZcg/rjtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KwTyMVVQ8olRWGUT4SxvZ5WhXsry3nwU4YaVXwwVhIgQkSJaMc7+zoYC9jVIqrzfmzUX0v+X/T6aHRFYRMMEuM2bQ9Eln7T4rENPxs0V3JVggw/ky1wYD5uUKtHcFOMsoQLwNw7m61UgrenJOnTli+gQJPNbDH+O/uBFCjQ9azM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAaNjIrw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAaNjIrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77321F000E9;
	Mon, 25 May 2026 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711787;
	bh=xzecqRis/su8YWa4DcabQDZ5O2to4FdFuYEfDzUi7zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAaNjIrwjGvsTlaepXyIVQ/53YKy1GzTzvl8AQDf/toOKYO797B7I2bzkCwbB4/Dg
	 BX/gQznjvYjgkHkimomULeHAFCKZQo+/BxKHUMK+7qQExZ8oEKpn+7+Q57U8NX5Gwt
	 DSW9QoEqOeUZp1LhkRC3ZlnyWT6Co495zuqVqiCbgpHFiPppGymT/qSYu3tl+Tx3GR
	 /hWixUSRA8M+l09xUwOJzGKSUy527Ck2fUY8wc8WPdzfJZkaEeOgjHYi1ALd4/tKPe
	 r/InZfqi4Pnr31YIPMe9+cSKj2Y+V9l2SUQhfI6/lI2rkJuKmWuG7NSwkUIo65jcBd
	 mFZmfgEE06EBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/18] ASoC: rsnd: Add RZ/G3E SoC probing and
 register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525110230.4014435-6-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-6-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:23:06 +0000
Message-Id: <20260525122306.C77321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The driver computes an incorrect physical address for DMA tran=
sfers on RZ/G3E by mistakenly falling back to R-Car Gen2/Gen3 hardcoded off=
sets.
- [Medium] The driver unconditionally attempts to write to `SSI_MODE0` duri=
ng stream initialization for RZ/G3E, but this register is omitted from the =
RZ/G3E register map, causing continuous error logs.
--

commit 15c83e0793c513d3877a09357bf6e83e9029bbdb
Author: John Madieu <john.madieu.xa@bp.renesas.com>
Date:   Mon May 25 11:02:17 2026 +0000

ASoC: rsnd: Add RZ/G3E SoC probing and register map

This commit adds probe support and register layouts for the RZ/G3E audio
subsystem. It introduces specific register maps to accommodate the different
base address organization and register offsets compared to R-Car Gen2/3/4.

> diff --git a/sound/soc/renesas/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
> index d1f20cde66be1..05d5f656fb01c 100644
> --- a/sound/soc/renesas/rcar/gen.c
> +++ b/sound/soc/renesas/rcar/gen.c
> @@ -464,6 +464,184 @@ static int rsnd_gen1_probe(struct rsnd_priv *priv)
>  	return ret_adg | ret_ssi;
>  }
> =20
> +/*
> + *		RZ/G3E Generation
> + */
> +static int rsnd_rzg3e_probe(struct rsnd_priv *priv)
> +{
> +	static const struct rsnd_regmap_field_conf conf_ssiu[] =3D {
> +		RSND_GEN_S_REG(SSI_MODE1,		0x804),

[Severity: Medium]
Will this cause unsupported register access errors during stream initializa=
tion?

The conf_ssiu register map omits SSI_MODE0, but rsnd_ssiu_init() will
unconditionally attempt to write to it using rsnd_mod_bset(). Without this
register in the map, rsnd_is_accessible_reg() might fail, potentially
leading to error logs every time a stream starts.

I note this regression is addressed in the subsequent commit
"ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support". Could this cause issues for
users who bisect to this specific commit?

> +		RSND_GEN_S_REG(SSI_MODE2,		0x808),
> +		RSND_GEN_S_REG(SSI_MODE3,		0x80c),

[ ... ]

> @@ -487,6 +665,8 @@ int rsnd_gen_probe(struct rsnd_priv *priv)
>  		ret =3D rsnd_gen2_probe(priv);
>  	else if (rsnd_is_gen4(priv))
>  		ret =3D rsnd_gen4_probe(priv);
> +	else if (rsnd_is_rzg3e(priv))
> +		ret =3D rsnd_rzg3e_probe(priv);

[Severity: Critical]
Does this new RZ/G3E generation cause a regression in rsnd_dma_addr()?

When setting up a DMA transfer, there doesn't seem to be a specific branch
for RZ/G3E address calculations. Because rsnd_is_gen1() and rsnd_is_gen4()
evaluate to false, execution appears to default to rsnd_gen2_dma_addr().

This fallback subtracts hardcoded offsets valid only for R-Car Gen2/Gen3,
which could yield an incorrect physical address for RZ/G3E and potentially
cause incorrect memory access during DMA transfers.

I note this regression is fixed later in the series by the commit
"ASoC: rsnd: Add RZ/G3E DMA address calculation support". Should the DMA
calculation support be included in this patch to maintain bisectability?

> =20
>  	if (ret < 0)
>  		dev_err(dev, "unknown generation R-Car sound device\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D5
