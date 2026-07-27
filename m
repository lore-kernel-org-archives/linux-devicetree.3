Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB223536B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175896; cv=none; b=RcSypQLLDVa8dlGfwvlT8kuI79nh0DM6XMbTvJ9scHuE73YZ18A5b538BX32IH0ZNymmxfpwDL1SY9MtCtQinpoMrkJRRlm0ObVO0gu3xuRG6HlnmXjEwL+XvyjqzbK3fGlIh0DS7yFmw0mvd7Dl0KkbN0+cflrTo255+MxMZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175896; c=relaxed/simple;
	bh=ygN7CoIA96bMMDh3L/Re3061TAts8u3TKr4rCamKXBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbdhehm7qriitKBz3roTIpFCisY+fre7sBlD6O2061BNbBO1aph9NMEkHmUCRnTXJTkIu8sIbkG+kis1eHHOv7/ewTiFng1l+et/R3lGs2YMDKbBItW673JFe4k8yh4/FZgM6TydQzLaQG3k3yRyGyLUfAa3tbR6djGephP6jMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6Rho1WD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6Rho1WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B6D1F000E9;
	Mon, 27 Jul 2026 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175894;
	bh=pD9+AjoZV0AH5nrjppr5bFhOoF+/DDtHtVLH00OMiE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6Rho1WD2cDbHTZuBhlx0OeyR1blAwQotaaBqg5AWriptj7D8k4/WMzwDE14Ry+TO
	 JGNelcGdMMhCzrAffOnR5H7A4gAYM6JeT2RuwKM/qe2x4uk5uEnsCc+vVv8we/oAxF
	 6lcSDlE3s6lcO094i1ky9oMYn5yyBPwGRWCloK3rSEgGSmeBmy2qg+kQD39jGi3Tw/
	 3QtfoIcalu4GodHEzcu3lm+e6LQPXV8j9Cu91BgBr/uAw8z3IZRGCwMlEQ5iexAxC9
	 hVubM/ki1EEDTD4uWF2t/DvwOLFIdfAKZMgdkxUf85Uw1jHBKXVEmdpwyJCaEr0+la
	 rp8FgCr6NUO2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 32/35] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727174141.664933-33-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-33-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:11:34 +0000
Message-Id: <20260727181134.93B6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The fallback logic for `syscon_regmap_lookup_by_phandle()` masks l=
egitimate errors like `-EPROBE_DEFER` or `-ENOMEM`, converting them to `-EN=
ODEV`.
- [Low] Use of `IS_ERR_OR_NULL()` on `syscon_regmap_lookup_by_phandle()` is=
 misleading.
--

--- Patch [32]: [PATCH v8 32/35] pinctrl: airoha: try to find chip scu node=
 by phandle first ---
commit 79f9f3a73727f62c86606b46895b0e4240f8019f
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 34485cc29624c..e8cbea41fbae2 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -762,9 +762,12 @@ int airoha_pinctrl_probe(struct platform_device *pde=
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

[Severity: Low]
This isn't a bug, but syscon_regmap_lookup_by_phandle() returns an ERR_PTR()
on failure, not NULL. Is it necessary to use IS_ERR_OR_NULL() here instead
of just IS_ERR()?

[Severity: High]
If syscon_regmap_lookup_by_phandle() returns a transient error like
-EPROBE_DEFER, this block catches it and falls back to
syscon_regmap_lookup_by_compatible().

If the device tree has been updated to use the phandle and lacks the legacy
compatible string, the fallback will return -ENODEV. Does this overwrite the
original -EPROBE_DEFER and cause the driver to permanently fail to probe?

Should this fallback only be triggered if PTR_ERR(map) =3D=3D -ENODEV (mean=
ing
the phandle property is missing)?

> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);
> +	}
> =20
>  	pinctrl->chip_scu =3D map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D32
