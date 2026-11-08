Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175272;
	b=RI26FIBDneVGYgdPH73Q2syJgmaBhjkgx0xzavpBVSdg/IsjBXDeJ6nhXmSkbRrnNags
	 /Yo4u1aKnEwQU5ZFV3H72Jr5hgoocuE7ct+OKenD2Dxmu4EkByAes4M6vgNC9a47Rd+US
	 1ArsvY+mfIguka2G7/RxTX6zfjCRCHgqLAYUulvUTs2Tt5BJX51g1yjJHWqyWI+5QiZEh
	 dVE6hQBodcUGhkZUk2rlc51kEsvXmHvTZRH5MB/Pwfii/mUJeweoIwFQag3neRqzhUXii
	 93qGkkgoQijETHKH9aNYvQEY3B7Sitjp2VoDZgGtznzBCigFUxerhi8zvrfxMSMfIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IUgNlICcmGVDAsSgi5OFkuFWUOgyZmzNI4YvGdkZPNI=;
	b=JBnw2Hujl6ei5b1idaovUJixMTSoKZHdvIizgQaRxR92iuHzpGP9jXcNGrC5fP1UQ8MB
	 mV+IZY4J5Vn0tWDk2Por+Z/1gTeJzf4HXuviP91oUgF1r7WKjXAwCWd3VcIKjbtBxej8K
	 b3W2DlOy1PVI+K3cht2M+ygCkX/EuDZ6Dk3pI8Fw7Mubtz/YG83tAbZsudtjtxuntAem5
	 Wfz/bo6ZYd80zRnkKlhjUNwcVg30QErPMEfpfLwpnh54OwK3zA7jzD6fa4HQFthu5s6Rr
	 Irpu5LI8HDhk+iHIEH4633sWWhv8KG1wh8ury+KeUAbpcgyrqRX/alsffx/OIVYTtFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah7R+CF9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDA606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah7R+CF9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F431F0089F;
	Sun,  8 Nov 2026 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794175272;
	bh=IUgNlICcmGVDAsSgi5OFkuFWUOgyZmzNI4YvGdkZPNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ah7R+CF9GGXNmqyvr/XtP3x5mRIpHm4rQPbkJcG9OoGg8IMrjAAfwvo2XiwrXMZYJ
	 0+xf13NlSUoCD5E3Hisv87+/NnQ2pynakJtX85f180XUEEpNqI3DBNNDxRQZOtqyqH
	 9gLfNPbZS241g6b4YVyVS/FSIm9fb6VzQLHF+9wScNfhxQgy+8SxjW5CQxGUGSvJTD
	 chXGkYvHr/c0Mh2qYJXP/Z5bjYKBCpaJATdmGsu39idCPGitENE9VYwK6LWKdtdZlg
	 1WcVWjMjTfSEqFAy45UriuiA6bL4WE19R6NDVHtxkcRoS3xoUTCjYaasl3TrRioI7I
	 wAArlgfRqt29A==
Message-ID: <sashiko-outbox-204103@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <cyan2254650260@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108215010.351256-3-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
 <20261108215010.351256-3-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 22:01:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] ARM: dts: zynq: undocumented vendor prefix alinx in root
  compatible strings
- [Low] ARM: dts: zynq: decimal unit-addresses in XADC channel@10 and
  channel@13 nodes
- [Low] ARM: dts: zynq: split root node blocks in
  zynq-alinx-ac7z020.dtsi
--

commit ad140ae8401a6613bfd0e62dbc79a92d188f222b
Author: Pufan Jin <cyan2254650260@gmail.com>

ARM: dts: zynq: Add ALINX AX7Z020B development board

This commit adds devicetree support for the ALINX AC7Z020 system on module
and the ALINX AX7Z020B development board.

Link: https://www.alinx.com/

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi b/arch/arm/=
boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
> new file mode 100644
> index 0000000000000..2da08424f1a2a
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DTS for ALINX AC7Z020 System on Module
> + *
> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
> + */
> +
> +#include "zynq-7000.dtsi"
> +
> +/ {
> +	compatible =3D "alinx,ac7z020", "xlnx,zynq-7000";

[Severity: Low]
Should the "alinx" vendor prefix used here and in zynq-alinx-ax7z020b.dts
be documented in Documentation/devicetree/bindings/vendor-prefixes.yaml?
Without an "^alinx,.*" entry there, checkpatch.pl and dtbs_check report an
undocumented vendor prefix.

> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000>;
> +	};
> +};
> +
> +&clkc {
> +	ps-clk-frequency =3D <33333333>;
> +};
> +
> +&devcfg {
> +	status =3D "okay";
> +};
> +
> +/ {
> +	pmu@f8891000 {
> +		interrupt-affinity =3D <&cpu0>, <&cpu1>;
> +	};
> +};

[Severity: Low]
This isn't a bug, but why reopen a second root node block after &clkc and
&devcfg instead of placing pmu@f8891000 inside the initial / { ... }; block
above per Documentation/devicetree/bindings/dts-coding-style.rst?

[ ... ]

> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/=
boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> new file mode 100644
> index 0000000000000..4dfef96ad376a
> --- /dev/null
> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

[ ... ]

> +&adc {
> +	xlnx,channels {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		/* AD1: XADC_AD1P/N, E17/D18 */
> +		channel@2 {
> +			reg =3D <2>;
> +		};
> +
> +		/* AD9: XADC_AD9P/N, E18/E19 */
> +		channel@10 {
> +			reg =3D <10>;
> +		};
> +
> +		/* Spare pair: XADC_AD12P/N, F19/F20 */
> +		channel@13 {
> +			reg =3D <13>;
> +		};
> +	};
> +};

[Severity: Low]
Should channel@10 and channel@13 be named channel@a and channel@d?
Unit-addresses after @ are lowercase hexadecimal without a 0x prefix, while
reg =3D <10> and reg =3D <13> are decimal (0xa and 0xd).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108215010.3512=
56-1-cyan2254650260@gmail.com?part=3D2
