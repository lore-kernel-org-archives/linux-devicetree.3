Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446F3DD523
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013071; cv=none; b=hmZan7XKBwPX9PTo2rlTdp/CRnYaFs5SV0Cz7UKcpQi56Mwo0Ynf+Ia5mdfBkuDme60t6+Pze26jKDynUUB2j9bL/LIyzo2r5cYfjf58HUxSCdzbM4IF9yfjcBOl0iajWZEJXzNq6oSYyz3DIJbSDd7WrTmjH6a0oZj2mU6DCzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013071; c=relaxed/simple;
	bh=62jXxAW+g7Hd22t7VV3kfmBZO6Bm5fGkmgYmm0PXTRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gWb1l29KcDnLCGX8HAFJE/se7sDfSO05bYjqZZ3LqYm8imjD4shKebAr91R3Xw8tPKCA1RHWoWJ9Zyi7o/ZeU96WzdnVklOKLTa3WveJPXll1SsYa077ZM12jVd2LbcpG8AUbCIb0rqtBXw5XgAauPPwDs3kufSxRk+HEAvCmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k83+zgm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k83+zgm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA4E1F00A3A;
	Tue, 14 Jul 2026 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784013069;
	bh=h5jew8Jee1qppPV3TnB1rtWbboszvL9On4xdE+0VF8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k83+zgm0RkdFmZR+WKX1MYec6WMRNENKQsLWLB7axHF3371EvX9JCHpeVdkCCqsk4
	 7ZXsSopxrHfbnDm7lurc1Po8agPQ7WN37YcbCcmBhmGr5WZp0BbCGck90Mn4egNdGR
	 zKSaHjTquioAf4dwhv1HqjnF3mmS5H8nIJgROBl+H17ZePJRDSje34OuUGqbGAZx5v
	 MBdTSlr6XX9xix6RaLg3eV6D4NORTTLczYttyBwNKezwwb9F1GWotz/cZsuq3uk0O8
	 JQ5FO5Esu0M0yEty9/3GA9X4L+I2YQZ46cprQiKIFU4iP9beDCeUAJfpUFNxrp+3bU
	 t6wRNbviJOQOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <MN0PR19MB6091D3101FD2D8F940F0CE4DACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB6091D3101FD2D8F940F0CE4DACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:11:08 +0000
Message-Id: <20260714071109.5BA4E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree uses an undocumented and unsupported vendor proper=
ty `maxio,clk-out-frequency-hz` in the Ethernet PHY node, which will be ign=
ored by the upstream kernel, causing the GMAC reference clock to remain unc=
onfigured.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M=
 ---
commit 7ee3e6144c52507192ef8cc196563da5f89d4b8e
Author: Liu Changjie <liucj1228@outlook.com>

arm64: dts: rockchip: Add LCKFB Taishan Pi 3M

This adds the device tree for the LCKFB Taishan Pi 3M board based on the
Rockchip RK3576 SoC. It describes various hardware components including the
RK806 supplies, eMMC, SD card, Gigabit Ethernet, and others. The patch also
attempts to configure the MAE0621A PHY CLKOUT to supply the GMAC reference
clock at 125 MHz.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
> new file mode 100644
> index 0000000000000..bfddce2a94fb8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts

[ ... ]

> +&mdio0 {
> +	rgmii_phy0: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-id7b74.4412";
> +		reg =3D <0x1>;
> +		maxio,clk-out-frequency-hz =3D <125000000>;
[Severity: High]
Is this maxio,clk-out-frequency-hz property supported by an upstream PHY
driver?

It appears maxio is an unregistered vendor prefix, and this property is not
defined in upstream device tree bindings, which will cause make dtbs_check
to fail.

Since there is no upstream driver matching the 7b74.4412 ID, the PHY will
likely bind to the generic genphy driver which ignores this property.
Because the device tree specifies a hardware reset below via reset-gpios, t=
he
PHY will be reset during initialization, clearing any clock configuration
provided by the bootloader.

Will this result in the GMAC reference clock remaining unconfigured and
breaking Ethernet functionality on this board?

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&gmac0_phy_reset>;
> +		reset-assert-us =3D <20000>;
> +		reset-deassert-us =3D <100000>;
> +		reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MN0PR19MB60918292CC=
2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com?part=3D2
