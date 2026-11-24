Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539327;
	b=odb4hbAK8FRDLlVNDP8kVnj+x3Af4MZUvJfUpvF+6h6I/88h2u5URtRxSRJMCAhHTN8N
	 JCmCL95jUCe64/bgwheI9gg2MaBGcygodMv0Ci6KayK+CbEeNbWtYIvQi3TfT/euysHJK
	 1n3gezc73AfA3HWYGWIi/3Ow8Z2JBCrER20JZLNxECRRCjMR3kAGvmBL5DsSKw1hvHY2K
	 6mRkvQrMWyoY6bp/9tY1F4jwGARRhSzild/kj+RmM/5GVuYJu0lw7TP3n8zEKZZwhpvzw
	 kORa8GgTUDtItCl5uHV+LtHGtQTRxPSWTLZgv/s6PZzVC+8O3JWG3n+PynMyE4/zI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yaa1ucdiXu2ZqlR8D2y7IV3Ou24KRSFVhewvBEmrXX8=;
	b=X/nAYifFdS07doYdUq0PidbGT0cJPj+qA6PFg3LC+rMtmwmwxAZ9V2mIpYxI8GaOqLHO
	 eJG1bRsS36i2+yccFGAOKywqZRtijeC+ny9HUhbmHnBJWyKmvTE4DNVKozdH+tU+DX9kL
	 bbxGEfzEK3X3gbG2ff2nJobEJYLGFeBlM2rOQqdOJGbZrLWPAH/IGTC2dlf4H6PHcyrGz
	 av6mm1nHovyl4Rj+OtggrqOn1TbHOjsRLkT0m51xki4zAK3eoTGO3gIGQZAhj5WhjSPrA
	 vk6qrL8FKIRsebZyxQaXJ/0M953rGwmWdEtnS6g+psq2CITUPaa+Bd1CE2PNiZtPIFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5NREgNL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323C606A33B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5NREgNL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1456D1F000D1;
	Tue, 24 Nov 2026 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539327;
	bh=Yaa1ucdiXu2ZqlR8D2y7IV3Ou24KRSFVhewvBEmrXX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5NREgNLl46AvfrClHRsbAvQRT8ucW6IauusXsAuxbxyhB2//MB80ZM7ln87uBfUC
	 AZ0jdlrg9noetu8esn7ot1Ntv9l76+YKTUKl0eps8ejWdNMLQL7brmfaC48LqYLAoX
	 IQjJpG6409OI1feI7Xm86F9haow5NA63qM61dHPaisJhZ5YD5NBez/sYTa1A/s6N3w
	 8qY5yd9zr5YkPqzCIyptPS1178QT3lN78UqLmZFdY8OV6kCS8n0lzi31VsYt6ZmK46
	 op9A8Ok361l79WW8E7xq+Bt07pNFBacYbDhgHumSC7v8HGcvM+rONmMaYndRxE4iy2
	 nN8vPMDWJFwaw==
Message-ID: <sashiko-outbox-231620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/10] dt-bindings: arm: stm32: allow TAMP nvram
 child node for syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-upstream_nvram_reworked-v6-2-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
 <20261124-upstream_nvram_reworked-v6-2-ea0cfccc20b0@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:55:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: arm: stm32: requiring address/size cells breaks
  childless tamp
--

commit ecaee20f976bb2eae8b98a614ee17d74f8f0700e
Author: Patrice Chotard <patrice.chotard@foss.st.com>

dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

This commit updates the st,stm32-syscon binding to allow #address-cells,
#size-cells, ranges, and an nvram child node on st,stm32-tamp nodes.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b842..70266070c57ba 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml

[ ... ]

> @@ -76,6 +82,9 @@ allOf:
>                - st,stm32mp23-syscfg
>                - st,stm32mp25-syscfg
>      then:
> +      properties:
> +        "#size-cells":
> +          const: 1
>        required:
>          - "#address-cells"
>          - "#clock-cells"
> @@ -84,11 +93,39 @@ allOf:
>          - phy@2800
>      else:
>        properties:
> -        '#address-cells': false
>          '#clock-cells': false
> -        '#size-cells': false
>          phy@2400: false
>          phy@2800: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-tamp
> +    then:
> +      properties:
> +        "#size-cells":
> +          enum: [1, 2]
> +    else:
> +      properties:
> +        ranges: false
> +      patternProperties:
> +        "^nvram@[0-9a-f]+$": false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32-tamp
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> =20
>  additionalProperties: false
> =20

[Severity: Medium]
As reported by Krzysztof Kozlowski on v4 [1], does requiring
#address-cells and #size-cells for st,stm32-tamp break validation for
childless TAMP nodes?

The nvram child node is optional and the schema also permits
st,stm32-tamp with only syscon (without simple-mfd or subnodes), so
existing device trees with a childless tamp node (such as tamp@5c00a000
in arch/arm/boot/dts/st/stm32mp151.dtsi) fail dtbs_check when these
properties are required unconditionally.  Since st,stm32mp23-syscfg and
st,stm32mp25-syscfg already require #address-cells and #size-cells in
their own if/then block above, dropping this then branch while keeping
the else branch allows the properties on st,stm32-tamp without making
them mandatory.  Also, the then branch in the st,stm32-tamp block above
repeats the top-level #size-cells enum: [1, 2] definition.

[1] https://lore.kernel.org/r/20261106-tireless-cobra-of-passion-1fca1d@quo=
ll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream_n=
vram_reworked-v6-0-ea0cfccc20b0@foss.st.com?part=3D2
