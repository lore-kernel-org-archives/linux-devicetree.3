Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CCC39659A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566841; cv=none; b=qxffi7osAW+kajF6rZQi3gM1WIxffkPI/3+CyZyBN0DHk7Uv4LIqJn4Qf55tIzY2SB9V12S8EY0194viqSLTG7D/Ug/jdxQDDjDr3AYrigPIUfqR8+EGk8PcerG3cSs1cGU28j9JoI2vZAgHKzK+d9+kOaYDl93og7mfo2A/h+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566841; c=relaxed/simple;
	bh=RUr3XKFhYqIdn+HqiT1HP9ppQIomYCx6OD8ZlUkvM8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GbClQEvnk2s1BZpBc5m3bPo5BspirVnrSE5IP94GJPI/gyv5u+MU3pY8ZXdStluV3+W951sNKzBkNW/Bt/R+2MlxmCjpiRzfVc4MVNlWdKozo4NRSB3/p6btrf1usofpV9u8BdR24xdM/gUtIhlkoOH3cp4eh+IJAVuCCF4QL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYm0gLnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYm0gLnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260CB1F000E9;
	Wed, 12 Aug 2026 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786566839;
	bh=SZtyWmuRJjUUevcuDmLBrcaM+wamZVYbXKwJBw6d1mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYm0gLnZyjnipCs5/VYaN3mJEOf59sYvueI9ikF4mU7yX1Dl6wzXAj/+ZlG+gWHyK
	 JWKjKl/k53k1N3gzSjceKG4/rHq62yZoiaoOsnAWwM+M5Kt7A71V6TvsbPSQLWrToR
	 iE+ghaJSWophg9PbHaESWPmbxCCfjsgEcFLRED7NeUmc4iXtnLWJjQheQmFyjTAmxd
	 NI2RTwUUCHwlrYsI8xFclAap8W0LXgw2XdZghbAJjoeAX+ty7wVua5g6Cx5+rpnHXU
	 zXH8cUtvxP0un3k5HwURqDX8SF8iPhmxBO8nft7XvB6Z3/lXEnMBbyp8SL7jTx2bhP
	 Z8Y/Ql/TUhR3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tan Siewert" <tan@siewert.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-ts-x470d4u-v3-1-c8e266f1663b@siewert.io>
References: <20260812-ts-x470d4u-v3-0-c8e266f1663b@siewert.io>
 <20260812-ts-x470d4u-v3-1-c8e266f1663b@siewert.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 20:33:58 +0000
Message-Id: <20260812203359.260CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit unintentionally introduces a second, undocumented compat=
ible string `asrock,x470d4u-data64-bmc`.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U =
BMC ---
commit edbc123921dd78f14b8c4849e14a649077a33ee2
Author: Tan Siewert <tan@siewert.io>

dt-bindings: arm: aspeed: add ASRock X470D4U BMC

This commit documents the compatible string for the ASRock X470D4U BMC boar=
d.

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index dd7996960de3e..277c0e03cf488 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -40,6 +40,8 @@ properties:
>                - asrock,e3c256d4i-bmc
>                - asrock,romed8hm3-bmc
>                - asrock,spc621d8hm3-bmc
> +              - asrock,x470d4u-bmc
> +              - asrock,x470d4u-data64-bmc

[Severity: Low]
Is this second compatible string an accidental inclusion? The commit message
explicitly mentions a singular board addition.

The data64 suffix appears to be an internal convention used elsewhere in th=
is
file exclusively for Facebook hardware with 64MB datastores, such as
facebook,wedge400-data64-bmc. This allows an undocumented string to pass
schema validation even though no such ASRock variant appears to exist.

>                - asrock,x570d4u-bmc
>                - bytedance,g220a-bmc
>                - facebook,cmm-bmc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ts-x470d4u=
-v3-0-c8e266f1663b@siewert.io?part=3D1
