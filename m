Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EC2F260C
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057515; cv=none; b=AiaYT5GnN16TJzrIhYXcEAuzqX8iYBQp6qdufXsubs+JVgbtEDcWzjyw3p2jA1dX4/6QpgEO+mWhMPbU7Ld7Dqd+MDgDVvZ9vEd5cRcL4AYmzpQrobrCriSczH50hDDFiBarmwCh7BiIerQBoICTp5Omwr1qmyedlMuoo5rmor4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057515; c=relaxed/simple;
	bh=Ep40Hvjd3Pio2IzHKfwp4+EwLPVSkIi9YK5ERyVginM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PriyDgLXMsIobxIQVruZEL8GhYOm4xmO36kSA8lg5dyNkbNwEbMimnu1aEZBcnk1g7ytjYX38MylTcpA2m7zOQbljtKsKifNP66TMfbdG2r+15CptpkfCTPd8ehmLJa50eBsCWad3gbrVt0avOYu02hj4wPsIlRxTgDvyM9d02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU0Qs3TQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU0Qs3TQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DB71F0089B;
	Sat,  3 Oct 2026 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791057514;
	bh=qdNNMcshR+rj05d0WQOS52KEpe/eAQwJWSnj6cqQ4Tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PU0Qs3TQklxdCIVcOaXYmI2hFMnWX0mIcn6HWouXfN/yCSk4ujCXvF8gY4oMkYOyF
	 MuCU6pxRTOd6QmamU019SUwgD/OAuZdpB8LaYQRhp1Da94dVNDQkDIXU2Rur+sdoKh
	 jgZjrY3GPrPBEeDytN1DWQ+5omSntcDEcCu5CXzMhq0dkH9g2gE99TgT4aiJYbwUkz
	 aJCwbrwXohulwhe+y6nP3RiqGhon32zXGRcKsEPA1IJTXcu8o/fRsO2O2ef5ctBhGv
	 dtCNnCI+jFTfJ1sczz790xEEC+8WAwthnOVTTRF9P5sFvfBvbbBTGhihEYCNa6Wvy3
	 hg2j4zcMvZnbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <2254650260@qq.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 19:58:33 +0000
Message-Id: <20261003195834.14DB71F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt: zynqmp: peripherals fail to probe due to missing LPD_LSBUS clo=
ck override
- [Medium] dt: zynqmp: missing non-removable and bus-width properties for e=
MMC
--

commit cf011196c14a8a65736d50052e13ac3e134bc620
Author: Pufan Jin <2254650260@qq.com>
Subject: arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board

This commit adds the device tree for the EBDEE EdgeBoard FZ3A carrier
board built around the MYIR MYS-CZU3EG SoM. It enables various board
peripherals including Ethernet, I2C, eMMC, PCIe, USB, DisplayPort,
and UARTs.

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts b=
/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts
[ ... ]
> +	/*
> +	 * The PM firmware on this ZU3EG does not report the LPD_LSBUS
> +	 * clock id as valid, so <&zynqmp_clk LPD_LSBUS> resolves to no
> +	 * clock at all and drivers that require their bus clock fail to
> +	 * probe.
> +	 */
> +	lpd_lsbus: clock-lpd-lsbus {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <100000000>;
> +	};
[ ... ]
> +&gem3 {
> +	clocks =3D <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
> +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
> +		 <&zynqmp_clk GEM_TSU>;
> +	phy-mode =3D "rgmii-id";
> +	status =3D "okay";
> +};
[ ... ]
> +&sdhci0 {
> +	no-1-8-v;
> +	status =3D "okay";
> +};

[Severity: High]
Since the PM firmware's LPD_LSBUS clock is broken as noted above, will sdhc=
i0
fail to probe without a clock override? The base device tree maps LPD_LSBUS=
 to
sdhci0, so it seems it will inherit the broken clock if not explicitly
overridden here like it was for gem3.

[Severity: Medium]
The commit message states this board has an 8GB eMMC. Should this node
include the non-removable and bus-width =3D <8>; properties? Without them,
does the MMC core treat this as a removable SD card and run at a degraded
1-bit or 4-bit bus width?

[ ... ]
> +&uart0 {
> +	status =3D "okay";
> +};

[Severity: High]
Will this console UART also fail to probe without the lpd_lsbus clock
workaround? If it inherits the broken LPD_LSBUS clock from the base device
tree, does that result in no console output on boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_E21E2A584AF=
8EE0505C2C0809838621C8209@qq.com?part=3D3
