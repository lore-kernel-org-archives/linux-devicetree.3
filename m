Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA12EBDFA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700458; cv=none; b=WJWCQwQHZA9sW1791L4MPMdBL6D1Ro4/sq6ruVPPPTKGvDtZyuEfJLZ3eZk6mep7PugQO13/yPPKimT0+rvA9nEBsPUhNz26FCNWZ+MErX6AtDrY2pDe+77PnT2APakMlhJKbeO+WIzIhopwMbPMj/4Cdi0VQqIUJnF7GNF2KYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700458; c=relaxed/simple;
	bh=u63Zj4eKuB3OKbkQ6vuYjhbZMvQzC+Vlcw5nJ5eyhII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZORNX1I72VWTsL1/Gd2z/KY7La7w1cqOFIH7nynJgPyu+iJnBrraZBPItt3dWaZrMH2jg1fKNgpjz/ed8Fj6M+AJ11RWLCliMNsf+aI9khoJVn1vV4XM/lJ7k5DralHsqPFlMkJIiqdCipyISvMlO3ZDYlRhFvTOgb840cRkOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxhyvSIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxhyvSIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D911F000E9;
	Wed, 22 Jul 2026 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784700457;
	bh=Qt/ODCnpBosnVL1sOu3yAg1NVAL5a/nLWxZmAiJ+hYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JxhyvSIrO3wodNSP/sB7AjUOHuhs0OE3rO86v0h9QmEa11wPB9FE4/swEaY5BWxYC
	 8T7wMxNOFRymlbpuTzngLj5qE1kErTHPCXwr6EaTYC/+JPBRuPl8fn1FN5E/77S434
	 zVyA8KR7/2rP777CIarr3XLaVMrW2MSP2oYz5NxucORbyqrlm/D1u18+Dm7tUau2MA
	 h6B+O+58LzObcypP4nAY2IC1yuf6YmVUlHHCQD0fBDuSnvktRxvOkxrvZ00/T9mZLB
	 hY1sdW9mktQGxzthjN6IQWXg2R9vhgqpPue4PSyQcPyk7+pSn35d8EtZ5481DTelwM
	 J4+skTVwUzsdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-tcsr_qre_0721-v10-2-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
 <20260721-tcsr_qre_0721-v10-2-d2fa68c63b78@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 06:07:36 +0000
Message-Id: <20260722060737.10D911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding acts as a clock and reset provider but omits the `#c=
lock-cells` and `#reset-cells` properties from the global `required` list.
- [Medium] Consumer supply properties for Mahua are incorrectly named after=
 external provider regulators (`vdda-refgen3-*`) rather than the consumer h=
ardware block's input pins (`REFGEN4`).
--

--- Patch [2]: [PATCH v10 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add ma=
hua support ---
commit 282638638d6cf4e79e2d1f839eca3e8872570141
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom,glymur-tcsr: Add mahua support

This commit adds the qcom,mahua-tcsr compatible string to the glymur-tcsr
clock binding and documents its specific supply properties. It notes that
Mahua has a different topology where a single QREF block is fed by REFGEN4.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> index ec89feff89e4e..2b64226271657 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

> @@ -82,6 +83,25 @@ allOf:
>          - vdda-refgen3-1p2-supply
>          - vdda-refgen4-0p9-supply
>          - vdda-refgen4-1p2-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,mahua-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply
> +        - vdda-qrefrpt1-0p9-supply
> +        - vdda-qrefrpt2-0p9-supply
> +        - vdda-qrefrpt3-0p9-supply
> +        - vdda-qrefrpt4-0p9-supply
> +        - vdda-qrefrpt5-0p9-supply
> +        - vdda-qrefrx1-0p9-supply
> +        - vdda-qrefrx2-0p9-supply
> +        - vdda-qrefrx3-0p9-supply
> +        - vdda-qreftx1-0p9-supply
> +        - vdda-refgen3-0p9-supply
> +        - vdda-refgen3-1p2-supply

[Severity: Medium]
Are these supply properties for Mahua incorrectly named after external prov=
ider
regulators rather than the consumer hardware block's input pins?

The commit message notes that "REFGEN4 is supplied by regulators
vdda-refgen3-1p2 and vdda-refgen3-0p9". Should these properties instead be
named after the REFGEN4 consumer block to correctly model the device tree
semantics?

> =20
>  required:
>    - compatible

[Severity: Medium]
Should #clock-cells and #reset-cells be added to this global required list?

Because this binding acts as a clock and reset provider, omitting these
properties allows incomplete device tree nodes to pass schema validation but
fail at runtime when consumer drivers request clocks or resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-tcsr_qre_0=
721-v10-0-d2fa68c63b78@oss.qualcomm.com?part=3D2
