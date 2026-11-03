Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720917;
	b=Dy3F+K36/Ni95glI5JQ9aOPAWI2+RUEMXhzhtMuKJGzcdURRCZelCXXx1i/i13EFWBb+
	 QJ5cbjLkcUSzwL4A0oFBI9WwCHzP87+FRVcJ8RyJ7WxlnAmOMn6gjqondpUG7g1XeoDvS
	 DlTKULUBzQD7PBfZ11sxRzgp/dasqptgCgVsdG3nFGK49NzpPmFPwJ9iBUA8013pCtkgW
	 2CXHSH4AfjsGdOqQlhFG2EXRiKge+CpR8vNkJ7Abeg56WJbBHoKBsTvg/VQrRR24Y3hRt
	 Um4iAYNmAUS/acuyl2N8myMD7Jd3/a1uaQZEchTBjyLIZUj76q5g5dQ9FxxI7hdKI1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=16TD21nVXLKChoZGvpOMQMxisElxHxptgWliIDevbsY=;
	b=OrE1ThtoXZD+ZfI/9/1cy+PgkappGVugrnlIUBLpLXoKWYChIyd9is2YSLw05hDCuHyl
	 GWkC76eW0WLjyTEOgT/faZaGg9Y+XmIz7fbvVubvuA05drO/7G/dBlFI3Li9lAUNeyOdn
	 fDbddmfuKKuudZ8yaZZT+qMrb8SgIhQ/XlNpl7lcg1Qy0T7DOSCZrRLjyrMz3rWZilXDR
	 vWhDjxqiO4JgnZFBBCpirZvaUs/bQ+6Ig+izfgFT0PAdDmcFJTLePH5eFTxureRwWcnaM
	 +qBtjhb4yZnMbdT18WdTlV1O/FT4W6gFccCNok4tYYsf70Ts/cbmfqjpKroD898Z9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLGrJt2P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F1606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SLGrJt2P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2451F000C1;
	Tue,  3 Nov 2026 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720916;
	bh=16TD21nVXLKChoZGvpOMQMxisElxHxptgWliIDevbsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SLGrJt2PzpQQAfpJedeNY+WxRGCl9pRJ52aZLcmTr4lB+8r3i0jVt6rcO1eKdTWs/
	 frjv5IkobzP9V6gCFK5Hf1NvLRVMkNyqLIIfXQdstzuT+tnMYoFUbyUTyw25f9Y9kU
	 NGtGn3iakU+QlmRA9Nmnhx8XCSZ7tYL51ccd0scWiTGevRP/KaTWQuainTQKqm0JIp
	 fCdj9hIBZ7Dn0ejwgwSbTXBZYWf3Gpw+WfWCQU5lKeBe2e/YgGFW5D7akC3O+W/8Oy
	 q3u2eB4bjpF9kBQFdf2tbSgWBbJWVkqoUmWHBH8+tIOD6dqOjkNdk/CMd4hDr0reXM
	 HLOLVub1pZ4aQ==
Message-ID: <sashiko-outbox-195654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-quarkpi-ca2-v14-2-290990440b67@163.com>
References: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
 <20261103-quarkpi-ca2-v14-2-290990440b67@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:48:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] arm64: dts: rockchip: broken USB-C and USBDP PHY graph in quarkp=
i-ca2
- [Medium] arm64: dts: rockchip: gmac1 snps,reset-gpio wipes YT8531 clock o=
n resume
- [Low] arm64: dts: rockchip: duplicate headphone DAPM routes in quarkpi-ca2
- [Low] arm64: dts: rockchip: unused regulators and redundant DT properties
--

commit df968b833dae8e9d1c2068c44391cf022074881d
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..d11b14f23675c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> @@ -0,0 +1,1210 @@

[ ... ]

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det>;
> +		simple-audio-card,name =3D "QuarkPi-CA2 ES8388";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&sound_cpu>;
> +		simple-audio-card,frame-master =3D <&sound_cpu>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,aux-devs =3D <&hp_amp>;
> +		simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,pin-switches =3D "Headphones", "Headset Mic";
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",
> +			"RINPUT1", "Headset Mic";

[Severity: Low]
In analog_sound, LOUT1 and ROUT1 are routed into the hp_amp simple-audio-am=
plifier
via Headphone Power INL and Headphone Power INR, with Headphone Power OUTL =
and
Headphone Power OUTR feeding Headphones.

Should the direct "Headphones", "LOUT1" and "Headphones", "ROUT1" entries be
dropped so that the DAPM graph does not also define an unamplified bypass p=
ath
around the headphone amplifier?

[ ... ]

> +	combophy_avdd0v85: regulator-combophy-avdd0v85 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "combophy_avdd0v85";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <850000>;
> +		regulator-max-microvolt =3D <850000>;
> +		vin-supply =3D <&vdd_0v85_s0>;
> +	};
> +
> +	combophy_avdd1v8: regulator-combophy-avdd1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "combophy_avdd1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&avcc_1v8_s0>;
> +	};

[ ... ]

> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	clock_in_out =3D "input";
> +
> +	snps,reset-gpio =3D <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us =3D <0 20000 100000>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &gmac1_clkinout>;
> +
> +	phy-handle =3D <&rgmii_phy1>;
> +	status =3D "okay";
> +};

[ ... ]

> +		usb_con: connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +			try-power-role =3D "sink";
> +			source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos =3D <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt =3D <1000000>;
> +
> +			altmodes {
> +				displayport {
> +					svid =3D /bits/ 16 <0xff01>;
> +					vdo =3D <0xffffffff>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_orientation_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					usbc0_role_sw: endpoint {
> +						remote-endpoint =3D <&dwc3_0_role_switch>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					dp_altmode_mux: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_dp_altmode_mux>;
> +					};
> +				};
> +			};
> +		};

[ ... ]

> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0x1>;
> +
> +		motorcomm,clk-out-frequency-hz =3D <125000000>;
> +		motorcomm,keep-pll-enabled;
> +	};
> +};

[Severity: Medium]
Does placing snps,reset-gpio on gmac1 break Ethernet across system suspend =
and
resume?

Here gmac1 sets clock_in_out =3D "input", so the MAC relies on the 125 MHz
reference clock output from the YT8531 PHY configured via
motorcomm,clk-out-frequency-hz =3D <125000000> on rgmii_phy1.

In drivers/net/phy/motorcomm.c, yt8531_probe() programs
motorcomm,clk-out-frequency-hz into YTPHY_SYNCE_CFG_REG only once when the =
PHY
is registered:

drivers/net/phy/motorcomm.c:yt8531_probe() {
	...
	if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz", &freq))
		freq =3D YTPHY_DTS_OUTPUT_CLK_DIS;
	...
	return ytphy_modify_ext_with_lock(phydev, YTPHY_SYNCE_CFG_REG, mask,
					  val);
}

When snps,reset-gpio is placed on the gmac1 node (which is also deprecated =
in
Documentation/devicetree/bindings/net/snps,dwmac.yaml and missing a pinctrl
entry for gpio0 RK_PD5), stmmac_resume() calls stmmac_mdio_reset() when
resuming without Wake-on-LAN:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_resume() {
	...
	if (!device_may_wakeup(priv->device) || !priv->wolopts) {
		...
		/* reset the phy so that it's ready */
		if (priv->mii)
			stmmac_mdio_reset(priv->mii);
	}
	...
}

stmmac_mdio_reset() pulses the snps,reset-gpio line and hardware-resets the
YT8531 PHY. Because stmmac sets mac_managed_pm =3D true, mdio_bus_phy_resum=
e()
skips phy_init_hw(), and neither yt8531_probe() nor yt8531_config_init() ru=
ns
after that reset. Doesn't that revert YTPHY_SYNCE_CFG_REG to its 25 MHz res=
et
default (stopping the 125 MHz reference clock needed by stmmac_hw_setup()) =
and
lose the RGMII delay configuration?

Note that moving reset-gpios into rgmii_phy1 while keeping
compatible =3D "ethernet-phy-ieee802.3-c22" would also cause issues because
fwnode_mdiobus_register_phy() calls get_phy_device() before per-PHY
reset-gpios is deasserted, and phy_detach_internal() asserts per-PHY
reset-gpios on interface down. Would describing the reset on the mdio1 bus
node (reset-gpios, reset-delay-us, reset-post-delay-us) avoid resetting the
PHY behind the PHY driver's back?

[ ... ]

> +&sata0 {
> +	/* shares combphy0_ps with pcie2x1l2 */
> +	status =3D "disabled";
> +};

[ ... ]

> +&sdmmc {
> +	max-frequency =3D <150000000>;
> +	no-sdio;
> +	no-mmc;
> +	bus-width =3D <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_3v3_sd_s0>;
> +	vqmmc-supply =3D <&vccio_sd_s0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
> +	status =3D "okay";
> +};

[Severity: Low]
This isn't a bug, but there are a few unused or redundant definitions in the
device tree:

1. combophy_avdd0v85 and combophy_avdd1v8 are defined as always-on fixed
   regulators without GPIO control and have no consumer references anywhere=
 in
   the DT.
2. sata0 is already status =3D "disabled" in rk3588-base.dtsi, so the overr=
ide
   here is redundant.
3. sdmmc sets both no-mmc and cap-mmc-highspeed; since no-mmc disables MMC
   card initialization in mmc_of_parse(), cap-mmc-highspeed has no effect.

Could these be cleaned up?

[ ... ]

> +&usbdp_phy0 {
> +	mode-switch;
> +	orientation-switch;
> +	sbu1-dc-gpios =3D <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> +	rockchip,dp-lane-mux =3D <2 3>;
> +	status =3D "okay";
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		usbdp_phy0_orientation_switch: endpoint@0 {
> +			reg =3D <0>;
> +			remote-endpoint =3D <&usbc0_orien_sw>;
> +		};\n+
> +		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +			reg =3D <1>;
> +			remote-endpoint =3D <&dp_altmode_mux>;
> +		};
> +
> +		usbdp_phy0_dp_in: endpoint@2 {
> +			reg =3D <2>;
> +			remote-endpoint =3D <&dp0_out_con>;
> +		};
> +	};
> +};

[Severity: Medium]
Can DisplayPort AltMode and the USB-C graph work as intended with this
usbdp_phy0 and usb_con layout?

1. In drivers/phy/rockchip/phy-rockchip-usbdp.c, rk_udphy_probe() checks for
   port 3, endpoint 0 before registering the DRM AUX bridge:

   drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_probe() {
       ...
       dp_aux_ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0,=
 0);
       if (dp_aux_ep) {
           ret =3D drm_aux_bridge_register(dev);
           fwnode_handle_put(dp_aux_ep);
           if (ret)
               return ret;
       }
       ...
   }

   Here usbdp_phy0 uses the deprecated single port container with endpoint@=
0,
   endpoint@1, and endpoint@2 instead of a ports node with port@0 through
   port@3 as described in
   Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml. Because
   port 3 is absent, fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0,=
 0)
   returns NULL and drm_aux_bridge_register() is never called.

2. In usb_con (compatible =3D "usb-c-connector"), port@0 is wired to
   usbdp_phy0_orientation_switch and port@1 is wired to dwc3_0_role_switch.
   Per Documentation/devicetree/bindings/connector/usb-connector.yaml, port=
@0
   is for High Speed (the USB controller role switch) and port@1 is for Sup=
er
   Speed (the USBDP PHY), so port@0 and port@1 appear to be swapped.

3. usbdp_phy0 sets rockchip,dp-lane-mux =3D <2 3> alongside mode-switch and
   orientation-switch. In rk_udphy_parse_lane_mux_data(), specifying
   rockchip,dp-lane-mux forces static UDPHY_MODE_DP_USB and 2-lane DP at pr=
obe
   time, whereas phy-rockchip-usbdp.yaml states that rockchip,dp-lane-mux is
   not needed when DP lanes are mapped dynamically by DisplayPort AltMode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-quarkpi-ca=
2-v14-1-290990440b67@163.com?part=3D2
