Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612E4756D6
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861035; cv=none; b=Ez7elE/df2vnikVf7NO4uSfmdu3lac9BRSiiDnk5a9Mv6+pAimi0+gC5lP1iQPladEW2zO0n3vya3Sy+Yn1x38RbtGSDF+CjeuX30c+zXk60X3nGtKL8k6n6IPbZ1F2W/nygUwtyVvQHiOKGcAfzgPNPOPYeLagl523mpFIWKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861035; c=relaxed/simple;
	bh=VklaDW+5LCkcxuSofiI77akIgDC2AdLsEZcpCVp69U8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NTxJJuTPxx4cXSWtXGZuOpSNzglsPzeI8AR7HBG1/6NpULHkrZZ5SvTb3LYuEpLw965Zq2vhKDya42xeZAMOVGwuAYns6ECXP8dabYniQdzJtvhHZma3mcGhcmNgblo1J/EduOKXInD2OOA/2rstSipdGn9eFCSqEkQRX57QmX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohQ0XBLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohQ0XBLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017971F00A3A;
	Tue,  4 Aug 2026 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861033;
	bh=IJyijGaaD7H+WNP17O2sPTV7I8e9x5p1g9wjBb7g6Jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ohQ0XBLaoHwiJhpX5Zy096QHWvqNmgxGOnjHMPBR2fv5NAFlLN+GKtW2HOc73HIoS
	 CQrGU41WgjCh+veLvopGujKl/XEt5DBn7Cpe6AwsvPIfl8yBNLIdGmPYVDtBt2jRgz
	 ynG5ncJT+2MwcvpnjbR7YcalitDlIcyx3dYPldtUJgz867HvNV5Ke41c6ao97YFFgK
	 ZIuQU4JmjsYJtLUrtMS/xacgJPoxL25vYxAK7Qh7m2hB71a2c8bVo52LikpN8eQQav
	 acJeZOCAFAiUP6WTGtfjnlK0G/5OqVTMh08Zrvfox2xv/3tLtbaf5fnB+gx6Zt2JGZ
	 68GQHLHLwZaVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 33/36] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-34-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-34-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:30:32 +0000
Message-Id: <20260804163033.017971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The fallback logic for chip SCU regmap lookup masks `-EPROBE_DEFER=
` and other legitimate errors from `syscon_regmap_lookup_by_phandle()`.
--

--- Patch [33]: [PATCH v9 33/36] pinctrl: airoha: try to find chip scu node=
 by phandle first ---
commit 61237bb0bf7e8867822c8f795d7f2be68c677edc
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first
   =20
The patch updates the airoha pinctrl driver to first search for the chip
SCU regmap using the "airoha,chip-scu" phandle. If that fails, it falls
back to using the SoC-specific compatible string.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 5a9afea4bb960..f6acbfdd0911f 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -781,9 +781,12 @@ int airoha_pinctrl_probe(struct platform_device *pde=
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
Does this fallback logic inadvertently mask legitimate errors like -EPROBE_=
DEFER
from syscon_regmap_lookup_by_phandle()?

If the initial phandle lookup returns -EPROBE_DEFER (for instance, if the
syscon node exists but hasn't probed yet), IS_ERR_OR_NULL(map) will catch it
and execute the fallback to syscon_regmap_lookup_by_compatible().

If the legacy compatible string is then missing from the modern device tree,
the fallback will return -ENODEV. This overwrites the original -EPROBE_DEFER
error, causing the driver probe to permanently fail instead of correctly
deferring.

> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);
> +	}
> =20
>  	pinctrl->chip_scu =3D map;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D33
