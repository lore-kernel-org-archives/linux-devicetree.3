Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020511FC7C5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557822; cv=none; b=u6iilpSIRa2Ddwo47XyzDacGlSIirXaveHo/hokBaSnJUOmdAoX7WttWPOPdvmJQ283qrup+kcXyB8yA6rnRNtvySMfR2K5zW2lkFQEPfa3YZ+gYQdh5MwJYu7+PnYnxqYL2MbS7Xu++gljxSbgxsb4ZvdIHtFjO0dkWx5aL6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557822; c=relaxed/simple;
	bh=ctUJgL1tmeB+HFteeTVPG5jzSiyai3NKusvP3vSpDPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L258MFyovz6RNRgXpYUsSI0FJD3cs4BOm+21DLE1vaqL9MhPvDYPx8bo9PUyGVZGvzCFwufJSziF8uikukE2N3Y41+9fWtH6gpHM40BMGczypMEhSA94s0WfzibwYOsyRB005xO+0BAGSYveCUfSSvVbfrEw8NJTEkgrNVy6hkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/cu1kUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/cu1kUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C11C2BCB0;
	Tue, 12 May 2026 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557821;
	bh=ctUJgL1tmeB+HFteeTVPG5jzSiyai3NKusvP3vSpDPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=j/cu1kUkEAvkubwtRCZ07Wm9XZ7D/8eu9k/QuXfgZyMe/e0ib5caujo69ftCyLFMG
	 0RoL7hG3YB5WsaGNEvs8OZ/h1G+E+h24DX8G59bJYvBq87PdMH63aqjjzZWEL+tnNL
	 EHbXWzj0rsiUgU58IlI5sQV1YhvVYalTMpkayUpx71rTU0d7D1G1dcMtDerQae73Jf
	 h15SdnUfKvVh6hqsRZXpzuP3EcbbdiiX2ZuGeVgvRIOuzwABhwBkyMIlEOnh58Pp6U
	 iW1jbG1Z0ebMNXHGc7UtRt5YleWJoNybwj9CDgoavGvZK3bsITBI+y/r+AqWMkfDit
	 Jpn400sfH59lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add basic devicetree for
 Ayaneo Pocket DS gaming console
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:50:20 +0000
Message-Id: <20260512035021.60C11C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Medium] Missing DisplayPort AUX (SBU) Routing in Type-C connector.
- [Medium] Missing thermal `cooling-maps` and incorrect trip point types.
- [Medium] Invalid DAPM widget in `audio-routing`.
- [Medium] Missing `pinctrl-1` property in `pwm_fan` node.
- [Medium] Improper Audio Amplifier Initialization via pinctrl.
- [Low] Downstream device tree property `rocknix-u-boot-dt-id` included in =
root node.
- [Low] Missing `compatible` string in `panel@0` node.
- [Low] Unreferenced `volume_up_n` pinctrl state, missing Volume Up button.
- [Low] Extraneous `orientation-gpios` property in `pmic-glink`.
- [Low] Deprecated `gpio` property used in fixed regulators.
--

commit 22f111b3d5157012d6f5d9d466cfb26e61ed3b56
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

Add initial Device Tree for the Ayaneo Pocket DS gaming console based
on the Qualcomm QCS8550 platform.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/=
arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,1861 @@
> +// SPDX-License-Identifier: BSD-3-Clause
[ ... ]
> +/ {
> +	model =3D "AYANEO Pocket DS";
> +	compatible =3D "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
> +	rocknix-u-boot-dt-id =3D "u-boot-pocket-ds";

Is this downstream U-Boot property intended for upstream submission?
It does not appear to be documented in the upstream DT bindings.

> +
> +	aliases {
[ ... ]
> +	tca6424_vcc: regulator-tca6424-vcc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "tca6424_vcc";
> +
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +
> +		gpio =3D <&tlmm 168 GPIO_ACTIVE_HIGH>;

This isn't a bug, but could we use gpios here instead of the deprecated
gpio property? This also applies to vdd_ts and vdd_fan_5v0 later in the fil=
e.

> +		enable-active-high;
> +		regulator-boot-on;
[ ... ]
> +	pmic-glink {
> +		compatible =3D "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		orientation-gpios =3D <&tlmm 11 GPIO_ACTIVE_HIGH>;

Does the qcom,pmic-glink driver read orientation-gpios?=20

The driver appears to rely on IPC with the firmware to determine Type-C
orientation, which would make this property unused here.

> +
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint =3D <&redriver_ss_out>;
> +					};
> +				};
> +			};
> +		};

The commit message states DisplayPort is muxed over the USB-C connector, but
port@2 (SBU) is missing. Is SBU routing needed here for the DP AUX channel
(link training and EDID) to ensure DisplayPort Alt Mode functions correctly?

> +	sound {
> +		compatible =3D "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model =3D "SM8550-APS";
> +		audio-routing =3D "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";

Is vdd-micb a valid DAPM widget name here?=20

It looks like the regulator supply name for the VA macro. Will DAPM fail to
parse this route and leave the digital microphones' bias voltage disabled?

[ ... ]
> +	pwm_fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +
> +		pinctrl-0 =3D <&fan_pwm_active>, <&fan_int>;
> +		pinctrl-names =3D "default", "sleep";

Are we missing pinctrl-1 here?=20

Since pinctrl-names defines a sleep state, won't the PM core fail when
attempting to look up pinctrl-1 during transitions?

[ ... ]
> +&cpuss0_thermal {
> +	polling-delay =3D <200>;
> +
> +	trips {
> +		cpuss0_fan0: trip-point2 {
> +			temperature =3D <40000>;
> +			hysteresis =3D <3000>;
> +			type =3D "passive";
> +		};

Should the trip point type be active instead of passive since these are
intended for a fan?

Also, are the cooling-maps omitted intentionally across the thermal zones?
Without them, the kernel thermal framework cannot bind these trip points
to the pwm_fan cooling device.

[ ... ]
> +&pm8550_gpios {
[ ... ]
> +	volume_up_n: volume-up-n-state {
> +		pins =3D "gpio6";
> +		function =3D "normal";
> +		power-source =3D <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};

This pinctrl state is defined but does not appear to be referenced anywhere.
Are we missing a gpio-keys device node to instantiate the Volume Up button?

[ ... ]
> +&tlmm {
[ ... ]
> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> +		pins =3D "gpio7";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-high;
> +	};

Will setting output-high statically configure the active-low speaker shutdo=
wn
pins to drive high at boot?=20

This might prematurely power up the amplifiers before the audio framework is
initialized, potentially causing an audible pop noise.

[ ... ]
> +&mdss_dsi0 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +
> +	status =3D "okay";
> +
> +	display_panel: panel@0 {
> +		reg =3D <0>;
> +
> +		pinctrl-0 =3D <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 =3D <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names =3D "default", "sleep";
> +	};
> +};

Does this panel node need a compatible string?=20

Even if panel support is being added later, leaving a child node on an
enabled DSI host incomplete violates the DT schema and will likely cause
the DSI core to fail when parsing child devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-pocketds-v=
2-0-299dd4247f2f@gmail.com?part=3D3
