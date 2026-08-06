Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36AE3F823F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013313; cv=none; b=GEGCGE9f+qtMwghBM0yJLJsXIAOehOx5RRwye99RKtb0UwEKuxZIb2b9YufVh/xQHtz1EaE9Fgq5Z8s5Re/den0julAY1RYYa0Eu2waKZddZHJkVBjl6WTgrz3REGJNsScJ1NFo78veVk6y6rZtMzVqagWuRBgJBw8Pkua9fuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013313; c=relaxed/simple;
	bh=9O7/0wgVqKuUYQAV63Qe/yCRxvNnYOXOeVEgfaaSDDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RLeXODe1YYXI+u/NJhrdktTn3W04Eyi/rzL7V7nQLfVMve2LQgCRAXYKrO4aw3GamlBid3yMK02lyazQ/WQx+PYjOCw+U0sIZa82mj9Tgzl6QagAfVpi2h6bu+5tZ8ypdXiPEoWFsETfnylyEkpBSee+JRAh56ZIRqRJw+S+I+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpFgRc9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpFgRc9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99B01F000E9;
	Thu,  6 Aug 2026 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013311;
	bh=teJI8boehtw22mx3R3zA6FT/LH5GlSCbjxjfNA/fSZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UpFgRc9JAycmyBzvVpVh7JEfIj3SVhcJI98lkzROKWizmTWrJc2qzALRkABV8ETf7
	 T4sDZ6oL0OcVs3kI1oodciBIzvgxHFGLWU4s0hvOgEqa+PiZj+AQ3OOXlpgUCaV50I
	 NpGsF9EeE6R4PnyychJ6uMlo8n46poxy74Q9GzjRM8fF8BrNipn366dvVbFPQW+6dJ
	 2q0TpZA0PP2+gOUbHtVyC0LtnFwtlAihevE3NPzWfC83x2PGbjl2vDDatCmIv/TYkc
	 IIw9EO2Who4xhYUxF7xkzT563fjJav+0Jv8kFdibJCmC57oHpmPvLHLjfTwqun4UQw
	 4zgrOs1OnCl+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/10] dt-bindings: clock: qcom: Add support for
 CAMCC for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-6-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
 <20260806-eliza-mm-cc-v9-v10-6-6ba52dd14343@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:48:30 +0000
Message-Id: <20260806104830.E99B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding imposes a strict 3-item `clocks` array constraint wh=
ich conflicts with the typical hardware requirements of the newly added `qc=
om,eliza-cambistmclkcc` variant.
- [Medium] The schema incorrectly inherits a strict requirement for `#reset=
-cells` from `qcom,gcc.yaml#` and applies it to the `qcom,eliza-cambistmclk=
cc` variant, which does not provide resets.
--

--- Patch [6]: [PATCH v10 06/10] dt-bindings: clock: qcom: Add support for =
CAMCC for Eliza ---
commit edf279fa3bffce90685bc341e0addff553a7d4e2
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add support for CAMCC for Eliza

This commit adds the compatible strings and dt-bindings headers for the
Eliza camera and camera BIST clock controllers to the existing Milos
camcc binding. It also enforces the '#power-domain-cells' requirement
for the camera clock controller.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> index c4aba40e316ca..0655cea72524e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
[ ... ]
>  properties:
>    compatible:
> -    const: qcom,milos-camcc
> +    enum:
> +      - qcom,eliza-cambistmclkcc
> +      - qcom,eliza-camcc
> +      - qcom,milos-camcc
> =20
>    clocks:
>      items:

[Severity: Medium]
Is this global clocks array constraint too strict for the new BIST variant?

The base schema currently restricts the clocks property to exactly 3 specif=
ic
items. Do BIST clock controllers like qcom,eliza-cambistmclkcc use the exact
same 3 clocks, or do they require a different set and number (e.g., AHB, TC=
XO,
TCXO_AO, SLEEP)?

Should there be a conditional if-then block to override the clocks array
constraints for qcom,eliza-cambistmclkcc so validation doesn't fail when the
actual clocks used by the hardware are provided?

[ ... ]
> @@ -47,6 +54,15 @@ required:
> =20
>  allOf:
>    - $ref: qcom,gcc.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: qcom,eliza-cambistmclkcc

[Severity: Medium]
Does this inheritance from qcom,gcc.yaml# inadvertently force a
#reset-cells requirement on the qcom,eliza-cambistmclkcc variant?

The referenced qcom,gcc.yaml schema unconditionally requires the
#reset-cells property. By including it here globally, the new BIST controll=
er
inherits this requirement.=20

However, looking at the newly added header for this variant:

include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h:
/* CAM_BIST_MCLK_CC clocks */
#define CAM_BIST_MCLK_CC_MCLK0_CLK                              0
#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC                          1
...

The controller only defines clocks and has no reset indices.

Could this cause device tree validation to fail for the new variant unless
authors add a dummy #reset-cells property?

Would it be better to make the $ref: qcom,gcc.yaml# inclusion conditional f=
or
compatibles that actually provide resets, or perhaps split the BIST control=
ler
into a separate YAML schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-eliza-mm-c=
c-v9-v10-0-6ba52dd14343@oss.qualcomm.com?part=3D6
