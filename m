Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF7A3451AB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469192; cv=none; b=EUNCeA7ZKP1nwIaLZ1/GKxqp+uxXmA0pIoQHdXCKlKYjsjVT1lLVHJYcn3j2LSJVLgESnXbOjuoNKgFzRs9X7Y622ax+ub3/8gNRWANQw/Bl1zH9VCMwGFmQkCnhZKpTZTj9jO2atJAhSeAc5gxFs4GsZqwZmCFIE6uGa0iRjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469192; c=relaxed/simple;
	bh=U9dX1uUw1P/fMJt8kqyTHCOjePQxAPTVwQpD6KqJC/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p7mWelsVTH0CpweGTVseS0pOYG+i778anmn0WtLQFOn5v/d3BTN0FgyzhQe+Rk/i3aHp/GwLYSb4X87GBeyKoOeOxDuyp1ql22mn53v2nhmu1PPQHOZd8xkyszCnsPYcZ/4xrUH/Rh0my8sTb7qyZrkMR+u5NcIGfs9Ofd6HJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJdOcb8n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJdOcb8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3561F000E9;
	Thu,  3 Sep 2026 20:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788469180;
	bh=u/e2f5Hq5Md42bO2T4K9PPa13TRu4bJu/rATXE+jYM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IJdOcb8ncRAXiA7KOFdmYVKWHSbsHIFk6ER4gXRy1u0+pL1xmqHGbajcUVu+eQwSk
	 8toANI6Zm0jSMItAmjOR5ZremUw3CXPcDOdfKX5fJFmRlsq2G/MEFlN8AWaCB1lY79
	 7rWkbL0C/4LC05W6nCnQRYEF0kV+Gq1KiY3XNFpVjqAltsETYwZ14cMrrB/zHFI7kv
	 slUKagaZK8KFBoFsXRp96xvYOVZvmEVo10SjHji3lB9KKEszU3Ox0kExd9UQk89zHd
	 yG7PbPH+WKHpz4UIBCuuEdZ73KADhv7mmKSvKgdnzvu6lEyQ0RjECA1p60JUK/Y59e
	 OvKvUpzoswm4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:59:39 +0000
Message-Id: <20260903205939.ED3561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing `maxItems: 1` constraint on `endpoint@1` `data-lanes`.
- [Low] Mismatch in `required-opps` array length relative to `power-domains=
` in the example.
- [Low] Type mismatch constraint on `clock-lanes` using a scalar `const`.
--

commit be1ee8982134944fca33ceaa85eed2383dcf7ea6
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema

This commit adds a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs.
The PHY supports both C-PHY and D-PHY operation, as well as a combo-mode
that allows for two sensors to be connected to one PHY.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..993271c42fa06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
[ ... ]
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    clock-lanes:
> +                      const: 0

[Severity: Low]
Will this pass dtbs_check validation?=20

Because the clock-lanes property uses a -lanes suffix, dt-schema evaluates
the payload from the device tree as an array. Using a scalar "const: 0"
checks for an integer, which can cause a type mismatch.=20

Should this be written as an array constraint, such as "items: - const: 0"?

> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3

[Severity: Low]
Similarly, should this use an array item constraint rather than a scalar
constant to prevent a validation type mismatch with the clock-lanes array?

> +                    data-lanes:
> +                      items:
> +                        - const: 4

[Severity: Medium]
Is it necessary to add "maxItems: 1" here to properly restrict the property
to a single data lane?

Since maxItems is inherited as 4 from the base definition, a configuration
like data-lanes =3D <4 2> might falsely pass schema validation without an
explicit maxItems override.

> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0

[Severity: Low]
As with the other clock-lanes definitions above, does this scalar constant
need to be updated to match the array evaluation of dt-schema?

[ ... ]
> +        csiphy_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz =3D /bits/ 64 <300000000>;
> +                required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;

[Severity: Low]
Does this required-opps array length match the power-domains definition
provided earlier in the example?

The example block defines 3 power-domains ("top", "mmcx", "mx") but only
provides 2 entries here. In the Linux PM domain framework, required-opps
maps 1:1 to power-domains by index, which leaves the scalable mx domain
without an OPP mapping.=20

Should this be padded to 3 entries (e.g., using <0> for the non-scalable
GDSC)?

> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-x1e-csi2-p=
hy-v17-0-26606fa9a039@linaro.org?part=3D1
