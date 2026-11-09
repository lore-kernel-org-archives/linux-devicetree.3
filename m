Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241888;
	b=yfiSepqK5not9p9boSZyr9Tc+sly/s8CjdBbAKkjSqrT64rUv5u1xHCOO3W80ecWWBPp
	 WM5CQX8/0eEBaopeP74BtEf/KJszSJAnxRDZ4XwA3DIV5YSc6l/LtOYOoTb9rMYnS5AfY
	 OzKdcLHQ3+h1w27q/lyzztoELyp5WrcXxLk92JExDHfF0Yeu4BXf9cQdjBRZ53fN2p1+2
	 fFlUk0rVoaqlxu8jNYl5B/zcgvK9WrRDfuVMV51TDwTxj3kGaDa39gBQAbmthxzaNET+8
	 hYCS47/QemHLWHxnzAGHt4C5EjEekECrBqmDBQM3QBV3fmjmx38hRJlOJ/FSEFiGvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241888;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ROzbYBaB7rjGvS+IjgSHkI0QX1ACximXnkqUTE8t1k4=;
	b=aCoso3uyTpgVGTjOsij485gtTxaIfyVDx4C5H7qGdgwSEDRFlKdY/UU1yxiGnjpevfSH
	 1XHf+IMcUOTXax7rG0/yp2OEB7tAWksghtqQGoMKWvFdY0/vWAA7eDiH7+jqtL1pLjN/9
	 EhJuvBWhs4G+uyk/FxfrCpWrXqQ+EOqxX9xt5fvTYErN581c6H9pjL2ubedPOtT+mpMhM
	 +xBEA/9fQL7+yAZ2A+S1uxVEm0f1ujTUsRmu7ZWl3oWdRkbMeUIj5annSnM1HGQ4BRylp
	 vCdRRI35X+cKSF0GfMLkuqBrVljbV9hvOG41PWpBpOnmPU2hEdS7B+WnzVtqLzvmEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGRWQH4k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34446606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGRWQH4k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5C41F0089F;
	Mon,  9 Nov 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241887;
	bh=ROzbYBaB7rjGvS+IjgSHkI0QX1ACximXnkqUTE8t1k4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGRWQH4kj9ZTkMY+gTWyPHwqInQqdvwVGlmbvSAT9dMJ3KrEQWDilLUopHyq8ii1M
	 3pI53LYsUb/j0bPcKaGdzC4oM4atmlmo81J3TvXlvXVvQcQVJrGJX4wbm+bAosesAM
	 bQyQHiD91kOfc0f25nG6e02zJ2GydbGsjYCBTTOcEUkZLJhMv8CSG/WMn7a1z9Ss4d
	 BUwLKZAUugEx9DxgSF/W6GwM2PRF1xwdrJAFiKa/OvU2nhzEvgxtOHN02uh1xcTlRZ
	 P+16RYW3fFQrW1hb1NMJRYhlj03rb4fXWMKtXfVF7h4CEl7YMS+yVogjcvqMw8qZ8E
	 t5XGmk+JfN5kA==
Message-ID: <sashiko-outbox-205233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109162523.1698129-2-dinguyen@kernel.org>
References: <20261109162523.1698129-1-dinguyen@kernel.org>
 <20261109162523.1698129-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 16:31:26 +0000
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
- [Low] dt-bindings: edac: altr,socfpga-ecc-manager piles on Agilex5
  conditionals
--

commit 5ff2b28fe8d1c4bf87126e0c3c295e7d764f432e
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: edac: altera: agilex5: document new edac support

This commit documents Agilex5 EDAC support in the Altera SoCFPGA ECC
Manager binding, adding the altr,socfpga-agilex5-ecc-manager compatible
along with up to 7 named interrupts and per-compatible schema constraints.

> diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-mana=
ger.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.=
yaml
> index 136e8fccd429a..16940b49471cd 100644
> --- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> +++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
> @@ -20,7 +20,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: altr,socfpga-s10-ecc-manager
> +          - enum:
> +              - altr,socfpga-s10-ecc-manager
> +              - altr,socfpga-agilex5-ecc-manager
>            - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-a10-ecc-manager
>        - const: altr,socfpga-ecc-manager
> @@ -33,7 +35,25 @@ properties:
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 2
> +    items:
> +      - description: Global single-bit error
> +      - description: Global double-bit error
> +      - description: IO96B0 DRAM controller error
> +      - description: IO96B1 DRAM controller error
> +      - description: SDM QSPI single-bit error
> +      - description: SDM QSPI double-bit error
> +      - description: SDM single-event
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: global_sbe
> +      - const: global_dbe
> +      - const: io96b0
> +      - const: io96b1
> +      - const: sdm_qspi_sbe
> +      - const: sdm_qspi_dbe
> +      - const: sdm_seu
> =20
>    interrupt-controller: true
> =20
> @@ -235,28 +255,45 @@ patternProperties:
>        - interrupts
>        - altr,ecc-parent
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: altr,socfpga-ecc-manager
> -then:
> -  required:
> -    - compatible
> -    - "#address-cells"
> -    - "#size-cells"
> -    - ranges
> -
> -else:
> -  required:
> -    - compatible
> -    - "#address-cells"
> -    - "#size-cells"
> -    - interrupts
> -    - interrupt-controller
> -    - "#interrupt-cells"
> -    - ranges
> -    - altr,sysmgr-syscon
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-ecc-manager
> +    then:
> +      required:
> +        - compatible
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +
> +    else:
> +      required:
> +        - compatible
> +        - "#address-cells"
> +        - "#size-cells"
> +        - interrupts
> +        - interrupt-controller
> +        - "#interrupt-cells"
> +        - ranges
> +        - altr,sysmgr-syscon
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-agilex5-ecc-manager
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 7
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 2

[Severity: Low]
Should Agilex5 (or the newer SoCFPGA generations) be split into a
separate schema document instead of piling on another per-compatible
if/then/else block under allOf?

This schema already spans multiple generations with different property
requirements, and Agilex5 introduces a distinct 7-interrupt layout
combining aggregate IRQ-domain interrupts with direct GIC interrupts.
Also, in the new allOf entry, the else branch only restricts interrupts
to maxItems: 2 while leaving the 7 Agilex5-specific interrupt-names
unconstrained on older platforms, and maxItems: 7 in the then branch is
redundant with the 7-entry items list at the top level.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109162523.1698=
129-2-dinguyen@kernel.org?part=3D1
