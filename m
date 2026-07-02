Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0723168E6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974437; cv=none; b=MMZ1UovbMHEgMAg3BWJQXZP2zLK95ZuaNGIIE3zgwiqOxv+aTYdr1vlu7l9MuQcYIn7J+/JEwlcgT3PDKDgCdN3dAXJlj3Yf4KJVwVtw0ICdSXTk8xA2FbEjpsp1bYRT+3TfsEcfwCWbfOmS1ZXLtw7LYABNY0paWS9CQr2v6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974437; c=relaxed/simple;
	bh=0z7/4j6tHGwsl8r4/H0yk0Hz5ZQgqY8A6PN1dEdHsxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=txfeXO52z4ogNBdja1gURwe9SafGowbvIqU+AamhMHGDPOQtj5sAIOaoJhRnzG8tX7slbjMFVeibRhjubRlNGXG31pZtWqDh6BBqADPAD9srLx0mre4Pe5pDVxEF3if8408j5ZFJeAyDy4yRRI1xqvR2nVNPpiYWZUsRT8EJicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOFbQfOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOFbQfOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09ED1F000E9;
	Thu,  2 Jul 2026 06:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782974435;
	bh=XII9l7pBJZTD4zeWP9LHyd9dCH1+Ruxr765ghyq7kiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOFbQfOdSMrjhmcpq+BzQGwqp3JIk5Dh54DcEgvJOC8SwZ9XTJ+XAuYaph2Cl54xz
	 bgSc8Y4aQLb7KtXUlZAuk8MtTYdcLJsw9pS53ahSu98boyNtd/sE8DENDLM+qxb4Ia
	 mZzMxo8jUhuuJ3PKhj08auKoF+eyrNipKD3YX1mXDNfOHyBP82s2JTRxlv5SPLMxX/
	 J94H/FIoZpL7oq5HWOHo6/+WsBdaCCZWtkM2pQMa/iQhHaxwuuZl3wMmG455+AXeDp
	 n3xSPSiZUZOznon3jbdHbnH6E4oQ+LXWRQKz5D4KFXK/R6DeYfqLWvKytXhl5HlA3r
	 o/V3P5OLB07Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaipeng Zeng" <kaipeng94@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702063156.35169-3-kaipeng94@gmail.com>
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 06:40:35 +0000
Message-Id: <20260702064035.A09ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] WSA8845 speakers use `reset-gpios` instead of `powerdown-gpios` an=
d share the GPIO incorrectly.
- [High] Type-C Switch Configuration Error on Type-A Port due to inherited =
PHY properties.
- [Medium] Missing Audio DAI Link for HDMI output.
- [Medium] Commit message claims 'Webcam' support but no camera nodes are a=
dded.
- [Low] Inaccurate `orientation-gpios` array length in `pmic-glink`.
- [Low] The High-Speed USB PHY `usb_1_ss2_hsphy` is enabled despite no USB =
controller consuming it.
--

commit 61c654b8218e8d2d66d2d6d5ec3990a2ffe03533
Author: Kaipeng Zeng <kaipeng94@gmail.com>
Subject: arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

This commit introduces the device tree for the Acer Swift Go Pro AI (SFA14-=
11)
laptop, based on the Snapdragon X Elite SoC. It enables core hardware featu=
res
including internal display, USB, Wi-Fi, audio routing, and HDMI output.

> Supported features:
>=20
>  - Internal display & Brightness control
>  - Keyboard & Touchpad
>  - USB Type-C, Type-A
>  - Wi-Fi & Bluetooth
>  - ADSP & CDSP
>  - Adreno X1-85 GPU
>  - HDMI & USB Type-C display
>  - Webcam

[Severity: Medium]
Is the webcam feature fully implemented in this patch? The commit message
lists Webcam as a supported feature, but a review of the device tree reveals
no camss, cci, or image sensor nodes added in this patch.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/a=
rm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> index 0000000000000..f5d91abf11f1d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this array length match the number of connectors? The qcom,pmic-glink
bindings require the orientation-gpios array to contain exactly one GPIO en=
try
per connector node. This board explicitly defines only one connector, but
supplies three GPIOs here.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-CRD";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		displayport-0-dai-link {
> +			link-name =3D "DisplayPort0 Playback";
> +
> +			codec {
> +				sound-dai =3D <&mdss_dp0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai DISPLAY_PORT_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +
> +		wcd-playback-dai-link {

[Severity: Medium]
Will audio work over HDMI without a DAI link for mdss_dp2? The board routes
HDMI through a bridge connected to mdss_dp2, but the sound node only defines
a DAI link for mdss_dp0. Without displayport-2-dai-link, the audio driver
may not expose the HDMI audio endpoint to userspace.

[ ... ]

> +	swr0 {
> +		pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +		pinctrl-names =3D "default";
> +
> +		status =3D "okay";
> +
> +		/* WSA8845, Left Woofer */
> +		left_woofer: speaker@0,0 {
> +			compatible =3D "sdw20217020400";
> +			reg =3D <0 0>;
> +			reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;

[Severity: High]
Should this use powerdown-gpios instead of reset-gpios? The ASoC WSA884x co=
dec
driver does not look for reset-gpios, which means the GPIO is never toggled=
 and
the speaker amplifiers might fail to power up.

Additionally, will sharing the GPIO directly here cause a failure when prob=
ing
the tweeter? The gpiod_get requests exclusive access, so the second probed
device could fail with -EBUSY. A gpio-reset controller is usually required =
to
share the line properly.

[ ... ]

> +	swr3 {
> +		pinctrl-0 =3D <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
> +		pinctrl-names =3D "default";
> +
> +		status =3D "okay";
> +
> +		/* WSA8845, Right Woofer */
> +		right_woofer: speaker@0,0 {
> +			compatible =3D "sdw20217020400";
> +			reg =3D <0 0>;
> +			reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;

[Severity: High]
Similar to the left woofer, does this need to use powerdown-gpios and a
gpio-reset controller to avoid probe failures?

[ ... ]

> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l2j_1p2>;
> +	vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Does this node need to explicitly delete the mode-switch and orientation-sw=
itch
properties? In hamoa.dtsi, usb_1_ss1_qmpphy is defined as a combo PHY and
contains those properties, which causes the PHY driver to register a Type-C
switch and default to TYPEC_ORIENTATION_NONE.

Since this board uses a regular Type-A port here and won't receive Type-C
orientation events, this can leave the USB 3.0 lanes permanently disabled,
degrading the port to USB 2.0.

[ ... ]

> +&usb_1_ss2_hsphy {
> +	vdd-supply =3D <&vreg_l3j_0p8>;
> +	vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Is it necessary to enable this High-Speed PHY? The usb_1_ss2 controller is
disabled because this port is exclusively used for DisplayPort output.
Enabling the PHY without a USB controller to consume it leaves a dangling
device probing indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702063156.3516=
9-1-kaipeng94@gmail.com?part=3D2
