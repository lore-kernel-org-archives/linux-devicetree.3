Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651847;
	b=27mClIrJs8Eg4OPj5QTlWsHKNwVpAyqNOqw/ZJr2w55jn5s9FOd3sDEX2KPgbkI9VCbC
	 Xw32CyU4rmqGQPHMpochGwmEHJpnwMFLG3orGjMIPUNL6BChs9MkIoUXH+5tOhZE9BEC3
	 41H4w0rgpfDF9CuUCfaRRWneEgjHCu1fMWW+nXdD7qosYYtSJ/RSd933EIOLE3bSDjoAh
	 m/nwcOGcc1NgkjbTapN2Ktn/9grPQsObkAfygUZqXHcw+1jMULHFSvBTK46kvHjwTVnKy
	 mipSPT2+LCYz6vNTwzrSrVb/yMPZmlL/lN0l1UkxZAqh0GsR3iTlcPP8RO9HtT5eSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651847;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6p07wDtIRK7ROADwQXQ53JY+NEgcjaZ++uUDkoCC9w8=;
	b=CRBfsqCudxTAsLcXPXgEi91mOgflAg3i+mTPcEGnhxKfS5bMnomRf/CQOZ9kvmus6YnS
	 o9wcVufQ6ldzbKrV6V0FPGM9hnhR2M3vOmS1hm6BMTyGBrlVHuTFQvIoy22Nmtt+oD4g4
	 ESabVTN0mbs0fb2JW17AzoQQoBbbLwsMBVyl8hRFRqH+xoJ+K2TNVU1t+Vu/sAvrM16u5
	 4FCTRS7HgZZrzF9z8T0IFwR96/cz3rop+yuyUAsqNYjNOCBaIx8sdhEW0K41umONG7jw9
	 gW0xkKPKtAHfOkN3IORP8DfyQ/HxaGdtr08mDUpBQwO8joKoP4YvARmblYLsCI4XM6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/FOfLAe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9DF606A322
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/FOfLAe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B21F1F000C5;
	Thu, 22 Oct 2026 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651846;
	bh=6p07wDtIRK7ROADwQXQ53JY+NEgcjaZ++uUDkoCC9w8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/FOfLAeWmG+yzXbClju3xw8BylNW288om+Qma9fcRd34PPU1WqY84eH67PB/j2n7
	 WZ+4WUGPSyg2ms+fZyTdNYyEVMMrxH56yl4y85cM1Pf1laynFIxSLk8E98eGcW803+
	 8Xi/2iEdSefxQeMZ7UHyl+WDQoRmQSUGxfhvIr6xwenw3KOjMqHWuYpSvT1lPmfM8C
	 yh+eszIQIa1RvlsjVQmbnzF8wO8wwkboIgt+s2ZUp2T1vbuf6OIp/Wt2oyl3pdLIvd
	 bU7KSskfq1zZ8APqlKHzrhqfYLyqQASIjSW60+0SCocXW3/nbZtViQ9bkcGEKx3bjd
	 i+D74KgzqvHhg==
Message-ID: <sashiko-outbox-181106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] sh: dts: add Casio fx-9750GIII board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022063936.472520-2-artem122novak@gmail.com>
References: <20261022063936.472520-1-artem122novak@gmail.com>
 <20261022063936.472520-2-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:50:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] sh: dts: missing sh7305.dtsi include breaks fx9750giii.dtb build
- [Medium] sh: dts: fx9750giii uses unselectable Kconfig and missing sh7305=
.dtsi
- [Low] sh: dts: undocumented compatible strings and vendor prefix in fx975=
0giii.dts
--

commit 82402ca3074df3c76845795376be9cd0891cff1d
Author: Artem Novak <artem122novak@gmail.com>

sh: dts: add Casio fx-9750GIII board

This commit adds the device tree source file fx9750giii.dts for the Casio
fx-9750GIII graphing calculator and registers fx9750giii.dtb in
arch/sh/boot/dts/Makefile.

> diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
> index d109978a5eb9c..4887fb16dbf23 100644
> --- a/arch/sh/boot/dts/Makefile
> +++ b/arch/sh/boot/dts/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +dtb-$(CONFIG_SH_FX9750GIII) +=3D fx9750giii.dtb

[Severity: Medium]
Can CONFIG_SH_FX9750GIII ever be enabled to build fx9750giii.dtb?

In arch/sh/boot/dts/Makefile, dtb-$(CONFIG_SH_FX9750GIII) references
CONFIG_SH_FX9750GIII, which is not defined in this patch. Although the
follow-up commit ("sh: fx9750giii: add board support") adds config
SH_FX9750GIII in arch/sh/boards/Kconfig, it specifies:

    depends on CPU_SUBTYPE_SH7305

which is not defined anywhere in arch/sh/Kconfig or the kernel tree.

Because CONFIG_SH_FX9750GIII remains unselectable, fx9750giii.dtb is only
placed in $(dtb-), where scripts/Makefile.dtbs promotes it into $(dtb-y) wh=
en
CONFIG_OF_ALL_DTBS=3Dy is enabled:

    dtb-$(CONFIG_OF_ALL_DTBS) +=3D $(dtb-)

At that point, cmd_dtc in scripts/Makefile.dtbs attempts to preprocess
arch/sh/boot/dts/fx9750giii.dts and fails because sh7305.dtsi is missing.

>  obj-$(CONFIG_BUILTIN_DTB) +=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_=
NAME))
> diff --git a/arch/sh/boot/dts/fx9750giii.dts b/arch/sh/boot/dts/fx9750gii=
i.dts
> new file mode 100644
> index 0000000000000..bccae22e48994
> --- /dev/null
> +++ b/arch/sh/boot/dts/fx9750giii.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (C) 2026 Artem Novak
> +/dts-v1/;
> +
> +#include "sh7305.dtsi"

[Severity: High]
Where is sh7305.dtsi defined in the kernel tree?

The commit message states "The description uses existing SH7305 SoC include=
",
and arch/sh/boot/dts/fx9750giii.dts includes sh7305.dtsi, but no sh7305.dtsi
file exists in arch/sh/boot/dts/, scripts/dtc/include-prefixes/, or anywhere
else in the repository (nor is it added in the follow-up commit
"sh: fx9750giii: add board support"). Without it, the board device tree also
lacks the SoC definitions (cpu nodes, interrupt controller, timers, clocks,
and root #address-cells and #size-cells).

When building fx9750giii.dtb directly, setting
CONFIG_BUILTIN_DTB_NAME=3D"fx9750giii", or building under CONFIG_OF_ALL_DTB=
S=3Dy
(where scripts/Makefile.dtbs promotes $(dtb-) into $(dtb-y)), cmd_dtc in
scripts/Makefile.dtbs runs:

    $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \

Doesn't this cause a build regression when the preprocessor fails with
"sh7305.dtsi: No such file or directory"?

> +
> +/ {
> +	model =3D "Casio fx-9750GIII";
> +	compatible =3D "casio,fx-9750giii", "renesas,sh7305";

[Severity: Low]
Should the vendor prefix and compatible strings in the root node "/" of
arch/sh/boot/dts/fx9750giii.dts be documented in the device tree bindings
first?

The vendor prefix "casio" is not listed in
Documentation/devicetree/bindings/vendor-prefixes.yaml, and neither
"casio,fx-9750giii" nor "renesas,sh7305" is documented under
Documentation/devicetree/bindings/ (such as
Documentation/devicetree/bindings/soc/renesas/renesas.yaml), which causes
scripts/checkpatch.pl and dtbs_check warnings when validating fx9750giii.dt=
s.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022063936.4725=
20-1-artem122novak@gmail.com?part=3D1
