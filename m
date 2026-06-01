Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787833C13E9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325359; cv=none; b=iwYXAyzQuxSBY6gRSRpEXgC9pdbUeQaz1cdYYhIbFu4Q0X99bT4cTyHWoV7P+etaea5zSf/Wp52pewrWRh4p1bgzE+h/qwASyrhExhmq0oMDrMRiMVDCeYfUVz7ZSC4VhzvxyfXCUBOxcKYQ0raypF/WmWFHFzCnYX5/4y8o3do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325359; c=relaxed/simple;
	bh=W02wGjPKNVjJpsmQtopt+ea2aaY8rMb4gI74zvi/8mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myZlfVzx2XSjhj+auAVyJpWUEUXUNDqXpnem+kKxzqJzrIKmAIZwrxoHEC2b6A4LfGUl+j+oZXCOUzMvZ7+1AGF7OjfvGHPKBH5Ud3p3d+D7Nm/z12w5v4mNKBq3DmbMvfNcrI00f5Azf1ucGQVafK1IKLHSMNF1NQORqSj5N2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9vS07fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9vS07fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACAF1F00893;
	Mon,  1 Jun 2026 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780325358;
	bh=9a6wP+QG3KEw+tP/SJtstjOS6nC870MnoPw94948lEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G9vS07fkIes1tWBe/QqUyGOff1b8t66N25wOAt877h0jN7wl2F29b9k/ruBrvc6re
	 LecEPlzoQWgRu2qElkDqPY1Vz0Fy65mYs842Yc/IAJxAoa8p9dVqoct+Or88oA2O9s
	 vC2PjC/hpV0sZUXhCUAwAuujNYnIswmzQt75FN1Rwg8Ce10qCgME7TacQKSi2rZHU7
	 LLe6vMS873GEAVJP7SWJ2Y3RH0ClUMA6+WRBw4Zs9oil+9hG+ObNkaFWelwJpy3SRd
	 /MJZcwOJpWd2FxbW+K+Rgc7osBLcaLMDrx1cLhpBe8EEx2yjWmjPc7fPkpNHrxDDVS
	 6tsryEY78/0HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add Vicharak Axon board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601143022.153941-4-hrushirajg23@gmail.com>
References: <20260601143022.153941-4-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 14:49:17 +0000
Message-Id: <20260601144917.DACAF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware conflict: both `pcie2x1l0` and `sata0` are enabled, but t=
hey share the same single-lane PHY (`combphy0_ps`).
- [Medium] The SDIO node lacks UHS capability properties, limiting the Wi-F=
i interface to 50MHz.
- [Medium] Incomplete configuration: USB PHYs and `combphy2` are enabled bu=
t their respective controllers are disabled.
- [Low] Undocumented Wi-Fi interface configuration.
--

commit 395e8a5adb0ca626a634aafea8c647363459acf1
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: add Vicharak Axon board

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

> The board supports:
>=20
> - eMMC storage
> - microSD card
> - Gigabit Ethernet
> - HDMI output (dual HDMI)
> - HDMI input
> - USB 2.0 host ports
> - PCIe 2.0 slots
> - PCIe 3.0 x4 slot
> - SATA
> - RTC
> - Status LEDs

[Severity: Low]
The commit message lists the board's supported features but omits Wi-Fi.

However, the device tree includes an &sdio node configured for a Wi-Fi modu=
le,
along with an sdio_pwrseq.

Could the commit message be updated to include Wi-Fi, or is the Wi-Fi
configuration leftover code from a reference design?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> new file mode 100644
> index 0000000000000..9d1e61e1857ae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> @@ -0,0 +1,1036 @@
[ ... ]
> +&combphy2_psu {
> +	status =3D "okay";
> +};

[Severity: Medium]
Are the controllers for this PHY supposed to be enabled as well?

combphy2_psu is explicitly enabled here, but all of its potential consumers
(pcie2x1l2, sata2, usb_host2_xhci) appear to be disabled.

Does this leave the PHY initialized but orphaned, potentially wasting power?

[ ... ]
> +&sdio {
> +	max-frequency =3D <150000000>;
> +	no-sd;
> +	no-mmc;
> +	bus-width =3D <4>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;

[Severity: Medium]
Does this node need UHS capability properties to achieve the requested 150M=
Hz?

Without properties like sd-uhs-sdr104, the Linux MMC core might assume the
host does not support SDR104/UHS speeds and artificially cap the interface =
to
High-Speed mode (50MHz).

Could this severely throttle the Wi-Fi bandwidth?

[ ... ]
> +&pcie2x1l0 {
> +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_rst>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie20_sata30>;
> +	status =3D "okay";
> +};

[ ... ]
> +&sata0 {
> +	status =3D "okay";
> +};

[Severity: High]
Will enabling both pcie2x1l0 and sata0 create a hardware conflict?

In rk3588-base.dtsi, both pcie2x1l0 and sata-port@0 (in sata0) are hardcoded
to use combphy0_ps. combphy0_ps is a single-lane PHY that can only operate =
in
one mode at a time.

If both controllers are enabled without reassigning the PHY for either, will
one interface fail to link or corrupt the PHY configuration of the other?

[ ... ]
> +&u2phy0 {
> +	status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +	status =3D "okay";
> +};

[Severity: Medium]
Are the USB host controllers for these PHYs intended to be enabled?

u2phy0 and u2phy0_otg (along with u2phy1) are enabled, but their consumers
like usb_host0_xhci remain disabled.

Could this result in non-functional USB ports and wasted power?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601143022.1539=
41-1-hrushirajg23@gmail.com?part=3D3
