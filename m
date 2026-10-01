Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7733DD849
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861618; cv=none; b=oqIlryLgStK0yinCtItd4409hWQz9ebv3XHWeyRm6l5oSNZWQnZ2B6/wxD7wLgBvoztVz+apU52bkQdcJhKhA8KLpgRxWWpUEKKYw+FI8oSWBCB2qETgtrgg3mnnv1a3cD76WiFPop7Jms0B5QOTwodpxyL5KS42RJTQQmUvzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861618; c=relaxed/simple;
	bh=tcNJuyvj4QxrZ7ON/HKFgCm6nyOBO4Y/hXrHC1lFtt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gmmr6CWG0mTKlCncAI1+/cJrFGC82ZtPGKPJl1kAJ6vjc1NlHFzGMktvAOMY9wWSg26KXZ6XdZtyVP6bD5/8Sy7k+Bl6RfkJn0ByX8qMGaVrsdsa2HB8Sh2boOBhIwvB15nRuR/9eirI4gEqhyxoJ6ZoZZEhfPWjydeoSAVGwMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFX1dGeh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFX1dGeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBB81F00899;
	Thu,  1 Oct 2026 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861617;
	bh=6+xvO5VlgUrHtavo0GJI34Jy641Hewr2IabUEXwHm8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hFX1dGeh8Qz2+/nyUfW+XAvAW7iqq58wyLPLvEsAtrb8p+aXqsDJKhtZvtwkh/4pi
	 flf8WqYIh3txA9rfmVHmxkkfHeois66AKofcSJU7f1Kh58SGpjyyHVYqE5nbN/hohO
	 Rah9rq/HNYnZNQxsOjmwF0ra3ZMeSCa4YjkUX4QGNS9r5hRAGAIaxXHyoVSCb1iGwG
	 +apb13zHRqiXdDBR49idfOz8ESYxmHAqjZctD7+IST4CSGtunazlU6SygZ0KVha5a0
	 zyMeNcnZOzVEz7MM9hGrcxPGfvgZObPoL/OQZJB+vIPJoOAUc1l+kM9YYOY48oC+NH
	 dzyHVjx6dFZLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: BG9OXA <bg9oxa@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <179086060083.25869.13705100394180154293@163.com>
References: <179086058377.25869.5809349568462938314@163.com>
 <179086060083.25869.13705100394180154293@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:33:36 +0000
Message-Id: <20261001133336.ABBB81F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] arm64: dts: rockchip: Type-C SuperSpeed OF graph bypasses USBDP =
PHY
- [Medium] arm64: dts: rockchip: Invalid DAPM routing mixes paths and bypas=
ses amplifier
- [Medium] arm64: dts: rockchip: USB Type-C data role mismatch with host co=
ntroller
- [Low] arm64: dts: rockchip: Makefile entries are not alphabetically sorted
- [Low] arm64: dts: rockchip: Erroneous brace indentation in I2C nodes
--

commit 37d68f4aec1739a1867e904e0086c7d08ca21350
Author: BG9OXA <bg9oxa@163.com>

arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

This patch adds device tree support for the ALIENTEK QuarkPi-CA2, an
RK3588S-based single-board computer. It introduces nodes for various hardwa=
re
components including Ethernet, USB, audio, and display interfaces.

> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index e7936a21c1185..34423e8cfbc97 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-khadas-edge2=
.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-lubancat-4.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-quarkpi-ca2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb

[Severity: Low]
Does this insertion break the alphabetical sorting of the Makefile?

It appears quarkpi is placed between nanopi and odroid, which could
lead to future merge conflicts.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..3f971ff8a6f0d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +		usb_con: connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +			try-power-role =3D "sink";
> +			source-pdos =3D <0x401912c>;
> +			sink-pdos =3D <0x4019064>;
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
> +					usbc0_hs: endpoint {
> +						remote-endpoint =3D <&usb_host0_hs_ep>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					usbc0_ss: endpoint {
> +						remote-endpoint =3D <&usb_host0_ss_ep>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +					usbc0_sbu: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_dp_out>;
> +					};
> +				};
> +			};
> +		};
> +		};
> +		};

[Severity: Low]
Are these closing braces aligned correctly?

It looks like the husb311 and i2c2 nodes end with misaligned and stacked
closing braces, which violates kernel coding style and hurts readability.

[ ... ]

> +&usb_host0_xhci {
> +	dr_mode =3D "host";
> +	status =3D "okay";

[Severity: Medium]
Is the dual data-role in the usb_con node compatible with this xHCI
controller configuration?

The usb_con node claims dual data roles, but the DWC3 controller here
is locked to host mode and lacks the usb-role-switch property. Will
this cause role swap requests to fail or break device mode functionality?

[ ... ]

> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1m4_xfer>;
> +	status =3D "okay";
> +
> +	es8388: audio-codec@11 {
> +		compatible =3D "everest,es8388", "everest,es8328";
> +		reg =3D <0x11>;
> +		clocks =3D <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> +		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> +		assigned-clock-rates =3D <12288000>;
> +		AVDD-supply =3D <&vcc_3v3_s0>;
> +		DVDD-supply =3D <&vcc_1v8_s0>;
> +		HPVDD-supply =3D <&vcc_3v3_s0>;
> +		PVDD-supply =3D <&vcc_3v3_s0>;
> +		#sound-dai-cells =3D <0>;
> +	};
> +	};

[Severity: Low]
Is this closing brace for the i2c1 node indented correctly?

It appears misaligned, which affects the readability of the device tree fil=
e.

[ ... ]

> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"Headphone Power INL", "LOUT2",
> +			"Headphone Power INR", "ROUT2",

[Severity: Medium]
Does this DAPM routing incorrectly mix paths and bypass the amplifier?

This configuration appears to connect Headphones directly to LOUT1/ROUT1
while also connecting them to the amplifier output, bypassing the headphone
amplifier. It also shorts the codec outputs LOUT1 and LOUT2 into the amplif=
ier
inputs. Could this cause incorrect audio mixing or potential hardware stres=
s?

[ ... ]

> +&usbdp_phy0 {
> +	orientation-switch;
> +	mode-switch;
> +	sbu1-dc-gpios =3D <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> +	rockchip,dp-lane-mux =3D <2 3>;
> +	status =3D "okay";
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		usbdp_phy0_dp_in: endpoint@2 {
> +			reg =3D <2>;
> +			remote-endpoint =3D <&dp0_out_con>;
> +		};

[Severity: Medium]
Does this SuperSpeed routing bypass the USBDP PHY?

Earlier in the file, the Type-C connector's SuperSpeed endpoint (usbc0_ss)
is routed directly to usb_host0_ss_ep instead of going through the USBDP PH=
Y.
Here, the usbdp_phy0 port node is missing the SuperSpeed endpoints
(endpoint@0 and endpoint@1) that should sit between the DWC3 and the Type-C
connector.

Will this break hardware orientation switching for SuperSpeed lines since
the PHY handles the orientation muxing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179086059727.25869.=
4898747284365209003@163.com?part=3D2
