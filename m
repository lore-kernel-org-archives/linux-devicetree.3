Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913D86341
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623027; cv=none; b=qoLHzrCvNrFqhlI6hr1zrSnbr3EBHix4ulO3fXkttjLfCslPmIY0HCSPD5PErOd88BUTy4qgODBK6t4PcKCqbqybne6m860doTNWSSxw1dhwf4IxMFFg71dXphT28m8jgpKEwZTDm9eR/IzibMR3qLe2iZr0CEzxy5OntLrHYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623027; c=relaxed/simple;
	bh=pwwWg5y/9QPmuHTn32NgdcnGKUdWbcWk5l/HDW7Msw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pkduqb1oBTufBQKuVifRe/VAz3RzxSxa7/pA/lif51+nrqiBou2nCMWE9hmtkN9Xp1tbPYLQZYi3My2RsBcyHPbSSoq0YVsmW+AueJGObLGFgRWbHsLpjPna5OZJqJT7bjJcrfGx1Zg262yJkzgYdppzaqIOl3ULSRlWcGkNPJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6URCsaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6URCsaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E941F000E9;
	Thu, 13 Aug 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623025;
	bh=Kl/hABagNJrjEKnzn3iHXMEV+4vfjrx4GvyFPVFVb2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6URCsaLrpery9/BlMQnBKsgncNLWBfrEVd+k/oJjOngBdDiNs5oTYj8ym7D9C49i
	 7h6Obf78ci8CcH1YS0BpbnEXarfIIT4tfR/lkEaxzW2POBTIQGNPykQCtBcRWu7W2o
	 wWz00LrhGxgv8I6ZesH7N7i0ShOvr29znAL8QTbXMGyN1fULZCuHXKqMXS71v5ou7f
	 1UJ1FroFRt+rItEoM/GNHQWooVbcAUU30zsS+/KDj0NS4Hkh85wxlPUBRe8xUoUBuS
	 UevNfbJ25Zzjs0iQWgzNSVu9hCgQzH7UX5QPZB8+7+2H/NzoElrwrlAUIl/8v5R5T5
	 IqZWY59Lz44qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/15] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-2-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
 <20260813-anacapa-devlop-phase-devicetree-v5-2-c7058f63dc67@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:10:25 +0000
Message-Id: <20260813121025.80E941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The wrapper devicetree aspeed-bmc-facebook-anacapa.dts drops t=
he generic compatible string 'facebook,anacapa-bmc', breaking backward comp=
atibility.
- [Medium] Including a top-level .dts file from another .dts file to hijack=
 the build target name violates standard Device Tree architecture.
--

--- Patch [2]: [PATCH v5 02/15] ARM: dts: aspeed: anacapa: Add EVT1 devicet=
ree and point wrapper to it ---
commit 35fc682b92e94ff2d9be35a5fb9d50d3d7e5a11c
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it

This commit introduces an EVT1 development-phase devicetree for the Facebook
Anacapa BMC. It updates the top-level wrapper DTS to include the EVT1
devicetree, aiming to allow future revisions to inherit from a common basel=
ine.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> index 0000000000000..a095be48a3fe6
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> @@ -0,0 +1,1079 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model =3D "Facebook Anacapa BMC";
> +	compatible =3D "facebook,anacapa-bmc-evt1", "aspeed,ast2600";

[Severity: Critical]
Does dropping the generic "facebook,anacapa-bmc" compatible string cause
a regression for backward compatibility?

Bootloaders, hardware management systems (like OpenBMC's entity-manager),
and userspace applications might rely on the generic identifier to match
this board. Should we preserve the generic compatible string as a fallback
in this list?

[ ... ]

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 1fddf3a5d1383..209eef65cedbc 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -1,1079 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> =20
> -/dts-v1/;
> -#include "aspeed-g6.dtsi"
> -#include <dt-bindings/gpio/aspeed-gpio.h>
> -#include <dt-bindings/i2c/i2c.h>
> +#include "aspeed-bmc-facebook-anacapa-evt1.dts"

[Severity: Medium]
Is it standard practice to include a fully formed top-level .dts file
(which already contains /dts-v1/;) from another .dts file?

Typically, shared definitions are moved into a .dtsi file, and distinct
hardware variants (like EVT1, EVT2) have their own explicit .dtb targets
in the Makefile. Could masking hardware variants behind a single wrapper
cause issues for the build system or future extensibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-anacapa-de=
vlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com?part=3D2
