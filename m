Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E844EC66E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779305; cv=none; b=ODjmC8ABAGasGha+3yclvUEmdE2Pc0khFl7oAiQ+baO/lU1fI2D6dwzXglpRR3iRJIRsgpPYaEeI+Y0IxlSUZqNNAF583TmtxSv2rrbe2wS62mJq+Z9j60oz9ck4ah+dJi/hQo3V/hl3cfjAgpur9CkT0mR3nAA8nwpCOnr6lCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779305; c=relaxed/simple;
	bh=b3keD2wIkFR/wxwi5TUcHl5WefiNsztrdJGQRwoBP44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UAlyK2ul5QC+UGmmt0qUKmcNXodgQ2GCQujAVL29Id6oNHwX6lqzQ1T3MebcBsXTFvkVAwdzR04EyA8LVJztm0pDqxopChDDTaoaTDLsj6xU3GUxm/1jk0RbyiOdmOfVCll5VWUz5e/RDB5W+e2kMmRi/nz1zRjnpA+29pK/b34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWg44Pd+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWg44Pd+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10851F00898;
	Wed, 30 Sep 2026 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790779297;
	bh=pRK5x+N3W0hHuLGklrggeddls80Ts5CfED82IuzLyG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VWg44Pd+lGNdUqjD+4oLfGSwblwWMuT2SkNTXvW0A1S2/JzffruciVwe25o8nXG6i
	 uajjSCyXs1bjoTfCS//uL0WayWHb7NWibji/r14H3Jah8H7xBlwEev8keeBKfWoqu8
	 Yjf5dkeTPvmuEtx/vylvtEFX9g+bqkJGWBRB32hpzZwyBb9bP5cyMIswg5ZTA+TqgK
	 XqEOMilBNMydYoVJNnqdr7dbOrTw4L/JTrcZNIvggizQ+RXrDbbu6Wk/LedXv1yuKc
	 L92PDBiIgx75QqgRP1UV2lA00AVF+Iqu3L7lMqvpU5XqgH/ptoG8kfFQzDdRlFV88+
	 APr4mlDX8/KjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260930133257.23210-9-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
 <20260930133257.23210-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:41:36 +0000
Message-Id: <20260930144136.D10851F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing base DT nodes 'dsi' and 'du' break composite DTB gen=
eration
--

commit 07c28a5a092963d3ce032fe9a165d2ef8166fc2f
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
   =20
Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 8bf155badd111..8c6a448907151 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs :=3D r9a08g045s=
33-smarc.dtb r9a08g045s33-sma
>  dtb-$(CONFIG_ARCH_R9A08G045) +=3D r9a08g045s33-smarc-pmod1-type-3a.dtb
> =20
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc.dtb
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtbo
> +r9a08g046l48-smarc-dsi-adv7535-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g04=
6l48-smarc-dsi-adv7535.dtbo
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtb

[Severity: Low]
Will this composite DTB generation fail and halt the build process?

The fdtoverlay tool requires that target nodes exist in the base DTB. Becau=
se
the labels referenced in the overlay do not exist in the base DTB, it appea=
rs
this will break make dtbs for the architecture.

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.d=
tso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> new file mode 100644
> index 0000000000000..1e1ebafe24398
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

[ ... ]

> +&dsi {
> +	status =3D "okay";

[Severity: Low]
Does this target label actually exist?

This fragment targets the &dsi label, which appears to be missing from the
R9A08G046 base device tree.

[ ... ]

> +&du {
> +	status =3D "okay";
> +};

[Severity: Low]
Does this target label actually exist?

This fragment targets the &du (Display Unit) label, which also appears to
be missing from the R9A08G046 base device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930133257.2321=
0-1-biju.das.jz@bp.renesas.com?part=3D8
