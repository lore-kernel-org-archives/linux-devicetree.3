Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51CF289E13
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727541; cv=none; b=KPdH2EVEMqYkHhP1BRnCPTSPfJwYnlJ4Mb8BxH1oSS4rKsyR3AOG/eN/lNT2OhZtPykhLEScvl+odRJplHOksIImUE7LLnzA3nhoSAuffPPKQM2ZFwfgEqgfav2M2elbCXFGNvnS4i+tdhSBz+i16OYM9dQXeBTjm1SVFAdtSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727541; c=relaxed/simple;
	bh=MToLDESOAqBLVGAMXiNF3omDeApvtR5djeP3F2ZdttY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7m/voMqlfNpxglEFGT6Ne5j0J1ifA1oD/J8mHS9Ty0r4iIqB21vhhPM+jM8mrOGqLQDyNusxGqpxZpMibfb4WuB2nyqafL+1PPF62+Qbxq7JXd7zs74dCESECqVSLgXbGAPRsmNSfS9ztIg8OL+BwXiTEmymiNPNt9zUgDna8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKECJlxk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKECJlxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C83C19425;
	Thu, 14 May 2026 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778727540;
	bh=MToLDESOAqBLVGAMXiNF3omDeApvtR5djeP3F2ZdttY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GKECJlxk4abdMp0iuComzP6MNj1HDfSHAf+3+WkSlnMtPVQWmCH+pqYtzdsfP6fu5
	 +OUnijbPvlHggkq+FGKsDuc8TcA8cHMblwhcDu9redqPmwZ54wG8vaIJt+s7FBRtDQ
	 hDrzLW6UxwfwuaG1KGT7tOdRUB6NjEJCpvix0Dt+0ahvm39piOE6DB8mVgCxhdXWpF
	 d1YuUdSuOfoCDzs/VuSQRVqEwkd7jrei3CtSOQs1Y3UY73qxTGKFrDroUei75XNhmV
	 9ucG/0V/pjuJVCdtm1fUiMIzOBJaCCN6d8wOJAdjIC7NjflGBtt7POIY/8U/fpwV4A
	 JjGhG1t3NGEZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:58:59 +0000
Message-Id: <20260514025900.50C83C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Out-of-bounds memory access triggered by malformed Device Tree.
- [High] Permanent resource leak of shared reset control on error path.
- [High] Silent PIO fallback will cause hardware misbehavior on RZ/G3E.
- [Medium] Hardcoded SoC check contradicts the capability flags design.
- [Medium] Undocumented functional change regarding hardware reset.
- [Low] Unnecessary architectural complexity with dynamic allocation.
- [Low] Variable shadowing in rsnd_ssiu_busif_err_status_clear().
- [Low] Incorrect placement of ssiu_ctrl struct member comment.
--

commit 376b6d769102c3df2fb5467964293ac39d8601d0
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support

Add support for the SSIU found on the Renesas RZ/G3E SoC, which
provides a different BUSIF layout compared to earlier generations.

> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
>=20
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
>=20
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.

This isn't a bug, but the patch later adds a hardcoded check for
rsnd_is_rzg3e(priv) in rsnd_ssiu_init() to skip PIO initialization. Would it
be better to introduce an additional capability flag like
RSND_SSIU_NO_PIO_FALLBACK instead of hardcoding the SoC check, to keep with
this stated design?

Also, the commit message doesn't mention the addition of the "ssi-all" shar=
ed
reset control or the resulting changes to the hardware initialization
sequence. Could this functional change be documented here?

> diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
> index e917aa12fa80c..186468a584fed 100644
> --- a/sound/soc/renesas/rcar/rsnd.h
> +++ b/sound/soc/renesas/rcar/rsnd.h
> @@ -684,6 +685,7 @@ struct rsnd_priv {
>  	/*
>  	 * below value will be filled on rsnd_ssi_probe()
>  	 */
> +	void *ssiu_ctrl;
>  	void *ssi;

This isn't a bug, but this variable is allocated and populated in
rsnd_ssiu_probe(). Should it be grouped under the rsnd_ssiu_probe() comment
block further down instead of rsnd_ssi_probe()?

> diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
> index 0cfa84fe5ea86..f483389868d2c 100644
> --- a/sound/soc/renesas/rcar/ssiu.c
> +++ b/sound/soc/renesas/rcar/ssiu.c
[ ... ]
> @@ -87,10 +95,10 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_=
mod *mod, int enable)
> =20
>  bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
>  {
> +	struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
>  	bool error =3D false;
>  	int id =3D rsnd_mod_id(mod);

Does this cause a compiler warning for variable shadowing?

There is an existing local declaration of struct rsnd_priv *priv inside the
if (status) block further down in this function:

	status &=3D val;
	if (status) {
		struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
		struct device *dev =3D rsnd_priv_to_dev(priv);

which will shadow this newly added variable.

[ ... ]
> @@ -160,7 +168,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
>  	/*
>  	 * SSI_MODE0
>  	 */
> -	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> +	if (!rsnd_is_rzg3e(priv))
> +		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);

If the DMA channel request fails with -EAGAIN, rsnd_rdai_continuance_probe()
will attempt a PIO fallback by replacing mod->ops with rsnd_ssi_pio_ops.

Since the RZ/G3E hardware and register configuration do not support PIO,
will this fallback silently fail and lead to hardware misbehavior or a
stream hang?

[ ... ]
> @@ -534,8 +545,15 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
>  	if (!ssiu)
>  		return -ENOMEM;
> =20
> +	ctrl =3D devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	ctrl->busif_status_count =3D rsnd_flags_has(priv, RSND_SSIU_BUSIF_STATU=
S_COUNT_2) ? 2 : 4;

Is it necessary to dynamically allocate a new structure just to store the
busif_status_count integer?

Could this status count be evaluated directly from the capability flag when
needed, or stored as an integer field in an existing structure to reduce
allocation overhead?

>  	priv->ssiu	=3D ssiu;
>  	priv->ssiu_nr	=3D nr;
> +	priv->ssiu_ctrl	=3D ctrl;
> =20
>  	if (rsnd_is_gen1(priv))
>  		ops =3D &rsnd_ssiu_ops_gen1;
> @@ -558,12 +576,21 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
>  		} else if (rsnd_is_gen4(priv)) {
>  			list	=3D gen4_id;
>  			nr	=3D ARRAY_SIZE(gen4_id);
> +		} else if (rsnd_is_rzg3e(priv)) {
> +			list	=3D rzg3e_id;
> +			nr	=3D ARRAY_SIZE(rzg3e_id);

Can a malformed device tree trigger an out-of-bounds memory access here?

The ssiu array is initially allocated based on the device tree node count,
which is saved in priv->ssiu_nr. However, nr is overwritten here with
ARRAY_SIZE(rzg3e_id).

If the device tree contains more nodes than expected, the later
for_each_rsnd_ssiu() loop will iterate up to the original node count,
causing the inner j loop to terminate without breaking. This results in an
incorrect id_sub value that can lead to an out-of-bounds access in
rsnd_ssiu_get_status().

>  		} else {
>  			dev_err(dev, "unknown SSIU\n");
>  			return -ENODEV;
>  		}
>  	}
> =20
> +	/* Acquire shared reset once for all SSIU modules */
> +	rstc =3D devm_reset_control_get_optional_shared(dev, "ssi-all");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get ssi-all reset\n");
> +
>  	for_each_rsnd_ssiu(ssiu, priv, i) {
>  		int ret;
> =20
> @@ -586,7 +613,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
>  		}
> =20
>  		ret =3D rsnd_mod_init(priv, rsnd_mod_get(ssiu),
> -				    ops, NULL, NULL, RSND_MOD_SSIU, i);
> +				    ops, NULL, rstc, RSND_MOD_SSIU, i);
>  		if (ret)
>  			return ret;

If a subsequent iteration of this loop fails, returning ret directly leaves
the previously initialized modules active.

Since rsnd_mod_init() calls reset_control_deassert(), returning early witho=
ut
rolling back the successful initializations will permanently leak the deass=
ert
reference count of the shared ssi-all reset line.

Does this error path need to call rsnd_mod_quit() for the previously
initialized modules?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D9
