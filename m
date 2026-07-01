Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB1416D16
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904165; cv=none; b=Aw19Md/pY8zIOgcQF8ZUhOcbjfq5RKJ0Iu8i0ULskf6sJ3qcokC8dL4yeiEbeG6Nn+PdWk7JXiaxIO90qaPa8k/Yh8CfRftglsrecE7RM2sxjZgodkvuoPmqOYEgFiVidJEBUvFmRvuKA/MG6nQs1l6EE4NRjyEIoliNBjsHVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904165; c=relaxed/simple;
	bh=jESHDdA8x3mWH3IsCTNGzTWp1ISN/ZwUIyAAtipKeBw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hwX/3ClCrWidgyfXLiP6hXTl4EdlIlkAbvnfy/uzArXUaeGxVO6QEbKMyqSm9mZUqYk3fMnzijx8IU663FAV1kNzOI4tsW0qDCt1OtkO2wQpsfbhCEoH3ribx3Irf3Zchhx3DP+0o49xHJb08o4PQAXud5r9sctJzgGsN6Lnvx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvvcEWZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvvcEWZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA301F000E9;
	Wed,  1 Jul 2026 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904163;
	bh=S2NhhsjLN3A3Wrr2tLs2fbX1psMtv9WLhbWia3EQGlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvvcEWZpEhuxmQ2RbwHTPFpOCFe4AdH2Lp+ofJVmJPVvkPavbWBFbCLbB20M81rYF
	 4AlRsou/qMfGiEWcJaepgODJnN0Vejcm0CtSTKvBg6tMS8loEuhecA2eB+iw+S7u18
	 FbcL7XRTEHmKz+r5MKTlYQdOzC3q6iM+Yz058FYpv1RFEcgAi56z5o+5jgKPLzJpwY
	 0A1ZWF2Uc/6JbR6VVhHU2ILvKJKRLqY9fv+U+nJtgMBHwtjMLjwu6YLiGXXMYYSvPg
	 q8J077BxN2RcREigHQHrPm4Q+KsFNto/FQ+dzePwPV3AG9az66x5A4DQIolgrKWZbJ
	 Dk/encuKRe8Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:09:21 +0000
Message-Id: <20260701110922.BCA301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The property `qcom,qaif-aif-bits-per-lane` is fundamentally misnam=
ed relative to its description and usage, creating a dangerous contradictio=
n that will lead to incorrect hardware configurations.
- [Medium] The `qcom,qaif-aif-lane-config` matrix schema fails to enforce t=
he exact length of each row, allowing malformed configurations to silently =
pass validation.
- [Low] The `compatible` property schema forbids standard specific-to-gener=
ic fallback chains.
--

commit 766077d779dbf4ceb1f7492bb1a02c81dfc5f0d3
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

dt-bindings: sound: qcom,qaif-cpu: Add binding

Add a dt-bindings header and devicetree binding for the Qualcomm Audio
Interface (QAIF) CPU DAI controller. This allows platform devicetree
files to describe the controller's MMIO region, IOMMU stream, clocks,
interrupts, and per-interface AIF configuration.

Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller support =
on Qualcomm Shikra SoC
  https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5=
f2d928@oss.qualcomm.com/

> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b=
/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> index 0000000000000..672f40df877be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> @@ -0,0 +1,358 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qaif-cpu
> +      - qcom,shikra-qaif-cpu

[Severity: Low]
Does this strict enum restrict the compatible property to a single string,
preventing standard specific-to-generic fallback chains? If a device tree
attempts to use a fallback like "qcom,shikra-qaif-cpu", "qcom,qaif-cpu",
it looks like dt_binding_check validation would fail.

[ ... ]

> +      qcom,qaif-aif-lane-config:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description:
> +          Lane configuration matrix. Each row is a pair <enable directio=
n>
> +          for one lane starting from lane 0, up to 8 lanes.
> +          enable: 0 =3D disabled, 1 =3D enabled (QAIF_AIF_LANE_ENABLE).
> +          direction: QAIF_AIF_LANE_DIR_TX (0) for TX (playback),
> +                     QAIF_AIF_LANE_DIR_RX (1) for RX (capture).
> +        maxItems: 8
> +        items:
> +          items:
> +            - description: Lane enable (0 =3D disabled, 1 =3D enabled)
> +              enum: [0, 1]
> +            - description: Lane direction (0 =3D TX/speaker, 1 =3D RX/mi=
c)
> +              enum: [0, 1]

[Severity: Medium]
Should this inner items list include minItems: 2 and maxItems: 2?

Since JSON Schema Draft 7 doesn't implicitly restrict array tuple lengths,
omitting the bounds allows extra elements per row to silently pass validati=
on.

If malformed arrays are provided, it looks like the driver's flat array
parsing would misalign and misinterpret the values.

> +      qcom,qaif-aif-full-cycle-en:
> +        type: boolean
> +        description: Enable full-cycle sync (effective in sync master mo=
de).
> +      qcom,qaif-aif-bits-per-lane:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of slots per lane. Maps to hardware register
> +          BITS_PER_LANE as (slot_width * bits_per_lane - 1).
> +          For example, 2 slots with a 32-bit slot width gives
> +          63 (=3D 32 * 2 - 1) in the register, representing 64
> +          bits per lane per frame.

[Severity: High]
Is this property fundamentally misnamed? The description says it represents
the number of slots per lane, and the driver code also appears to treat
it as slots to calculate the final register value.

If a device tree author follows the property name qcom,qaif-aif-bits-per-la=
ne
and provides the actual number of bits (like 64), wouldn't this cause a
register overflow and clock miscalculation when the driver multiplies
it by slot_width?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D1
