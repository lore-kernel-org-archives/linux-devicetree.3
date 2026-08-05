Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91073EC6A0
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935174; cv=none; b=fZVrqhimNAr6HNMX/DvG4q5PYRsabFF5wwJeFOUsBp3wlGhHvmtoV3BO/eVVsZ30G85O0ni32zN7lsmqDhffhpYtkYKXKgFqR5u1Ha32uxaCBA+C0E2MNMts2Cyu08cWP/b106Cc6i4SymGhISX4N1FiI8xRnYOxw2GSQNUO+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935174; c=relaxed/simple;
	bh=gP9C2DAUGUG2Y0kBmOOiq/VwjNbTj0HzTGTFSwW6aeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gJ0L++V3DEZesVykX0voVjcqriHEw/tiw7iyQjkOFbrzol/TcQdeWjoNBOgD5rQpF3Cj5iSBJ9FEeGnNIzdMEZvFmnYYm4AeaHh1devBwJzJG2gcam/ysMdgiFs6Cv5X1OjXb9KG/+jQpJSuQNQ2+0KOxjuspd/HsjsijhXUNbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNG7Efmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNG7Efmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3831F00A3A;
	Wed,  5 Aug 2026 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935173;
	bh=s3aNKVGV4KH8uAI445MCwGmvwXx/L728ss41SccJ/nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNG7EfmcVdFvSzJgE08JPZwROkgGm8Arlh58mAVGc3LCAzmr6uV4uO0GtlcaBMzIX
	 Rem9Ie35zXU2qIEW1Norcv2F0jRVxpTK9d3qBDiS9PN+oppr6Occ1sWmJyswE2tYf3
	 NedB7hq/dnw2uweSUctyQd4ywdBo8kmDSGqoMQN37DZoLYU0E4PlMpIfCzEZGwv3RH
	 mPd1OGQxxbrrcGoWnS0+kd0oIV5ochSnno1AprCZK++SY4TICLDQjORyRWeHu6cYyo
	 pfIwYw1n8SVEXnpAOsjSe4cLn2W+9DzHRHtcYFh55tXn9LrfXLe1O+f+nDPYxATdGC
	 dFAHAcsrD1sFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 33/36] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-34-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-34-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:06:12 +0000
Message-Id: <20260805130613.1B3831F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Valid error codes (such as -EPROBE_DEFER or -ENOMEM) from the phan=
dle lookup are clobbered by the fallback path, causing permanent probe fail=
ure.
--

--- Patch [33]: [PATCH v10 33/36] pinctrl: airoha: try to find chip scu nod=
e by phandle first ---
commit 1b07c88ba2b60a6919f3a1d6b55003a4983e9897
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first

This commit updates the Airoha pinctrl driver to search for the chip SCU
regmap using a phandle first. It falls back to the SoC-specific compatible
string if the phandle lookup fails.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -792,9 +792,12 @@ int airoha_pinctrl_probe(struct platform_device *pde=
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
> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);

[Severity: High]
Does this overwrite valid error codes like -EPROBE_DEFER or -ENOMEM from the
initial phandle lookup in airoha_pinctrl_probe()?

If syscon_regmap_lookup_by_phandle() correctly defers and returns
-EPROBE_DEFER, the code enters the fallback path. If the newer device tree
omits the legacy compatible string, syscon_regmap_lookup_by_compatible()
will return -ENODEV.

Since the fallback error is returned, the original -EPROBE_DEFER is dropped,
turning a transient probe deferral into a permanent probe failure. Could we
propagate the original error instead if it is something other than a missing
property?

> +	}
> =20
>  	pinctrl->chip_scu =3D map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D33
