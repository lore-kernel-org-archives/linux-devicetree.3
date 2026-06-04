Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8D3BBFD7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611834; cv=none; b=Guv6foT1hEezwqJKIN4NjTSbyZLhoCufLnNzYKTZSBhGfq/m2sem0jeIZz6OFQ6SUgTeD/GDZElxrMUx3o/6VOx59tymkWQyS4Jg91DoBxuytg5AWPOUOGCXvrlKfUwkaeZ+RUTx0hb3mT4HFRnI3waXwW11Klt0LeoMJJpESBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611834; c=relaxed/simple;
	bh=wL2Fw4jT53lkGKAa4GyCx5RjxfjuS+2ZprglzV9X4Ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtRhhcFV5VM3Yq/+Ggi4m/Jseihn9nbGKRjSs9CG1Cxit042fT9vOVBZYXTMObP8nKR7kY553PS6lbvm359WWyTNjEm/KGNpi71jAKTQPUIswJKngzt0YRwhaKC54ARIw9O5qmIb7RnmOukSR7QYrvBKxDQgKKHwlj5awf1TyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwajZ4EW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwajZ4EW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8254C1F00898;
	Thu,  4 Jun 2026 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780611833;
	bh=7WIj/yiwKmo/5Bte8XATAvP3MHY+olt/PurQOuhAfqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kwajZ4EWAjy7GI8jC8jAe3NjN2QHv4lDkBJ/1ojiOHlv3IWOkUbUwdG9JkTVWPJiu
	 l3qrBofKt0PzOilaAnh8INpyWErk8NI8/4b/5KxednPjpL7vAdc3aHMMOpcV9pufs2
	 8hc+BtAp4ABk91jrOp5SKtkddeLoZKY4SkuxsMhMbB34uUVjlH1BdPtsdTjtwW9ast
	 SudhStC4tGP991Ro+hT+qF4mb0JuoWoOmO9soZJoBhOOBTarc5hw5BvGIlxn1+vuME
	 Xm2sii0hCNVrJqsGAi2nD4zsmDYw0UCRd3paBIZQK9xJQFrA8eg9aK+WpygGfVcipV
	 44blBXIe81L5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604220802.119107-7-macroalpha82@gmail.com>
References: <20260604220802.119107-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 22:23:52 +0000
Message-Id: <20260604222352.8254C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] USB Type-C source PDO advertises 3A, exceeding the SGM41542 charge=
r's OTG boost capability.
- [Medium] Missing SPI child device node prevents userspace control of the =
analog joysticks.
- [Medium] Ghost HDMI configuration exists for a device that lacks an HDMI =
port.
--

commit 9a10b9538aecda51a72bf0a4aa5290b693df3a4b
Author: Chris Morgan <macromorgan@hotmail.com>
arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This commit adds the device tree for the Anbernic RG Vita-Pro, based on the
Rockchip RK3576. It defines the hardware configuration including the displa=
y,
buttons, analog joysticks, battery, and USB-C.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
[ ... ]
> +	hdmi-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "c";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
[ ... ]
> +&hdmi {
> +	status =3D "okay";
> +};

[Severity: Medium]
The commit message lists "DisplayPort over USB-C alt-mode" for video output
but does not mention an HDMI port. Does this device physically have an HDMI
port, or is this a leftover ghost configuration?

Leaving the HDMI pipeline enabled might waste resources or cause audio/disp=
lay
routing confusion in userspace if the port doesn't exist on the hardware.

[ ... ]
> +	sgm41542: charger@3b {
> +		compatible =3D "sgmicro,sgm41542";
> +		reg =3D <0x3b>;
[ ... ]
> +		regulators {
> +			vbus5v0_typec: otg-vbus {
> +				regulator-name =3D "vbus5v0_typec";
> +				regulator-max-microvolt =3D <5000000>;
> +				regulator-min-microvolt =3D <5000000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
[ ... ]
> +	husb311: typec-portc@4e {
> +		compatible =3D "hynetek,husb311", "richtek,rt1711h";
[ ... ]
> +		vbus-supply =3D <&vbus5v0_typec>;
> +
> +		connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			data-role =3D "dual";
> +			op-sink-microwatt =3D <10000000>;
> +			power-role =3D "dual";
> +			try-power-role  =3D "sink";
> +
> +			sink-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_FIXED(9000, 2000, PDO_FIXED_USB_COMM)>;
> +			source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;

[Severity: High]
Does advertising 3A for the source PDO risk overloading the SGM41542 charge=
r?

The husb311 Type-C port advertises 5V at 3A to connected sinks, but its
vbus-supply is powered by the sgm41542 charger's OTG boost converter.
According to the sgm41542 driver, its maximum OTG output capability is
physically limited to 2A (2,000,000 uA).

If a sink attempts to draw the advertised 3A, could it cause an overcurrent
fault and collapse the VBUS rail?

[ ... ]
> +&spi1 {
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi1m2_pins>, <&spi1m2_csn0>;
> +	status =3D "okay";
> +
> +	/* SPI controlled MCU for joystick and joystick LEDs. */
> +};

[Severity: Medium]
The commit message notes the analog joysticks are "controlled via userspace=
,"
but the &spi1 node doesn't have a child device node (such as spidev).

Without a child node, the kernel SPI subsystem will not instantiate an SPI
device. How will userspace communicate with the joysticks if the device node
is missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604220802.1191=
07-1-macroalpha82@gmail.com?part=3D6
