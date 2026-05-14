Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE301E515
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738993; cv=none; b=ishVb/Ee05DzBJU67zqXuriu+TmQf6xZRdMfkXPotbFGLMyofiesWfa52bFg9vEQTkvvAxplfSMORao7rLxG1lQhYsZQxDhdJqK3soENcA4cMmW2KSid0/AzwxcLtl5wATC2fX4YFNgFquOnFO0cZvog5SoXgVOq4uwOe+ENUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738993; c=relaxed/simple;
	bh=FJAs9gUgg9hj2zCKQtlKXBRjqNXV7CuU9FNNC9+9U4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cfUVPMpyLlCP9WZjaqRLwgZKdy30e9+ie2B0bw7Ejb7S2m2eWuMNl9ZihNKs6lr1oYsoHLquZuVXakU7x2PI5zSjW/YzA0Yv23xgUf0rKzI2xKGN2+DCJnOwqdCwKqiIGmE4IxhpOsiw8o2VrYRI/r8fk0GxjhWd/Bp8seY6cAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD5QU30h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD5QU30h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22043C2BCB7;
	Thu, 14 May 2026 06:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778738993;
	bh=FJAs9gUgg9hj2zCKQtlKXBRjqNXV7CuU9FNNC9+9U4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YD5QU30hm0DleBsPd875AE4rfpg2BzOHlU4cWWCEf2v00W6fYN4uDZD7NUmnGyIeL
	 nhk2shO4pfUb79iHsbsZsfPcDFu7mTrq4mTaBA1qz61Y0jUqd4hUd19WTtjg/+eLcQ
	 W/b/h5a7xUHYWgBTFK4o1i4pkFAFeNJ1aVyrkIq4zRYccEfkaO3KsRvohqXsfwCv6R
	 XufMRS2dPYEw+ttpZwP7vNV9XV6ECEJOaEQ/teyQYNSyNfdx7XOdFYDTiEbWNxZEsq
	 q2g+JCgBoYhiqNGMHs0ZuafQmGJCknXCYmRowVK4WCcifIjuLIS+MmdGBhKv2WOJOZ
	 cQ8auVuf0V+aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:09:52 +0000
Message-Id: <20260514060953.22043C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect clock and reset sequencing in `rsnd_resume_clk_reset()` =
prevents proper module resume.
- [Medium] Silent failure on clock preparation and enable errors during sys=
tem resume.
- [Medium] The `scu_supply` clock is not disabled during system suspend, ca=
using a power leak.
--

commit c780dd50f4c396b19ac5b1cf3e1ec1ec5c422765
Author: John Madieu <john.madieu.xa@bp.renesas.com>
ASoC: rsnd: Add system suspend/resume support

This commit adds system suspend/resume support for the ASoC rsnd driver,
required for RZ/G3E platforms. The per-module suspend/resume logic is
distributed across the relevant component files.

> diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
> index 679c833fd0014..26cd908299e6d 100644
> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
[ ... ]
> @@ -2160,11 +2161,35 @@ static void rsnd_remove(struct platform_device *p=
dev)
>  		remove_func[i](priv);
>  }
> =20
> +void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc)
> +{
> +	clk_unprepare(clk);
> +	reset_control_assert(rstc);
> +}
> +
> +void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc)
> +{
> +	reset_control_deassert(rstc);
> +	clk_prepare(clk);

Does this sequence deassert the reset before the clock is active, and omit
clk_enable() entirely?

In rsnd_mod_init(), the driver establishes that the hardware requires the
module clock to be active before deasserting its reset:

	ret =3D clk_prepare_enable(clk);
	if (ret)
		return ret;

	ret =3D reset_control_deassert(rstc);

Will deasserting the reset while the clocks are stopped fail to propagate
synchronous resets for IP modules using this helper?

Also, does this code silently ignore the return value of clk_prepare()?

If a clock fails to initialize, the subsystem might pretend the resume
succeeded.

> +}
[ ... ]
> @@ -2173,7 +2198,21 @@ static int rsnd_resume(struct device *dev)
>  {
>  	struct rsnd_priv *priv =3D dev_get_drvdata(dev);
> =20
> -	return rsnd_adg_clk_enable(priv);
> +	/*
> +	 * Same order as probe:
> +	 * DMA -> SSI -> SSIU -> SRC -> CTU -> MIX -> DVC -> ADG
> +	 */
> +	rsnd_dma_resume(priv);
[ ... ]
> +	rsnd_adg_clk_enable(priv);
> +
> +	return 0;

Does this code silently ignore the return value of rsnd_adg_clk_enable() and
unconditionally return 0?

The pre-patch code properly returned the error code.

>  }
> =20
>  static const struct dev_pm_ops rsnd_pm_ops =3D {
> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 0bca0b3031918..0bf97a12a9a72 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c
[ ... ]
> @@ -1035,3 +1035,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
[ ... ]
> +void rsnd_dma_resume(struct rsnd_priv *priv)
> +{
> +	struct rsnd_dma_ctrl *dmac =3D rsnd_priv_to_dmac(priv);
> +
> +	if (dmac) {
> +		/* Clock must be stable before reset is deasserted */
> +		clk_prepare_enable(dmac->audmapp_clk);

Is it possible to check the return value of clk_prepare_enable() here?

If the clock fails to initialize during resume, this could silently fail.

> +		rsnd_resume_clk_reset(NULL, dmac->audmapp_rstc);
> +	}
> +}
> diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
> index 0237b5d2e79e6..a844255879787 100644
> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
[ ... ]
> @@ -834,3 +834,37 @@ void rsnd_src_remove(struct rsnd_priv *priv)
>  		rsnd_mod_quit(rsnd_mod_get(src));
>  	}
>  }
> +
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

Does this code miss disabling the scu_supply clock?

It appears to be enabled during probe alongside scu and scu_x2, but omitted
here.

Could this leave the supply clock enabled across a system suspend cycle?

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

Are the return values from clk_prepare_enable() intentionally ignored here
as well?

> +
> +	for_each_rsnd_src(src, priv, i)
> +		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
> +				      rsnd_mod_get(src)->rstc);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D16
