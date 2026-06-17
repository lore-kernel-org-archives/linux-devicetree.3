Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A4E24E4A1
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676632; cv=none; b=LNpQC+FfZO6EjvbIRiC3hrt12WCDynYVGkM9kWRZ0KwYK+7TTQuGAtZUSc5flpHiFT452bKen12HLSp91BZOJnww730GcQPLlTeCoril1pvdk8l6M+e4U6mKd6XUjpn0cuaW/dVRgANgdpYv1+KFfTrU2HfApoY/3JkYUhSSwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676632; c=relaxed/simple;
	bh=eRLfEiBHwxV6KQcIWM3i4Nt2FAWplnrLo81h3PO/H/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CISlgh2le84QTOxiB1dA22l0XNDuHnUx9vc71g5SBMHOGYDCR0glEC2kH981nq/sl51GnsYmwfj7vyNg/bUMRKV9wK50W6A+3rfPbWXgIwWIfBhR132s3nNN1PVTwCqvWbp26boXnjVnM0kSX985yURqhg4gHybBVUBJ9Uyb4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY2ZefRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY2ZefRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B88C1F000E9;
	Wed, 17 Jun 2026 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781676629;
	bh=2KiB0+Y8mYja1lYrrdSFN1BS6bIMPac/u1wJhSd5lMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LY2ZefRQAorhQreuslicwLZMGik6y0aeTt5TuETnxagefvV3NSifdjb7zXTdChG+J
	 aKJPMYQusBMggWOc5r530CFg+9UlPTrVLdNaiZmpz0ZC2ZX4Vy9/5m1rcbcj31pghE
	 k5pDmvQ1VGL9Ewc0ARqBRR+1xyRvGQU1hzxDD64GW7YpywD78UuhVLvGP5jM5gqBUj
	 WLDNLXbwF5E4PyWZ/ke1QuLctJTzP6/rBia3bnRLdp5xN61zYmoqjyeRgfDaZZVqoR
	 RilKEfUG/+jJCDBFGPJxjA94+M5fvAptab/XXor7cQ9oaA5O8tM7sXnZOenrcKLUQo
	 1k66Q/BwvVoow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617060437.1474816-2-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-2-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 06:10:29 +0000
Message-Id: <20260617061029.7B88C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `cix,sky1-audss-system-control` compatible acts as a reset p=
rovider but does not require the `#reset-cells` property in its conditional=
 block.
--

commit bc475a5f4ccc93d6c4b68c75338adb8eb56b01b2
Author: Joakim Zhang <joakim.zhang@cixtech.com>

dt-bindings: soc: cix,sky1-system-control: add audss system control

This commit adds device tree bindings for the Cix Sky1 Audio Subsystem
(AUDSS) system control block. It introduces the new compatible string
cix,sky1-audss-system-control and defines constraints for its child
clock-controller, power domain, and resets.

> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-co=
ntrol.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.yaml
> index a01a515222c6d..5a1cd5c24ade7 100644
> --- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.y=
aml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-audss-system-control
> +    then:
> +      required:
> +        - clock-controller
> +        - power-domains
> +        - resets

[Severity: Medium]
Since the cix,sky1-audss-system-control compatible acts as a reset provider,
should #reset-cells also be included in this required list?

> +    else:
> +      properties:
> +        clock-controller: false
> +        power-domains: false
> +        resets: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617060437.1474=
816-1-joakim.zhang@cixtech.com?part=3D1
