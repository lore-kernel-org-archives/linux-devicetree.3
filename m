Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC52E7BB6
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656445; cv=none; b=aa2xMOjBT6MojaHtUk7kikt9rq8nyHz3rHReXq7BowHXHkK10d2YPO70FiGYBribZUswruCuSal5bfxLi9/OQcO0+FNjki+RTtTOUT0PUADt0+NZGo3y6s0SjqtFX1/NaYQ6yyeMV64fxvENc2xp4ItBu78lCePCwvJV3vLnwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656445; c=relaxed/simple;
	bh=4eeWiW/lzbRkGfpBeu9rrLeCqF2GzxQ5AZvrz1aDoSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ltEYv+tcwM+Gx5Pa8VACxNGvjO0fgJXpDbVfX1WJNTdrJ2AfmYMQaK8u/h+zQiOrL7/XGg0k/3Ckl3lTi2lapENZA20sEsLXJ7Z50S7wp3t6tsGTBPXJfuMy/hzn6+nDxLJGxLRCNUDASkO7dAOUq2Op3ylN/NUb8MquTVICytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9ax6DJZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9ax6DJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C021F00AC4;
	Sun,  2 Aug 2026 07:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785656443;
	bh=JnLLJKfrQZJ0bXH0iNuYeqaQlWLOTGdVO/0B3xPxmd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9ax6DJZR388VEfhRsJ9/5SgQieNABMCsjdVVYqY/0fcy91TujVnkGib+HKAVseSV
	 16HebOFM7p6EfkkwS6tDBtpx1bPtIp1LYc7zy224gjZzlwa8cQdBEok6lyHB41tC7c
	 SRmUB9EcPgUZ2QSkwXrRhZ7OuFpYmQPW0AFDSLIGCglcKTelug0n8smRDsDh5M5L2g
	 uxm1la3K37mUIHBgjsQnHVKcapXfLievyv/TPuZHR3eQALfsCxR9ytLO4o4PJMKZVX
	 Gy7XXkd80xTg8rP4PbfdZ3RglvrzXFmL5+HWLJ5p0yLYbzluIODklQ74PYEo6mS/RA
	 NCU8grpyjESLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add
 compatible for SM8475
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 07:40:43 +0000
Message-Id: <20260802074043.97C021F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding unconditionally applies SM8450-specific pin and func=
tion constraints to the SM8475 compatible string.
--

--- Patch [3]: [PATCH v2 3/4] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add c=
ompatible for SM8475 ---
commit 2182c26c092a1652eaae869b76b2b59cec9ca7fc
Author: Esteban Urrutia <esteuwu@proton.me>

dt-bindings: pinctrl: qcom,sm8450-tlmm: Add compatible for SM8475

SM8450 and SM8475 have different pinctrl drivers, which are incompatible
with each other. Add compatible string for the SM8475 pinctrl driver.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.y=
aml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
> index 16fd2c5e23393..c790ab851bc73 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml
> @@ -17,7 +17,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: qcom,sm8450-tlmm
> +    enum:
> +      - qcom,sm8450-tlmm
> +      - qcom,sm8475-tlmm

[Severity: Medium]
Since the commit message notes these drivers are incompatible with each oth=
er,
will SM8475 have different pin counts and multiplexing functions?

By adding the SM8475 compatible string here without any conditional blocks,
the schema unconditionally applies the SM8450-specific constraints defined
in qcom-sm8450-tlmm-state:

  qcom-sm8450-tlmm-state:
    type: object
    ...
    properties:
      pins:
        ...
      function:
        description:
          Specify the alternative function to be configured...
        enum: [ aon_cam, atest_char, atest_usb, ... ]

Will this cause dtbs_check to incorrectly reject valid SM8475 device trees
that use different pins or functions, and incorrectly allow SM8450 functions
on SM8475 nodes?

Should these constraints be split using if-then blocks, or is it better to
split this binding into a separate schema document for the SM8475 variant?

> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-sm8475-tlm=
m-v2-0-a93e1d1cb53b@proton.me?part=3D3
