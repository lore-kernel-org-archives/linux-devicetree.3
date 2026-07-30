Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB53F12F0
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411000; cv=none; b=TTJuq3Jfv9KmQ5LePKqV89qkRLpJhtcyQMM694UIQyl7h0nQYSyld9ZaG+JWZneWZPqKytjnzCLZlStg0NGEodHObYPQ+37Qe/zONdSjnpygWV6Mw3+mQbZuELEFj3cq+/ufo4HKT3aEJPRXBijsr/FvMplHBwqw2UrX8sGi9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411000; c=relaxed/simple;
	bh=oRvB4+TrgfUuIiwDPbPHAQkJT+rQJTgrAF7kTVdht0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AsO2U0v1D+qB1ERU4WynFmc4S5v+hmCqzxGC9p2rVLmp+IGZQnnf28NhxrDXfo1CDGkS246ynvtx3qD4526vZ+43Zl0g81KEzwqTAS6/2EpjclldCKZwgcrWp5svhFPlkmcTML25X6hon56j0E6AQHds1fQIBHcjrpRC6MVv3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9ijVo51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9ijVo51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED571F00A3A;
	Thu, 30 Jul 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410998;
	bh=NH0hyWJSc19FBZiKXkA65tVA4UyLoLlz6m7uLP/If/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9ijVo51v5XWtG0KBFbQG5U67YTa/StYyVJ4Kr67qrPa7WM5oO3a/oX4bdzpW36i7
	 3hRKEXe8a80io9fJdKYhmXIELH1U5/E2xdqLYpwMmtoc6c6GcSZW8RtU1ZmNPp7FEw
	 FN6AARmL4MRdzc058PpdOjzAzW9I5v3NIRB3WOdZ6YlRdR/PiVRkSx/3nPKm6nKKKi
	 3TdetXwSJTT0+jNo5cFbVFiG45no6ug1mcnjgpxiVqbrf3OxMKG0yHwXqN+gpYDRKC
	 vmNatWK72U3aj6y3mTGsH3lSFyL4v8ZqSogW1FbQNCh1GE/c6e5/jjVh4rITQIGHZc
	 JYoa9Z0MRBR+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/5] dt-bindings: pwm: dwc: Add eswin compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730111534.1834-1-dongxuyang@eswincomputing.com>
References: <20260730111425.1680-1-dongxuyang@eswincomputing.com>
 <20260730111534.1834-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 11:29:58 +0000
Message-Id: <20260730112958.9ED571F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditional schema for `eswin,eic7700-pwm` fails to constrai=
n the `resets` property to a maximum of 1 item.
--

--- Patch [2]: [PATCH v14 2/5] dt-bindings: pwm: dwc: Add eswin compatible =
---
commit 804c34afffe86d4a3ff253201b6470e700f1af47
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

dt-bindings: pwm: dwc: Add eswin compatible

This commit adds the eswin,eic7700-pwm compatible string to the
snps,dw-apb-timers-pwm2 binding. The EIC7700 integrates this IP but requires
exactly one combined reset line instead of up to two independent lines.

> diff --git a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm=
2.yaml b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> index 1f9d72f9f3590..87a56ffed09d9 100644
> --- a/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
> +++ b/Documentation/devicetree/bindings/pwm/snps,dw-apb-timers-pwm2.yaml
[ ... ]
> @@ -64,6 +64,29 @@ required:
>    - clocks
>    - clock-names
> =20
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: eswin,eic7700-pwm
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: Combined APB interface and timer logic reset

[Severity: Medium]
Is it possible for a device tree to pass validation with two resets for this
compatible, despite the intention in the commit message?

Because the top-level resets property implicitly allows up to 2 items,
overriding the items list here with a single element doesn't automatically
reduce the maximum allowed items.

Should maxItems: 1 be added explicitly in this block alongside items?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730111425.1680=
-1-dongxuyang@eswincomputing.com?part=3D2
