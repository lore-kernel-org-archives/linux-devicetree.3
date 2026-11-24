Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512416;
	b=e+8bJ/A5qKUWCMn+DeMu/hDnUt9tVtgwTa3wzqsxN5WjAFQZIzC22t0ZAVlp1U1xAGit
	 4eiZj2EZB3wyEHOsgOqi7+pmpyz9cY7CeeB336mJYzCxCwehdBlAO6/WOlLWpwO2tCJnO
	 jhvGwaNfrqPfRmWAjTE7iP86fpBZysrTGyu8nQQuSxzVGmWI7BiAVa4FR6PiyeXDAR/F+
	 d3Gug6TKTE8grheh+GKofvNhQ9XgzOOtFbu0UhAg4E5reb018Z/u/irWs3osd1tdW5QbI
	 +NAKfDLhkPpb1XLo/fA/lJRSM4EqMvjeQvEqHyJjH2bu0eeRnZZD2Tj+7x+fJy8/unA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512416;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lcYpi8gvB0sXDFCTIKQhmL5HufeRJ2nicNfZK6odBnY=;
	b=Z4aNk16Ka5DnrC2gPs7GQd6gcxsqpfceElnugQA9c13r/dz84kKgcRw/HWIMxduM+RCB
	 8YoXYObuqzxBEq67jy5Tvag+CUBPxlw1DR9R27V9ya78ImFu887Y+YTotNfMx9tQQQFCD
	 02JwG+oqSsHquNxTqyxSpcevQVCbZSH0pj90b6qa4k9+IN+ScFfWRf6njfLUT9Wyv+cfc
	 rTdZ3XvYEYoZRHq4mDjKHBfbpECnZJKyztfqd9oj7a01FT8Z/7KztAe3nuuLgynu4R3R7
	 p0lHIEQjt+zqbkLWyqyNNZ/XbQ1itYAh5DNaDPDCyA6CWEQi1MKsbeDf46nc+8Af+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhOmSXL+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F55606A33F
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhOmSXL+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A7D1F000D0;
	Tue, 24 Nov 2026 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512415;
	bh=lcYpi8gvB0sXDFCTIKQhmL5HufeRJ2nicNfZK6odBnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bhOmSXL+Bl+RpoDBo6Uz1L3NZtRyv5oWTCyJRBAnwE9J1vTG/9LiTYXCAbkC/VgYI
	 504MhifCygZIt2ZvrKw9ILK1A5oCPyGOeQlep2FimOtbSvqc5DhYGPVFVjSycIe0c5
	 CJlZm/+qnf5faY2H+JyBlWdC707krw37RxtPQOTXcOsoq7Wg/PmleGnbXMQjYPbuY6
	 zWaDjWkKTfgCR1yDdir9iFTRm13ERW/2ac7niEiNn6ZU7zwdnrlX3wUu01geUhPY2e
	 UR7XZCbvMFUAQMRPHShbZVmh3hcjSz7Pda7OeUQcqvyeaks8Fz6fj2DxLHuGxi4/wZ
	 ey+TTn9VmjYNw==
Message-ID: <sashiko-outbox-230834@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:26:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] dt-bindings: power: supply: example lacks parent pmic node
  and has unused label
- [Low] dt-bindings: power: supply: redundant word binding in commit
  subject
- [Low] dt-bindings: power: supply: fixed-entry arrays lack per-entry
  items list
- [Low] dt-bindings: power: supply: qcom,pm4125-charger missing from
  qcom,spmi-pmic.yaml
--

commit 45ce3860e319677782a8540cf93046fcf2b07086
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

dt-bindings: power: supply: Add qcom,pm4125-charger binding

This commit adds a YAML Devicetree binding schema for the Qualcomm SMBLite
switch-mode battery charger found on the PM4125 PMIC.

> dt-bindings: power: supply: Add qcom,pm4125-charger binding

[Severity: Low]
The dt-bindings: prefix already indicates that this adds a binding, so the
trailing word "binding" in the subject can be dropped ("dt-bindings: power:
supply: Add qcom,pm4125-charger").

> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-c=
harger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-ch=
arger.yaml
> new file mode 100644
> index 0000000000000..5651b428b0a11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.=
yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger

[ ... ]

> +properties:
> +  compatible:
> +    const: qcom,pm4125-charger

[Severity: Low]
Should this schema be referenced under ^charger@[0-9a-f]+$ in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml (or folded into
Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml)?

qcom,spmi-pmic.yaml validates ^charger@[0-9a-f]+$ child nodes against a
closed oneOf list and sets additionalProperties: false, so any SPMI PMIC
node containing a qcom,pm4125-charger child node will fail dtbs_check.

[ ... ]

> +  io-channels:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      IIO ADC channels used by the charger. usbin_v is the USB input
> +      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
> +      current channel (ADC5_USB_IN_I).
> +
> +  io-channel-names:
> +    minItems: 1
> +    items:
> +      - const: usbin_v
> +      - const: usbin_i
> +
> +  monitored-battery: true
> +
> +  qcom,jeita-soft-thresholds:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
> +      comparator values written to the BATIF ADC comparator registers.
> +      Example: <0x5314 0x25e3> for COOL=3D15=C2=B0C, WARM=3D45=C2=B0C.
> +
> +  qcom,jeita-hard-thresholds:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
> +      comparator values written to the BATIF ADC comparator registers.
> +      Example: <0x58cd 0x20b8> for COLD=3D0=C2=B0C, HOT=3D60=C2=B0C.

[Severity: Low]
Should io-channels, qcom,jeita-soft-thresholds, and
qcom,jeita-hard-thresholds use an items list with per-entry descriptions
instead of maxItems and free-form descriptions enumerating the entries?

In addition, the JEITA thresholds encode raw 16-bit ADC register values in
uint32-array without a maximum: 0xffff bound, rather than using the
standard alert-celsius and operating-range-celsius properties from
battery.yaml via monitored-battery.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/iio/qcom,spmi-vadc.h>
> +
> +    pm4125_charger: charger@1000 {
> +        compatible =3D "qcom,pm4125-charger";
> +        reg =3D <0x1000>;

[Severity: Medium]
Does this example pass make dt_binding_check?

Top-level example nodes default to #address-cells =3D <1> and
#size-cells =3D <1>, so a single-cell reg =3D <0x1000> without an enclosing
pmic node specifying #address-cells =3D <1> and #size-cells =3D <0> trigger=
s a
dtc reg_format error.  The pm4125_charger label is also unused, which fails
the unused-labels check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-smblite-ch=
arger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com?part=3D1
