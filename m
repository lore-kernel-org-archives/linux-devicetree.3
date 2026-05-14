Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48C2C0274
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730418; cv=none; b=MIfbdtlMXuFL/CT+gXG6UuljmnF74nNiJO3Poad09LvM+qG0HH4ViqbVUoSTSKmin8A53AN/siIEZmxUKpILAK5Y3sBPDgRKG39TETfSJK1wEIYU3pxOPT1OmaeUorMBWPwanVXspf77MuzlwE+H8oP6gpHm54EBSjtTPDt5b5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730418; c=relaxed/simple;
	bh=HR5U4ZFhtj76rxGCpctxX21lS1njZPYG19CeTK/NiDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ULbL2iPIZE6myrw9wYttkiUyLgzrnjBFNzjV3kGeP/zLcvBRlHtSkhJ6NeAp1vKnrRWKg1cUBNQz2SiXDjvTWiQMQEeGJHIoZL/arprvKfMFxIeCyScnOJBdktTvV3fOckXBxnwdNBK0Tr27/dgGv6wpZH/sfsh7iqBfcSCd6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkpLk3lL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkpLk3lL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A599C2BCB7;
	Thu, 14 May 2026 03:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778730418;
	bh=HR5U4ZFhtj76rxGCpctxX21lS1njZPYG19CeTK/NiDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lkpLk3lLGH0Gi88uZP+53/pk7RZdH46RATUlc1v3lzs7TU+ejzuRwvXyZYcIUHtjy
	 62yqCQ/g7e8h8HsRKKUwHw5S7vEVlF9ip11pfbh/6V2JmyPNF80LcRmv2C86mjZK45
	 di8SQxuzoJ1cEAMvZuY+I5TTto9f3+Cm5KeezHhDUR3frTOQP2lGvCHnN6U+YCqjUC
	 8vDFJr1f9mLUGtm7d8jYfQ0GzX8JQ+65KYi3N5KLFWpqu1inp7lM35JWX0obCSMomX
	 Mqn+V9ASckgi8EcSI1rRTBt1YQw3t/+36xA6bReZxGf4l+BFoSvp7jpR0OQ2UqiPNH
	 +nmWZq/lG3DUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/16] ASoC: rsnd: Add ADG reset support for RZ/G3E
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260512182631.3842065-12-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:46:57 +0000
Message-Id: <20260514034658.2A599C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The ADG reset line is deasserted during probe but never asserted o=
n module removal or error paths, causing a state/resource leak.
- [High] The ADG module reset is deasserted before its clock is enabled, vi=
olating the hardware reset sequence.
--

commit 6c6d894ea65ae109e5fa8d85239c0bfcc07fc1aa
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add ADG reset support for RZ/G3E

This commit adds optional reset control support for the ADG module on
Renesas RZ/G3E SoCs. It retrieves the adg reset line and passes it to
rsnd_mod_init() during probe.

> diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c
> @@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
>  	if (!adg)
>  		return -ENOMEM;
> =20
> -	ret =3D rsnd_mod_init(priv, &adg->mod, &adg_ops,
> -		      NULL, NULL, 0, 0);
> +	rstc =3D devm_reset_control_get_optional_exclusive(dev, "adg");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
> +
> +	ret =3D rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);

Does this sequence deassert the reset before the module clock is enabled?

Looking at rsnd_mod_init(), the reset is deasserted immediately:

sound/soc/renesas/rcar/core.c:rsnd_mod_init() {
        ...
        ret =3D clk_prepare_enable(clk);
        if (ret)
                return ret;

        ret =3D reset_control_deassert(rstc);
        ...
}

Since NULL is passed for the clk argument in rsnd_adg_probe(), the ADG
clock isn't enabled during this deassertion. The actual ADG clock is
fetched and enabled later in rsnd_adg_probe() via rsnd_adg_get_clkin()
and rsnd_adg_clk_enable().

On Renesas hardware, synchronous resets typically require the module
clock to be actively running when the reset is deasserted. Could this
cause the hardware to miss the reset release or lead to uninitialized
module state?

>  	if (ret)
>  		return ret;

Are there missing cleanup paths for the deasserted reset?

If rsnd_adg_probe() fails later (for example, in rsnd_adg_get_clkin()),
it returns the error directly without jumping to a cleanup path to
re-assert the reset.

Additionally, if rsnd_adg_remove() does not call rsnd_mod_quit() for
the ADG module, does this leave the hardware permanently out of reset
across unbind and rebind cycles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D11
