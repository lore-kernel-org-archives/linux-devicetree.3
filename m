Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCF1F131A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735101; cv=none; b=NajNSy5lnN4uPCVexW2lMvdnt5ugd2QE4IXfj2ZhG7NlkaVqU/VVkL/CZAt2UH7mEJX46CUWQ3KqNl8TjtqLBDihXynM1PD7krvhGsK/Zh2IGKfsdtsX/5IifYQzB5erDYhVuSDTf1LDf0Avm5it8Glwy6nBoylxm7fQJgxTHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735101; c=relaxed/simple;
	bh=el+Ugk49Msg8zxRrqiukMRb4UHcu9muXM71NdH4PsJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZC/KFDSDVSus7f+YPICsuU6tLLIsD4W9waGimz4zx0d2zo2pnyuJOiLXcmwYrhOZyXw3ywdGT1Z+ZActgLYZBY1E6pfO8bNg+5waYAeFIg/635Xtfo907cUHZJjMmD2Lnmu4jMMvKsXZ6HDhkTiLbYZ87nSFW3xzr//Qb1CKfn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V20r1yMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V20r1yMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA86C2BCB7;
	Thu, 14 May 2026 05:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778735100;
	bh=el+Ugk49Msg8zxRrqiukMRb4UHcu9muXM71NdH4PsJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=V20r1yMFyf3hriHpN3E58fuTeqU7BREbGVRM2olocMfDXvoV58+JQNpC3w4ACjv2D
	 J4LKg0QWUmhNYH4mzXB1G+MltrZ8fPU9GW+vYKDgOAmu2NTEsTd7XTUOF2lbfdMA1J
	 I8ZOBAudzsz2GZEV6EpjkeGVXLWWstJe1Uq2UOEch79nmX3igrUtg4H1nJzlnR5ZGO
	 7U52cyerFFvHNfz6b5XmooXKXRDdaAIcZUtoVxqQ5x9STyfj8VQPcYV2ZS6BKmEfa/
	 kXkjTfTIZQ7eFam82YqQS45qwimhgY+hXscA+Y+cho2fmaaw7aRmqErysK2gcG+k7l
	 Q2Ndzl+Q1KRmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:04:59 +0000
Message-Id: <20260514050500.5AA86C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing error rollback in the probe loop leaves hardware permane=
ntly deasserted.
- [Low] Redundant devres allocations for a shared reset control inside a lo=
op.
--

commit 987ecf3576f0681ad0809aeed224f14241a758ce
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E

This commit introduces explicit Sampling Rate Converter Unit (SCU) reset and
clock management for the RZ/G3E SoC. It adds support for the shared SCU
reset controller used by all SRC modules and manages the SCU supply clock
with the same lifetime as the other SCU clocks.

> diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c

[ ... ]

> @@ -754,6 +792,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
>  			goto rsnd_src_probe_done;
>  		}
> =20
> +		/*
> +		 * RZ/G3E uses a shared SCU reset controller for all SRC modules.
> +		 * R-Car platforms typically don't have SRC reset controls.
> +		 */
> +		rstc =3D devm_reset_control_get_optional_shared(dev, "scu");

Is it intended to fetch the shared reset control inside the loop?

Since it queries the parent device using a constant string, it resolves to
the exact same shared reset control on every iteration. Could this be moved
outside the loop to avoid duplicate devres allocations and repeated refcount
increments for the same resource?

The resulting single rstc instance could then be safely passed to
rsnd_mod_init() during each iteration, as the reset subsystem correctly
handles multiple deassertions on the same shared wrapper.

> +		if (IS_ERR(rstc)) {
> +			ret =3D PTR_ERR(rstc);
> +			goto rsnd_src_probe_done;
> +		}
> +
>  		clk =3D rsnd_devm_clk_get_indexed(dev, SRC_NAME, i);
>  		if (IS_ERR(clk)) {
>  			ret =3D PTR_ERR(clk);
>  			goto rsnd_src_probe_done;
>  		}

Does this error path leave the hardware permanently deasserted for modules
initialized in previous iterations?

When an error occurs here, the function returns without rolling back the
modules successfully initialized earlier in the loop. rsnd_mod_init()
explicitly deasserts the reset control:

rsnd_mod_init()
    ...
    ret =3D reset_control_deassert(rstc);
    ...

Since devres only drops object references via reset_control_put() and does
not assert the reset line on failure, the hardware reset might remain
permanently deasserted.

While the failure to unwind the clock prepare count on this error path appe=
ars
to be a pre-existing condition, the reset deassert state leak is introduced
here. Could an explicit rollback be added to handle this?

>  		ret =3D rsnd_mod_init(priv, rsnd_mod_get(src),
> -				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
> +				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
>  		if (ret)
>  			goto rsnd_src_probe_done;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D14
