Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC03B95F9
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523849; cv=none; b=Leh5GTagkPoyiAmNTkmpAVQtz1k81ItTvX3U6gN/kemTQ/MfSOvDi67XIJwH8z3sMKwZ5jgFOEmH52z+xgPk6NRMP/UCEo9HKdOlLCWqV6hbG5prEoYLa0vtYtVqBuftEq6JEbIukOyTj7+2vqDzveX8Vj8amBkhTQxMEfzARm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523849; c=relaxed/simple;
	bh=k6lkEgBMoDZLiIJOYXxNdBXUc9Dv8oN2/B6Mf9zc9Nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C3QDSHlzx3zbhL/vMJqMqyNfqWi50jZzjF2Z3HwkB3hNGWV1xD8OeSO5oIp/Io8zCf+ckb0hzed9OB5ThjGhCBQF350puvVfXt06s9OWZCkff2+ThaYCZr8gZpU2XupOwpSeJ5JfwUZEgO0i+rGoOX6wAqJdPk/d24HpN5uK9aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntIGRt2m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntIGRt2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7532F1F00A3D;
	Fri,  4 Sep 2026 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788523847;
	bh=juHKIFryfXk/gfVBZbBRS9Lty5yK26C0wuHXXZ/QiOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntIGRt2mdEYM3CBKwmq49XsOISHkVOhqDK/cjbdTGoUQfF3od0M6ombbkjPLAmw4s
	 YQ3y8s3Lmj6Yd+Wd1R9gt7QSzNRRN90j1HJ+h1zQOTFy5t5bD3qIrKRm1YLCIbB8BO
	 xGk88KrQsNlUaZ6vM12iiMi3mx1vVZr2HhNRGK8I8bGc/oYb6L+ZUCyoCPdRFzpBij
	 qwlU4rPNGVokUxqgWAYY5McT0ya5xdfcCi4bpKEtlSLQgH/kSHnPj9r5pwNCBDePXX
	 uIaXUMHenxBJY5p+xi18gqUkNIyZ4KH2xGU9jCdFDhwmzCoFkNAawoJhavUUtUDub0
	 3YGf7fDQeH+LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:10:46 +0000
Message-Id: <20260904121047.7532F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The shared device tree include file `rzg2l-hummingboard-pulse-commo=
n.dtsi` uses LED subsystem macros without including the required header, br=
eaking self-containment.
--

commit d997057daebf169901ade156154724f6370de654
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun hb-ripple with rzg2l som

Add support for the SolidRun HummingBoard Ripple with RZ/G2L SoM, which is a
reduced version of HummingBoard Pulse featuring various connectors like USB,
Ethernet, micro-HDMI, and microSD.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.=
dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
> new file mode 100644
> index 0000000000000..b0ddd426241ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-pulse-common.dtsi
[ ... ]
> +&phy0 {
> +	leds {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		led@0 {
> +			reg =3D <0>;
> +			color =3D <LED_COLOR_ID_ORANGE>;
> +			default-state =3D "keep";
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +
> +		led@1 {
> +			reg =3D <1>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "keep";
> +			function =3D LED_FUNCTION_LAN;
> +		};
> +	};
> +};

[Severity: Low]
Should this file include dt-bindings/leds/common.h directly to remain
self-contained? The led@0 and led@1 nodes use LED_COLOR_ID_ORANGE,
LED_COLOR_ID_GREEN, and LED_FUNCTION_LAN, but the header defining these
macros is not included here.

[ ... ]
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi b=
/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> new file mode 100644
> index 0000000000000..5e043e40641a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include <dt-bindings/leds/common.h>
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"

[Severity: Low]
Does rzg2l-hummingboard-pulse-common.dtsi rely on this include being placed
before it? If a future device tree includes
rzg2l-hummingboard-pulse-common.dtsi without also including
dt-bindings/leds/common.h beforehand, the build will fail due to the
undefined LED subsystem macros.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rzg2-sr-bo=
ards-v8-0-94c4674927e8@solid-run.com?part=3D8
