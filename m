Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79713D0BE1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180443; cv=none; b=c6/JiqI3icHRNK/42DNT88EQNmpIZHPzzZa5PvV6LtqC3Eb6Hnti6VmIf2GoqqUwyC1cc97wJGKP58u5A6fafHx6ITsbvr8IJCB60juz3y6CC9Njh4JUWFZuqAjLWhi2trK+2TDwjbYDhvTYdZnGOi59th0Tu6ftZRQuZffn7uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180443; c=relaxed/simple;
	bh=BYE6DeYG5iFxPvlDfAm5cEmBNCi5HQ8nPE+NCZ2yEnk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TjSgHk65/I5GOrzPvfRS1kG/x1jiA/sqf8RS07nUrySoCUgVmpkviSbAn60om4xhpxqfd69JR+iczwq2FSF93LkTfirVE+Bf9DaqhlvQ6Yx2XJ58IWwddTdWVAsdNZUEtMqnNnebJdxfrghxoamOGimwTe4q9uYdZJ5d/+srwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjZ1ohD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjZ1ohD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4478A1F000E9;
	Mon, 27 Jul 2026 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785180441;
	bh=F3z5Y8dNtfAMMyqz8FXUHKH7qty/tvhvw80Ca6P7C0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bjZ1ohD066R+gAXT8IHQwjM3zORTFoT1oDJpdY3rpgRIBp9hp/uRuZUui6n6WTV/p
	 7SSe/yxE1Pq09emxFtcnJHh20iGU2CNz69RtXLrkp36ufg4EExSGmoWWoR29fw9GkU
	 hDeCF5H2Rbdpyilu1vv0ioxGPIuIasm0xrQIVfYO+T4dq2Pd5xCQLQ74gBuYPZYXMr
	 PvhHxxPhxBlyz76ZXWMdnlll3H3PSy6ImofGNw/czriWYq3S2uP767SGBz2+S+vVet
	 pAAhvk7EcOAMJy/Hr47PXjkFj3WgNnzLapKyJjhYDpxeyctaElYbwcWZsOmNn97pFt
	 vXbAzZLRu4pBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:27:20 +0000
Message-Id: <20260727192721.4478A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The binding claims register regions already managed by the existin=
g `qcom,x1e80100-camss` binding, creating mutually exclusive overlapping de=
vice nodes.
- [Medium] The schema explicitly allows CPHY operation, contradicting the c=
ommit message which states CPHY is omitted.
- [Low] The `#phy-cells` property is omitted for a PHY binding.
--

--- Patch [1]: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY =
schema ---
commit cbf6f1512f36b1e20121afe66ff586d3cb88cde0
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

This commit adds a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs.
The PHY supports both DPHY and CPHY operation, including a split-mode
allowing two sensors to connect to one PHY. The submitted binding is
intended to describe DPHY modes only.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..7d0363812aa89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 SoC CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sen=
sors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +

[Severity: Low]
Does this binding need a #phy-cells property?  Since it is located in the
phy/ subsystem, a PHY provider binding typically requires #phy-cells to be
defined and added to the required list for standard usage via the phys
property.

> +  reg:
> +    maxItems: 1

[ ... ]

> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Medium]
The commit message mentions that CPHY is left to future work, but does this
enum explicitly permit CPHY (bus-type 1) in the schema?  This might allow
devicetrees to pass validation when using CPHY even though the necessary
constraints are not defined yet.

> +
> +              data-lanes:
> +                minItems: 1

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible =3D "qcom,x1e80100-csi2-phy";
> +        reg =3D <0x0ace4000 0x2000>;

[Severity: High]
Does this new standalone binding claim register regions that are already
managed by the existing qcom,x1e80100-camss binding?

If a device tree instantiates both the CAMSS node (which requires csiphy0)
and this new CSI2 PHY node, they might both attempt to map the overlapping
0x0ace4000 region.  This could lead to an -EBUSY resource request failure
and prevent the devices from probing.

> +
> +        clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-x1e-csi2-p=
hy-v14-0-27d1bf477593@linaro.org?part=3D1
