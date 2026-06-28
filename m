Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65603B27DB
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658496; cv=none; b=g39OeA1FtGDMU8EJO5Fn4ZTZG8laVIilZSZoWv3h0llpkIWBsXi98w5xZH2n2b1iSkQ9DnazZ3aHSBs4taowilAG6WIxbKQg1XjuyBrSrFTp6N1mce+1ONLY6iHKBG4a98dMLEw/ycQkpk/wD6yNrVRLxNDSMyv18+fvoSopn2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658496; c=relaxed/simple;
	bh=5rnBtbOlnTh30gpGwEvWX6zqz0pZbhnq6xyZvq8CURU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J2c76tPpnSPH1fzhcj7MEv/S7K+Yt3PE3MB2xpaN4l3FWcnMZ4+dDhmoi33xA5cOLb1GbK6Lzjydfw+QqhEF/geFtu7IxBXgFYugRNqusj8lStSFbrmpODl0Yh7/iPgVtqe/K/8x+RxB/9MWoi4/vuToSBJPg2xryfcZQsRz6DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IV9Em8yo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV9Em8yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169531F00A3A;
	Sun, 28 Jun 2026 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658491;
	bh=O0r7eSuN6v6bzHwbOOZGfF3uXmsxALwiuLO/lMAtWw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IV9Em8yoesAItSSx8VwOh9FJXU0j9+WvKVRwuVGPbh+8fI+DvnzksZKJm7lwzJ3M5
	 iUYrvaXaoj8ZqET/WH4cKxAxAyNTNJxDDh4YjtTdN/FxCsh0q8jp7dabVLH38oREIg
	 QI+RL1s7Y0zjgrFz04lAZEikoizDhgYc5DrYXUCAbSo8ivOuiPn+LCyerbpx9QHW+q
	 IYTwqXtuq9b7D+1B69zdaIK+F81evfGMG+JYPoRR8DHwiDtRqQ2YHP7cyzwfJ8T+jP
	 pRkRdAfHgU9Y7qgPmXS6cvUwl/vcr8CoE6+gQLPZG81jzY4/uLB5gJTx0dRerYuGLk
	 v6/ioS2HvdvDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/17] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628143733.273651-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:54:50 +0000
Message-Id: <20260628145451.169531F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Probe deferral and resource errors from `syscon_regmap_lookup_by_p=
handle()` are masked by unconditional fallback.
- [Medium] The 'airoha,chip-scu' phandle property is not documented in the =
device tree binding schemas.
- [Low] Unnecessary and incorrect use of `IS_ERR_OR_NULL()` for an API that=
 exclusively returns valid pointers or `ERR_PTR()`.
--

commit 5fba429358ea0aaa62389e837020f02835843d58
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first

This patch updates the probe routine to search for the chip scu regmap using
the "airoha,chip-scu" phandle before falling back to a SoC-specific compati=
ble
string. This provides better support for newer SoCs while maintaining
compatibility.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 543475d23fde3..e24e03b39d3d5 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -683,9 +683,12 @@ int airoha_pinctrl_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(pinctrl->regmap))
>  		return PTR_ERR(pinctrl->regmap);
> =20
> -	map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
> -	if (IS_ERR(map))
> -		return PTR_ERR(map);
> +	map =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip=
-scu");

[Severity: Medium]
Is the "airoha,chip-scu" property documented in the device tree binding
schemas? It appears this property might not have been added to the dt-bindi=
ng
YAML files, which could cause device tree validation tools to emit warnings.

> +	if (IS_ERR_OR_NULL(map)) {

[Severity: Low]
Is IS_ERR_OR_NULL() necessary here? syscon_regmap_lookup_by_phandle() retur=
ns
an ERR_PTR() on failure rather than NULL, so IS_ERR() should be sufficient.

[Severity: High]
Does this logic unconditionally overwrite -EPROBE_DEFER if the primary look=
up
fails because the syscon node isn't registered yet?

If syscon_regmap_lookup_by_phandle() returns -EPROBE_DEFER or -ENOMEM, the
fallback syscon_regmap_lookup_by_compatible() might fail with -ENODEV and
return that instead. This could cause a permanent driver probe failure rath=
er
than waiting for the resource.

Should the fallback be restricted to only execute if the initial lookup
explicitly returns -ENODEV?

> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);
> +	}
> =20
>  	pinctrl->chip_scu =3D map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628143733.2736=
51-1-mikhail.kshevetskiy@iopsys.eu?part=3D16
