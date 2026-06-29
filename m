Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5F3EDAAE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735008; cv=none; b=MJ1zsZLTM30wLTe0LOGtEEvER4qeL6hGUxowLB4eLHfMC1MD8wXpOsT2zbqPSY9o84eR3XEQXvqfASa9d8TKd+8SFs9+VKCBxbTOCvc/1nggzptkydEYef0U10Q0gImpmBaKdTNBC19W5s2M8ewI07Y9hAJxdsWaEy44Exv1MGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735008; c=relaxed/simple;
	bh=pVi4YsLus+sT1FC9S3DAXvp2sAOyC8lo8oxlpyDYIXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EmUKH8H3OhLxjQQU5DEAVIx6WPM1GZYTFwDH6Fie9Kct718d0eXCYnea6lLMWbfq1qEagtb+e6gcENH6BILKX1/EtTK12+7s3A8BrAinUx8n+wiStEZJqZPSHXk6B7Tn/9gJMe4OdG5viFxTwxlal4rZu6lxZGIMWNxFBv3sRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7cMSpbW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7cMSpbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564731F00A3D;
	Mon, 29 Jun 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735006;
	bh=wLflOWKbIcd/EssWnFa8SVesrRfJXKq1yOHLYtW6taA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7cMSpbWi+c73RinQ0e7Sp0dRhJoA1dBJjBVlcZbjl2n9P9BkwGDxHQcMKhzPraUm
	 G4nqeYyr/rQKks/daEKUz9YdMfUp5fTBbImP2fvcLiYw8WKq36GLj5DoapXc9BRcrB
	 YpA8U3YuSuJnTQXOWjEd8TDZg5PG31E1WbiHpDOPhTlTU//opQnP2RVgJJiANV7TuY
	 TNAIh7Cn4JVRnezEoJ1rMgAVajJ0/LzTPCI0S1nvVze4U/lAaafdnZ7RcT1PYC0Ex1
	 YzueLa0te4aPxLZb+efZPvzLSLAy+QBb2o+uSa3gR4Cq6tRga9y6Av40G4hW1FS0Bn
	 g68JfzlyiNAxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/2] dt-bindings: net: altr,socfpga-stmmac: add more
 interrupts for Agilex5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629114818.1746410-1-dinguyen@kernel.org>
References: <20260629114818.1746410-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:10:05 +0000
Message-Id: <20260629121006.564731F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema enforces a strict minimum of 17 interrupts for the Ag=
ilex5 compatible, breaking validation for existing in-tree device trees tha=
t only define 1 interrupt.
--

commit 7df8c6aab116c93fb2cc3131f91a04fdfb5b5ecf
Author: Dinh Nguyen <dinguyen@kernel.org>

dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agilex5
   =20
The stmmac hardware on Agilex5 supports 8 TX/RX queue pairs and is
dma-coherent. Update the schema to handle the hardware differences
between SoC variants.
   =20
Also make 'interrupts' and 'interrupt-names' as required properties.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index fc445ad5a1f1a..63084f7623738 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
[ ... ]
> @@ -149,10 +167,36 @@ required:
>    - clocks
>    - clock-names
>    - altr,sysmgr-syscon
> +  - interrupts
> +  - interrupt-names
> =20
>  allOf:
>    - $ref: snps,dwmac.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-stmmac-agilex5
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 17
> +
> +        interrupt-names:
> +          minItems: 17

[Severity: Medium]
Will this strict minimum break devicetree validation for existing in-tree
device trees?

For example, in arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi, the
existing gmac0 node only defines one interrupt:

    gmac0: ethernet@10810000 {
        compatible =3D "altr,socfpga-stmmac-agilex5",
                 "snps,dwxgmac-2.10";
        reg =3D <0x10810000 0x3500>;
        interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-names =3D "macirq";
        ...

If existing trees don't provide all 17 interrupts, enforcing exactly 17
here will cause dtbs_check to fail. Could minItems be relaxed or should
the existing device trees be updated alongside this change?

> +
> +        dma-coherent: true
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
> +        interrupt-names:
> +          maxItems: 1
> +
> +        dma-coherent: false
> +
>  unevaluatedProperties: false
> =20
>  examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629114818.1746=
410-1-dinguyen@kernel.org?part=3D1
