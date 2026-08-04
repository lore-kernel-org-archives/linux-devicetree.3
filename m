Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB4476CDF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861305; cv=none; b=l0DCmmvO2UWuLIx3Y0CMpxFNJiJ42LmstM7COp8s79njbSY/3zrx7Lqp4bKWV1mtX/UyqMMkla3YjuAayLVKQ3NR9DWbM2ymBAt5G4xNn2ojE/1OnXkP8bEgGVi9jNLcdJnfWrtYUxSPpHzg+tHysXI2OqLlm+piG/qNNudTO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861305; c=relaxed/simple;
	bh=855A6KYu/fwoYXYgD5Nohl+S99zA3DKGYBrCdemvAMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C8hPj2cinM2roe0U6OimRp+VHPitmpWdNcP+0lNfCtQ0o2lUTgK/zZ9ldIOwugTgSNpbJluV1Q9JdEUBULJbsaX0sufNTF8L/bAYfHwbvPF2xPt5IQ2SBtYJmqb41wJkEvhLfFVB890FmbwNltAwQOnk60mRGSjNOKe95GIL+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ul8pFMBD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ul8pFMBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADA61F000E9;
	Tue,  4 Aug 2026 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861298;
	bh=WoGPQ/DEC5WHb68M15MBEI+bQn9pAu00cW8+Jlqi3ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ul8pFMBDMjmwqWpBYer7ULH8ys2vjwRUaYGpNjmX/F7ghrJq5ccwyqFtajmY6jHEk
	 udlA1HnJMhTsKGm85W/MZRqfWynyZKFkEfsSHbeEoeN1W+4UKYhxJsikhpT6g3GNhQ
	 41w3uq4RKqZQCe36bnWRV9dYN84GYLQH8NchchHaxqaIeMHnVSWkSHduskbDZ/Sa8W
	 fc/O3E1jujZzO5k0kbzNcLzwrTdP1DF51eT5TVgMOFG4q/mzEotG/WiXZ+GxlPEIpu
	 mGrbm4V2ULq4jbr8nIPBsvasC8XjiVSf0bpTXiBO1OZTcS7+wMoXiv1zz8iMm1RKVG
	 BUpHJWY58MkdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 34/36] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:34:57 +0000
Message-Id: <20260804163458.0ADA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The 'airoha,chip-scu' property is used by the pinctrl driver but=
 is missing from the device tree binding schema.
- [Low] Duplicate dictionary key 'gpio-ranges' in the schema properties sec=
tion.
- [Low] The device tree example uses an unresolved phandle '&pinctrl' for t=
he 'gpio-ranges' property.
- [Low] The example incorrectly assigns a deprecated integer value to the b=
oolean property 'drive-open-drain'.
--

--- Patch [34]: [PATCH v9 34/36] dt-bindings: pinctrl: airoha: add support =
of en7523 pin controller ---
commit 798edf223c3bff7c2f675ccb0cf54fc3993ff782
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: add support of en7523 pin controller

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.=
yaml
> new file mode 100644
> index 0000000000000..dd5b3b51f7694
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
> @@ -0,0 +1,379 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7523 Pin Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The Airoha's EN7523 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: airoha,en7523-pinctrl
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Medium]
The pinctrl driver expects an airoha,chip-scu property to supply a phandle=
=20
to the SCU, but it is missing from this schema. Since this binding enforces=
=20
additionalProperties: false, will device trees that legitimately provide th=
is=20
property fail validation?

> +
> +  gpio-controller: true
> +  gpio-ranges: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1

[Severity: Low]
Is it intentional to define the gpio-ranges key twice in this section?=20
Strict YAML parsers will reject this duplicate key, causing=20
make dt_binding_check to fail to load the file.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pinctrl {
> +      compatible =3D "airoha,en7523-pinctrl";
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      gpio-ranges =3D <&pinctrl 0 12 30>;

[Severity: Low]
Since the root node is defined as pinctrl without a label, the reference=20
<&pinctrl 0 12 30> is unresolved. Could this cause the dtc compiler to fail=
=20
with a reference to non-existent node or label error during schema checks?

> +
> +      pcie1-rst-pins {
> +        conf {
> +          pins =3D "pcie_reset1";
> +          drive-open-drain =3D <1>;

[Severity: Low]
Does this example use deprecated syntax by assigning an integer <1> to=20
drive-open-drain? The standard pincfg-node.yaml schema expects this to=20
be a boolean flag.

> +        };
> +      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D34
