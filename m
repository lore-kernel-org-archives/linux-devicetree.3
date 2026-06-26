Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C154D225775
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 03:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445398; cv=none; b=H0bT3rzrIR5594rv1IxK5t/ixELjpxEJFGiMs0F2vt3chXJZ06yjZwrgAjsixN44lG6mnMbfiZL7hc5Bhu0P1Yh8TXvs7y+qWgZsXRhUME0xF2e/fnOzNxjPR7w7Gu5QDPVQAi4w+CyEVj6diJP/rrfxlsroZ03v9X2TjgDO6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445398; c=relaxed/simple;
	bh=XfXzYOumHAA0oM13K44N9eLE2yi7Ha5XlIkaF8juPFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fPjIO6QirYij7Ynok/p6xRKzos4HRGaU8BCQWp1LRi8rBh4ltffdZNzbRbWkOftSg5S75pFkcpQZ/on8BxGDYemL00qLD9zkFt35xn66ZgT5yIPpVOOyBeJa7zRj1Z60NB7J04ejuCrzQnq8pEFf8xEad+al0ClifbcLak7z8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv2yRmVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv2yRmVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250CF1F000E9;
	Fri, 26 Jun 2026 03:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782445397;
	bh=QvWU6qL7RZ3yfkLWfbSm+tAZxEODLM9S+CaAzvGwDrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wv2yRmVGPW4pnfKoOdJUQ5mHf8Twv8aIDu489+wKCsGd0N2SqSHfa2hX/JoffhhQz
	 ILeafR1r3VI0aN8IUr1cv0EbkFiwmAfCsulRkIT2rzl8h0BjG+L/Db/uw7kv3v7aJe
	 vEuVuBm2ntraYvXYG/k3AbXY1foxK7GUA++aCB1L1HJZfgkPtHape11DnwCV/wQEMi
	 xtn/vXAn8eeRyhYl13b4x73b3ESKqxw2O61/RUNsKpkEjgtzszCwoNKCHC4KRQN+0f
	 V+OVFzI0ICzhZWMcgAfz5Yl5dBI7BcbIk27MDKm+JQnMQwowDanYLLzr1rHtm/hz+K
	 pQ6cPstsNGeXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260626033418.520762-2-lijq9@lenovo.com>
References: <20260626033418.520762-1-lijq9@lenovo.com>
 <20260626033418.520762-2-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 03:43:16 +0000
Message-Id: <20260626034317.250CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string array for the Lenovo ThinkEdge SE70 omits the=
 underlying Xavier NX SOM compatible string.
--

commit bdfb0a0b8f7c5312dd01ccd7b35c0e589b16d8f5
Author: Jiqi Li <lijq9@lenovo.com>

dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string

This commit adds the compatible string for the Lenovo ThinkEdge SE70 carrier
board, which is based on the NVIDIA Tegra194 (Xavier NX) SOM, to the ARM
Tegra device tree bindings schema.

> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documenta=
tion/devicetree/bindings/arm/tegra.yaml
> index 033a63f6c0687..960c604ef9a3a 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -268,6 +268,10 @@ properties:
>          items:
>            - const: nvidia,p3509-0000+p3668-0001
>            - const: nvidia,tegra194
> +      - description: Lenovo ThinkEdge SE70
> +        items:
> +          - const: lenovo,thinkedge-se70
> +          - const: nvidia,tegra194

[Severity: Low]
Since the Lenovo ThinkEdge SE70 is a carrier board based on the NVIDIA
Tegra194 (Xavier NX) SOM, should this items list also require the underlying
SOM compatible string (nvidia,p3668-0001)?

Restricting the array to exactly two elements here implies the corresponding
device tree will omit the SOM fallback string. Omitting the intermediate SOM
string prevents the OS from natively identifying the underlying module and
could cause drivers or quirks targeting the Xavier NX SOM to fail to match
on this board.

>        - items:
>            - const: nvidia,tegra234-vdk
>            - const: nvidia,tegra234

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626033418.5207=
62-1-lijq9@lenovo.com?part=3D1
