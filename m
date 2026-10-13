Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F42547071
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849860; cv=none; b=Af9iaYFWqb7NA44RGuN4j4cDomY+WeOEoDr7pmdaGFwgZbs/hvZ9S7WCcy0VHD7QvuQX2bjf4z9EpxiBXYCqN9uzs3NDhVa6G0LBwMDgmOPANjiFku5rY7OGCjYJAWjgumSQ11SHYypU/iTr/FMStsKwtGXpuz6R7dmx29ZSOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849860; c=relaxed/simple;
	bh=0/vh5jUhDxswVXY/15qA7M4Clb7XJ0N+BWKulf2vKyg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kMT1uPV/V07sdkVD5w87cECjECmxq5UmKk8Uk4kWoGCqange/9r8QoJhhd0s818cGH30qu1oGqqeiSNs6lF1kNNljFxeNXAe9kpkkPHkQCPOAMU6tuMyAN/KpCAgwVAP3q3iWqPggMVdN1WPT7czyL1RMyWwkDdGl3tOWNGFubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k438DtjG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k438DtjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8A01F0089B;
	Tue, 13 Oct 2026 00:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791849859;
	bh=gr99YweI/toVhVJJhTNTkzSg+sVRblZ32UDg7bJvB6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k438DtjGRrBdGRef1wzu3u7Z7fWoKsLXstp4oXWk6xiuMXLZntxAl8dcrAMISZq2J
	 OajxVeVOQ3oQ9b37j+7DWAw4taystqj/iuU/XQ7Mx8azrR2eDfqOZRPW5XK9qZylQB
	 sE34u5U4KuK/krIjdTtY22UUfuMaoDZQD7tKjn+eLndiFJ9RwoAF3E4HA66PVfjGt2
	 +jRRin55bbEj4qMifqGckme+XtH3sUmFYWRQoFYiDIxi3DSUpUbtyBAjqB2PPzu5fG
	 xFf4wXmX5Tml3+GNY8FBd4HFD1JoAh5pw3CFzSAThGbt1OEIfADin/E/3Iyruop6DT
	 W7eqJFilubuDQ==
Message-ID: <sashiko-outbox-168767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hung-Chun Tseng" <alan.tseng.cs@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261012235624.77993-2-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
 <20261012235624.77993-2-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 00:04:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: spacemit: k1: boot media incorrectly marked bootph-pre-ram in S=
oC dtsi
--

commit 8f0e131a27a4e9b047773ff808813b281fae2061
Author: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram

This commit marks several K1 SoC nodes with the bootph-pre-ram tag to allow
a U-Boot SPL to use the upstream device tree directly. It adds the tag to
clocks, system controllers, UART, and boot media controllers (SD, eMMC,
and QSPI).

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 3fabfd34114b2..8ca98d15a117a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi

[ ... ]

> @@ -1085,6 +1094,7 @@ qspi: spi@d420c000 {
>  				reg =3D <0x0 0xd420c000 0x0 0x1000>,
>  				      <0x0 0xb8000000 0x0 0xc00000>;
>  				reg-names =3D "QuadSPI", "QuadSPI-memory";
> +				bootph-pre-ram;

[Severity: Low]
Does adding the bootph-pre-ram tag globally to the QSPI boot media controll=
er
in the SoC dtsi prevent individual boards from excluding the QSPI driver fr=
om
their SPL if they don't use it for early boot?

When a board includes k1.dtsi and enables a peripheral like QSPI for OS-lev=
el
storage but does not use it as the early boot medium, this inherited tag
forces the QSPI driver and node into the SPL anyway.

This unnecessarily inflates the U-Boot SPL binary size and increases SRAM
memory pressure.

Standard devicetree practice mandates that boot media phase tags be defined
in per-board .dts files or -u-boot.dtsi overlays corresponding to the actual
boot interfaces wired and used by that specific board.

>  				clocks =3D <&syscon_apmu CLK_QSPI_BUS>,
>  					 <&syscon_apmu CLK_QSPI>;
>  				clock-names =3D "qspi_en", "qspi";

[ ... ]

> @@ -1328,6 +1338,7 @@ usb_dwc3: usb@c0a00000 {
>  			sdhci0: mmc@d4280000 {
>  				compatible =3D "spacemit,k1-sdhci";
>  				reg =3D <0x0 0xd4280000 0x0 0x200>;
> +				bootph-pre-ram;

[Severity: Low]
Could this global bootph-pre-ram tag force the SD card controller driver in=
to
the SPL even for boards that do not use it as their early boot medium?

>  				clocks =3D <&syscon_apmu CLK_SDH_AXI>,
>  					 <&syscon_apmu CLK_SDH0>;
>  				clock-names =3D "core", "io";
> @@ -1341,6 +1352,7 @@ sdhci0: mmc@d4280000 {
>  			emmc: mmc@d4281000 {
>  				compatible =3D "spacemit,k1-sdhci";
>  				reg =3D <0x0 0xd4281000 0x0 0x200>;
> +				bootph-pre-ram;

[Severity: Low]
Does adding this tag to the eMMC controller in the SoC dtsi cause the same
issue of forcing unnecessary drivers into the SPL for boards that boot from
other media?

>  				clocks =3D <&syscon_apmu CLK_SDH_AXI>,
>  					 <&syscon_apmu CLK_SDH2>;
>  				clock-names =3D "core", "io";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012235624.7799=
3-1-alan.tseng.cs@gmail.com?part=3D1
