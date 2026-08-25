Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD03F8234
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655484; cv=none; b=Q/SzfAOfy98HmXc0xwZi4CI93QPe/JZf2yVW3s19VLIjnbKL1KDcNjajlFdfPU/4b6NDBmI7Xh0o7neNRuLigEXrDLBGU+LROiAW1WXlAFDGBg2fU/bJxEAQsjXZ6jc0Faejwg4txT9ZZtxjcNgRK8VFaFJlhgYjwC5iWoUNP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655484; c=relaxed/simple;
	bh=0tzIaxwaS9ASu0rE6zw9Jr4Qz0Emed8l0yZm+rP+SCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KUVyFZntPx0x2XbtUJ7kKhoYtHavEFHkbhCjC/zb77OYYxNd5fIcp8RLNQJQxBa8Uj+oeJueHDKibn6JkfTGmrw6iiJsb9MN3/J+y7/GnRuDyZH2AvT/3zWQcorwVEAm56+DJh7OvQ9scpzdT17wH8kJFJIhquHlpitRsW/fVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lxm/7Vg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lxm/7Vg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D362F1F00A3A;
	Tue, 25 Aug 2026 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787655482;
	bh=PRTQLJFsxuGt0iD8E9VHh4VkZW+3kVPojk/oBp5RjOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lxm/7Vg2ih51NMn6tcCGzcDQEc5aRwc8owvrcFWWOhfU/wIMPQd0rbPb1iJpHCe16
	 imi/LbonxmLg7gAXHzovm9VmLzOJlufsh9jfB5jZDZ1BvYXZSWY5qazpjMuJu54N/T
	 UAF6ggQV7Zb8vpMMsyjxStfeW/HNl6yT7qOdG21hMBAgTdhan4NMhTO83Dx2u7CZfX
	 KgPQHiRqybInrS5fp8v2cIwvnnZpxd783JWUlz0+n1U5XaA5TTKdVsckKlIu7cCnvA
	 MRy+MLPwK4Sw0rtW2yh1rLmZ/mORDtL+TLctn0EhYji0h1vKAKk9+yOZuvwQy19Nq1
	 1Hs9yjkdcOQsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-2-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
 <20260825-anacapa-devlop-phase-devicetree-v6-2-9059a2a279ce@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:58:01 +0000
Message-Id: <20260825105801.D362F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Devicetree ABI breakage due to removal of generic compatible s=
tring
- [Medium] Incorrect removal of `p3v3_bmc_aux` fixed-regulator node
- [Low] Included devicetrees use `.dts` extension instead of `.dtsi`
--

--- Patch [2]: [PATCH v6 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicet=
ree and point wrapper to it ---
commit 9a026f3bc21757ceb40a47713b367e173351589e
Author: Colin Huang <u8813345@gmail.com>

ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it

This commit introduces an EVT1 development-phase devicetree for the
Facebook Anacapa BMC. It updates the top-level wrapper DTS to include
the EVT1 hardware revision file, removes redundant pinctrl names, and
fixes a dt-check-style strict violation.

>       Remove p3v3_bmc_aux node to fix '[unused-lable]' warning.

[Severity: Medium]
Is it correct to remove the entire hardware node here?

If the intention is just to fix an unused label warning, usually only the
label itself (p3v3_bmc_aux:) is removed, preserving the regulator node to
accurately describe the EVT1 hardware.

While follow-up patches in the series (e.g., commit "ARM: dts: aspeed:
anacapa: Add SPI flash VCC supply") add the regulator back into the EVT2
devicetree, the EVT1 devicetree baseline remains permanently stripped of
this regulator node.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> @@ -0,0 +1,1120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	compatible =3D "facebook,anacapa-bmc-evt1", "aspeed,ast2600";

[Severity: Critical]
Does removing the generic "facebook,anacapa-bmc" string from the compatible
property break existing ABI?

Bootloaders, kernel quirks, or userspace utilities (like systemd or OpenBMC)
that rely on matching the generic string will fail to recognize the board
during an upgrade.

Even at the end of the patch series, the generic string is never restored.
Should the wrapper file override this to retain the generic string, or shou=
ld
it be appended here?

[ ... ]

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -1,1079 +1,3 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> =20
> -/dts-v1/;
> -#include "aspeed-g6.dtsi"

[ ... ]

> -/ {
> -	model =3D "Facebook Anacapa BMC";
> -	compatible =3D "facebook,anacapa-bmc", "aspeed,ast2600";

[ ... ]

> +#include "aspeed-bmc-facebook-anacapa-evt1.dts"

[Severity: Low]
Is it intended for this included file to use a .dts extension?

In kernel devicetree conventions, files intended to be included by other
files typically use the .dtsi (Device Tree Source Include) extension. Since
this evt1 file is strictly used as an include base and is not built as a
separate target in the Makefile, would it be better named with a .dtsi
extension?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-anacapa-de=
vlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com?part=3D2
