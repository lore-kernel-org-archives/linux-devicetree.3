Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED842C4F8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055352; cv=none; b=soMkA3yU1GDUF4GDe/YD67zqTwuL4KSWDBT2dbfyw0YMn5cyGtt8Ry4TmUJgI+mRp6ZnIhNnfu2R1TK6xdHxWN5B7PWo0DPrRhmynLeFub45ZGyOY6Dmixtqt3wcV3Dg44uj/Lb3UE5p2uORLYTTpBBe2M7fI/reU1YDX8l+rXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055352; c=relaxed/simple;
	bh=gKAhHtPoGJZfRnmGM3F3kD2oF2AgZyV0dR0hxpc4MXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGGq+pgsRMQ3vTG9U5N3Bdpnv/Yub+EFDLON3tPklUsNlqzIPN5fKTry27Qfhogk3YNYvhlh8tAlJK9fJAChNefv3XJlQoYsU9ChzDoolZBeJ0HYV2Xl6ZNvxnAdUW2M6R5i6uJo2XZVmsyoPNkfeNe8LGDjM5baefhxR4mztE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDQPiUil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDQPiUil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84B21F000E9;
	Thu,  6 Aug 2026 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055350;
	bh=jPczrUcW96CTor1ZlMjzdBFm2jh6wGi4fM70q7vgf4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDQPiUilJIur+ccMAyutzEoSfJKY3z5364bzHzebkdOBgnam7qf/MyT0lFQZGksTB
	 64txPVKVp1pC3nCoNQ8HWCOlWBjFWC+uWq+jqU5np/YPgUniL8fRNyKqLuQk3c8ebp
	 qHoXZcJcOqlmchuCAvG3ryjL7ACmQaqvF7Twn1v1cFu2bFeXIyHcWBxiQOTOrpy4zZ
	 ue38nSCtteOqrrekZg/I/wbDwlIv5mK8TsgaSciJ4dEVWM4BLQEsXw+h64qidZ9YIX
	 kUTABRXWjzEbFMAV6O97IwnBUQj7TvKgO5aP8w+V7Mnrms3qDSXRcQe4POq70pdmWX
	 DBjDA+Dnq8JLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 35/37] pinctrl: airoha: try to find chip scu node by
 phandle first
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806220615.4078303-36-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-36-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:29:09 +0000
Message-Id: <20260806222909.E84B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The fallback logic unconditionally catches all errors from syscon_=
regmap_lookup_by_phandle(), overwriting transient errors like -EPROBE_DEFER.
- [Low] Unnecessary use of IS_ERR_OR_NULL() for an API that exclusively ret=
urns an ERR_PTR on failure.
--

--- Patch [35]: [PATCH v11 35/37] pinctrl: airoha: try to find chip scu nod=
e by phandle first ---
commit 85429d10727580a9500263e5a9986ffdc51aa04d
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: try to find chip scu node by phandle first
   =20
The commit updates the probe function to first search for the chip scu
regmap using a phandle. It falls back to using the SoC specific compatible
string on failure.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 134c57a54b963..153dd825c18c4 100644
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

[Severity: Low]
Does syscon_regmap_lookup_by_phandle() ever return NULL? It looks like
this API exclusively returns either a valid regmap pointer or an ERR_PTR.
Could this just use IS_ERR() instead?

[Severity: High]
Does this introduce a regression where the fallback unconditionally catches
-EPROBE_DEFER?

If syscon_regmap_lookup_by_phandle() returns -EPROBE_DEFER because the
syscon node is not yet ready, the code falls back to
syscon_regmap_lookup_by_compatible().

If the device tree uses the new phandle format and lacks the legacy
compatible string, the fallback will return -ENODEV. This overwrites the
-EPROBE_DEFER from the initial lookup and permanently aborts the probe.

Should the code explicitly check for -EPROBE_DEFER and return it before
falling back?

> +		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +		if (IS_ERR(map))
> +			return PTR_ERR(map);
> +	}
> =20
>  	pinctrl->chip_scu =3D map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D35
