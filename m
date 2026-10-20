Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465318;
	b=oUkcpXNB8vPuzp4VgS3C7xXXzv0CEBS8kjcpHT80oq6H3X0h/24Pb+xwruT6PRlnyyf9
	 j/7GJvMViKGkeXvtQx6OQq9WjpuMRQ3JCsL+oKS6hlaAIu8keK428VkteTuzi1G/+uv0c
	 oWIZX6axax4Z/tlobnYR90A0ebR0cyqNiTfFXihYEx3554iqa15sFHvnnGJ3rH0QvNBmV
	 fQD8XbK1F+1DCn4Po9z+OfVi4yfhfvllsRwkbMCoGwbI+Gk3WTI+7PoThnN8j/+jfgeVw
	 PYbbyLQZidGosWsUwd08/NDiRFAzPcvm9FUrweXJuBcp+slTOI00tsFSJ6ohfYGJlWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OjqnarITAzzJbhssF5XR8htM0JXMrpR4UuWk6Vg3Uts=;
	b=HhKmXm4t+m68jI1OAkEQkUbwaGGIeyVe2gBO3cSmWnuoWSoYaJYH6M3QbZGhDN4yLkio
	 FShDFc8ntmCdOgzrMTWqW0H5gsm0OGjm1qkewBq2jdbEFnrW5WBzK/fyQ9OpTs583hIXx
	 Fkg/Kq2TllPBizM1Ma8fHKhRMwgPd6rl6xbOjlDn869beZdmYRGeaTFVF1nh/nJgTDK4F
	 N95jzOWiV1zq1wZkEQVoXWtKJjSnhRiJA3W5/Bzn+XdCcc1zwJZXDfTERi9ltR2+2a9y0
	 IND8F9QtBCrEOBvfIAXv0Rf5iCmjbccS3JUzIRn8BqM00+vJSVRiKMa0PQotuBo1RMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVzIdBOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D587606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVzIdBOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3611F000C4;
	Tue, 20 Oct 2026 03:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792465317;
	bh=OjqnarITAzzJbhssF5XR8htM0JXMrpR4UuWk6Vg3Uts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVzIdBOR8FCrvy5HeVgYrH85biMAAsCcm+KmffSLkOgPDIpnO0q5w5vzovd+PGrj6
	 VQXvNKAHAOGWHh7ODZFDURWMZ04pvmVaSzanGLU/sJ7H6TCKKcnUusl+BHph11ghvj
	 jeSA9JHTCgSiGEmaNB0rkhpWkd3FIDkSsWZa89Fjdx+Q+kMC/pT1Hc9sGPhOiddvqC
	 MohOwTT0KhVTl1hVM1F6HzQoTP97lRx6ONW0vyylC9R2kV93a2umV1RpEbnVYXxMi9
	 Czc9AT9cuM0tXqnwOr83WsdRTgJCeN/zAHtR6/yIlFlpWjrH1UGshY5cmxvxs5eGZq
	 mXgII04xROGVg==
Message-ID: <sashiko-outbox-178426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: add support for Toshiba
 TC9564
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019030129.1470307-2-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-2-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 03:01:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: snps,dwmac: invalid items list under reset-nam=
es
- [Medium] dt-bindings: net: snps,dwmac: missing toshiba,tc9564-xgmac in sn=
ps,tso rule
- [Low] MAINTAINERS: wrong filename for toshiba,tc9564-xgmac.yaml binding
--

commit a79ac6443d5804b83846d7672a48631fcd49b078
Author: Alex Elder <elder@riscstar.com>

dt-bindings: net: add support for Toshiba TC9564

This commit adds the devicetree binding for the Toshiba TC9564 XGMAC
Ethernet controller and updates snps,dwmac.yaml to allow up to three
resets.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2218a492817fd..ace827ee4eb6c 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -120,6 +120,7 @@ properties:
>          - starfive,jh7110-dwmac
>          - tesla,fsd-ethqos
>          - thead,th1520-gmac
> +        - toshiba,tc9564-xgmac
>          - ultrarisc,dp1000-gmac

[Severity: Medium]
Should toshiba,tc9564-xgmac also be added to the compatible list under
allOf in snps,dwmac.yaml that guards snps,tso?

In Documentation/devicetree/bindings/net/snps,dwmac.yaml:

allOf:
  - $ref: ethernet-controller.yaml#
  - $ref: snps,dwmac-common.yaml#
  - if:
      properties:
        compatible:
          not:
            contains:
              enum:
                ...
                - snps,dwxgmac
                - snps,dwxgmac-2.10
                - st,spear600-gmac

    then:
      properties:
        snps,tso: false

Because toshiba,tc9564-xgmac.yaml references snps,dwmac.yaml# and
defines compatible solely as const: toshiba,tc9564-xgmac, omitting
toshiba,tc9564-xgmac from that list causes snps,tso: false to be applied
and rejects snps,tso in the new binding and its example during
dt_binding_check.

> =20
>    reg:
> @@ -174,17 +175,24 @@ properties:
> =20
>    resets:
>      minItems: 1
> -    items:
> -      - description: GMAC stmmaceth reset
> -      - description: AHB or OCP reset
> +    maxItems: 3
> =20
>    reset-names:
> -    oneOf:
> -      - items:
> -          - enum: [stmmaceth, ahb]
> -      - items:
> -          - const: stmmaceth
> -          - enum: [ahb, stmmaceth-ocp]
> +    maxItems: 3
> +    items:
> +      - oneOf:
> +          - description: GMAC stmmaceth reset
> +            const: stmmaceth
> +          - description: AHB reset
> +            const: ahb
> +          - description: MAC reset
> +            const: mac-reset
> +          - description: PMA (Physical Medium Attachment) reset
> +            const: pma-reset
> +          - description: XPCS reset
> +            const: xpcs-reset
> +          - description: OCP reset (deprecated)
> +            const: stmmaceth-ocp
> =20
>    power-domains:
>      maxItems: 1

[Severity: Medium]
Does writing - oneOf: as a list item under reset-names:items cause
dt_binding_check to fail?

In interrupt-names earlier in snps,dwmac.yaml, items is a mapping:

  interrupt-names:
    minItems: 1
    maxItems: 19
    items:
      oneOf:
        ...

With the leading hyphen in - oneOf: and without minItems: 1, items is
treated as a 1-element list rather than a schema applied to each entry
up to maxItems: 3. This conflicts with maxItems: 3 in the meta-schema
and rejects multi-entry reset-names such as the three resets in
toshiba,tc9564-xgmac.yaml.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 149bc44003bda..55ead3d1007a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28305,6 +28305,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>  F:	drivers/misc/tc9564-pci.c
> =20
> +TOSHIBA TC9564 DWMAC ETHERNET DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org

[Severity: Low]
Should this file entry reference toshiba,tc9564-xgmac.yaml instead of
toshiba,tc9564-dwmac.yaml to match the file created by this patch?

=E3=81=8A=E4=BC=9D=E3=81=88

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019030129.1470=
307-1-elder@riscstar.com?part=3D1
