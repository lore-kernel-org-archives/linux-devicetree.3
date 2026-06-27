Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C513B7A3
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782591980; cv=none; b=NKpWgeGLENur1PSfzw/mSg7vUrTl2zMmBpVaj4f0frezE4wEi8SCV9wV/I0QqOVMfXk7+zCb8xb8ZC4JZblZbt9Tf1CgR+YsY+03cRr+kqSJ8VkxKf8WUvvW2DNg2IVir/Ru5LDPP63iy+/vYtmcS3XSGk+2dcLCOPyJE6bqQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782591980; c=relaxed/simple;
	bh=9mrAwC7vpS0LnfheZhQG4118A/TTAyHeLrDwD4greaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJTLlXg4mO420NOch7bDGzDXjKKmmoprrPe29ZBLo0A8XWcH1wwiyM3K/wV8sMRAE3hkD4CAyid/VWTtIjkYUJ7F5Whi6Sx6KyMJLAIxBQPQawPpC8J7DU5XzFcCvIJnd1/N36jmFw6fhaRSjeIDGw5vT875E+La2JA9K10XVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc4c9fex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc4c9fex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C77D1F000E9;
	Sat, 27 Jun 2026 20:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782591978;
	bh=yZlInKQxw1pZa860MVrlv6mQ5xkQui79KP2LUwzcoVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vc4c9fexXcXMJHIpu+1IQ75HwmR3jsYuMY9mL9NFtIdueZr/5ayYEvl8B59bNZqPf
	 KB1pb5SCVtaLqc1WboMzYJjS4TOcyrT0pGcu4SclOZY87LxPNjD4BcjD9VLysXvxIc
	 GtwyZy5JMWZ6e9D9//mlI3LnR/iUzNNdo2ZcfoURyh0lncPNNfCTCoiHkI+EFS5TEi
	 7AGFImEYNGERpAPxsPAVL0ncmwm79ZOZ3hrsip7jai82hr2nQ/9eASxqHPNoNzVHLC
	 DCawCatr/m3ruKI738omATuwQG/bfc1Wlt+/c2By0ww26ElAhQPX2QItj0253Gruv/
	 3hjcrJQUF/9sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: mmc: cdns,sdhci: add SD6HC support
 and PHY properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260627201457.12318-3-tanmay.kathpalia@altera.com>
References: <20260627201457.12318-1-tanmay.kathpalia@altera.com>
 <20260627201457.12318-3-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 20:26:18 +0000
Message-Id: <20260627202618.8C77D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree schema guideline violation: standard properties are def=
ined solely within conditional blocks.
--

commit e277493647bd6915b90ee32b253e1cb7514a8c5f
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

dt-bindings: mmc: cdns,sdhci: add SD6HC support and PHY properties

Extend the Cadence SDHCI binding to support the sixth-generation SD6HC
controller. Add the cdns,sd6hc and altr,agilex5-sd6hc compatible strings
along with variant constraints.

> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Docu=
mentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> index 6c7317d13aa6c..edd96e1d2bdcd 100644
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml

[ ... ]

> @@ -139,6 +168,77 @@ allOf:
>          reg:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cdns,sd6hc
> +    then:
> +      description: SD6HC variant - use IO-cell and delay element propert=
ies
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ciu
> +            - const: biu
> +        dma-coherent: true
> +        iommus:
> +          maxItems: 1

[Severity: Low]
This isn't a bug, but should clock-names, dma-coherent, and iommus be
declared in the top-level properties block instead of solely within this
conditional?

The dt-schema guidelines suggest defining properties with their broadest
constraints at the top level rather than entirely within if:then blocks, to
ensure proper documentation generation and tooling compatibility.

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,agilex5-sd6hc
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +          maxItems: 3
> +        reset-names:
> +          items:
> +            - const: sdhc-reset
> +            - const: combophy
> +            - const: sdmmc-ocp

[Severity: Low]
Similar to the clock-names property, should reset-names also be declared at
the top level rather than being exclusively defined in this conditional blo=
ck?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627201457.1231=
8-1-tanmay.kathpalia@altera.com?part=3D2
