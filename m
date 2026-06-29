Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5142B74A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749210; cv=none; b=pqA6fMo9Swnt7sdnsrHD6yMyzSnBKznLhUEhuvhV+iuDDbkrhqwnOR46Ug/v23rWno8T93lk8lUnjZYEENfcDrGMkLZyZn05h4fVg75vjN3AiV2Q1x86W3ArVpK3EYZBfL2BKiS1CVUGZGm4gYijsZOtvbCy/GxaZiYsV7fpppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749210; c=relaxed/simple;
	bh=bX0QimWwqWq+J5ZTJ6gmlAoIsNRf92KmuxQnWSMeDsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tnwuXRVvbG1vjOSzFMs1BnzwS22GLUoCLvUDXYzmqZ9ev32c06NgdUyYTvnOBDhatSl1f0KM43kkeFm2VwicqipTm+lC51rVcEjw1sBWDIpHvGdH4+PFdhqjpwtp3Km2501KPrQS7Z49FRTS2Ls5ThW+VEfGaswqcjMO5+CERE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUijbHRo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUijbHRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1051F000E9;
	Mon, 29 Jun 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749209;
	bh=uOupjvaXl+H12o4rwYkoesd1lMpzG4gxjJhixfPsj4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lUijbHRob7qpPPZ9642/gGPQNYv59feMxXLF+2Oe0aZGgmFDg3DdPYYzNbuFY1fh7
	 +KbgZArgCEH92c9zdxYA4PnXLh6LC75OTcw7d/y3nQe0N/LzUIrSc+PM57xMyPBFJP
	 MzGjB8gnyVLlwIUDy+GnhTwLyi1T7BFJLdKr6MDG2LBQ66NRcLdiDV2VcuJlB0jppV
	 ZQuN14gPEjBXrSM0VPUvTh3Wxa0+Aca1MOeoNs2jOAMvtUVjUJwlHTfohr+Jg0gv+v
	 efcOAVoiDZJARWDidjYLpVNDGIuIosxTok5Czydo/sDXCbFj0cdqZlHwfs+edlAzkq
	 3vl2tpUHK3xbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629154812.9066-4-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
 <20260629154812.9066-4-mail@etehtsea.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 16:06:47 +0000
Message-Id: <20260629160648.DB1051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] DisplayPort over USB-C and HDMI are fundamentally broken due to in=
valid graph topology and missing SBU routing.
- [High] The touchpad interrupt pinmux configuration targets the wrong GPIO=
, breaking touchpad input.
- [High] The touchscreen reset pin lacks the `output-high` directive, leavi=
ng the device stuck in reset.
--

commit 3e10552e6c3c61e8d8f91d2bc36dc84459dad1e7
Author: Konstantin Shabanov <mail@etehtsea.me>

arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
   =20
Introduce support for the HONOR MagicBook Art 14 laptop.
This version is based on the initial work by Kirill A. Korinsky and
Valentin Manea.

Link: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
Link: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.=
19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/755

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts=
 b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,x1e80100-pmic-glink",

[ ... ]

> +		connector@0 {
> +			compatible =3D "usb-c-connector";

[ ... ]

> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint =3D <&usb_1_ss0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};

[Severity: High]
Are the port@2 definitions for routing SBU signals missing from both
connector@0 and connector@1? Without routing SBU lines to the hardware, Typ=
e-C
DisplayPort alternate mode negotiation might be unable to establish the
DP AUX channel.

[ ... ]

> +	i2c1 {
> +		clock-frequency =3D <400000>;
> +
> +		status =3D "okay";
> +
> +		touchpad@5d {
> +			compatible =3D "hid-over-i2c";
> +			reg =3D <0x5d>;
> +
> +			hid-descr-addr =3D <0x1>;
> +			interrupts-extended =3D <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;

[ ... ]

> +	tlmm {
> +		gpio-reserved-ranges =3D <34 2>, /* Unused */
> +				       <44 4>; /* SPI (TPM) */
> +
> +		tpad_default: tpad-default-state {
> +			pins =3D "gpio3";
> +			function =3D "gpio";
> +			bias-disable;
> +		};

[Severity: High]
Is there a mismatch in the GPIO configuration for the touchpad? The node
declares the hardware interrupt on GPIO 24, but the tpad_default pinctrl
state configures GPIO 3. Will this prevent the system from receiving touchp=
ad
events?

[ ... ]

> +	ts0_default: ts0-default-state {
> +		reset-n-pins {
> +			pins =3D "gpio48";
> +			function =3D "gpio";
> +			drive-strength =3D <16>;
> +		};
> +
> +		int-n-pins {

[Severity: High]
Does the touchscreen reset pin configuration need an output-high directive?
Since the hid-over-i2c driver does not actively manage a reset-gpios
property, omitting output-high here might leave the touchscreen stuck in
hardware reset.

[ ... ]

> +	usb_1_ss2_qmpphy {
> +		vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +		vdda-pll-supply =3D <&vreg_l2d_0p9>;

[ ... ]

> +		ports {
> +			port@0 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				/delete-node/ endpoint;
> +
> +				usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> +					reg =3D <0>;
> +
> +					data-lanes =3D <3 2 1 0>;
> +					remote-endpoint =3D <&hdmi_bridge_dp_in>;
> +				};
> +			};
> +		};
> +	};

[Severity: High]
Does replacing the QMP PHY's DP input endpoint with a connection to the HDMI
bridge's input sever the required connection from the GPU DP controller
(mdss_dp2_out)? Pointing port@0 away from the GPU might leave the HDMI
bridge without a valid signal source and break the GPU DP controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629154812.9066=
-1-mail@etehtsea.me?part=3D3
