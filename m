Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1842050
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510434; cv=none; b=Q5DIX3wE1lwiFJyy+Ciglem1EUZujV/SJO2DKOrMKQ/hF9X7AmlqMM+aH9iqrbq3C1ddTyUpSEDJWxU4KeAp6f0U/nlPNeKYVqxJ34jfALFGHa2ET+9ezrnyspPiQewP6RZP2XUteZv8SBXC7S+fPOiLpr3yPb0SoNMR35xVXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510434; c=relaxed/simple;
	bh=H1iSQGFiuKxX4CU6d/eK6tc04WhMDwUhxtxpl50nDB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eaYeAJWQvPLrzcC8FPk1artW919R/RSGYgojRbMCXZbvXeHM8+nN/7RpQyAHibFHJqrmDe8Nxr2NRrWXHVXSs9DVhR9z0f6YdrttQx30f5gALMSStahDEOVBOdR/XfR8zQsavgK78weMfTKyngVGl56Dni7dCC4P8LpAuy4Fly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSfUPHl+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSfUPHl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C3F1F000E9;
	Mon, 20 Jul 2026 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510432;
	bh=2PLb8I13jer0vsrN/Qv6Kj67tynSbToxe6erdn09OCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSfUPHl+KfxSnth1p3GxD9iC4WTOl7Xnhml9k2kLxjUUK94discBitMmLcPiO+Gbz
	 7jxjvkl9HfnFqpIxj2wGS/xxq0JxMhmvPNvglRopnxPqxear6pCxr9hY4LGnkqIWKK
	 3+hLGumQnRHpa01sjHwNLlwGrwm3G0eKW4qrpXe3hETztvEKUO6UpNdYaS7YlKG4Sf
	 uBmaYqhweYIn1sevS5DtmmPk3pCDbzQA7kqnYfODCTvo83sWqO3UHN1jVQQ5S1jR5O
	 7DxY4YJjbOrc+aBMS5JU+w9zHSNXpEYjvZjfL0nWuki0o0GQZ77NysqelEqrBo+pRW
	 vy4UeVWaZmAPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, media-ci@linuxtv.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:20:32 +0000
Message-Id: <20260720012032.68C3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added standalone `qcom,x1e80100-csi2-phy` binding clai=
ms hardware resources and changes the OF graph topology without matching up=
dates to the existing `qcom,x1e80100-camss.yaml` schema.
- [Medium] The `patternProperties` for `port@0` allows arbitrary endpoint n=
odes, bypassing the split-mode data-lane constraints.
--

--- Patch [1]: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY =
schema ---
commit 21e0c2eac81f8a0822a401dad73b1be1b2b38b5e
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

This commit adds a new base schema for the MIPI CSI2 PHYs on Qualcomm
SoCs, supporting DPHY modes (with CPHY left for future work). It includes
support for a split-mode where two sensors can be connected to one PHY.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..880fe602945cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,195 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1

[Severity: Medium]
Does this new reg definition overlap with the base addresses already
claimed by qcom,x1e80100-camss.yaml?

If a device tree implements this new binding alongside the existing CAMSS
binding, it seems it will produce dtc warnings for overlapping unit
addresses. Furthermore, drivers might fail to probe due to -EBUSY when
claiming overlapping memory regions like 0x0ace4000.

[ ... ]

> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

[Severity: Medium]
Will these port definitions change the DT topology by placing the PHY as
an intermediate node?

The existing CAMSS binding ports currently assume a direct sensor
connection. Do we need matching updates in qcom,x1e80100-camss.yaml to
accommodate this new standalone PHY binding?

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two data-lanes and
> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1

[Severity: Medium]
Does this constraint logic leave a loophole for invalid split-mode
configurations?

Because the if-block only evaluates to true when endpoint@1 is present,
a device tree configuring endpoint@0 and endpoint@2 would bypass the
strict data-lane limits.

Both endpoints would fall back to the generic rule above, allowing up to
4 lanes each, which silently circumvents the split-mode hardware
constraints (which only allow 2 and 1 lanes respectively). Should the
patternProperties be restricted to exactly endpoint@0 and endpoint@1, or
the if-condition broadened?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-x1e-csi2-p=
hy-v13-0-160c31958863@linaro.org?part=3D1
