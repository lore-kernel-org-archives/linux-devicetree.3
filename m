Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136169;
	b=uCb1T7aza2RyDcrNsv7T6SIUZae6CJHIu1Dm7QjqW2fUryJeQB+poCMGTIYmcSNcV+K0
	 5OaZaUFoEtXZKCGksZQo7Kb4FpFSwk5R8DF30RYGxyGwo/USpTAwjOm1kgqLaqByXVDfc
	 4GpIy8JlH2xySTNlcVne4wQ/bFLiIW1O3JlN8U5WGKfo80qO6Z6jc+UKyXnppPyBZG0LI
	 xICu9tQY5fypdCHLT9+J58qoZVTSx7LLVcuI4QZfYFUfMUnmqil7qvqo2vU2msoP44idP
	 hCrfuae8wKG5owFMdYqpDUuiJXE1ZPjFJRiSs4AB9tZANc74b6yQKuZsShXJxN9WKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AdlCA4oGMHLqQ6UUJuqu16U3rtYNulRJiggQDYPeuJs=;
	b=kaAQ//rGrwTilO2BTckZ5K9CotjZ/5R2aXbsZXil54R3WK6yz5nO8b8mNKXURH5TDy8v
	 FsiHDc/HYBR7oN/zLIwpcb6GrzuEo0B/9KmxCIPVaHI1ZnCOAuHlqXeMZXfqhGn2c8+aq
	 J99WxsWNGp9gtIJ3HvBbFbLXH1yqQnbszxIO2Ngo+skn3rd56mH41KpMvV5i0MwCIq4gc
	 XUhcl+YXjF3/2FugPfS1BbvafNhxUPHqUSQq0fuHDXmtFW4YorkOw1pPBONa6DDeq2rlu
	 nkQEVdyk5XI7YR/xvzXhfmbCuD4fEa4LnJSGz+1TZA3tjUIHGXSWQAlOOfJzhIDy9uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OmRsu0+m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC63606A336
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OmRsu0+m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6BB1F000C4;
	Fri, 20 Nov 2026 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795136169;
	bh=AdlCA4oGMHLqQ6UUJuqu16U3rtYNulRJiggQDYPeuJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmRsu0+mV8LEvHwjoGik6RfORDmgi7Dmd+lyK9mq56daOvv3NM4l3A4J+WjkyR/8x
	 m2KmBuNLYXY3oSruds+wJT+KOk6kN1QazzL9wWZNjKDI2Ryda8qn3//omWWZgZNvRm
	 2OxoZbnHeLldC4iQvm7L0LeELPLIOhfe+PycPC+ws8l81bH5HcEZxPqiX7TSe90hZS
	 oOmNUqGZ7/o3VXIJ5dkp5hpK678gzDtyYuCNsyd6pwDFacA5DzEWpWjlwqn6MkiSR3
	 HOFSNSfuJDOMQaAZxGgBg1nzWw4/wqq+xZVLS+wqDQP3NuSajJ6P8NCvkH9JKWS030
	 DWs5wWue2O+JQ==
Message-ID: <sashiko-outbox-224280@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Mekotronics R58X-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Pardini" <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-rk3588-mekotronics-r58x-pro-v1-3-4e70c077c7b4@pardini.net>
References: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
 <20261120-rk3588-mekotronics-r58x-pro-v1-3-4e70c077c7b4@pardini.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:56:08 +0000
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
- [High] arm64: dts: rockchip: keep usb3-phy on usb_host1_xhci to
  disable U3 port
- [Medium] arm64: dts: rockchip: pull-up on active-high bt_wake_host_irq
  pin
- [Low] arm64: dts: rockchip: missing pinctrl entry for hdmi0
  frl-enable-gpios
--

commit e79dea5ac70e03e57bbea1fad7fc98344b2d0678
Author: Ricardo Pardini <ricardo@pardini.net>

arm64: dts: rockchip: Add Mekotronics R58X-Pro

This commit adds the device tree for the Mekotronics R58X-Pro, an
industrial mini PC based on the Rockchip RK3588 SoC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mekotronics-r58x-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3588-mekotronics-r58x-pro.dts
> new file mode 100644
> index 0000000000000..af83b14dda80e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-mekotronics-r58x-pro.dts
> @@ -0,0 +1,1215 @@

[ ... ]

> +&hdmi0 {
> +	frl-enable-gpios =3D <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +};

[Severity: Low]
Should &hdmi0 also define a pinctrl entry for the frl-enable-gpios pin
(<4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>) and include it in pinctrl-0,
rather than leaving GPIO4_B1's pull configuration to bootloader defaults?

[ ... ]

> +	wireless-bluetooth {
> +		bt_reset_pin: bt-reset-pin {
> +			rockchip,pins =3D <1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_wake_host_irq: bt-wake-host-irq {
> +			rockchip,pins =3D <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		bt_wake_pin: bt-wake-pin {
> +			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};

[ ... ]

> +&uart6 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		clocks =3D <&hym8563>;
> +		clock-names =3D "lpo";
> +		device-wakeup-gpios =3D <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "host-wakeup";

[Severity: Medium]
Should bt_wake_host_irq use &pcfg_pull_down instead of &pcfg_pull_up?

With IRQ_TYPE_LEVEL_HIGH on host-wakeup, hci_bcm configures the controller
for active-high host wake (idle-low) and requests IRQF_TRIGGER_RISING.
Pulling GPIO1_B0 high holds the line in its active state when idle, which
can prevent rising-edge wakeup detection or cause spurious wakeups.

[ ... ]

> +/* USBDP PHY1 lanes are all used by the DP connector, so this is USB 2.0=
 only */
> +&usb_host1_xhci {
> +	dr_mode =3D "host";
> +	maximum-speed =3D "high-speed";
> +	phys =3D <&u2phy1_otg>;
> +	phy-names =3D "usb2-phy";
> +	status =3D "okay";
> +};
> +
> +&usb_host2_xhci {
> +	status =3D "okay";
> +};

[ ... ]

> +&usbdp_phy1 {
> +	rockchip,dp-lane-mux =3D <0 1 2 3>;
> +	status =3D "okay";
> +};

[Severity: High]
Does dropping <&usbdp_phy1 PHY_TYPE_USB3> from &usb_host1_xhci leave its
USB3 port enabled without a running PIPE clock when all four usbdp_phy1
lanes are assigned to DisplayPort?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_init() {
	...
	/* DP only or high-speed, disable U3 port */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
		rk_udphy_u3_port_disable(udphy, true);
		return 0;
	}
	...
}

On RK3588, the DWC3 controller takes its PIPE clock from the USBDP PHY by
default, and rk_udphy_u3_port_disable() writes usb3otg1_cfg in usb_grf to
disable the USB3 port and switch the PIPE clock to the UTMI fallback clock.
Because &usb_host1_xhci overrides phys and phy-names to drop "usb3-phy",
dwc3 never calls phy_init() on usbdp_phy1's USB3 PHY, so xHCI register
accesses on usb_host1_xhci can hang or trigger a fatal SError.  Keeping the
default phys and phy-names from rk3588-extra.dtsi alongside maximum-speed =
=3D
"high-speed" allows rk_udphy_usb3_phy_init() to disable the USB3 port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-rk3588-mek=
otronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net?part=3D3
