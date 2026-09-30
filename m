Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9904F96A6
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780019; cv=none; b=jyItyokk3S1KcVu/cxjfTrW8IiZYSHd+mMsghIUwONTkuEkVBTaRkSxAtlPOqi0xyDgmpzjSDdggnjuRxagIsnb5O88CGRQdeR4/z7OSHxa6dMyKENYzaydZsoFEQMl9b305Vo4DcR+v3dAeEY09y5+xNLGrnZAH3J6FCiFoM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780019; c=relaxed/simple;
	bh=596WijV7NJzJjwivMtFsH+ok22FrmDCexlyQ8DRd8Cg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vAdHsKEemxLa3w87HmFqVZ4Nzk78Ki10UY6oFpPv//qrVH9C8TFOzS/FvWb0F51dM0p19iuUBjGyYwFKnA4C8crHUFBddc9j8vyfXiAAuS00R+WRcMOA9VUOIw2RPiae90EtlhXnu58NUy2TXU+ye5RARyCBuUjYpXO9mWuRTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5WLEkY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5WLEkY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D555C1F000FF;
	Wed, 30 Sep 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780013;
	bh=WYWDIdEvwizDwmrf0LPz1cJhOMTPJgV+kCuc0kmZpGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5WLEkY1/6qT+GAqWZXxmN/10DKck6jEvBkKD+6uAlPzd2nPpulORfsrCkPtXrfuI
	 FLCm6c2KdnQHCGBhCjuu2kcwC3kBRB3uiYDHS3heD3ldckrnrqewRB5HtLhJjdfGs9
	 +BFtOOdtFkF044wQ0MDULWC2fdGlTI/vS6PGJYEiszGi5edw4N+kgDxewOCx5bUe01
	 5DAQyufL1tM76MxNeZoZxzjLkjYSXybbouJgV7cwX9WhDSzHJLE7MMVTib9WXRVsRG
	 SxDsC3NWFmYq7VMvLZrNn1jz7GnfBoWFZOEdOyCfz/m3qgAhiXdb/BSBauHQ8/yiIE
	 NaWQKji2UO2lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260930133257.23210-10-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
 <20260930133257.23210-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:53:32 +0000
Message-Id: <20260930145332.D555C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: unused Device Tree binding includes in the overlay
- [Low] build: missing &du and &lvds nodes in base DT break fdtoverlay
--

commit a9bfeabadeefbed460cdf1bc271c6ea8bca9412f
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with ITE6263

Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
ITE 6263 HDMI transmitter.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 8c6a448907151..3cecc40204e90 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -190,6 +190,9 @@ dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc.=
dtb
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtbo
>  r9a08g046l48-smarc-dsi-adv7535-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g04=
6l48-smarc-dsi-adv7535.dtbo
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtb
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-lvds-ite6263.dtbo
> +r9a08g046l48-smarc-lvds-ite6263-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g0=
46l48-smarc-lvds-ite6263.dtbo

[Severity: Low]
Will this composite build target fail when fdtoverlay runs?

The base SoC device tree (r9a08g046l48-smarc.dtb) appears to lack any nodes
for the display controller or LVDS interface. When fdtoverlay attempts to
resolve the __fixups__ for the &du and &lvds nodes against the base DTB's
__symbols__, it will fail with an FDT_ERR_NOTFOUND error and break make dtb=
s.

[ ... ]
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.=
dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> new file mode 100644
> index 0000000000000..3c64db8d22e9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
> + * connected to LVDS and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>

[Severity: Low]
Are these includes necessary?

There don't appear to be any GPIO properties, interrupts, or pinctrl nodes
defined or referenced in this overlay file, so these directives could be
safely dropped.

[ ... ]
> +&du {
> +	status =3D "okay";
> +};

[Severity: Low]
Does the &du label exist in the base r9a08g046l48-smarc.dtb?

If it's missing, fdtoverlay won't be able to resolve the symbol and will
fail.

[ ... ]
> +&lvds {
> +	status =3D "okay";
> +
> +	ports {

[Severity: Low]
Does the &lvds label exist in the base r9a08g046l48-smarc.dtb?

Similar to the &du node, if this label is not present in the base tree,
fdtoverlay will fail during the build.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930133257.2321=
0-1-biju.das.jz@bp.renesas.com?part=3D9
