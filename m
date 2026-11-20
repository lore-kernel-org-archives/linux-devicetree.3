Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172508;
	b=dIQ8lIZrqDm2lOYpEWYf6Y5zfvTqfKEBoa/7Rv+aP6n21uikAD2CB3MY+995H9XYoPFp
	 cvfX5hZz48hQQEpCN7LQ+o9y4a0CwTYzYOPuW1AN8xEPU3zggoT9jQMOcxWIa50+6/HpP
	 JoCSRnxW1yVAmXSd555lthYsl3dB660p0U1I02SjG2Juwbgi5dkV9e5pA489ZMxzaVzBE
	 lAa5nX+acccTJJOlkVpqW9GbWzPwUwRoLadkyWMa0Cab8kCuJNNnzlYF9rxgDy7QfBvui
	 JwzLY1tYDx4VgTejeykuwsDurxsx1X9TyA4ckZa+B5Hp8q6eYMkz2TPKiJxeEM+ZSFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dcyX3szpWcABFLM+8vnZLL0yce9Jt7RpQ7F1Fp/4XUI=;
	b=mUlVQ78Rd72aD50tci5JmU4/62zZJy2zj+C4FjHDARaSOFDi7A/+bpBasbshYkRfueX/
	 05tmjEvwIkFbRvaEiMNhbLfUx0RsaignhD311NzpyrZtBMHQG5t7xceTlu43KAtfYWvNX
	 nndl8X9qt2ZnqUlX92fHws6GiO70nn8Gr2UwhApeMnJc+BEhlnpQTaulPvpmcOWKYqLoA
	 XU4uqV+Xk+xjERpsl/YjbWIDJknr6abuGo+N9CmcxU2vszsyKR+tlH/UsFa+ICqOwqgHF
	 xzrYO3KDRTTeum0/rtBTh0fH3yKcsnze7fmcuHeSam7JikzF3wKcLtHDAxTMZgo7MuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4CeHH3C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440A606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4CeHH3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60A31F000CA;
	Fri, 20 Nov 2026 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795172508;
	bh=dcyX3szpWcABFLM+8vnZLL0yce9Jt7RpQ7F1Fp/4XUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4CeHH3CO0Zg7FoiQaIKLJmt/BPjAB5psDinrcQA0gOtlg54C+8A/I8+39Neu9X25
	 3aOYSp5fEf1qedVa+9iN57MvQPkoL5cJhXn5iWG/l63804gCxyAW1YiuWlW5HWtg5D
	 v+TTO8ozQhc13gNGMLvUpgbPisGXGXk74Db16yvhTTs/qc/oE61zwwGRztRYy8mNQM
	 CuXD3q8/wNWOQ5ManweWjludj6Rt9jV2Sc/UhHRNN/4aHTzflRaQqShoCUXUaFCVU0
	 6DCD7ec+rK8UOE1uS39drpK8g31g2aUGsWkdw2hhyiDqbRxhg37JHS+itlQ2Ae4Qxb
	 5PRG60xWtdHuQ==
Message-ID: <sashiko-outbox-224978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet
 PHY reset to datasheet timing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-rk3576-phys-v1-6-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-6-6382cd14e3dc@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:01:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: rockchip: RTL8211F reset-deassert-us below 72ms
  minimum
--

commit 0900c61dff0b0908a212846ea06a953d5d033faf
Author: Alexey Charkov <alchark@flipper.net>

arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet tim=
ing

This commit reduces reset-assert-us and reset-deassert-us for the two
RTL8211F Ethernet PHYs on the FriendlyElec NanoPi M5 from 20ms/100ms to
10ms/30ms.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm=
64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> index 638e00b6e1658..3444198b6cf66 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> @@ -809,8 +809,8 @@ rgmii_phy0: ethernet-phy@1 {
>  		interrupts =3D <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&gmac0_int>, <&gmac0_rst>;
> -		reset-assert-us =3D <20000>;
> -		reset-deassert-us =3D <100000>;
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <30000>;
>  		reset-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
>  		realtek,aldps-enable;
>  	};
> @@ -824,8 +824,8 @@ rgmii_phy1: ethernet-phy@1 {
>  		interrupts =3D <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&gmac1_int>, <&gmac1_rst>;
> -		reset-assert-us =3D <20000>;
> -		reset-deassert-us =3D <100000>;
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <30000>;
>  		reset-gpios =3D <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
>  		realtek,aldps-enable;
>  	};

[Severity: High]
Is 30000 us for reset-deassert-us on rgmii_phy0 and rgmii_phy1 below the
minimum post-reset settling time required by newer revisions of the
RTL8211F datasheet?

Revision 1.9 of the RTL8211F datasheet increased the post-reset wait after
PHYRSTB deassertion from 30 ms to at least 72 ms for internal circuit
settling before accessing PHY registers.  Because phy_init_hw() accesses
MDIO registers immediately after waiting reset-deassert-us in
phy_device_reset(phydev, 0), a 30 ms delay can cause PHY initialization or
stmmac_hw_setup() DMA reset failures during probe or ip link down/up
cycles, as seen in 1c7412530d5d ("arm64: dts: meson: g12b: odroid-n2: fix
PHY deassert timing requirements").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-rk3576-phy=
s-v1-0-6382cd14e3dc@flipper.net?part=3D6
