Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AEA3CEBA6
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333257; cv=none; b=p+1cBWeENTRiPP5lK1WuYQHnT8Cidj3spJBs3ZBq9O2n0wB9VS/IbmvDGckvW/yIV98RI8pD+Mg3YZ8pocu0akT+jm6SPyZiOWRyes6ntRdhnJN5Y+jjsUfjeXx7RaLTpyei5KuWlmt9XuZN/fl4vIMNe5WgLdCG9dvKPTtoedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333257; c=relaxed/simple;
	bh=wNBPOurSqe5BCVCQdh7MS2Zi0ZyPwDhDcqeCJTCQhig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GwegvTOWb/bjxW4w5eiSHENopebKP8HR9jVBpP7KWa2G9bKOGfNIuH4AMePcGlXdvrwrq/JskO2d2rB+8YYbkfONn9FuhAG9vI1x6mMYg+PLm1xfXGdPjT256PP319GvfEG6O6XXtwCJezbtN6fKNuCpkINPYTy9dj+xK8b4AWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+a5cHu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+a5cHu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14541F000E9;
	Wed,  2 Sep 2026 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788333255;
	bh=moiZxr+pfezDzfaTEGTf8e3x6R6sdv2lj4rRcWkn/YA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X+a5cHu3bhwaM01eWqRRGmgmibmfM6Bfh3ki883wktpqfaGb19QB31ts9kzZdDPGi
	 uXzsCLVU15uLlai3+o0+4oc03dg2d3m3FvACeArgCy2cFUmOJ1UrQpgBqDZj5Q5KBX
	 M0E6TPQmskWhk5IGPCCH7aEgfLppM6WNi4Rz0mhgH3PHTZb018bTgP165SPOMQJIPh
	 KwCk2n89zyzpgL3+f5ZDtJBNX3ObK0EKBLlsKrpE7fhAHT7WAlBgTUZXVtbXB7wQW3
	 RNiAQnBHxY0G9Y+d325S1KGEjho5OFsjHmCWpQOTpxhPqNX2ljixMPCXO2AVOwJPCs
	 /MIh+PWF8qkYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mmc: sdhci-of-k1: Set clock-frequency of io clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 07:14:14 +0000
Message-Id: <20260902071414.C14541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Missing check for `clk_set_rate()` return value, masking configu=
ration failures.

Pre-existing issues:
- [High] Breaking probe deferral by obscuring `devm_clk_get_enabled()` erro=
r codes with `-EINVAL`.
- [High] Probe deferral is broken for pinctrl due to unconditionally ignori=
ng all errors.
--

commit 9748f01c4f206e03365b12c3c2ceed5bed26c9c0
Author: Long Wan <long.wan@linux.spacemit.com>

mmc: sdhci-of-k1: Set clock-frequency of io clock

Add a clock-frequency property to set the rate of io clock, for SDIO
case, a clock frequency need to propagate down early.

> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k=
1.c
> index 37b0911e7cf20..e6ab40c9a5551 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -438,6 +438,8 @@ static inline int spacemit_sdhci_get_clocks(struct de=
vice *dev,
>  					    struct sdhci_pltfm_host *pltfm_host)
>  {
>  	struct spacemit_sdhci_host *sdhst =3D sdhci_pltfm_priv(pltfm_host);
> +	struct device_node *np =3D dev->of_node;
> +	u32 freq;
> =20
>  	sdhst->clk_core =3D devm_clk_get_enabled(dev, "core");
>  	if (IS_ERR(sdhst->clk_core))
>  		return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but does returning -EINVAL here
break probe deferral? If devm_clk_get_enabled() in spacemit_sdhci_get_clock=
s()
(drivers/mmc/host/sdhci-of-k1.c) returns -EPROBE_DEFER, returning -EINVAL w=
ill
cause the probe to fail permanently. Should this propagate
PTR_ERR(sdhst->clk_core) instead?

> =20
>  	sdhst->clk_io =3D devm_clk_get_enabled(dev, "io");
>  	if (IS_ERR(sdhst->clk_io))
>  		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but does this also break probe deferral for t=
he
same reason? Should we propagate PTR_ERR(sdhst->clk_io) in
spacemit_sdhci_get_clocks() instead of returning -EINVAL?

> =20
> +	if (!of_property_read_u32(np, "clock-frequency", &freq))
> +		clk_set_rate(sdhst->clk_io, freq);

[Severity: Medium]
Does this code silently ignore clock configuration failures? If clk_set_rat=
e()
in spacemit_sdhci_get_clocks() (drivers/mmc/host/sdhci-of-k1.c) fails and
returns an error code (for instance, if the frequency is unsupported or
rejected by CLK_SET_RATE_GATE), the failure is masked. Should we check the
return value and handle potential configuration failures?

> +
>  	pltfm_host->clk =3D sdhst->clk_io;
> =20
>  	return 0;

While reviewing the file, I noticed another pre-existing issue in
spacemit_sdhci_get_pins():

drivers/mmc/host/sdhci-of-k1.c:spacemit_sdhci_get_pins() {
    [ ... ]
	sdhst->pinctrl =3D devm_pinctrl_get(dev);
	if (IS_ERR(sdhst->pinctrl)) {
		sdhst->pinctrl =3D NULL;
		dev_dbg(dev, "pinctrl not available, voltage switching will work without =
it\n");
		return;
	}
    [ ... ]
}

[Severity: High]
This is a pre-existing issue, but does this code break probe deferral for
pinctrl by unconditionally ignoring all errors? If devm_pinctrl_get() in
spacemit_sdhci_get_pins() (drivers/mmc/host/sdhci-of-k1.c) returns
-EPROBE_DEFER, the driver will treat it as if no pin controller is present.
Should we check for and propagate -EPROBE_DEFER?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-07-k3-sdhc=
i-dts-v1-0-4e7909cf4233@kernel.org?part=3D3
