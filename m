Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CC2E612E
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 03:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445629; cv=none; b=Edw7HW/1M0hEkkYpU7j4x/JzNt1Byb8jxMnDLsssRKl5anpEl3HL9Q/JWsZR4WaxxYr4sgm/41uGx5G2H1yDW0mLN6z2gb9J6sQUwZ1fpMWSDN1Gd40WoqWf25ICjVNuZ0uOj8ShrpoxALlAE3caYsUxuC9JSwNQgIuJGadWICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445629; c=relaxed/simple;
	bh=kwBicSXiFB+tJMr8XuamvcExKXKjQQfj1NMZK7soR9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qpScDSyAcO+xGn1Eow5ZdFgQAFbOCMcL4D0S+9MjfYcbunldyML/PIq/dCL2I1zhozAB7dn18tkwNIUTx4yvYE/h7I56tOYeGTB0g+Xj3zi/oHsQTzhTHzoVV2g9Www/DvSMR/8h67RZj2GKUS3ZbgzLIO4uAeBMjnykw6pFVOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GROUymBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GROUymBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A62F1F000E9;
	Fri, 26 Jun 2026 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782445628;
	bh=4V4mo401fnPFC5m3gQs8//GjPUPNqylNuQMN32ZsGqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GROUymBCNnrdLCGK/Z5KjKhhqUcI34rnAP0VPxZvtUZLr2E8rVKicPFBxQECZViWD
	 JPmdBcQrmBmjfVL6NF/SOT6Rw575pe+Q7Y/E3QXogZovdRdbCZRt7wuAceZzgP1i8a
	 nCFfQXzVjgyeG23WVXnyRkaRtxdLhtsSUcw1PDj64Orzep80JbzRDpclTug2zHGfLk
	 R9S581CJJ9WyhEm8pPnY4MEqSDPmfIj4SdMWKJuMfQTa1XUn77FwzCdSJNm/Gutsrv
	 zW9s3ChauE2X/2zTX7Tfj/gX6P2oWsYdJglJPcrphLKZ6eDz6MKhxTMQcSPkllLBC2
	 S1h/1KT5+GtMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier
 board DTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626033418.520762-3-lijq9@lenovo.com>
References: <20260626033418.520762-1-lijq9@lenovo.com>
 <20260626033418.520762-3-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 03:47:07 +0000
Message-Id: <20260626034708.3A62F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Pin configurations are instantiated as standalone dummy nodes inst=
ead of subnodes of the pinctrl controllers.
- [High] SD card controller override fails due to a node name mismatch (`sd=
hci` vs `mmc`).
- [High] The pwm-fan status override fails because it is incorrectly nested=
 under bus@0.
- [Medium] Device tree contains dead overrides for non-existent downstream =
nodes.
- [Medium] The fixed-regulators node incorrectly uses simple-bus with `#add=
ress-cells =3D <1>` for a sizeless child.
--

commit 124a29c4818b88a33b77f6bc336c64c7bd9a06ec
Author: Jiqi Li <lijq9@lenovo.com>

arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS

ThinkEdge SE70 is a fanless industrial edge gateway built around
NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
tree file describing core carrier board peripherals.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 0000000000000..d44eb7c9b4742
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts

[ ... ]

> +	/* Fixed 3.3V regulator for external SD card slot */
> +	fixed-regulators {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		ap2306gn_3v3_sd: ap2306gn-3v3-sd {

[Severity: Medium]
The fixed-regulators node is marked as compatible =3D "simple-bus" and sets
#address-cells =3D <1>, but its child ap2306gn-3v3-sd does not have a unit
address or a reg property.

Since the simple-bus binding requires children to have a reg or ranges
property, will this cause dtbs_check validation to fail?

[ ... ]

> +	bus@0 {
> +
> +		/* Custom pinmux configurations for 40-pin expansion header */
> +		pinmux@c302000 {
> +			status =3D "okay";
> +			touch-clk-pcc4 {
> +				nvidia,pins =3D "touch_clk_pcc4";
> +				nvidia,function =3D "rsvd2";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +		};
> +
> +		pinmux@2430028 {
> +			status =3D "okay";
> +			soc-gpio41-pq5 {

[Severity: High]
Is it intended to create standalone nodes at the exact register offsets of
the individual pins (pinmux@c302000 and pinmux@2430028), instead of placing
them as subnodes under the main pinctrl controllers (which reside at
pinmux@c300000 and pinmux@2430000 in tegra194.dtsi)?

Because they are standalone nodes and lack a pinctrl-0 reference, the pinct=
rl
driver won't parse them, which will cause these pinmux configurations to be
ignored.

[ ... ]

> +		/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
> +		sdhci@3440000 {
> +			vmmc-supply =3D <&ap2306gn_3v3_sd>;
> +			cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
> +			status =3D "okay";
> +		};

[Severity: High]
In the upstream tegra194.dtsi, the SDMMC3 controller is defined as
mmc@3440000.

Does using sdhci@3440000 here create a new, inert dummy node instead of
overriding the existing mmc@3440000 node? This would leave the actual
controller in its default disabled state.

> +
> +		/* Disable fan and tachometer hardware not populated on SE70 carrier b=
oard */
> +		pwm-fan {
> +			status =3D "disabled";
> +		};

[Severity: High]
In tegra194-p3509-0000.dtsi, the pwm-fan node is located at the root of the
device tree (/pwm-fan).

Since this override is nested inside /bus@0/, doesn't this create a new dum=
my
node at /bus@0/pwm-fan while leaving the actual root /pwm-fan node enabled?

> +		thermal-fan-est {
> +			status =3D "disabled";
> +		};
> +		tachometer@39c0000 {
> +			status =3D "disabled";
> +		};

[Severity: Medium]
It looks like nodes such as thermal-fan-est, tachometer@39c0000,
generic-pwm-tachometer, spi@3210000, and spi@3230000 do not exist in the
upstream tegra194 device tree sources.

Does overriding them here just create new dummy disabled nodes instead of
affecting real hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626033418.5207=
62-1-lijq9@lenovo.com?part=3D2
