Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611253B341
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174749; cv=none; b=KwJrb2/DUYpDhMvf6dO5v/9gT2zcCSnMJPU7Ek5gmPftMGS5xn9ieda+DvSQWbjklY3xw1LSPvQ9dN9+uwsJ6xAe+yc2P1bTVduL6zfX9o9nysS4ojvZ0ZJnbdhShxJph/Bto4sh3e545nE7UXq1pk4So/5R2qLdlsATnPQGeuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174749; c=relaxed/simple;
	bh=9Zc4Dy9bPAED20Kc832/AHxIcxKGnyYXtCAUV6gbxVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lzR2+rhJBmJNi1SCwOTMaBxn3bvUJauNATuWeQLTfMpROLhdZ+Y93xh6VakloS53+sOImTENrTHwjaDv57XK0nw+Psh/CHHhDudvW3jwwRvzGUvIHJDmP8bzIhUnF14lOaTL0JWZDuiveQuBUhY1IUlJWTE74VreAsxKqIRmIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls7QUqGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls7QUqGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D0B1F00893;
	Wed, 23 Sep 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174748;
	bh=Cmc8C8kN0PaFVbymjclsOxShNRPivDtpIGl2UpTFBu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ls7QUqGVWnHF7dE85zeiUK8rUAvda0xXGgtF66w5yw+MOLDLf8sIMkaFE+dZQR7K+
	 TOUSWsMarNf8KWKe1lCxBUEJtp+ALM2cOD7L/KCY8kz3Ib/WljKxL0JA56h1HJXgFs
	 +HPOAoA7VV/xi18m8j+efZRiyk+/1lvSsqdwcJggOSOdD4m/LEG2NQzj0HDZHTPKkI
	 j1sKS32g8en9FXbgG1rHa9RVVSdMxZe5kuu6cI8GPPwyD+Fh/XSo5LM39sLwfAYhpZ
	 soXtPmFAErpnLHe3QlFLPzPQyFDupSxiq10RgGJVrreg2PMueBRNb16KN9SEUKRT0a
	 6C7BgpGHD+xtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: amlogic: describe bus
 clock for t7-thermal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
 <20260923-fix-t7-thermal-clock-v2-1-bff7a09eb487@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:45:47 +0000
Message-Id: <20260923144548.32D0B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: ABI break by prepending new clock instead of appending
--

commit e4a0aa553cfc6f50abf6357d559b0af000ba1b3b
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: thermal: amlogic: describe bus clock for t7-thermal

This commit updates the amlogic thermal binding to describe a new bus clock
required by the t7 thermal sensor to gate register access. It makes this
second clock mandatory for the t7-thermal compatible while keeping a single
clock for older Amlogic SoCs.

> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.ya=
ml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -32,7 +32,15 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Bus clock, gates register access to the sensor.
> +      - description: Functional clock of the temperature sensor, shared =
between sensors.

[Severity: High]
Does prepending the "bus" clock at index 0 break backward compatibility for
older deployed kernels?

Older driver versions use devm_clk_get() which blindly fetches the clock at
index 0:

drivers/thermal/amlogic_thermal.c:amlogic_thermal_probe()
    ...
    pdata->clk =3D devm_clk_get(dev, NULL);
    if (IS_ERR(pdata->clk))
    ...

If an older kernel is booted with this updated device tree, it will fetch t=
he
"bus" clock instead of the "core" functional clock, which could cause the
thermal sensor to fail. Additionally, doesn't this misdocument the existing
functional clock for older Amlogic SoCs as a "bus" clock?

Even if the driver is later updated to use bulk clock APIs, the device tree
ABI break for existing older kernels remains. Should the new "bus" clock be
appended to the list instead, keeping "core" at index 0 and "bus" at index =
1?

> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: core

[Severity: High]
Since this naming array matches the clocks array above, would it also need =
to
be reversed to "- const: core" then "- const: bus" to ensure the functional
clock remains at index 0?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-fix-t7-the=
rmal-clock-v2-0-bff7a09eb487@aliel.fr?part=3D1
