Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608866;
	b=S6AqKhHWs6xENyqP8dlyYSYYHxvZxZog77qahhpPVJDtKBkMMLqNC+FmK0oS/Gpm8J5f
	 TVr5dahIWn0PksfixqIVqQt/R9T4xIr5vSkmoKcteKTIM/VkknTzxOptHkO/rVX4gJmXh
	 pYpvkfj9u7pQf7ST6GLa+psYl7JLUXLtWIXWZVmow577frLuSXYym3Rsx0GgJLwsjpern
	 fEvx+I33hLPkMjeX8kngZZNIwG+kpuhFvQrhbwrBx7RRsIwhPqL79+HX4jSaUTJjw7SZZ
	 C5jfNBGJhpj0D1QEoqyWC2EYxllA12Rzs/EPM4dwBNoKO92hxfxuZ/xdS8P9YD6Odig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608866;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8xk9NE7yU6h/BG4sLZsv3lVUn6Wzx/1vjie+frptZo4=;
	b=X+ixO7YeuGjb1FInKPt5fibGB81qw5MMyPYISQemex/1+wT7V22ppIcA2kk04VzPPY47
	 6Tgu9hUn1wnv+lhcTFO+zhf/nQkF4Hjvo7I5PsbvtlSgv/nOdYxEUtYFOHtUYJB7jt0oz
	 TNRNB6JxX779l2z2dmRZpyqTWB8XX7mK/jPLTUMmhze34W07dlD6H6r40AOZfcQ/SJ+VA
	 2vh1pBqa2BpS37yayvc4fZ5E9webWj36AqpBtFu9iBiGbLfB0Kmv5oOvqQMeGN4P42/KX
	 fAnCKRUB3bpUhidOetyTFXbzpIaCLhpwr+o5KG+5PFJJ7SzL9Jw1OFxBFJtIpTZPdxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhrOOeK0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3F606A330
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhrOOeK0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7B31F000C1;
	Mon,  2 Nov 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608865;
	bh=8xk9NE7yU6h/BG4sLZsv3lVUn6Wzx/1vjie+frptZo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EhrOOeK0W0TMTiG3585u8HuMXygjFqSdzPEqCXRsagC17YlZq9Qf2w0cTM56D8ojh
	 cr/QqTNiCxvbUcXiQyG1Z2U0b+0pxYU/ABNZFSjy1pBXS/NSDpGm1zjahL5UPYCbUn
	 Bo5qZuYiZK0Gywe51OShMkWvwnpJ7z/J4XwnLFM0/Vk3vVU5VQEnTLMMtxr6cGHUpV
	 rQ2ZhNT00R202I3RzloYmIFjDOPDULSuUpGnHgY8fxTvF0JF5dsx86t8OJxV6Tvw0f
	 F8ptpp4lfCDi4t1jhs6tsgGA1qTdIJY0FE1xovqg+XdJXYmrPhDv0yxdjcPLGzydDe
	 XhcRbv6bbkuQw==
Message-ID: <sashiko-outbox-193129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: cix: add Sky1 USB/DP combo PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102081532.2305142-4-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
 <20261102081532.2305142-4-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:41:04 +0000
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
- [High] arm64: dts: cix: enabling usbc_phy0..3 asserts PHY resets at boot
- [High] phy: cix: broken mode transitions, clock leak, and phy_ops in cix_=
udphy
- [Medium] arm64: dts: cix: missing OF graph ports for usbc_phy Type-C swit=
ches
--

commit d16228024f6482f816de21fc474d6f5027baff41
Author: Gary Yang <gary.yang@cixtech.com>

arm64: dts: cix: add Sky1 USB/DP combo PHY

This commit adds the four USB/DP combo PHY device tree nodes to the CIX Sky1
SoC dtsi and enables them with Type-C orientation-switch and mode-switch
properties on the Radxa Orion O6 board.

> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/=
dts/cix/sky1-orion-o6.dts
> index e39c87774c128..76f75185b6a8e 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -117,3 +117,31 @@ &s5_gpio2 {
>  &uart2 {
>  	status =3D "okay";
>  };
> +
> +&usbc_phy0 {
> +	orientation-switch;
> +	mode-switch;

[Severity: Medium]
How are Type-C connector nodes expected to link to the orientation-switch
and mode-switch registered by usbc_phy0 through usbc_phy3?

In drivers/phy/cix/phy-cix-usbdp.c, cix_udphy_probe() checks for these
boolean properties and registers a Type-C switch and mux on the PHY device
fwnode via udphy_setup_orien_switch() and udphy_setup_typec_mux():

drivers/phy/cix/phy-cix-usbdp.c:cix_udphy_probe() {
	...
	if (device_property_present(dev, "orientation-switch")) {
		ret =3D udphy_setup_orien_switch(udphy);
		...
	}

	if (device_property_present(dev, "mode-switch")) {
		ret =3D udphy_setup_typec_mux(udphy);
		...
	}
}

When a Type-C connector driver looks up its switch or mux through
fwnode_typec_switch_get() or fwnode_typec_mux_get(),
fwnode_connection_find_matches() -> fwnode_graph_devcon_matches() resolves
boolean orientation-switch and mode-switch providers by walking OF graph
endpoints (port or ports with remote-endpoint) from the connector node to
the provider node.

However, neither sky1.dtsi nor sky1-orion-o6.dts defines any port or ports
nodes on usbc_phy0..3, and
Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml sets
additionalProperties: false while only allowing usb-port@[0-9a-f]+ and
dp-port@[0-9a-f]+ child nodes:

  patternProperties:
    "^usb-port@[0-9a-f]+$":
      ...
    "^dp-port@[0-9a-f]+$":
      ...
  additionalProperties: false

Without OF graph port definitions in the binding and device tree nodes,
won't any usb-c-connector node be unable to bind to these switches or fail
DT schema validation?

> +	cix,default-conf =3D /bits/ 8 <0x03>;
> +	status =3D "okay";
> +};

[Severity: High]
Does enabling usbc_phy0 through usbc_phy3 here before any USB or DisplayPort
consumer nodes are present in the device tree break bootloader-initialized
USB or DisplayPort connections at boot?

Neither arch/arm64/boot/dts/cix/sky1.dtsi nor
arch/arm64/boot/dts/cix/sky1-orion-o6.dts currently has any consumer nodes
referencing usb3_phy0..3 or usbc0..3_dp_phy. When cix_udphy_probe() runs for
each enabled PHY node, it unconditionally asserts both the core and APB
resets and sets cur_mode to UDPHY_MODE_NONE:

drivers/phy/cix/phy-cix-usbdp.c:cix_udphy_probe() {
	...
	reset_control_assert(udphy->reset);
	reset_control_assert(udphy->preset);
	...
	udphy_set_default_mode(udphy);
}

drivers/phy/cix/phy-cix-usbdp.c:udphy_set_default_mode() {
	udphy->cur_mode =3D UDPHY_MODE_NONE;
}

Although commit ba3650ed160e ("phy: cix: add USB/DP combo PHY driver for
Sky1") states that the bootloader may hand over the port already initialize=
d,
asserting reset and preset in cix_udphy_probe() while no consumers exist to
power the PHYs back on leaves all four PHYs permanently held in reset after
probe. Wouldn't this tear down any active bootloader-initialized DisplayPort
(such as an EFI framebuffer output) or USB link on Radxa Orion O6?

[ ... ]

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index 0a820f45feb96..672aade42d6f8 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -606,6 +606,102 @@ mbox_ap2sfh: mailbox@80a0000 {
>  			cix,mbox-dir =3D "tx";
>  		};
> =20
> +		usbc_phy0: usb-phy@9030000 {
> +			compatible =3D "cix,sky1-usbdp-phy";
> +			reg =3D <0x00 0x9030000 0x00 0x40000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			clocks =3D <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
> +			resets =3D <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
> +				 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
> +			reset-names =3D "core", "apb";
> +			cix,usbphy-syscon =3D <&s5_syscon 0>;
> +
> +			status =3D "disabled";
> +
> +			usb3_phy0: usb-port@0 {
> +				reg =3D <0x0>;
> +				#phy-cells =3D <0>;
> +			};
> +
> +			usbc0_dp_phy: dp-port@1 {
> +				reg =3D <0x1>;
> +				#phy-cells =3D <0>;
> +			};
> +		};

[Severity: High]
When these PHY nodes are enabled on Radxa Orion O6, can the cix,sky1-usbdp-=
phy
driver handle USB3 PHY initialization and Type-C mode transitions without
skipping lane reconfiguration or leaking udphy->apb_clk enable references?

First, in drivers/phy/cix/phy-cix-usbdp.c, cix_usbdp_phy_power_on() checks
udphy->cur_mode against udphy->next_mode:

drivers/phy/cix/phy-cix-usbdp.c:cix_usbdp_phy_power_on() {
	if (udphy->cur_mode =3D=3D udphy->next_mode)
		return 0;

	if ((udphy->cur_mode =3D=3D UDPHY_MODE_USB || udphy->cur_mode =3D=3D UDPHY=
_MODE_DP) &&
	    udphy->next_mode =3D=3D UDPHY_MODE_DP_USB)
		return 0;

	if (phy_cfgs->udphy_init) {
		ret =3D phy_cfgs->udphy_init(udphy);
		...
	}
}

If the PHY is brought up in 4-lane DP-only mode (udphy->cur_mode =3D=3D
UDPHY_MODE_DP, which programs sky1_udphy_dp_conf in sky1_udphy_init()) and
usbdp_typec_mux_set() later switches udphy->next_mode to UDPHY_MODE_DP_USB,=
 a
subsequent call to cix_u3phy_init() -> cix_usbdp_phy_power_on() hits the ea=
rly
return above and skips sky1_udphy_init(). Doesn't that leave the hardware in
4-lane DP-only configuration with USB3 non-functional?

Second, if USB is active (udphy->cur_mode =3D=3D UDPHY_MODE_USB, with
udphy->apb_clk already enabled by sky1_udphy_init()) and udphy->next_mode
changes to UDPHY_MODE_DP, udphy_dp_phy_power_on() calls
cix_usbdp_phy_power_on() -> sky1_udphy_init(), which calls
sky1_udphy_clk_enable() -> clk_prepare_enable(udphy->apb_clk) a second time
without a preceding disable, and then overwrites udphy->cur_mode:

drivers/phy/cix/phy-cix-usbdp.c:udphy_dp_phy_power_on() {
	...
	ret =3D cix_usbdp_phy_power_on(udphy);
	if (ret)
		goto unlock;

	phy_set_bus_width(phy, udphy_dplane_get(udphy));
	if (udphy->next_mode =3D=3D UDPHY_MODE_DP)
		udphy->cur_mode =3D UDPHY_MODE_DP;
	else
		udphy->cur_mode |=3D UDPHY_MODE_DP;
}

Because overwriting udphy->cur_mode clears the UDPHY_MODE_USB bit,
cix_u3phy_exit() becomes a no-op and cix_usbdp_phy_power_off() ->
sky1_udphy_exit() only calls clk_disable_unprepare(udphy->apb_clk) once. Do=
es
this leak a prepare/enable reference on udphy->apb_clk?

Third, cix_u3phy_ops only wires up .set_mode and .exit, omitting .init and
.power_on:

drivers/phy/cix/phy-cix-usbdp.c:cix_u3phy_ops {
	.set_mode       =3D cix_u3phy_set_mode,
	.exit		=3D cix_u3phy_exit,
	.owner		=3D THIS_MODULE,
};

Won't standard USB controller drivers that call phy_init() and phy_power_on=
()
before accessing controller registers or before calling phy_set_mode()
operate while usb3_phy0..3 are still held in reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102081532.2305=
142-1-gary.yang@cixtech.com?part=3D3
