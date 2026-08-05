Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627A3D3326
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952725; cv=none; b=J07GX1D/wMDxCTFyva1N1RYfM9BOnSDtnPdhWy4jolATU9pxyZ+cAGTVX4iJZnHc/+12pfN6ydHH3rf8FWWyL0uKBZelyV45FxsMIVLZd6YB11/kVQazC2DyMQW2lTR96MJtLw6yXm4DP+Au9q2ibCOqD2F3sNpOzDdcR/zhn+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952725; c=relaxed/simple;
	bh=zH9jEREL5y5eM6ExbPwCdVX+iM9Xlfy6g0iFWnWELFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pHFC/n7ksyaq3NGvbGrKeXrZF5DnJD74bdkRWvdLW7aHrSns98qWph2E03Pb1L0MbOlGTbD07LJ9UHCwTZ3iKfF+8B0kBf04HzI9rzwD7pTC4u3VYjMV1GmqrDXbguCjMc4CRSt9QyJU95No5fsap9E+9pDUQwwpFGY63LxQRNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uil85rHg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uil85rHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590851F00A3A;
	Wed,  5 Aug 2026 17:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785952723;
	bh=xgpeY27VLxcQ7uoy6uQ7XeMpAHdEv5J7GhoPpcQivuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uil85rHgjGyezVFqcBVR7eelBraTFCn+IFDiePfCF4VD3o9gukkpay6aD0Tu1wdSY
	 HHbZxpnvh60K6X4RIUVFup+IC73cP+af85+Tr62EuvdiltH04DU5WidQ27Zykz16Kg
	 dpKE4EJDHEKRs/N5zk9uMkuKX3HX/N48U0cINFhOKErzR9eqTx/KtEFvvi+/Ys7Upw
	 e7yYQEZkSzXXNcKHcuF/V73qZ34YDpDWqG3rJN3TONTk8WAn72Sct89CiY2fMRswCw
	 B/Uel3APs+Fm0IuYnxbp6oYNY97thMoEbTBr0GizAsZdmNbL4RCL89oO4RmdOnvWup
	 7BZ/6u5YZgIDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: net: convert wiznet,w5x00 to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXJ0aHVyIENyw6lwaW4gTGVibG9uZA==?= <arthur@marmottus.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804-wiznet-link-gpio-v2-2-3b1d0c870f35@marmottus.net>
References: <20260804-wiznet-link-gpio-v2-0-3b1d0c870f35@marmottus.net>
 <20260804-wiznet-link-gpio-v2-2-3b1d0c870f35@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 17:58:42 +0000
Message-Id: <20260805175843.590851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree example contains multiple syntax errors and unresol=
ved references that will cause `make dt_binding_check` to fail fatally.
- [Low] The `pinctrl-names` property incorrectly uses `enum` alongside `min=
Items: 1` for a string array constraint.
--

--- Patch [2]: [PATCH v2 2/2] dt-bindings: net: convert wiznet,w5x00 to YAM=
L ---
commit 03b1fc0266172468d4c1e28d10eec5fa26175fe7
Author: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>

dt-bindings: net: convert wiznet,w5x00 to YAML
   =20
Convert the Wiznet w5x00 SPI Ethernet controller binding from
text to DT schema format.

> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5x00.yaml b/Do=
cumentation/devicetree/bindings/net/wiznet,w5x00.yaml
> new file mode 100644
> index 0000000000000..8f45a5d773fe3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5x00.yaml
> @@ -0,0 +1,103 @@
[ ... ]
> +  pinctrl-names:
> +    description:
> +      List of assigned state names, see pinctrl binding documentation.
> +    enum:
> +      - default
> +    minItems: 1

[Severity: Low]
Does this incorrectly restrict pinctrl-names to a scalar string instead of a
string-array?

Since pinctrl-names is inherently defined as a string-array, using
enum: [ default ] restricts the property to a scalar string, which will cau=
se
schema validation to fail for valid device trees. The standard approach
requires:

  items:
    - const: default

[ ... ]
> +examples:
> +  - |
> +    /* Example (for Raspberry Pi with pin control stuff for GPIO irq) */
> +
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet@0: w5500@0 {

[Severity: Low]
Is the label ethernet@0 valid here?

DTS labels cannot contain the '@' character. This will cause a strict
compilation failure when this YAML example is parsed by dtc during
make dt_binding_check.

> +          compatible =3D "wiznet,w5500";
> +            reg =3D <0>;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&eth1_pins>;
> +            interrupt-parent =3D <&gpio>;

[Severity: Low]
Could this unresolved &gpio phandle reference cause a compiler error during
dt_binding_check?

Since &gpio is not defined in the scope of this standalone example, dtc will
fail to resolve it.

> +            interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +            spi-max-frequency =3D <30000000>;
> +            link-gpios =3D <&gpio 4 GPIO_ACTIVE_HIGH>;
> +            local-mac-address =3D [ a0 b0 c0 d0 e0 f0 ];
> +        };
> +    };
> +
> +    &gpio {
> +      eth1_pins: eth1_pins {
> +        brcm,pins =3D <25 4>;
> +        brcm,function =3D <0 0>; /* in */
> +        brcm,pull =3D <0 0>; /* none */
> +    };

[Severity: Low]
Are we missing a final closing brace for the &gpio node here?

This syntax error seems to have been introduced during the conversion from
the text binding, and it will prevent make dt_binding_check from compiling
the example.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-wiznet-lin=
k-gpio-v2-0-3b1d0c870f35@marmottus.net?part=3D2
