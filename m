Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518A42D77B
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327401; cv=none; b=O/4xRaUYlEVM+rTPWwbHxfUa0HHyIaOHro713fYUeHKTrwddWacuee47YEwtuMov8HxLnEV4GmPmlJ4YEJi3qOBRTCHSBivWC2x9g+PHOYZYVJMS4KfZEL7riPFTMxybdID58HlEnqIrviOg5UWBtwAfoliq7iFJcMhp20iObGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327401; c=relaxed/simple;
	bh=xCl7musDBrAAkyg9fzx2ig0Sfmd2scDKy4f5A/HFPdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0Rx5aDrHuNUoEwHnr4N7cqYEY8qTpyG4EJ5tU3iRWK/cyIyI1nKTwpzPKufyQmGyNoqs8QVSOXK0+kAzSA4oaZnaqpH+kpkdOq5LZvOMtojVja1jz+UnRpC9ynYgQKIRSyTdf6Q3CHNe62Pg1uYkNUQ4d3Hlk+CpDuXEsiXj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHomdJZs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHomdJZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBC31F008A1;
	Fri, 25 Sep 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790327398;
	bh=M7eVVWvtO7P8CT8lROTHysx58V9KfrVcPLLS2K7SbTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHomdJZszOa6aqUX9LQ+EoHqKFvziBrBVPbILc3oXBTfvDjefcjP7f3kXiu/C8NDu
	 BeBIOMeWKKZ4p/6ladCOG0ubR/UiAq8XGFQRfoO930MtvE5EMKhXfOEdmFSznvOaTz
	 xsVayG2Ic6c8c++cuHOlzFkRCu/e/NBdFrv4GvoutYuGHeh+e+S0HLWAZULsykTzmq
	 or6JgZ9H6h18F80TdkCZhaYw3h8h0CNbFHvXpvP3VWy02fVmKeatAwqNCWQ1fmvEjV
	 Mt9nw8l0NzddSd/dn32zQ55T68Bq87Ji6bPgkLTqWr4+k6uPht9jL2ce1XPYuOxvCm
	 jxsXSnea4UuTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: power: supply: ab8500: Add AB8505
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925-ab8500-charger-dt-v3-1-f80b8d295e2d@kernel.org>
References: <20260925-ab8500-charger-dt-v3-0-f80b8d295e2d@kernel.org>
 <20260925-ab8500-charger-dt-v3-1-f80b8d295e2d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 09:09:57 +0000
Message-Id: <20260925090958.7BBC31F008A1@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: driver probe breakage due to 9 interrupt limit for AB=
8505
- [Medium] dt-bindings: missing schema constraint for autopower_cfg on AB85=
05
--

commit 56f862db85ac24639bf3e5234e563c4b067537a4
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: power: supply: ab8500: Add AB8505 charger

This commit adds a unique AB8505 charger compatible string with the AB8500
compatible as its fallback. It requires 14 main and USB charger interrupts
on AB8500 and 9 USB charger interrupts on AB8505. It also notes that the
autopower_cfg describes the AB8500 facility, as the AB8505 register bit
is reserved.

> diff --git a/Documentation/devicetree/bindings/power/supply/stericsson,ab=
8500-charger.yaml b/Documentation/devicetree/bindings/power/supply/stericss=
on,ab8500-charger.yaml
> index 4f19744844e9c..dcffcecaea13b 100644
> --- a/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml

[ ... ]

>  properties:
>    compatible:
> -    const: stericsson,ab8500-charger
> +    oneOf:
> +      - const: stericsson,ab8500-charger
> +      - items:
> +          - const: stericsson,ab8505-charger
> +          - const: stericsson,ab8500-charger

[ ... ]

> +allOf:
> +  - $ref: power-supply.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: stericsson,ab8505-charger
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 9
> +          maxItems: 9

[Severity: High]
Since stericsson,ab8505-charger uses stericsson,ab8500-charger as a fallback
above, does enforcing a strict limit of 9 interrupts here break driver prob=
e?

Looking at drivers/power/supply/ab8500_charger.c:ab8500_charger_probe(), the
driver unconditionally requests all 14 interrupts:

	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;
	}

If the device tree strictly follows this schema and provides only 9
interrupts, platform_get_irq_byname() will return -ENXIO when requesting the
missing MAIN charger interrupts, aborting probe immediately.

[Severity: Medium]
Since the commit message notes that the corresponding AB8505 register bit
is reserved, should this conditional block explicitly disallow the
autopower_cfg property?

If a device tree includes autopower_cfg in an ab8505-charger node, the sche=
ma
will allow it. At runtime, the driver will act on it and invoke
ab8500_enable_disable_sw_fallback(), which unconditionally writes to the
reserved hardware register on AB8505 devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-ab8500-cha=
rger-dt-v3-0-f80b8d295e2d@kernel.org?part=3D1
