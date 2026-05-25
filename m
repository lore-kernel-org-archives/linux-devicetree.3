Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D633D4EE
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711783; cv=none; b=aqPpYBrntWKGjQYolcxXg7rVbnHfTjRVbKKICGBIoJ0KP7IggamYkzz49ZjUtmi6zKhjza/ygVLPxgJ5StTM8BunLAa07wM5KkgUM2w3/8Yvd3k2tf7rA3G4kwKcXHEFV26lCiMsrkAOmogg6sAZNlUZOcKLO/M1sB7+pxNmnNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711783; c=relaxed/simple;
	bh=IDnxsW0/sYN63NavRZIYlwbC7xdsIW8HwQ1Sf7NtlQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CRzrg6BE7mK9+WV163Hek249cAW9XdciHfBK1n6o/ZgrYsyq0e62T5qRmUlnjWDNOF5l/W1I5PnRm+owrHLhExceMSe3Tjl2cM0j48n4X5oj/9mD/KNxpN1vHpwsXHpDVIGp5G/K/M8hG2B0wSSCZXnppJJZpqFmzKy9vNx2Yvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBhTVSsP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBhTVSsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206D01F00A3A;
	Mon, 25 May 2026 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779711781;
	bh=zoABT4FgWqKyW46IY2YgmxwFRyiFm5O9TvAtLfMNi4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PBhTVSsPnKMKUjqs2XzAB9nJQIKjDXtuRdJVD8syl2M19tGofWUAcbKw24JKkQyiW
	 RQfyFTkJIyICSjUPbL3IfreoycIP/N42UtyFHadW5R2MufwaYnHN7jPqRZN3o/VP0J
	 JPyNQAKLSPqV96QKeBElPFYMecZqJPQ3RFpoLpF7USGvoDgfcXtg721d9H3KM2gVlV
	 W2oT5LIJv+l4ItASxkoZTvqbabpB3CiNAQxZTgq9OVyt/4epAuN0hQnVd8vQ6qxomX
	 R8CU54MovZ21KbLEyRolKMCDC/66d+qHdsfXwTL69EUugYoTyfEcpCBHaZ3TjwWTWC
	 wHpxbX4udvwNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/18] ASoC: rsnd: Add system suspend/resume support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260525110230.4014435-19-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-19-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:23:00 +0000
Message-Id: <20260525122301.206D01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect clock and reset ordering in `rsnd_suspend_clk_reset` and=
 `rsnd_resume_clk_reset`.
- [Medium] The `scu_supply` clock is omitted from suspend/resume management=
 in the SRC module.
- [Medium] Return values from critical resource management functions are si=
lently ignored during system resume.
--

commit 0690a34131ef80f23f3d83d8daa691b816da9afc
Author: John Madieu <john.madieu.xa@bp.renesas.com>
Date:   Mon May 25 11:02:30 2026 +0000

ASoC: rsnd: Add system suspend/resume support
   =20
This commit adds system suspend and resume support for the ASoC rsnd driver,
distributing the module-specific suspend/resume operations across individual
files instead of centralizing them in core.c.

> diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
> index fbf7f72364600..9ce56cd84f46d 100644
> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c

[ ... ]

> @@ -2159,11 +2160,35 @@ static void rsnd_remove(struct platform_device *p=
dev)
>  		remove_func[i](priv);
>  }
> =20
> +void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc)
> +{
> +	clk_unprepare(clk);
> +	reset_control_assert(rstc);

[Severity: High]
Will this sequence send the reset command to an unclocked IP block?

Looking at the driver's normal module quit sequence in rsnd_mod_quit(), the
reset is asserted before unpreparing the clock. Could asserting the reset
after unpreparing the clock here cause the IP blocks to hang?

> +}
> +
> +void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc)
> +{
> +	reset_control_deassert(rstc);
> +	clk_prepare(clk);

[Severity: High]
Is it safe to deassert the reset before the clock is prepared?

The hardware typically requires the clock to be stable before deasserting
the reset, which is explicitly noted in rsnd_dma_resume() and done correctly
in rsnd_mod_init(). Will deasserting early here cause issues for the
modules using this helper (SSI, SRC, CTU, MIX, DVC, and ADG)?

[Severity: Medium]
Should the return values of clk_prepare() and reset_control_deassert() be
checked here?

If a clock fails to prepare or a reset fails to deassert, these failures
are silently ignored. Could subsequent register accesses to these IP blocks
trigger a synchronous external abort if they didn't actually resume?

> +}

[ ... ]

> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 537b71841f8e2..793dd4adbe5c6 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c

[ ... ]

> @@ -1035,3 +1035,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
> +void rsnd_dma_resume(struct rsnd_priv *priv)
> +{
> +	struct rsnd_dma_ctrl *dmac =3D rsnd_priv_to_dmac(priv);
> +
> +	if (dmac) {
> +		/* Clock must be stable before reset is deasserted */
> +		clk_prepare_enable(dmac->audmapp_clk);

[Severity: Medium]
Is it necessary to check the return value of clk_prepare_enable() here?

If enabling the DMA clock fails, the hardware won't be accessible, and the
error will be silently dropped, potentially leading to panics when the block
is accessed.

> +		rsnd_resume_clk_reset(NULL, dmac->audmapp_rstc);
> +	}
> +}

[ ... ]

> diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
> index cad15fcc37f22..ac806bdc96d9e 100644
> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c

[ ... ]

> @@ -834,3 +834,37 @@ void rsnd_src_remove(struct rsnd_priv *priv)
> +void rsnd_src_suspend(struct rsnd_priv *priv)
> +{
> +	struct rsnd_src_ctrl *src_ctrl =3D rsnd_priv_to_src_ctrl(priv);
> +	struct rsnd_src *src;
> +	int i;
> +
> +	if (!src_ctrl)
> +		return;
> +
> +	for_each_rsnd_src(src, priv, i)
> +		rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
> +				       rsnd_mod_get(src)->rstc);
> +
> +	clk_disable_unprepare(src_ctrl->scu_x2);
> +	clk_disable_unprepare(src_ctrl->scu);

[Severity: Medium]
Does this skip disabling the scu_supply clock during suspend?

During rsnd_src_probe(), scu, scu_x2, and scu_supply are all acquired and
enabled. If scu_supply is omitted here, will it remain enabled throughout
system suspend and prevent the clock domain from entering a low-power state?

> +}
> +
> +void rsnd_src_resume(struct rsnd_priv *priv)
> +{
> +	struct rsnd_src_ctrl *src_ctrl =3D rsnd_priv_to_src_ctrl(priv);
> +	struct rsnd_src *src;
> +	int i;
> +
> +	if (!src_ctrl)
> +		return;
> +
> +	clk_prepare_enable(src_ctrl->scu);
> +	clk_prepare_enable(src_ctrl->scu_x2);

[Severity: Medium]
Should the return values of these clk_prepare_enable() calls be checked?

If the clocks fail to prepare, the error is discarded.

Also, similar to the suspend path, should scu_supply be re-enabled here?

> +
> +	for_each_rsnd_src(src, priv, i)
> +		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
> +				      rsnd_mod_get(src)->rstc);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D18
