Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF63E0C76
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139622; cv=none; b=i8nXr28kwXJoLwJSFhc/bJuRICc10Dyylvo1WXg5C1Ei6DuaNFICKXioHIdsoQQftZIJIZBWqVe5/1UAbbox5awP9FTp3hluxAd+xXFwPvSdSR9PQYIZ03yv3ml0+HHuPv1k91jbPS9zSkdgRlqrqdboAxRNqO9gVfoI6GSAUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139622; c=relaxed/simple;
	bh=W20vXHjWj9QqIQ7Ti0/9Cd0qWBjHlyFMYrZtUs3knfU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EMvobrwiX2tnUigV0PXu9rypYvPAwaaLrzJxLqWCivW4/gVK1TADZUXZQU0bGd/lv4nLQPUudbUgj4DidyQIn355aQFrj+Eo8YPUo+uqP31n0XavtEocAEqTdC9s0L5ao8Ow6fQX4gl+vsbK7deO14JulkDgsCQkr6y0OXZSVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yhx7ysFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yhx7ysFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685E51F00A3D;
	Mon, 27 Jul 2026 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139620;
	bh=i1N/bJMTG5Rgsab1hQESl1t35642jRSanA+XB1WUym0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yhx7ysFUjQRLYZ0UFTFZj1yvRTSS4/Ax/uj+KLpzEPahCHSQ4/JCMVtGPuVGJ0dp+
	 cs0qXcwcmQdFQ1iPQ4pT9Lb7/YPDmKer2ltcTp6bLNkARf1hSiQgWed5mf7g+nXAgv
	 bOPxCgwfac1b9HbTa2ZIniVBiMRVGfakDutyE8Qs95VpqSH2WvBK3Y1QnOHqMa6qit
	 c/Q/MUd8E8Ddfkc0leqDh0GWk2z+zyBHA4B/qlnphWX3dq3yIsODRL+6eHzrw+i8MB
	 x87sZMRrtKvPiUnpUEKGJu89Yy8intux6URohynCCHnkuNtKpbG1TXGCZLrrpiECz/
	 KrX7DCof+jB/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 31/34] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-32-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-32-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:06:59 +0000
Message-Id: <20260727080700.685E51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The fallback logic unconditionally catches all errors from `syscon=
_regmap_lookup_by_phandle()` (including `-EPROBE_DEFER` and `-ENOMEM`), whi=
ch can mask critical errors by overwriting them with permanent `-ENODEV` fa=
ilures.
--

--- Patch [31]: [PATCH v7 31/34] pinctrl: airoha: try to find chip scu node=
 by phandle first ---
commit bdb88d3420346c0c992b6bccf51e7ae7eb4e0a9a
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first

This patch updates the probe function to first search for the chip SCU regm=
ap
using the airoha,chip-scu phandle. If that fails, it falls back to searching
by a SoC-specific compatible string to maintain compatibility across differ=
ent
chip variants.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index a671d34b334eb..460010c001eb2 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -748,9 +748,12 @@ int airoha_pinctrl_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(pinctrl->regmap))
>  		return PTR_ERR(pinctrl->regmap);
> =20
> -	map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
> -	if (IS_ERR(map))
> -		return PTR_ERR(map);
> +	map =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip=
-scu");
> +	if (IS_ERR_OR_NULL(map)) {

[Severity: High]
Does this error check unintentionally mask -EPROBE_DEFER?

If the device tree uses the modern phandle binding but the SCU syscon is not
ready, syscon_regmap_lookup_by_phandle() returns -EPROBE_DEFER.

Because this check unconditionally catches all errors, it will fall back to
syscon_regmap_lookup_by_compatible(). If the legacy compatible string isn't
present in the device tree, that fallback returns -ENODEV, which overwrites
the original -EPROBE_DEFER and causes a permanent probe failure instead of
deferring.

Should the fallback only be executed if the initial lookup returns -ENODEV?

> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);
> +	}
> =20
>  	pinctrl->chip_scu =3D map;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D31
