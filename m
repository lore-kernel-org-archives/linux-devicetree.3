Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902FC3CFF58
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537662; cv=none; b=lcHpJNIpCZymlfh/Dsr7bXNL5kNNlNMHbyH3jhpJCwMeRZVN3Vkd6CCaA4GUcUFh+yg4ik6+dQZq3X76ptRA61zn5Fmrw6s6vDDlSoQgbdh1JHr1R9AJLd5vY4HSBvidg7LSzmxv7WR5kQIPrt6zNHfxAmeHshrZMfmweO9Hvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537662; c=relaxed/simple;
	bh=1i6QWYuCRTLy1wAumMZnQeNQjLpiRo0FFk3bKIama6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZHFNVzrOxqeMkI9c0zzB+pdtM80FNYh/ZDPB5b+C9VXaB76npxWh5YMCVEsNdAVS/xq6jL9qNDGBFP8Qbo61LSQ4jBV2cJaCWq12MDJHtcHPYIw69MwtInAzfi9RoY+ML8tR7IZtKFEcSAoxlEFYToZ1W2YR/zmBU3sJsXBGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHLmP9Wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHLmP9Wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CF11F000E9;
	Mon, 20 Jul 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784537661;
	bh=quVci2ZBy1nQdJekMgUBPhrmXSTEgfl9sAwvLwmRGdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHLmP9WaxUuk9geVPZ92L77WT2ThOwgAvHLlsoYMpfmlK0VimRoXRQVa2ZVHkdpYU
	 QoPmXo1dQsnH01AOMHR4wzG6MrsNUPT2cJUe8E63ZI2SExQNTkhHvgonBPxjaEg5/e
	 uLJYvDRKwZnfUP5tTKRxu+VrkbYfiuOx34y3shD484fteuM7NZqTxls9rK8BoypE+g
	 qxlrUkuiVftSA4GFKu8DpCQXUEtEjrEsB+yvYgB+AWdVIgocT99dWLSu4M66Yqip0y
	 xo7e2BFOZmADV2L4yu2DlRfDgfUxJNS0o3vNVKOtYcHGZzvbZJuZNC9BnLIKqHYHq2
	 THwlKJkAQcD1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yongxing Mou" <yongxing.mou@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 08:54:20 +0000
Message-Id: <20260720085420.E0CF11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Relaxing the global maximum number of `power-domains` in `mdss-c=
ommon.yaml` without restricting legacy schemas allows invalid device trees =
to pass validation.
- [Medium] Missing `power-domain-names` in the `required` list allows incom=
plete device trees to pass validation.
- [Medium] Adding an items array to `power-domains` implicitly sets `minIte=
ms: 2`, breaking backward compatibility for existing device trees.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power =
domains ---
commit 3afe59087bba460fdef9d8666ba4cb4a97273b44
Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

dt-bindings: display: msm: Allow two MDSS power domains

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC
powers a subset of SSPP blocks.

Allow the MDSS bindings to describe both power domains and
their corresponding power-domain-names values.

> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.ya=
ml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e03346..c0b650ffd9ef8 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -31,7 +31,8 @@ properties:
>      const: mdss
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

[Severity: Medium]
When we relax the global maximum number of power-domains here, does this al=
low
invalid device trees to pass validation for legacy platforms?

For example, schemas like qcom,sm8550-mdss.yaml include this common schema
but only have 1 hardware power domain. Without explicitly overriding
maxItems to 1 in those legacy schemas, they might silently accept invalid
device trees with 2 power domains.

> =20
>    clocks:
>      minItems: 2
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,glymur-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.ya=
ml
> index 64dde43373ac7..685bedb26a124 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
[ ... ]
> @@ -38,6 +38,16 @@ properties:
>        - const: mdp0-mem
>        - const: cpu-cfg
> =20
> +  power-domains:
> +    items:
> +      - description: MDSS core GDSC power domain
> +      - description: MDSS INT2 GDSC power domain

[Severity: Medium]
Does adding this items array implicitly set minItems to 2 during dt-schema
evaluation?

If so, this might break backward compatibility for older device trees that
only specify a single power domain. Should minItems: 1 be explicitly
specified here?

> +
> +  power-domain-names:
> +    items:
> +      - const: core
> +      - const: int2

[Severity: Medium]
If a device tree specifies 2 power domains but omits power-domain-names,
will it pass schema validation?

The driver might fail to probe at runtime when attempting to attach power
domains by name. Should power-domain-names be conditionally required in the
required list (using an if-then block) when multiple power domains are
provided?

> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali=
-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-m=
dss.yaml
> index 9f935defd6b12..088010f464c3d 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.y=
aml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.y=
aml
[ ... ]
> @@ -40,6 +40,16 @@ properties:
>        - const: mdp0-mem
>        - const: cpu-cfg
> =20
> +  power-domains:
> +    items:
> +      - description: MDSS core GDSC power domain
> +      - description: MDSS INT2 GDSC power domain

[Severity: Medium]
Similar to the glymur binding, does this items array implicitly set minItems
to 2 and break backward compatibility?

> +
> +  power-domain-names:
> +    items:
> +      - const: core
> +      - const: int2

[Severity: Medium]
Also similar to the glymur binding, should power-domain-names be conditiona=
lly
required to ensure device trees with two power domains provide the necessary
names for the driver?

> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-msm_gdsc2-=
v1-0-4687866d6cb0@oss.qualcomm.com?part=3D1
