Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBDC3D3D1A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165190; cv=none; b=tiouBhdIJCzON6p7g96e8T/YWZfofUVhaELvKVBSu5L9HBFllLfOJsClipXmvhoXykyO+AeJwtjdEmAOUkdI6HoIGQdgq58HqgyKUjLd+lU9dIsdtGxdFRxI0iSjGxU+p9hq861C+76KdWFwyLTxJVnWiJaS2pugzx48durQMgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165190; c=relaxed/simple;
	bh=BsYCWz1KnSstqHRa+DXvRkb+4OHa48Kbk7v8reFAxQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AZY7q5K3Jw+9XPVfD2xl/iQ1DIEvwU6zgJiVYdNEs1W2+5crucAa3xlhsdQ6T3FFKWkQF9DuoA17SCCgnN5IIq34WWP0rKC6bYZMiuXGG1SOtWeq5/I5GftLkYFlcoJIYnl/K26BQV2pQQDxvvIFV4HNfHbQkVaare32S+MVB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l66vqfTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l66vqfTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C271F00A3E;
	Mon, 31 Aug 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165188;
	bh=ximfls1J2EEtNp1Ia//dnnAeNtJTVfh5qT7+vvl6F3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l66vqfTlLv7lPRTNgrvXac2XNb7rxpA4gBcR3GB7f+l1vu7o/QI6aSBxHtHdTxOEx
	 gPMf+qMfTqF7NHkADLCNShukU4zOTdOh47xgfzmCxguNqAxeUdtrxLVSECP+0wCYt/
	 nTKZUPK19OP4Z1dQmc0fZEQ05dqap32ODhhP+Qn50dK3Mqja8xxSSr0L0oJPFavJ9p
	 H6XOgRkpUTYW76ZX1eGlPYPv05aDUrG6U8cFGHpIhTfdTsoz1/QGuEokSyQOR0tQ2P
	 D+0Pm5G/eoZTuOzzA1geBlNqq7Eo7btd9qqAm2aU3ednKgGp0xNZitaNu4+LJ8CBK0
	 LWMWo8mK13JfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260831082309.3854507-5-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-5-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:33:07 +0000
Message-Id: <20260831083308.00C271F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The parent USB wrapper nodes (`usb4`, `usb5`) and the required USB=
 PHY node (`usb3_phy4`) are left disabled in the board device tree, prevent=
ing the USB controllers from probing.
- [Low] The unit addresses for the `usb4` and `usb5` nodes do not match the=
ir first `reg` address, violating the Device Tree specification.
- [Low] The `usb-port` child nodes inside `usb3_phy4` use unit addresses bu=
t lack the required `reg` properties.
- [Low] Incorrect `reg-names` order for the `cdns,usb3` controllers violate=
s the DT schema binding.
--

commit fb5456e6e85188c30dcbeb49499209cebdd39407
Author: Hongliang Yang <hongliang.yang@cixtech.com>

arm64: dts: cix: Add USB4/USB5 nodes for Sky1
   =20
Add USB4 and USB5 controller nodes and their associated USB3 PHY nodes for
the CIX Sky1 SoC. Enable USB4 and USB5 in host mode on the Radxa Orion O6
board.

> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/=
dts/cix/sky1-orion-o6.dts
> index e39c87774c128..33d3ffdc3f9e0 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
[ ... ]
> @@ -117,3 +133,23 @@ &s5_gpio2 {
>  &uart2 {
>  	status =3D "okay";
>  };
> +
> +&usb4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usb4>;
> +};

[Severity: High]
Are the usb4 and usb5 parent nodes intentionally left disabled in the board
configuration?

The parent nodes usb4 and usb5 are marked as status =3D "disabled" in the
DTSI. Although this patch adds pin control configurations for them, it
omits status =3D "okay";. The Linux DT core will not instantiate disabled
platform devices, which would prevent their children (usbss_4, usbss_5)
from probing.

> +
> +&usbss_4 {
> +	status =3D "okay";
> +	dr_mode =3D "host";
> +};
> +
> +&usb5 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usb5>;
> +};
> +
> +&usbss_5 {
> +	status =3D "okay";
> +	dr_mode =3D "host";
> +};

[Severity: High]
Is the required PHY node (usb3_phy4) missing its enablement in this board
file?

The PHY is marked disabled by default in sky1.dtsi, but it is completely
omitted from the board file. This could cause PHY consumer requests to fail
with -ENODEV even if the controllers did probe, preventing USB4 and USB5
from functioning.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index a77c52296ebd3..44736c0715732 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
[ ... ]
> @@ -574,6 +581,132 @@ mbox_ap2sfh: mailbox@80a0000 {
>  			cix,mbox-dir =3D "tx";
>  		};
> =20
> +		usb4: usb@91c0300 {
> +			compatible =3D "cix,sky1-usbssp";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +
> +			reg =3D <0x00 0x091c0314 0x00 0x4>,

[Severity: Low]
Does the unit address @91c0300 need to be updated to match the first reg
address 0x091c0314? The DeviceTree specification mandates that the unit
address must exactly match the first address in the node's reg property,
which could trigger validation warnings.

> +				<0x00 0x091c0400 0x00 0x4>;
> +			reg-names =3D "axi_property", "controller_status";
> +
[ ... ]
> +			usbss_4: usb-controller@91d0000 {
> +				compatible =3D "cdns,usb3";
> +				reg =3D <0x00 0x91d0000 0x00 0x4000>,
> +					<0x00 0x91d4000 0x00 0x4000>,
> +					<0x00 0x91d8000 0x00 0x8000>;
> +				reg-names =3D "otg", "dev", "xhci";

[Severity: Low]
Is the order of the reg-names correct here?=20

The device tree binding for Cadence USB3 controllers requires the reg-names
property to be strictly ordered as "otg", "xhci", "dev". Do the names and
the corresponding reg tuples need to be reordered so that the "xhci" memory
region matches the required order to avoid schema validation errors?

> +
> +				interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
[ ... ]
> +		usb5: usb@91c0304 {
> +			compatible =3D "cix,sky1-usbssp";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +
> +			reg =3D <0x00 0x091c0324 0x00 0x4>,

[Severity: Low]
Similarly, does the unit address @91c0304 need to be updated to match the
first reg address 0x091c0324 to avoid validation warnings?

> +				<0x00 0x091c0410 0x00 0x4>;
> +			reg-names =3D "axi_property", "controller_status";
> +
[ ... ]
> +			usbss_5: usb-controller@91e0000 {
> +				compatible =3D "cdns,usb3";
> +				reg =3D <0x00 0x91e0000 0x00 0x4000>,
> +					<0x00 0x91e4000 0x00 0x4000>,
> +					<0x00 0x91e8000 0x00 0x8000>;
> +				reg-names =3D "otg", "dev", "xhci";

[Severity: Low]
Does the order of the reg-names and corresponding reg tuples for usbss_5
also need to be adjusted to "otg", "xhci", "dev" to match the binding
schema?

> +
> +				interrupts =3D <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>,
[ ... ]
> +		usb3_phy4: usb-phy@9210000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "cix,sky1-usb3-phy";
> +			reg =3D <0x00 0x09210000 0x00 0x40000>;
> +			status =3D "disabled";
> +
> +			resets =3D <&s5_syscon SKY1_USBPHY_SS_RST_N>,
> +				<&s5_syscon SKY1_USBPHY_SS_PST_N>;
> +			reset-names =3D "reset", "preset";
> +
> +			clocks =3D <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
> +				<&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
> +			clock-names =3D "apb_clk", "ref_clk";
> +
> +			usb3_phy4_0: usb-port@0 {
> +				#phy-cells =3D <0>;
> +				status =3D "disabled";
> +			};

[Severity: Low]
Since this node has a unit-address (@0) and the parent has
#address-cells =3D <1>;, should it include a reg =3D <0>; property?

The DeviceTree specification states that if a node has a unit-address in
its name, it must have a corresponding reg property.

> +
> +			usb3_phy4_1: usb-port@1 {
> +				#phy-cells =3D <0>;
> +				status =3D "disabled";
> +			};

[Severity: Low]
Should this node also include a reg =3D <1>; property for the unit-address =
@1?

> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082309.3854=
507-1-hongliang.yang@cixtech.com?part=3D4
