Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC304214A84
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212183; cv=none; b=TUxojzbPjRuKxz6vVmdPrAapWyaf+NPf1vad/LS2rzIF2h7G69veX5mxI+IATuTBQ0xl0ehZl6EIUdGNe6Z/qAcKDkABg+gfnj/zdIoSWmmrbrvafYWu2q5MQd1lU11BXgp1LQMvEt/RFDgqh9xW05QKrlWCTKdmgf+KDdtON5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212183; c=relaxed/simple;
	bh=/XFFLo+ByKBHRcy60P24cpRuzY19ZOlGX7rdOf9t80I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mTqAp9iGzbqlpxzjqUeLCBLs973clNrHbkY/6PO/BQ46x09KrOV/crhLxBRviJxwH+RnvKGrHtd9B3vB/DoOuVjoBhMb8lXjeTyZZClI6n8WGdwTmaO2VQh4QRC+x4HVe9+pVg/HZZLJnero7ZSBxAQvolL9q4UqwgXVF4v75io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc9xhfff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc9xhfff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143F01F000FF;
	Thu, 24 Sep 2026 01:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212182;
	bh=Ho+ZWyWKYyvkoPN/emCtGXT2qDmAYrJcWDEvh6f5OWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kc9xhfff38MPa4JgjfRLFHENt9i1dlcBoAtmfD+NOFWOKj3KUyKfo96fiUX755NVq
	 ArywEgIok3+aK8OanBhIHG6KBX2UtIsvGd6JevVm89nHjkdaQXQXWF4ecq5GxooQ4+
	 ngnRApFN0iVrhdTuRr2yATrErb64TXz/WNfNUvGTU4AEwQAJT4C6YL3kGvLABu4sSt
	 4cfMXAPD6jjV1CPtrL0LTuHHS1VKN6XOpXDkEtvUhTp06OZ8PqCmcx2ZWoagkJa/an
	 HErjJockTGAmwTqKE2ROK7GXv9QlY+8LNcGlJGq/R8F3zCDBWzV3fHCzD+rOpr3ki7
	 W3+KG15SVRi4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 6/9] dt-bindings: net: qcom,ethqos: add
 Qualcomm Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-6-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-6-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:41 +0000
Message-Id: <20260924010942.143F01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing clock constraint restriction for older ethq=
os devices
--

commit 2ec6ff874b6b04da419dd5b3f1e6b8a59de089ce
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

dt-bindings: net: qcom,ethqos: add Qualcomm Nord

This commit adds the Qualcomm Nord compatible string to the qcom,ethqos
binding schema. It updates the constraints to support the new variant's
requirement for 5 clocks, 1 power domain, and 10 SMMU stream mappings.

> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Doc=
umentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 423959cb928d9..41de2ccd56458 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
[ ... ]
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,nord-ethqos
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +        clock-names:
> +          minItems: 5
> +          maxItems: 5
> +        iommus:
> +          minItems: 10
> +          maxItems: 10
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 1

[Severity: Medium]
Since the global constraints for clocks and clock-names are relaxed later in
this file to allow up to 5 items, does this else block also need to restrict
clocks and clock-names back to a maximum of 4 items?

Without this restriction in the else block, device trees for older hardware
generations might silently pass validation even if incorrectly configured
with 5 clocks.

[ ... ]
> @@ -57,19 +80,31 @@ properties:
>        - const: sfty
> =20
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 5
> =20
>    clock-names:
> -    items:
> -      - const: stmmaceth
> -      - const: pclk
> -      - const: ptp_ref
> -      - enum:
> -          - rgmii
> -          - phyaux
> +    oneOf:
> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: ptp_ref
> +          - const: phyaux
> +          - const: eee
> +            description: |
> +              Due to a hardware quirk, PCS link-up depends on the EEE cl=
ock
> +              being enabled.
> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: ptp_ref
> +          - enum:
> +              - rgmii
> +              - phyaux

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D6
