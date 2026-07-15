Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A8197A7D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101477; cv=none; b=JLlZaJY5c+HKKxs8w6/E356m+darR8r3WxmUDsHaZxe4PEQHJkTdPI8ibCpkN20sl91bQY2GO/yUUOz0PUB8GTlCN3BuVB4GAA84PDROuXtm/yZsKDSHeAzKVVyJSLT1h0dNwAXk3xh0z4BIQQIlO7sUPnkI6bztxu5WhAkMq9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101477; c=relaxed/simple;
	bh=/WrIRYO6EF4WO4E3FH68txxCJ1lx+6iCSI+izpgVFBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XyoXXAFm9yXi4Uslz8kzXqOunhRtpnxob3JtLfK42I6HMcBYoM+FI9nqcfsdGmZgS7/pJH0QsrG2y6JsFNjPY3Pl1z017ZZ6IxYcmDmxntSQoBlLZySc12NAw95BEWwh4ebb5dtMSDPh0I1ihBs+l0uDoL95GqmXfbpbThzbUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMZ2qY5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMZ2qY5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364EF1F00A3A;
	Wed, 15 Jul 2026 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101475;
	bh=cvsEFXBxRoThrcZXs/0tRd8ps1UbRBafPFAfxsafpsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMZ2qY5GqnuSKwfCuECH4LmzdKqAPHuIGURJ/UCJeIBplI0RePWWAnN/aaBICO9R/
	 yQGFIBKa+Yfrpiwht1jvKhTbeXerwN+37hy+sm4OAmZHjIXltbcGgqn1LD9hExvS7b
	 CdOyOCMPAE/Sp1lYuuAmCdwiQjsLToBuQMi0dOOEL9x16L6V1UoalOKA9mp/Hh2Inj
	 rOLJevhf2QN7vfocoL4mHEYJ5ft5RrXhzea2wa3l9kTN5xcy9EkPbi/T8cVRgQCCID
	 6rvcHAL7fH0p00vRrcgBm/+zQ3Sz0ppeMqAQQftDOhklCbUkwESaDq9wKf17pTf8R7
	 kozXfrsktt/kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: i2c: Add Novatek NT726xx SoC I2C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: Nina_Kuo@novatek.com.tw
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715073521.147610-1-Nina_Kuo@novatek.com.tw>
References: <20260715073503.147552-1-Nina_Kuo@novatek.com.tw>
 <20260715073521.147610-1-Nina_Kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:44:34 +0000
Message-Id: <20260715074435.364EF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] DT Binding Anti-Pattern: Usage of custom `novatek,hwmods` string pr=
operty to assign unique instance names.
- [Low] Schema Type Violation: The boolean property `novatek,stbc-controlla=
ble` incorrectly specifies an integer default value of `0`.
- [Low] DT Schema Validation Failure: I2C controller examples use invalid `=
#address-cells` and `#size-cells` values.
--

--- Patch [2]: [PATCH v3 2/3] dt-bindings: i2c: Add Novatek NT726xx SoC I2C=
 controller ---
commit fc4c1ba789209e1e7e8f1fe88e1d6a2a1a7eec66
Author: Ben Huang <Ben_Huang@novatek.com.tw>

dt-bindings: i2c: Add Novatek NT726xx SoC I2C controller
   =20
Add device tree documentation for Novatek NT726xx SoC I2C controller.

> diff --git a/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.yaml
> new file mode 100644
> index 0000000000000..866589c5ae51a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/novatek,nt726xx-i2c.yaml
[ ... ]
> +  novatek,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of each i2c pin, must be named with "i2cX". (X is
> +                 an integer starting from 0, must be unique)

[Severity: Low]
Does this violate standard Device Tree schema practices?=20

Hardware nodes should typically not encode software logical indices. Instan=
ces
are usually mapped dynamically via the /aliases node (e.g., i2c0 =3D &i2c0;=
) or
derived from the reg base address rather than using a custom string property
like novatek,hwmods.

> +
> +  novatek,stbc-controllable:
> +    type: boolean
> +    description: Set if this i2c master, named as `stbc-i2c`, is
> +      controllable by stbc (Standby controller, actually is an 8051
> +      micro-processor) on Novatek NT726xx SoCs.
> +      For these `stbc-i2c`s, the driven clock is only 12 MHz and the
> +      authentication to stbc must be executed before controlling the
> +      registers.
> +
> +    default: 0

[Severity: Low]
Is this default value valid for a boolean property?=20

Boolean properties in DT schema are evaluated by their presence or absence
and shouldn't accept an integer value. This will likely fail schema validat=
ion
during dt_binding_check. If a default is needed, it should be false.

[ ... ]
> +examples:
> +  - |
> +    i2c0: i2c@10000000 {
> +      compatible =3D "novatek,nt72600-i2c";
> +      reg =3D <0x0 0x10000000 0x0 0x100>;
> +      interrupts =3D <0 67 4>;
> +      clock-frequency =3D <400000>;
> +      novatek,hwmods =3D "i2c0";
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +    };
> +
> +    stbc-i2c1: i2c@20000000 {
> +      compatible =3D "novatek,nt72600-i2c";
> +      reg =3D <0x0 0x20000000 0x0 0x100>;
> +      interrupts =3D <0 77 4>;
> +      novatek,hwmods =3D "i2c1";
> +      novatek,stbc-controllable;
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +    };

[Severity: Low]
Do these cell counts pass core device tree schema validation for I2C contro=
llers?

I2C controllers dictate the cell sizes for their child devices and normally
enforce #address-cells =3D <1> (for the I2C address) and #size-cells =3D <0=
> (since
child devices are not memory mapped). Both examples seem to be using <2>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715073521.1476=
10-1-Nina_Kuo@novatek.com.tw?part=3D2
