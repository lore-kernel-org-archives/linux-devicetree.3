Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF83E8C6A
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466084; cv=none; b=kTr5saDj0P3M8o4jj14s3IV7ttbsrFG+xXin1YiKl+x4Ee+07PbIZhLphIaTlNmeJdcnqI4YsfuI2RfNM00BDe15Vtt1mZXi2lNrjes8Bjfef0utPRSvskGDm/7U3665EeaL2vdFewLfxE88/BDZRmDzjbkDGfVZY20MpC/DWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466084; c=relaxed/simple;
	bh=KXPu8qmHMu2rq/AFOMWtWliM/hMJMaSLGUYSlAn2jvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CQC7MqYDujUtBEShBDI5KwCZGvyjydq2dYwfrh0WPINGj//INfxX8lNhp6RoXebWIunLDhmxY88dFO193bKBJ6O/iCkyWqJQxhxqddo3XsId1G6ABASYvbjHUdNJwGY5xG2aCq/qSpUzx5mHeKCxHw4Sv/HOyODpLQsufEIp084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIsi8Ip1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIsi8Ip1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6811F000E9;
	Fri, 26 Jun 2026 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782466081;
	bh=LwKrQOAZxN4qqPf+ADmaOw9TSR8qrLOdjZmbBv3Zs8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bIsi8Ip1cZf9nIlewSCsHDopt4gCWfrwIl1UEGOcXJ5W8YUCyisoEXEhyaSakSELC
	 sq8igyJORflQYbF1qv5SUFqVY8fnIo1oJMLwk8hZd5AtoDYlu0+H+l5EnDoIkxOxaU
	 1WZyurhF1fds+KioXPEcL6SuNabTT1RFkTlZaLW1eQ/JZ1p8if9S2F3G3884HRtSqR
	 FhXZeHBbqlwzShamXRNppdCuA+AoKK+iJWs35Ceeg6S1DuFkSRd63hi6Xza1I29Y4i
	 PfGG/JO+UswPyI+W+SQWAY4vuJiPHen7m+4h3mCH16qRr168jSWp5h3ww6hdjp9NNL
	 A6l99ZXX3bUbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier
 board DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260626091349.570091-3-lijq9@lenovo.com>
References: <20260626091349.570091-1-lijq9@lenovo.com>
 <20260626091349.570091-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 09:28:00 +0000
Message-Id: <20260626092801.3A6811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing `no-1-8-v` property or 1.8V-capable `vqmmc-supply` for `mm=
c@3440000` while UHS modes are enabled in the base DTSI.
- [High] Missing `bus-width` property for the SD card slot (`mmc@3440000`).
- [Medium] Device tree schema violation for 'fixed-regulators' wrapper and =
its child node.
- [Medium] The patch fails to disable the unused SPI peripheral as claimed =
in the commit message.
- [Medium] Missing `disable-wp` property in the SD card node (`mmc@3440000`=
).
--

commit d7f4007a1b474f4e8527dff37fcaa0da82f91d42
Author: Jiqi Li <lijq9@lenovo.com>

arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

ThinkEdge SE70 is a fanless industrial edge gateway built around
NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
tree file describing core carrier board peripherals.

> No fan, PWM, tachometer, extra camera/spi peripherals are present
> on this passively cooled platform, so unused nodes are explicitly
> disabled following mainline device tree best practices.

[Severity: Medium]
Does this patch actually disable the extra SPI peripherals as claimed?

The tegra194-p3509-0000.dtsi explicitly enables the spi@3270000 node, but
there doesn't appear to be an override to disable it in this file. The
unpopulated SPI flash driver will probe on boot and waste resources.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 0000000000000..44a7ae9a05bfb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

[ ... ]

> @@ -14,6 +14,6 @@
> +	/* Fixed 3.3V regulator for external SD card slot */
> +	fixed-regulators {
> +		compatible =3D "simple-bus";
> +		ap2306gn_3v3_sd: ap2306gn-3v3-sd {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "ap2306gn-3v3-sd";

[Severity: Medium]
Does this fixed-regulators node comply with the device tree schemas?

Using simple-bus requires the #address-cells, #size-cells, and ranges
properties, which are missing here. Additionally, the ap2306gn-3v3-sd child
node does not start with the regulator- prefix as required by the
fixed-regulator.yaml schema.

This seems to contradict the commit message claim that dt_binding_check
passed without errors.

[ ... ]

> @@ -95,6 +95,6 @@
> +		/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
> +		mmc@3440000 {
> +			vmmc-supply =3D <&ap2306gn_3v3_sd>;
> +			cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
> +			status =3D "okay";
> +		};

[Severity: High]
Does this configuration need a no-1-8-v property or a 1.8V-capable
vqmmc-supply?

The tegra194.dtsi enables UHS-I modes for mmc@3440000, which require 1.8V
signaling. Since this node only defines a fixed 3.3V supply without disabli=
ng
1.8V modes, won't the MMC core try to switch the SoC pads to 1.8V signaling
while the card is powered at 3.3V? This could cause I/O failures and
hardware overstress.

[Severity: High]
Should this node specify a bus-width property?

If the bus-width property is omitted, the MMC subsystem defaults to 1-bit
mode. Since the parent sdmmc3 node in tegra194.dtsi does not specify a
bus-width, will this SD card operate in a degraded 1-bit mode, artificially
crippling read and write performance?

[Severity: Medium]
Could this node be missing a disable-wp property?

If the board leaves the internal WP pin floating and disable-wp is absent,
could the kernel randomly mount the SD card as read-only?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626091349.5700=
91-1-lijq9@lenovo.com?part=3D2
