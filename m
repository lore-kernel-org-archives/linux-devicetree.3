Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458993F58E1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509252; cv=none; b=klNetpBlISRsjGyO3WhXKVTBCnaDfKqotxefP7+ok0LvUm64oEosLx6LibVt88U4Mhf+EafLpmGOin1vann4nzgOdraKjEAPebPyC/V6vZEb3vsMYluNwcdNEBrnuNCOwhElHNHOKeZ90noHJrCxdh5kdSgxEdO5u4m08vEUmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509252; c=relaxed/simple;
	bh=LXwzAoOtiBj+rZUfu+H0JyRYtFPpw91KKAZE25kuKdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLOa9Z6TMDxO9womliTi56SyzJEO9h3DlhE+aLrn9zT8YHn9+Xb/lhM7dVqFKYm2vpvGXGcpQUnwgxqwztEZC6JWD/QNGVcyyLyPCybXCEVkiqzz9PSH2kYAz1kL/qTz0V560cMOdEX8tH69mKbYmyiFKWiudryd35TVlLrqt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYsCfjHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYsCfjHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C991F000FF;
	Tue, 15 Sep 2026 21:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789509250;
	bh=V+GKwesaYUdjz8FzI5ZgCbS4Z6+MZ7g9fap+5Fq8wXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYsCfjHGgycUEJHRRyFRVT52sb41iDKi6uMk7KmMKWJm8rr6JawbzoZBLvSX1lXPa
	 B9bBba56cwKZIEkJNAvPj6CQs044hnfnkS34kAYA4KmpgK0GrvtuYhtEwabqJmM+eO
	 bY4beczJbtBDQpmpGaSvhMLiERUe87BvRpHbtN+5/D9Z/heQHAOIsStjYFOvlp3Bm7
	 hiAzI+Vt5O+BkLCOFuJssUUTfI7w9HmsMDRk1FWhBgf93ZmeuEd+8nkf+jT2eRk3oY
	 CnDU4PhzYRX7WHkMg73aL0l66uN6ix/X3Ebb42mLu8szpBtXyvcj9YTOTRL48iieiu
	 AwYY0rStzv+uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: ab8500: Allow AB8505
 interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915-ab8500-charger-dt-v1-1-10b7b387e6a6@kernel.org>
References: <20260915-ab8500-charger-dt-v1-0-10b7b387e6a6@kernel.org>
 <20260915-ab8500-charger-dt-v1-1-10b7b387e6a6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 21:54:10 +0000
Message-Id: <20260915215410.A4C991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] power: supply: ab8500: fatal probe failure when using 9-interrupt =
configuration
--

commit 8052a5eb029696fb98fcaf52a7b6b4012177809a
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: power: supply: ab8500: Allow AB8505 interrupts

AB8505 has no main charger or main-charger interrupts. Permit its
nine USB charger interrupts as an alternative to the full set of
fourteen AB8500 interrupts.

> diff --git a/Documentation/devicetree/bindings/power/supply/stericsson,ab=
8500-charger.yaml b/Documentation/devicetree/bindings/power/supply/stericss=
on,ab8500-charger.yaml
> index 4f19744844e9c..437b58e82e9ae 100644
> --- a/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml
[ ... ]
>    autopower_cfg:
>      type: boolean
> -    description: automatic poweron after powerloss
> +    description: AB8500 automatic poweron after powerloss
> =20
>    interrupts:
> +    minItems: 9
>      maxItems: 14
> =20
>    interrupt-names:

[Severity: High]
Does this binding relaxation lead to a fatal probe failure when the
9-interrupt configuration is used?

During initialization, ab8500_charger_probe() unconditionally loops over the
statically defined 14-element ab8500_charger_irq array:

drivers/power/supply/ab8500_charger.c:ab8500_charger_probe() {
    ...
	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;
    ...
}

When the driver attempts to request one of the missing main charger
interrupts via platform_get_irq_byname(), it will return a negative error
code and immediately abort the probe.

This would break battery charging and power management entirely on hardware
using the 9-interrupt DT configuration.

A later patch in this series, ARM: dts: ux500: Drop AB8505 main charger
interrupts, applies this 9-interrupt configuration to the DTS without
updating the driver, which will cause the driver to fail to load on boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-ab8500-cha=
rger-dt-v1-0-10b7b387e6a6@kernel.org?part=3D1
