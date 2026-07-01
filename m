Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D839D3EB
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886076; cv=none; b=A+eMqLqf3vhC6NTxB7h/f8TZcYPYLzQaLOyjKppW9FKqe8Q4+peg4A3wx8wZFml93QvigmzQVdm/V/L6If9fnWW14Iv4Tm2vS6t53XWfQBzZrh5SYrkzuMmdinmD0LxiMccUaklUE6m4MNtbwQOxCEYHEegbzbw7hnbN0PjqvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886076; c=relaxed/simple;
	bh=NJOtYHIECJPtDnxVK2L/VpGD5QrSB4dYzmb4VgDxXS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBSgVsBz4jyYF3y7AgIlf63suYXEE6/UsC7mv2PlsG3dXTjCBqjjj/54p8GreIzdBliYzIrrldSsrZ2y+K+VXja622NxBEkjRecj0wYzeQBDQBZDGkMW3IEnJUe5REhOvxwOqNamJANOIOb/Xbct/BqlZD1ryGFnTf8qHDugYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZMbRYVO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZMbRYVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AC51F000E9;
	Wed,  1 Jul 2026 06:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782886073;
	bh=eQIqGgoRaci0rn+fDm6HdaiVyBpPw/2+o8cTgzktGks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZMbRYVOEC5Ztn2V8v8gHq0cKXC9nDQWpKe68yswPlAcLxz6ArTfXM2OMvAbUSPrD
	 CoaG8AaOANggsBauwq/XpU2ZT7chWRvamVE+tLW39Tuu1qh9CAmB9n5Y6i9leO99oz
	 b/JJWJ7S8brBLHCM2/M0Tij4V2Ji4plU/snAjOmVoaY+kZGJGjJxY1XLqjiE/K9xOn
	 G1/6MZRHdlD1at7LqoFgIiuJY1TQoGHfwse80TkN7Ju3rABy5w+VFaIOjUgFPxxX90
	 w6oaeD5lv/J45G0UmBsCsBv0E/EYtvmBrZtGBSL9WZtnfaqLrUG/pPhhwXVnnioj9b
	 L4T/5ils2o/Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701055529.445819-2-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
 <20260701055529.445819-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:07:52 +0000
Message-Id: <20260701060752.C4AC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree binding schema omits the `interrupts` property d=
espite the hardware description explicitly stating that it generates interr=
upts.
- [Medium] The binding declares compatibility with `arm,primecell` but fail=
s to reference the core primecell schema, incorrectly restricting inherited=
 properties via `additionalProperties: false`.
--

commit b5849a8f6235b8ea1a67c149957156b0d2165d02
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

dt-bindings: arm: Add support for Qualcomm TGU trace
   =20
The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom,tgu.yaml
> new file mode 100644
> index 0000000000000..76440f2497b97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> @@ -0,0 +1,71 @@
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,tgu
> +      - const: arm,primecell

[Severity: Medium]
Since this device declares compatibility with "arm,primecell", should it
include a reference to the core primecell schema?

Without an allOf block referencing /schemas/arm/primecell.yaml#, the
schema inheritance is missing for standard PrimeCell properties.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk

[Severity: Medium]
The description mentions the hardware can "generate interrupts to processor=
s".
Would it make sense to define the interrupts property here so it can be
accurately described in board device trees?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

[Severity: Medium]
If the primecell schema reference is added, should this be changed to
unevaluatedProperties: false?

Currently, standard AMBA PrimeCell properties (like arm,primecell-periphid)
will fail validation because they are blocked by this constraint.

Additionally, if a device tree node adds the unlisted interrupts property
to wire up the hardware as described, it will also be rejected by this
constraint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701055529.4458=
19-1-songwei.chai@oss.qualcomm.com?part=3D1
