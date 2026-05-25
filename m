Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D137F8AC
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709286; cv=none; b=PtAvUf3VXbnbQqhGLOLC9nD1o6s9KETbKSwJXVBbr9f70hYeT/X7Ou0wV1/Ep2ilA2lnycFZyr5bDzPHkAXCsyWP1oc6o+OQerzOgFxMbcbIPGEDeAdxhNFPg8SEjY+xBdtHnik1pfssvFEuz8smviqVdXqqSZMnRMIiVrEdvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709286; c=relaxed/simple;
	bh=Yb88PVwLQbUIwfH+ZUbv9KRcGQSNVZ3z/iDGeIJ1zME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BkdaUESDGL0pIwRVrUtE1+Zp4UVqS0KdU7G/PexfTl6AuLCf3j3ebbUwjMV882zk5SC5XIhU+Rj8VHPQjpu0Ge9itVZMEofUUNzcFX0Ny5Fe1L47794Cn7VNj7jdP3mvgnvojCvm/RyEkZdxjz36ci82w2nm/Cp1DZAQjAAZs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/Kv7X9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/Kv7X9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C601F000E9;
	Mon, 25 May 2026 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709284;
	bh=ienxeBNnxHoCdnhLVuQFBZpO2Asch8EnXppH0lrQCPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J/Kv7X9fWGC4xISLJtZziLPsFhZWdFRp5o5pPQAGxWIc4w6EXzvdyt46DJIqMj5+u
	 wZGEqyMS68F1lzEdhuFXGHlOoiPcd8uxwPvgahb36FVMYGUo+0MtmDMZmHIPIsdMer
	 yfGQufTbtcZMazb483Svxk78rLscR1xB4j6uiA6IeVQ80DvT7hj2u+oQ0Ge5ikvDCs
	 xppEAjxOoit4S7czgy3+fcJJ4Lql8l0bEQwMpJDFH5mx1l/ekgkDVB2bbS/2WHgrV2
	 pZ0Gh5fNho39jBYO675+anAfganu3qaA28QZDXx+laaZT2E89HqdPoBZQj0pXyecQv
	 huujaTxlN7IDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/18] ASoC: rsnd: ssiu: Add shared SSI reset
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525110230.4014435-10-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:41:23 +0000
Message-Id: <20260525114123.C8C601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing rollback on probe error paths leaks the shared reset contr=
ol's deassert count.
--

commit 75b9405455f9c9d54972ded411c26d45e6a17c73
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: ssiu: Add shared SSI reset controller support

The RZ/G3E SoC exposes a single shared "ssi-all" reset that gates all
SSI/SSIU modules. Acquire it at SSIU probe and pass it through
rsnd_mod_init() so it is wired into the rsnd_mod->rstc plumbing.

> diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
> --- a/sound/soc/renesas/rcar/ssiu.c
> +++ b/sound/soc/renesas/rcar/ssiu.c
[ ... ]
> @@ -586,7 +593,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
>  		}
> =20
>  		ret =3D rsnd_mod_init(priv, rsnd_mod_get(ssiu),
> -				    ops, NULL, NULL, RSND_MOD_SSIU, i);
> +				    ops, NULL, rstc, RSND_MOD_SSIU, i);
>  		if (ret)
>  			return ret;

[Severity: High]
This is a pre-existing issue, but does this error path leak the shared reset
control's deassert count?

If probe fails on a subsequent module (for example, returning -EPROBE_DEFER
from rsnd_mod_init), the function returns directly without calling
rsnd_mod_quit() for the modules initialized in previous iterations of the l=
oop.

Since rsnd_mod_init() calls reset_control_deassert(), the reset remains
deasserted for those modules.

While devres cleanup will call reset_control_put() on the shared reset acqu=
ired
via devm_reset_control_get_optional_shared(), this only drops the kref. It =
does
not balance the atomic deassert_count or assert the hardware line.

Across common initialization events like -EPROBE_DEFER retries, will the
deassert count grow unbounded and leave the hardware permanently deasserted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D9
